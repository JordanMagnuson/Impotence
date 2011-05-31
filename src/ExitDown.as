package src 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.jpunk.Colors;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class ExitDown extends Entity
	{
		public var image:Image;
		public var exitToWorld:World;
		import net.flashpunk.FP;
		
		public function ExitDown(x:Number = 0, y:Number = 0, imageSource:* = null, exitToWorld:World = null, fed:Boolean = false) 
		{
			image = new Image(imageSource);
			super(x, y, image);
			this.exitToWorld = exitToWorld;
			
			if (fed)
				image.color = Colors.PLAINS_GREEN;
			else	
				image.color = Colors.BLOOD_RED;
			image.centerOO();
			setHitbox(image.width, image.height, image.originX, image.originY);
			
			type = 'exit_down';			
		}
		
		override public function update():void
		{
			if (collide('player', x, y))
			{
				FP.world = exitToWorld;
			}
		}
		
	}

}