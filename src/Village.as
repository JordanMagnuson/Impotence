package src 
{
	import net.flashpunk.FP;
	import net.jpunk.Util;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Village extends MyWorld
	{
		public static const NUMBER_OF_NEIGHBORHOODS:int = 5;
		public static const GRID_SIZE:int = 60;
		
		public function Village(index:int = 0) 
		{
			super(index);
		}
		
		override public function begin():void
		{
			super.begin();		
			FP.world.add(new ExitUp(20, FP.halfHeight, new Village(Global.villageIndex)));
			populate();			
		}		
		
		public function populate():void
		{
			var x:int = GRID_SIZE;
			var y:int = GRID_SIZE;
			var fed:Boolean;
			for (var i:int = 0; i < NUMBER_OF_NEIGHBORHOODS; i++)
			{
				fed = false;
				if (checkNeighborhoodFed(makeNeighborhoodArray(i)))
					fed = true;
				FP.world.add(new ExitDown(x, y, Assets.NEIGHBORHOOD, new Neighborhood(i), fed));
				x += GRID_SIZE;
			}
		}		
		
		public function makeNeighborhoodArray(localIndex:int):Array
		{
			return new Array(Global.continentIndex, Global.countryIndex, Global.provinceIndex, Global.prefectureIndex, Global.countyIndex, Global.townshipIndex, Global.villageIndex, localIndex);
		}
		
		public function checkNeighborhoodFed(indexArray:Array):Boolean
		{
			for each(var i:Array in Global.fedNeighborhoods)
			{
				if (Util.checkArraysMatch(i, indexArray)) 
				{
					return true;
				}
			}
			return false;
		}		
		
	}

}