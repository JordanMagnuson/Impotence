package src 
{
	import net.flashpunk.FP;
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
			trace('Global.neighborhoodIndex: ' + Global.neighborhoodIndex);
			add(new ExitUp(20, FP.halfHeight, new Village(Global.villageIndex)));
			super.begin();
		}		
		
		override public function populate():void
		{
			var x:int = GRID_SIZE;
			var y:int = GRID_SIZE;
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