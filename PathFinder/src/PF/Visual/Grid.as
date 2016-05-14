package PF.Visual 
{
	import flash.display.Sprite;
	import PF.Calc.Singleton
	import PF.Objects.Node;
	/**
	 * ...
	 * @author Nike
	 */
	public class Grid extends Sprite
	{
		private var c_GridSquares:Vector.<GridSquare>;
		private var c_GridHeight:int;
		private var c_GridWidth:int;
		
		public var c_HasGrid:Boolean = false;
		
		public function Grid() {
			
		}
		
		public function BuildGrid(data2dimensional:Vector.<Vector.<int>> = null, data:Vector.<int> = null, gridWidth:int = -1, gridHeight:int = -1):void 
		{
			c_GridHeight = gridHeight;
			c_GridWidth = gridWidth;
			
			if(data == null) {
				if (data2dimensional != null) {
					data = Singleton.Combine2dIntVector(data2dimensional);
					c_GridHeight = data2dimensional.length;
					c_GridWidth = data2dimensional[0].length;
				} else {
					throw new Error("There was no data send to the grid.");
				}
			} else if (gridWidth == -1 || gridHeight == -1) {
				throw new Error("One or more of the grid dimensions was not set.");
			}
			
			if (Singleton.c_WindowWidth / c_GridWidth <= 1 || Singleton.c_WindowHeight / c_GridHeight <= 1) {
				throw new Error("There can't be more squares in the grid than pixels on the stage.");
			}
			
			c_GridSquares = new Vector.<GridSquare>(data.length);
			
			//calculate the smallest size that fits the screen
			const screenAlignment:String = Singleton.c_WindowHeight / c_GridHeight < Singleton.c_WindowWidth / c_GridWidth ? "height" : "width";
			var squareSize:Number;
			
			//set the correct size for the squareas and position the grid to the center
			if (screenAlignment == "height") {
				squareSize = Singleton.c_WindowHeight / c_GridHeight;
				x += (Singleton.c_WindowWidth - squareSize * c_GridWidth) / 2;
			} else {
				squareSize = Singleton.c_WindowWidth / c_GridWidth;
				y += (Singleton.c_WindowHeight - squareSize * c_GridHeight) / 2;
			}
			
			for (var i:int = 0; i < data.length; i++) 
			{
				var color:uint;
				if(data[i] != 0) {
					color = 0x000000;
				} else {
					color = 0xEEEEEE;
				}
				
				var sq:GridSquare = new GridSquare(squareSize, color);
				sq.x = (i - Math.floor(i / c_GridWidth) * c_GridWidth) * squareSize;
				sq.y = Math.floor(i / c_GridWidth) * squareSize;
				addChild(sq);
				
				c_GridSquares.push(sq);
			}
			
			c_HasGrid = true;
		}
		
		public function RemoveGrid():void
		{
			while(numChildren > 0) {
				removeChildAt(0);
			}
		}
	}

}