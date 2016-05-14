package PF.Events 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Nike
	 */
	public class CustomButtonEvent extends Event
	{
		public static const GENERATE_GRID:String = "generateGrid";
		
		public var c_GridHeight:int;
		public var c_GridWidth:int;
		public var c_ObstaclePercentage:int;
		
		public function CustomButtonEvent(type:String, gridWidth:int, gridHeight:int, obstaclePercentage:int, bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, bubbles, cancelable);
			c_GridHeight = gridHeight;
			c_GridWidth = gridWidth;
			c_ObstaclePercentage = obstaclePercentage;
		}
		
		public override function clone():Event
		{
			return new CustomButtonEvent(type, c_GridWidth, c_GridHeight, c_ObstaclePercentage, bubbles, cancelable);
		}
		
	}

}