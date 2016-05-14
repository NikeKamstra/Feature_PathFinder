package PF.Visual 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import PF.Calc.Singleton;
	/**
	 * ...
	 * @author Nike
	 */
	public class Menu extends Sprite
	{
		private var c_GridHeightIF:TextField = new TextField();
		private var c_GridWidthIF:TextField = new TextField();
		private var c_ObstaclePercentageIF:TextField = new TextField();
		
		public function Menu()
		{
			y = Singleton.c_WindowHeight;
			
			addChild(c_GridHeightIF);
			addChild(c_GridWidthIF);
			addChild(c_ObstaclePercentageIF);

			c_GridHeightIF.border = true;
			c_GridWidthIF.border = true;
			c_ObstaclePercentageIF.border = true;
			
			c_GridHeightIF.width = 30;
			c_GridWidthIF.width = 30;
			c_ObstaclePercentageIF.width = 30;
			
			c_GridHeightIF.height = 20;
			c_GridWidthIF.height = 20;
			c_ObstaclePercentageIF.height = 20;
			
			c_GridHeightIF.x = 0;
			c_GridWidthIF.x = 50;
			c_ObstaclePercentageIF.x = 100;
			
			c_GridHeightIF.y = 0;
			c_GridWidthIF.y = 0;
			c_ObstaclePercentageIF.y = 0;
			
			c_GridHeightIF.type = "input";
			c_GridWidthIF.type = "input";
			c_ObstaclePercentageIF.type = "input";
			
			c_GridHeightIF.maxChars = 3;
			c_GridWidthIF.maxChars = 3;
			c_ObstaclePercentageIF.maxChars = 3;
			
			c_GridHeightIF.restrict = "0-9";
			c_GridWidthIF.restrict = "0-9";
			c_ObstaclePercentageIF.restrict = "0-9";
			
			c_GridHeightIF.addEventListener(Event.CHANGE, InputFieldUpdate);
			c_GridWidthIF.addEventListener(Event.CHANGE, InputFieldUpdate);
			c_ObstaclePercentageIF.addEventListener(Event.CHANGE, InputFieldUpdate);
		}
		
		private function InputFieldUpdate(e:Event):void {
			if (e.target.text == "") {
				e.target.borderColor = 0xFF0000;
				return;
			}
			var inputNumber:int = e.target.text;
			if (e.target == c_GridHeightIF) {
				if (inputNumber < 1 || inputNumber > Singleton.c_WindowHeight) {
					c_GridHeightIF.borderColor = 0xFF0000;
				} else {
					c_GridHeightIF.borderColor = 0x00FF00;
				}
			} else if (e.target == c_GridWidthIF) {
				if (inputNumber < 1 || inputNumber > Singleton.c_WindowWidth) {
					c_GridWidthIF.borderColor = 0xFF0000;
				} else {
					c_GridWidthIF.borderColor = 0x00FF00;
				}
			} else if (e.target == c_ObstaclePercentageIF) {
				if (inputNumber < 0 || inputNumber > 100) {
					c_ObstaclePercentageIF.borderColor = 0xFF0000;
				} else {
					c_ObstaclePercentageIF.borderColor = 0x00FF00;
				}
			}
		}
		
	}

}