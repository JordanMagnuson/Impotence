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
		public var instructionText:TextEntity;
		public var exitUp:ExitUp;
		
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
			
			// Text
			if (!this.topText) this.topText = new TextEntity(FP.halfWidth, 20, "Default top text", 10, 'casual_encounter', 400);
			if (!this.percentFedText) this.percentFedText = new TextEntity(FP.halfWidth, 100, 'Percentage of hungry people in this room who have been fed', 12, 'verdana');
			if (!this.instructionText) this.instructionText = new TextEntity(FP.halfWidth, 20, "Instruction text", 8, 'casual_encounter', 400);
			
			// Progress bar
			this.progressBar = new ProgressBar(FP.halfWidth, 50, 440, 30, 0XFFE5E5E5, 1, Global.FED_COLOR, 1, true);
			
			// Exit
			if (!this.exitUp) this.exitUp = new ExitUp(50, FP.halfHeight);		
			
			// Position
			this.topText.y = 30;
			this.progressBar.y = 70;
			this.percentFedText.y = 95;
			this.instructionText.y = 120;
			this.exitUp.x = 60;
			this.exitUp.y = 350;
			
			add(this.topText);
			add(this.percentFedText);
			add(this.progressBar);
			add(this.instructionText);
			add(this.exitUp);
			
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
					markThisFed();		// For some reason, we have to wait until the game starts updating to do this.
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
			//this.percentFedText.updateText("Percentage of hungry people in this room who have been fed: " + String(percentFed * 100) + "%");
			//this.percentFedText = new TextEntity(FP.halfWidth, 50, "Percentage of hungry people in this neighborhood who have been fed: " + String(percentFed), 8, 'casual_encounter');
			//add(this.topText);			
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