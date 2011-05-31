package src 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class ExitUp extends Entity
	{
		public var exitToWorld:World;
		public var image:Image = new Image(Assets.EXIT_UP);
		
		public function ExitUp(x:Number = 0, y:Number = 0, exitToWorld:World = null) 
		{
			super(x, y, image);
			this.exitToWorld = exitToWorld;
			
			image.centerOO();
			setHitbox(image.width, image.height, image.originX, image.originY);
			
			type = 'exit_up';
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