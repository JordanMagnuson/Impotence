package src 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import flash.ui.Mouse;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class MouseController extends Entity
	{
		public var breadImage:Image = new Image(Assets.CURSOR_BREAD);
		public var handImage:Image = new Image(Assets.CURSOR_HAND);
		
		public function MouseController() 
		{
			breadImage.centerOO();
			handImage.centerOO();
			type = 'mouse_controller';
			layer = -1000;
		}
		
		override public function update():void
		{
			x = FP.world.mouseX;
			y = FP.world.mouseY;
			
			var overlapPerson:Person = collide('person', x, y) as Person;
			var overlapExitUp:ExitUp = collide('exit_up', x, y) as ExitUp;
			var overlapExitDown:ExitDown = collide('exit_down', x, y) as ExitDown;
			
			if (overlapExitUp)
			{
				graphic = handImage;
				visible = true;
				Mouse.hide();
				
				if (Input.mousePressed)
					overlapExitUp.exit();
			}			
			else if (overlapExitDown)
			{
				graphic = handImage;
				visible = true;
				Mouse.hide();
				
				if (Input.mousePressed)
					overlapExitDown.exit();			
			}
			else if (overlapPerson && !overlapPerson.fed)
			{
				graphic = breadImage;
				visible = true;
				Mouse.hide()
				
				if (Input.mouseDown)
					overlapPerson.feed()
			}
			else if (Input.mouseDown)
			{
				graphic = breadImage;
				visible = true;
				Mouse.hide()				
			}
			else
			{
				visible = false;
				Mouse.show();
			}
			
			super.update();
		}		
	}

}