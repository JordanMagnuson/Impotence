package src 
{
	import flash.geom.Point;
	import net.flashpunk.FP;
	import net.jpunk.TextEntity;
	import net.jpunk.Util;
	import net.jpunk.VisualGrid;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Neighborhood extends MyWorld
	{
		public static const NUMBER_OF_ITEMS:int = 50;
		public static const GRID_WIDTH:int = 700;
		public static const GRID_HEIGHT:int = 250;
		public static const GRID_ROWS:int = 3;
		public static const GRID_COLS:int = 20;
		
		public function Neighborhood(index:int = 0)
		{
			super(index);
			this.depth = Global.NEIGHBORHOOD;
		}
		
		override public function begin():void
		{
			Global.neighborhoodIndex = this.index;
			
			// Text
			this.topText = "In the average small world village of 350 people, 50 are hungry.";
			this.percentFedText = "Percentage of hungry people in this village who have been fed:";
			this.instructionText = "Click and drag your mouse to feed the hungry people.";
			
			// Exit
			this.exitUpWorld = new Township(Global.townshipIndex);
			
			// Super
			super.begin();
		}		
		
		override public function populate():void
		{
			var gridX:Number = Global.GRID_CENTER.x - GRID_WIDTH / 2;
			var gridY:Number = Global.GRID_CENTER.y - GRID_HEIGHT / 2;
			var grid:VisualGrid = new VisualGrid(gridX, gridY, GRID_WIDTH, GRID_HEIGHT, GRID_ROWS, GRID_COLS);
			//grid.layer = 5;
			//add(grid);
			//for each (var cell:Object in grid.cells)
			//{
				//
			//}

			
			var x:int;
			var y:int;
			var fed:Boolean;
			var personArray:Array;
			for (var i:int = 0; i < NUMBER_OF_ITEMS; i++)
			{
				x = grid.cells[i].centerX;
				y = grid.cells[i].centerY;
				fed = false;
				personArray = makePersonArray(i);
				if (checkPersonFed(personArray))
					fed = true;
				FP.world.add(new Person(x, y, personArray, fed));
			}
		}
		
		override public function markThisFed():void
		{
			Global.fedNeighborhoods.push(new Array(Global.continentIndex, Global.nationIndex, Global.provinceIndex, Global.prefectureIndex, Global.countyIndex, Global.townshipIndex, Global.villageIndex, Global.neighborhoodIndex));
		}				
		
		override public function checkPercentFed():Number		
		{
			var percentFed:Number = 0;
			var personList:Array = [];	
			var fedList:Array = [];	
			getClass(Person, personList);				
			for each (var p:Person in personList)
			{
				if (p.fed)
					fedList.push(p);
			}
			percentFed = (fedList.length / personList.length);
			trace('person percent fed: ' + percentFed);
			return percentFed;
		}					
		
		//override public function updateProgressBar():void
		//{
			//trace('neighborhood update percentfedtext');
			//trace('percent fed: ' + this.percentFed);
			//this.percentFedText.updateText("Percentage of hungry people in this neighborhood who have been fed: " + String(percentFed * 100) + "%");
			//super.updateProgressBar();
			//this.percentFedText = new TextEntity(FP.halfWidth, 50, "Percentage of hungry people in this neighborhood who have been fed: " + String(percentFed), 8, 'casual_encounter');
			//add(this.topText);
		//}
		
		public function makePersonArray(localIndex:int):Array
		{
			return new Array(Global.continentIndex, Global.nationIndex, Global.provinceIndex, Global.prefectureIndex, Global.countyIndex, Global.townshipIndex, Global.villageIndex, Global.neighborhoodIndex, localIndex);
		}
		
		public function checkPersonFed(personArray:Array):Boolean
		{
			for each(var i:Array in Global.fedPeople)
			{
				if (Util.checkArraysMatch(i, personArray)) 
				{
					return true;
				}
			}
			return false;
		}
	}

}