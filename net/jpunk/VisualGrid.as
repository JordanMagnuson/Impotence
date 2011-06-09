package net.jpunk 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Draw;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class VisualGrid extends Entity
	{
		public static const GRID_POS:Point = new Point(30, 100);	// Location of top left corner	
		public static const GRID_COLS:int = 8;		
		public static const GRID_ROWS:int = 8;
		public static const CELL_WIDTH:int = 40;	// Width in pixels
		public static const CELL_HEIGHT:int = 40;	// Height in pixels		
		
		public var rows:int;
		public var cols:int;
		public var cells:Array = [];
		public var cellWidth:Number;
		public var cellHeight:Number;
		
		public function VisualGrid(x:Number = 0, y:Number = 0, width:Number = 0, height:Number = 0, rows:int = 0, cols:int = 0) 
		{
			this.x = x;
			this.y = y;
			this.width = width;
			this.height = height;
			this.rows = rows;
			this.cols = cols;
			
			this.cellWidth = width / cols;
			this.cellHeight = height / rows;
			
			createGrid();
		}
		
		public function createGrid():void
		{
			var cellX:Number = 0;
			var cellY:Number = 0;
			for (var r:int = 0; r < rows; r++)
			{
				cellX = 0;
				trace('visual grid row');
				for (var c:int = 0; c < cols; c++)
				{
					var cell:Object = {};
					
					cell.row = r;
					cell.col = c;
					cell.x = x + cellX;
					cell.y = y + cellY;
					cell.centerX = x + cellX + this.cellWidth / 2;
					cell.centerY = y + cellY + this.cellHeight / 2;
					this.cells.push(cell);
					
					cellX += cellWidth;
					
				}
				cellY += cellHeight;
			}			
		}
		
		override public function render():void
		{
			// Draw background rectangle for entire grid
			Draw.rect(this.x, this.y, this.width, this.height, Colors.LIGHT_BROWN);
			
			// Draw grid lines
			for (var r:int; r <= this.rows; r++)
			{		
				var x1:int = this.x;
				var x2:int = this.x + this.width;
				var y1:int = this.y + r * this.cellHeight;
				var y2:int = y1;
				if (r % 4 == 0)
					Draw.line(x1, y1, x2, y2, Colors.WHITE); 
				else if (r % 2 == 0)
					Draw.line(x1, y1, x2, y2, Colors.BLACK); 
				else
					Draw.line(x1, y1, x2, y2, Colors.DARK_BROWN); 
			}
			for (var c:int; c <= this.cols; c++)
			{
				x1 = this.x + c * this.cellWidth;
				x2 = x1;
				y1 = this.y;
				y2 = this.y + this.height;
				if (c % 4 == 0)
					Draw.line(x1, y1, x2, y2, Colors.WHITE); 
				else if (c % 2 == 0)
					Draw.line(x1, y1, x2, y2, Colors.BLACK); 
				else
					Draw.line(x1, y1, x2, y2, Colors.DARK_BROWN); 
			}			
		}
		
	}

}