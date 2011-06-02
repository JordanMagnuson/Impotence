package src 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.jpunk.Colors;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class ExitDown extends Entity
	{
		public var image:Image;
		public var exitToWorld:World;
		public var fed:Boolean;
		
		public function ExitDown(x:Number = 0, y:Number = 0, imageSource:* = null, exitToWorld:World = null, fed:Boolean = false) 
		{
			image = new Image(imageSource);
			super(x, y, image);
			this.exitToWorld = exitToWorld;
			
			this.fed = fed
			if (fed)
				image.color = Global.FED_COLOR;
			else	
				image.color = Global.HUNGRY_COLOR;
			image.centerOO();
			setHitbox(image.width, image.height, image.originX, image.originY);
			
			type = 'exit_down';			
		}
		
		public function exit():void
		{
			FP.world = exitToWorld;
		}
		
	}

}