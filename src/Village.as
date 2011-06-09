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
		public static const NUMBER_OF_NEIGHBORHOODS:int = 2;
		public static const GRID_SIZE:int = 60;
		
		public function Village(index:int = 0) 
		{
			super(index);
			this.depth = Global.VILLAGE;
		}
		
		override public function begin():void
		{
			Global.villageIndex = this.index;
			this.exitUp = new ExitUp(20, FP.halfHeight, new Township(Global.townshipIndex));	
			super.begin();
		}
		
		override public function markThisFed():void
		{
			Global.fedVillages.push(new Array(Global.continentIndex, Global.nationIndex, Global.provinceIndex, Global.prefectureIndex, Global.countyIndex, Global.townshipIndex, Global.villageIndex));
		}		
		
		override public function populate():void
		{
			var x:int = GRID_SIZE;
			var y:int = GRID_SIZE;
			var fed:Boolean;
			for (var i:int = 0; i < NUMBER_OF_NEIGHBORHOODS; i++)
			{
				fed = false;
				if (checkNeighborhoodFed(makeNeighborhoodArray(i)))
					fed = true;
				add(new ExitDown(x, y, Assets.NEIGHBORHOOD, new Neighborhood(i), fed));
				x += GRID_SIZE;
			}
		}		
		
		public function makeNeighborhoodArray(localIndex:int):Array
		{
			return new Array(Global.continentIndex, Global.nationIndex, Global.provinceIndex, Global.prefectureIndex, Global.countyIndex, Global.townshipIndex, Global.villageIndex, localIndex);
		}
		
		public function checkNeighborhoodFed(villageArray:Array):Boolean
		{
			for each(var i:Array in Global.fedNeighborhoods)
			{
				if (Util.checkArraysMatch(i, villageArray)) 
				{
					return true;
				}
			}
			return false;
		}		
		
	}

}