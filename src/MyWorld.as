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
		public var index:int = 0;
		
		public function MyWorld(index:int = 0) 
		{
			this.index = 0;
		}
		
		override public function begin():void
		{
			add(Global.player = new Player(FP.halfWidth, FP.halfHeight));
		}
		
	}

}