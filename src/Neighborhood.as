package src 
{
	import net.flashpunk.FP;
	import net.jpunk.TextEntity;
	import net.jpunk.Util;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Neighborhood extends MyWorld
	{
		public static const NUMBER_OF_PEOPLE:int = 10;
		public static const GRID_SIZE:int = 60;
		
		public function Neighborhood(index:int = 0) 
		{
			super(index);
			this.depth = Global.NEIGHBORHOOD;
		}
		
		override public function begin():void
		{
			Global.neighborhoodIndex = this.index;
			
			// Text
			this.topText = new TextEntity(FP.halfWidth, 20, "In the world's average neighborhood or family group of 70 people, 10 are hungry.", 10, 'casual_encounter', 400);
			this.percentFedText = new TextEntity(FP.halfWidth, 50, '', 12, 'verdana');
			this.instructionText = new TextEntity(FP.halfWidth, 20, "Click and drag your mouse to feed the hungry people.", 8, 'casual_encounter', 400);
			
			// Exit
			this.exitUp = new ExitUp(50, FP.halfHeight, new Village(Global.villageIndex));
			
			// Super
			super.begin();
		}		
		
		override public function populate():void
		{
			var x:int = 100;
			var y:int = 150;
			var fed:Boolean;
			var personArray:Array;
			for (var i:int = 0; i < NUMBER_OF_PEOPLE; i++)
			{
				fed = false;
				personArray = makePersonArray(i);
				if (checkPersonFed(personArray))
					fed = true;
				FP.world.add(new Person(x, y, personArray, fed));
				x += GRID_SIZE;
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
		
		override public function updateProgressBar():void
		{
			trace('neighborhood update percentfedtext');
			trace('percent fed: ' + this.percentFed);
			this.percentFedText.updateText("Percentage of hungry people in this neighborhood who have been fed: " + String(percentFed * 100) + "%");
			super.updateProgressBar();
			//this.percentFedText = new TextEntity(FP.halfWidth, 50, "Percentage of hungry people in this neighborhood who have been fed: " + String(percentFed), 8, 'casual_encounter');
			//add(this.topText);
		}
		
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