package src 
{
	import net.flashpunk.graphics.Image;
	import net.jpunk.TopDownMover;
	import net.jpunk.Colors;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Player extends TopDownMover
	{
		public const SPEED:Number = 500;
		
		public function Player(x:Number, y:Number) 
		{
			image = Image.createRect(20, 20, Colors.BLACK, 1);
			super(SPEED, x, y, image);
			type = 'player';
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}