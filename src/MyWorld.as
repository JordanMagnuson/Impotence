package src 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class MyWorld extends World
	{
		
		public function MyWorld() 
		{
			
		}
		
		override public function begin():void
		{
			add(Global.player = new Player(FP.halfWidth, FP.halfHeight));
		}
		
	}

}