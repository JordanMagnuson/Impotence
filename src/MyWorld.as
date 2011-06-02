package src 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.jpunk.ProgressBar;
	import net.jpunk.TextEntity;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class MyWorld extends World
	{
		public var started:Boolean = false;
		public var index:int = 0;
		public var depth:int = 0;
		public var topText:TextEntity;
		
		public var percentFed:Number = 0;
		public var percentFedText:TextEntity;
		public var progressBar:ProgressBar;
		
		public function MyWorld(index:int = 0) 
		{
			this.index = index;
		}
		
		override public function begin():void
		{
			super.begin();
			populate();
			add(Global.mouseController = new MouseController);
			add(progressBar = new ProgressBar(100, 100, 100, 40));
			//add(Global.player = new Player(FP.halfWidth, FP.halfHeight));
		}
		
		override public function update():void
		{
			if (!started)
			{
				started = true;
				percentFed = checkPercentFed();
				updateProgressBar();
				if (percentFed == 1)
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
		
		public function updateProgressBar():void
		{
			this.progressBar.setPercentComplete(this.percentFed);
		}
		
		public function checkPercentFed():Number		
		{
			var percentFed:Number = 0;
			var exitDownList:Array = [];	
			var fedList:Array = [];	
			FP.world.getClass(ExitDown, exitDownList);				
			for each (var e:ExitDown in exitDownList)
			{
				if (e.fed)
					fedList.push(e);
			}
			percentFed = (fedList.length / exitDownList.length);
			return percentFed;
		}				
		
	}

}