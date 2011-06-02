package net.jpunk 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class ProgressBar extends Entity
	{
		public var percentComplete:Number = 0;
		public var barWidth:Number;
		public var barHeight:Number;
		public var barColor:uint;
		public var bgColor:uint;
		
		public var bar:Image;
		public var bg:Image;
		
		public var _point:Point;
		
		public function ProgressBar(x:Number = 0, y:Number = 0, barWidth:Number = 0, barHeight:Number = 0, bgColor:uint = 0xFFE5E5E5, barColor:uint = 0xFF000000) 
		{
			this.barWidth = barWidth;
			this.barHeight = barHeight;
			this.bgColor = bgColor;
			this.barColor = barColor;
			bg = Image.createRect(barWidth, barHeight, bgColor);
			bar = Image.createRect(1, 1, bgColor);
			super(x, y);
			_point = new Point(x, y);
		}
		
		public function setPercentComplete(percentComplete:Number):void
		{
			if (percentComplete <= 0)
			{
				bar = Image.createRect(1, 1, bgColor);
				return;
			}
			
			this.percentComplete = percentComplete;
			var fillWidth:Number = Math.floor(percentComplete * barWidth);
			bar = Image.createRect(fillWidth, barHeight, barColor);
		}
		
		override public function render():void
		{
			//super.render();
			bg.render(renderTarget ? renderTarget : FP.buffer, new Point(x, y), FP.camera);
			bar.render(renderTarget ? renderTarget : FP.buffer, new Point(x, y), FP.camera);
		}
		
	}

}