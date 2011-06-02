package src 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.jpunk.Colors;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Person extends Entity
	{
		public var image:Image;
		public var indexArray:Array;
		public var fed:Boolean = false;
		
		public function Person(x:Number = 0, y:Number = 0, indexArray:Array = null, fed:Boolean = false) 
		{
			if (fed)
			{
				image = new Image(Assets.PERSON_01_FED);
				image.color = Global.FED_COLOR;				
			}
			else
			{
				image = new Image(Assets.PERSON_01_HUNGRY);
				image.color = Global.HUNGRY_COLOR;	
			}
			super(x, y, image);
			
			this.indexArray = indexArray;
			this.fed = fed;
				
			//image.originX = image.scaledWidth / 2;
			//image.originY = image.scaledHeight / 2;
			//image.x = image.originX;
			//image.y = image.originY;
			//image.scale = 0.4;
			setHitbox(image.scaledWidth, image.scaledHeight, image.originX, image.originY);	
			
			type = 'person';
		}
		
		public function feed():void
		{
			if (fed)
				return;
			
			trace('feed');
			// Update image
			graphic = image = new Image(Assets.PERSON_01_FED);
			image.color = Global.FED_COLOR;
			setHitbox(image.scaledWidth, image.scaledHeight, image.originX, image.originY);	
			
			// Mark fed
			fed = true;
			Global.fedPeople.push(indexArray);
			var percentFed:Number = (world as Neighborhood).checkPercentFed();
			(world as Neighborhood).percentFed = percentFed;
			(world as Neighborhood).updateProgressBar();
			
			// Check all
			if (percentFed == 1)
				(world as Neighborhood).markThisFed();
		}
	}

}