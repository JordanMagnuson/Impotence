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
		public var centered:Boolean;
		
		public var bar:Image;
		public var bg:Image;	
		
		public var barOpacity:Number;
		public var bgOpacity:Number;
		
		public function ProgressBar(x:Number = 0, y:Number = 0, barWidth:Number = 0, barHeight:Number = 0, bgColor:uint = 0xFFE5E5E5, bgOpacity:Number = 1, barColor:uint = 0xFF000000, barOpacity:Number = 1, centered:Boolean = false) 
		{
			this.barWidth = barWidth;
			this.barHeight = barHeight;
			this.bgColor = bgColor;
			this.bgOpacity = bgOpacity;
			this.barColor = barColor;
			this.barOpacity = barOpacity;
			this.centered = centered;
			bg = Image.createRect(barWidth, barHeight, bgColor, bgOpacity);
			bar = Image.createRect(1, 1, bgColor, 0);
			
			super(x, y);
			
			if (centered) 
			{
				bg.centerOO();
			}		
			setHitbox(bg.width, bg.height, bg.originX, bg.originY);			
		}
		
		public function setPercentComplete(percentComplete:Number):void
		{
			if (percentComplete <= 0)
			{
				bar = Image.createRect(1, 1, bgColor, 0);
				return;
			}
			
			this.percentComplete = percentComplete;
			var fillWidth:Number = Math.floor(percentComplete * barWidth);
			bar = Image.createRect(fillWidth, barHeight, barColor, barOpacity);
		}
		
		override public function render():void
		{
			// bg
			bg.render(renderTarget ? renderTarget : FP.buffer, new Point(x, y), FP.camera);
			
			// bar
			if (centered) 
				bar.render(renderTarget ? renderTarget : FP.buffer, new Point(x - halfWidth, y - halfHeight), FP.camera);
			else 
				bar.render(renderTarget ? renderTarget : FP.buffer, new Point(x, y), FP.camera);
		}
		
	}

}