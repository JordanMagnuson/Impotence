package src 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.jpunk.Colors;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Province extends MyWorld
	{
		public const NUMBER_OF_PREFECTURES:int = 20;
		
		public function Province() 
		{
			
		}
		
		override public function begin():void
		{
			trace('province world begin');
			super.begin();
			FP.world.add(new ExitUp(20, FP.halfHeight, new Country));
		}
		
	}

}