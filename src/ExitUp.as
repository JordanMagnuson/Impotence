package src 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class ExitUp extends Entity
	{
		public static const WIDTH:Number = 36;
		
		public var exitToWorld:World;
		public var image:Spritemap = new Spritemap(Assets.DOOR, 36, 47);
		
		public function ExitUp(x:Number = 0, y:Number = 0, exitToWorld:World = null) 
		{
			super(x, y, image);
			this.exitToWorld = exitToWorld;
			
			image.add('inactive', [0], 0);
			image.add('active', [1], 0);
			image.centerOO();
			setHitbox(image.width, image.height, image.originX, image.originY);
			
			type = 'exit_up';
		}
		
		override public function update():void
		{
			if (collide('mouse_controller', x, y))
				image.play('active');
			else
				image.play('inactive');
		}
		
		public function exit():void
		{
			FP.world = exitToWorld;
		}
		
	}

}