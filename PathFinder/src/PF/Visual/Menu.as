package PF.Visual 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import PF.Calc.Singleton;
	import PF.Events.CustomButtonEvent;
	/**
	 * ...
	 * @author Nike
	 */
	public class Menu extends Sprite
	{
		private const c_InputTitles:Vector.<String> = new <String>["width","Horizontal squares(amount)", "height", "Vertical squares(amount)", "obsPerc", "Percentage of obstacles (0-100)"];
		private const c_TextFields:Vector.<TextField> = new Vector.<TextField>(6);
		private const c_GenerateButton:Sprite = new Sprite();
		
		public function Menu()
		{
			y = Singleton.c_WindowHeight;
			
			for (var i:int = 0; i < c_TextFields.length; i++) 
			{
				c_TextFields[i] = new TextField();
				addChild(c_TextFields[i]);
				c_TextFields[i].height = 20;
				c_TextFields[i].y = 0;
				
				//Different values for an inputfield and a plain textfield.
				if (i % 2 == 0) {
					//inputfields:
					c_TextFields[i].border = true;
					c_TextFields[i].width = 25;
					c_TextFields[i].type = "input";
					c_TextFields[i].maxChars = 3;
					c_TextFields[i].restrict = "0-9";
					c_TextFields[i].addEventListener(Event.CHANGE, InputFieldUpdate);
				} else {
					//plain textfield:
					c_TextFields[i].text = c_InputTitles[i];
					c_TextFields[i].autoSize = TextFieldAutoSize.LEFT;
				}
				var xPos:int = 0;
				for (var j:int = 0; j < i; j++) 
				{
					xPos += c_TextFields[j].width + 1;
				}
				c_TextFields[i].x = xPos;
			}
			
			c_GenerateButton.graphics.beginFill(0xAAAAAA);
			c_GenerateButton.graphics.drawRect(0, 0, 200, 20);
			c_GenerateButton.graphics.endFill();
			
			c_GenerateButton.useHandCursor = true;
			c_GenerateButton.buttonMode = true;
			c_GenerateButton.mouseChildren = false;
			c_GenerateButton.x = width/2-100;
			c_GenerateButton.y = 21;
			
			addChild(c_GenerateButton);
			
			var buttonText:TextField = new TextField();
			c_GenerateButton.addChild(buttonText);
			buttonText.text = "Generate Grid.";
			buttonText.height = 20;
			buttonText.autoSize = TextFieldAutoSize.LEFT;
			buttonText.x = 100 - buttonText.width / 2;
			
			c_GenerateButton.addEventListener(MouseEvent.CLICK, GenerateGrid);
		}
		
		private function GenerateGrid(e:MouseEvent):void {
			if (c_TextFields[0].borderColor != 0x00FF00 || c_TextFields[2].borderColor != 0x00FF00 || c_TextFields[4].borderColor != 0x00FF00) {
				trace("oeps");
				return;
			}
			trace("grotere oeps");
			dispatchEvent(new CustomButtonEvent(CustomButtonEvent.GENERATE_GRID, int(c_TextFields[0].text), int(c_TextFields[2].text), int(c_TextFields[4].text)));
		}
		
		private function InputFieldUpdate(e:Event):void {
			if (e.target.text == "") {
				e.target.borderColor = 0xFF0000;
				return;
			}
			
			var inputNumber:int = int(e.target.text);
			var borderColor:uint;
			if (e.target == c_TextFields[0]) {
				if (inputNumber < 1 || inputNumber > Singleton.c_WindowWidth) {
					borderColor = 0xFF0000;
				} else {
					borderColor = 0x00FF00;
				}
			} else if (e.target == c_TextFields[2]) {
				if (inputNumber < 1 || inputNumber > Singleton.c_WindowHeight) {
					borderColor = 0xFF0000;
				} else {
					borderColor = 0x00FF00;
				}
			} else if (e.target == c_TextFields[4]) {
				if (inputNumber < 0 || inputNumber > 100) {
					borderColor = 0xFF0000;
				} else {
					borderColor = 0x00FF00;
				}
			}
			e.target.borderColor = borderColor;
		}
		
	}

}