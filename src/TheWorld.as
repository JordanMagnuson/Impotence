package src 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class TheWorld extends MyWorld
	{
		public static const NUMBER_OF_COUNTRIES:int = 2;
		public static const GRID_SIZE:int = 60;
		
		public function TheWorld() 
		{
		}
		
		override public function begin():void
		{
			super.begin();
			trace(FP.elapsed);
			generateCompletionArrays();
			trace(FP.elapsed);			
			populate();			
		}
		
		public function populate():void
		{
			var x:int = GRID_SIZE;
			var y:int = GRID_SIZE;
			var complete:Boolean;
			for (var i:int = 0; i < NUMBER_OF_COUNTRIES; i++)
			{
				complete = checkComplete(i);
				FP.world.add(new ExitDown(x, y, Assets.COUNTRY, new Country, checkComplete(i)));
				x += GRID_SIZE;
			}
		}
		
		public function checkComplete(index:Number):Boolean
		{
			if (Global.completedCountries[index])
				return true;
			else	
				return false;
		}
		
		public function generateCompletionArrays():void
		{
			for (var c:int = 0; c < 19500; c++)
			{
				Global.completedCountries[c] = 0;
				Global.completedProvinces[c] = new Array();
				Global.completedPrefectures[c] = new Array();
				for (var p:int = 0; p < 20; p++)
				{
					Global.completedProvinces[c][p] = 0;
					Global.completedPrefectures[c][p] = new Array();
					for (var pre:int = 0; pre < 30; pre++)
					{
						Global.completedPrefectures[c][p][pre] = 0;
					}
				}
			}
			trace(Global.completedPrefectures[0][0][5]);
		}		
		
	}

}