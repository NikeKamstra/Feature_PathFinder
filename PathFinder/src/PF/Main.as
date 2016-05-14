package PF
{
	import flash.display.Sprite;
	import flash.events.Event;
	import PF.Visual.Grid;
	
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
			var grid:Grid = new Grid(null, new < Vector.<int> > [new <int>[5,6,7], new <int>[1,2,3]]);
		}
	}
	
}