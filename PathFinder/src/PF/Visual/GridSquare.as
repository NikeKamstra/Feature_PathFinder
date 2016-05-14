package PF.Visual 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Nike
	 */
	public class GridSquare extends Sprite
	{
		
		public function GridSquare(size:Number, color:uint)
		{
			graphics.beginFill(color);
			graphics.drawRect(0, 0, size, size);
			graphics.endFill();
		}
		
	}

}