package PF
{
	import flash.display.Sprite;
	import flash.events.Event;
	import PF.Visual.Grid;
	import PF.Visual.Menu;
	import PF.Events.CustomButtonEvent;
	
	/**
	 * ...
	 * @author Nike
	 */
	public class Main extends Sprite 
	{
		private const c_Menu:Menu = new Menu();
		private var c_Grid:Grid = new Grid();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function BuildGrid(e:CustomButtonEvent):void {
			trace("hallo");
			if (c_Grid.c_HasGrid) {
				c_Grid.RemoveGrid();
			}
			var data:Vector.<int> = new Vector.<int>(e.c_GridHeight * e.c_GridWidth);
			
			for (var i:int = 0; i < e.c_GridHeight * e.c_GridWidth; i++) 
			{
				data.push(Math.random() > e.c_ObstaclePercentage / 100 ? 0 : 1);
			}
			c_Grid.BuildGrid(null, data, e.c_GridWidth, e.c_GridHeight);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(c_Menu);
			addChild(c_Grid);
			
			addEventListener(CustomButtonEvent.GENERATE_GRID, BuildGrid);
			if (willTrigger(CustomButtonEvent.GENERATE_GRID)) {
				trace("correct")
			} else {
				trace("well fuck");
			}
		}
	}
	
}