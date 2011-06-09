package src 
{
	import net.flashpunk.FP;
	import net.jpunk.Util;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Township extends MyWorld
	{
		public static const NUMBER_OF_VILLAGES:int = 5;
		public static const GRID_SIZE:int = 60;
		
		public function Township(index:int = 0) 
		{
			super(index);
			this.depth = Global.TOWNSHIP;
		}
		
		override public function begin():void
		{
			Global.townshipIndex = this.index;
			//FP.world.add(new ExitUp(20, FP.halfHeight, new Village(Global.villageIndex)));			
			super.begin();		
		}		
		
		override public function populate():void
		{
			var x:int = GRID_SIZE;
			var y:int = 150;
			var fed:Boolean;
			for (var i:int = 0; i < NUMBER_OF_VILLAGES; i++)
			{
				fed = false;
				if (checkVillageFed(makeVillageArray(i)))
					fed = true;
				FP.world.add(new ExitDown(x, y, Assets.VILLAGE, new Village(i), fed));
				x += GRID_SIZE;
			}
		}		
		
		public function makeVillageArray(localIndex:int):Array
		{
			return new Array(Global.continentIndex, Global.nationIndex, Global.provinceIndex, Global.prefectureIndex, Global.countyIndex, Global.townshipIndex, localIndex);
		}
		
		public function checkVillageFed(indexArray:Array):Boolean
		{
			for each(var i:Array in Global.fedVillages)
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