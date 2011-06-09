package net.jpunk 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	public class TextEntity extends Entity
	{
		public var text:Text;
		public var string:String;
		public var font:String;
		public var size:Number;
		public var color:uint;
		public var centered:Boolean;
		
		public function TextEntity(x:Number = 0, y:Number = 0, string:String = null, size:Number = 8, font:String = null, sharpness:Number = 0, color:uint = 0xFF000000, centered:Boolean = true) 
		{
			this.string = string;
			this.text = text = new Text(string, 0, 0, sharpness);
			this.font = text.font = font;
			this.size = text.size = size;
			this.color = text.color = color;
			this.centered = centered;
			super(x, y, text);
		
			// Center text
			if (centered)
			{
				text.originX = text.textWidth / 2;
				text.originY = text.textHeight / 2;
				setHitbox(text.textWidth, text.textHeight, text.originX, text.originY);
			}
		}
		
		public function updateText(string:String = null, size:Number = 0, font:String = null, color:uint = 0):void
		{
			if (string) this.string = string;
			if (size) this.size = size;
			if (font) this.font = font;
			if (color) this.color = color;
		
			// Set text
			text.text = this.string;
			text.font = this.font;
			text.size = this.size;
			text.color = this.color;
			
			// Center text
			if (this.centered)
			{
				text.originX = text.textWidth / 2;
				text.originY = text.textHeight / 2;
				setHitbox(text.textWidth, text.textHeight, text.originX, text.originY);
			}
			
			// Update buffer
			text.updateBuffer();
			
			graphic = text;
		}
		
	}

}