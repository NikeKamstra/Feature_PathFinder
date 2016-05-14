package PF
{
	import flash.display.Sprite;
	import flash.events.Event;
	import PF.Visual.Grid;
	import PF.Visual.Menu;
	
	/**
	 * ...
	 * @author Nike
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var menu:Menu = new Menu();
			addChild(menu);
			var grid:Grid = new Grid(new < Vector.<int> > [new <int>[0,1,0], new <int>[1,0,1], new <int>[0,1,0], new <int>[1,0,1]]);
			addChild(grid);
		}
	}
	
}