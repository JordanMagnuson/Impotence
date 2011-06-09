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
		
		public var topText:String;
		public var progressBar:ProgressBar;
		public var instructionText:String;
		
		public var percentFed:Number = 0;
		public var percentFedText:String;
		public var percentFedTextEntity:TextEntity;
		
		public var exitText:String;
		public var exitUpWorld:World;		
		
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
			if (!this.topText) this.topText = "Default top text";
			if (!this.percentFedText) this.percentFedText = "Percentage of hungry people in this room who have been fed:";
			if (!this.instructionText) this.instructionText = "Default instruction text";	
			if (!this.exitText) this.exitText = "When you have finished feeding everyone here, click on the door icon to go up a level.";
			
			//---------------------------------------------
			// Add and position entities
			//---------------------------------------------
			
			// Top text
			add(new TextEntity(FP.halfWidth, 30, topText, 10, 'casual_encounter', 400));
			
			// Progress bar
			add(this.progressBar = new ProgressBar(FP.halfWidth, 60, FP.width, 20, 0XFFE5E5E5, 1, Global.FED_COLOR, 1, true));
			
			// Percent fed text
			add(this.percentFedTextEntity = new TextEntity(FP.halfWidth, 80, percentFedText, 11, 'verdana'));
			
			// Instruction text
			add(new TextEntity(FP.halfWidth, 110, instructionText, 8, 'casual_encounter', 400));
			
			// Exit
			add(new ExitUp(50, 427, this.exitUpWorld));
			add(new TextEntity(85, 416, exitText, 11, 'verdana', 0, 0xFF000000, false));
			
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
			var percent:Number = Math.ceil(percentFed * 10000) / 100;
			this.progressBar.setPercentComplete(this.percentFed);
			this.percentFedTextEntity.updateText(this.percentFedText + " " + percent + "%");
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