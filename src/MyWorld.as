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
		public var started:Boolean = false;
		public var index:int = 0;
		public var depth:int = 0;
		
		public function MyWorld(index:int = 0) 
		{
			this.index = index;
		}
		
		override public function begin():void
		{
			super.begin();
			populate();
			add(Global.player = new Player(FP.halfWidth, FP.halfHeight));
		}
		
		override public function update():void
		{
			if (!started)
			{
				started = true;
				if (checkAllChildrenFed())
				{
					markThisFed();	
				}
			}
			super.update();
		}
		
		public function populate():void
		{
			
		}
		
		public function markThisFed():void
		{
			
		}
		
		public function checkAllChildrenFed():Boolean		
		{
			var exitDownList:Array = [];	
			getClass(ExitDown, exitDownList);	
			trace(exitDownList);
			for each (var e:ExitDown in exitDownList)
			{
				if (!e.fed)
					return false;
			}
			return true;	
		}
		
	}

}