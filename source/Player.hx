package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.gamepad.FlxGamepad;
import flixel.input.gamepad.FlxGamepadButton;
import flixel.text.FlxText;
import flixel.ui.FlxVirtualPad;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	var positionArray = [180, 360, 540];
	var curPosition:Int = 0;
	var stop:Bool = false;

	public function new()
	{
		super();
		makeGraphic(100, 100, FlxColor.WHITE);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		/*#if html5
			var quit = new FlxText(1000, 0, 0, "tap me to quit", 10);
			for (touch in FlxG.touches.list)
			{
				if (touch.justPressed)
				{
					if (touch.overlaps(quit))
						FlxG.switchState(new MainMenuState());
				}
			}
			var virtualPad = new FlxVirtualPad(UP_DOWN);
			virtualPad.x = 1000;
			virtualPad.y = 500;
			if (!stop)
			{
				if (virtualPad.buttonUp.justPressed || virtualPad.buttonDown.justPressed || FlxG.gamepads.anyJustPressed(36) || FlxG.gamepads.anyJustPressed(34))
				{
					if (virtualPad.buttonUp.justPressed || FlxG.gamepads.anyJustPressed(34))
					{
						if (curPosition == 0)
							curPosition = 2;
						else
							curPosition -= 1;
					}
					else
					{
						if (curPosition == 2)
							curPosition = 0;
						else
							curPosition += 1;
					}
				}
			}
			#end */

		y = positionArray[curPosition];
		if (!stop)
		{
			if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.DOWN || FlxG.gamepads.anyJustPressed(36) || FlxG.gamepads.anyJustPressed(34))
			{
				if (FlxG.keys.justPressed.UP || FlxG.gamepads.anyJustPressed(34))
				{
					if (curPosition == 0)
						curPosition = 2;
					else
						curPosition -= 1;
				}
				else
				{
					if (curPosition == 2)
						curPosition = 0;
					else
						curPosition += 1;
				}
			}
		}
	}

	public function sstop()
	{
		stop = true;
	}
}
