package src
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import flash.ui.Mouse;
	import net.jpunk.Colors;
	
	public class Main extends Engine
	{
		public function Main() 
		{
			super(800, 400, 60);
			FP.screen.color = Colors.WHITE;
			
			// Console for debugging
			FP.console.enable();					
			
			
			
			//Mouse.hide();
		}
		
		override public function init():void
		{
			super.init();
			FP.world = new TheWorld;
		}
	}
}