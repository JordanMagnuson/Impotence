package src 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.jpunk.Colors;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Person extends Entity
	{
		public var image:Image = new Image(Assets.PERSON);
		public var indexArray:Array;
		public var fed:Boolean = false;
		
		public function Person(x:Number = 0, y:Number = 0, indexArray:Array = null, fed:Boolean = false) 
		{
			super(x, y, image);
			this.indexArray = indexArray;
			this.fed = fed;
			if (fed)
				image.color = Colors.PLAINS_GREEN;
			else
				image.color = Colors.BLOOD_RED;
				
			image.centerOO();
			setHitbox(image.width, image.height, image.originX, image.originY);	
			
			type = 'person';
		}
		
		override public function update():void
		{
			if (!fed && collide('player', x, y))
				feed();
			super.update();
		}
		
		public function feed():void
		{
			image.color = Colors.PLAINS_GREEN;
			fed = true;
			Global.fedPeople.push(indexArray);
			if (checkAllFed())
				Global.fedNeighborhoods.push(new Array(Global.continentIndex, Global.countryIndex, Global.provinceIndex, Global.prefectureIndex, Global.countyIndex, Global.townshipIndex, Global.villageIndex, Global.neighborhoodIndex));
		}
		
		public function checkAllFed():Boolean		
		{
			var personList:Array = [];	
			FP.world.getClass(Person, personList);				
			for each (var p:Person in personList)
			{
				if (!p.fed)
					return false;
			}
			return true;
		}
		
	}

}