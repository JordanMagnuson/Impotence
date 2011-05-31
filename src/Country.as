package src 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.jpunk.Colors;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Country extends MyWorld
	{
		public static const NUMBER_OF_PROVINCES:int = 10;
		public static const GRID_SIZE:int = 60;
		
		public var image:Image = Image.createCircle(20, Colors.BLOOD_RED, 1);
		
		public function Country() 
		{
		}
		
		override public function begin():void
		{
			trace('country world begin');
			super.begin();
			populate();
			FP.world.add(new ExitUp(20, FP.halfHeight, new TheWorld));
		}
		
		public function populate():void
		{
			var x:int = GRID_SIZE;
			var y:int = GRID_SIZE;
			var complete:Boolean;
			for (var i:int = 0; i < NUMBER_OF_PROVINCES; i++)
			{
				FP.world.add(new ExitDown(x, y, Assets.PROVINCE, new Province));
				x += GRID_SIZE;
			}
		}		
		
	}

}