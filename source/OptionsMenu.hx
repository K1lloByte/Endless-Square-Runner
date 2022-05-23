package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxVirtualPad;
import flixel.util.FlxColor;
import openfl.system.System;

class OptionsMenu extends FlxState
{
	var menuUi:FlxTypedGroup<FlxText> = new FlxTypedGroup<FlxText>();
	var menuList = ["deleteProgress"];
	var curSelected = 0;

	override function create()
	{
		super.create();
		add(menuUi);
		for (i in 0...menuList.length)
		{
			var text = new FlxText(0, 30 * i, 0, menuList[i], 20);
			text.ID = i;
			menuUi.add(text);
		}
	}

	var text = new FlxText(0, 0, 0, "DONE", 10).screenCenter(XY);

	var prompting:Bool = false;

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		/*#if html5
			var virtualPad = new FlxVirtualPad(UP_DOWN);
			virtualPad.x = 1000;
			virtualPad.y = 500;
			if (FlxG.gamepads.anyJustPressed(0))
			{
				switch (menuList[curSelected])
				{
					case "deleteProgress":
						prompt();
				}
			}
			for (touch in FlxG.touches.list)
			{
				if (touch.justPressed && !touch.overlaps(virtualPad))
				{
					switch (menuList[curSelected])
					{
						case "deleteProgress":
							prompt();
					}
				}
			}
			if (virtualPad.buttonUp.justPressed || virtualPad.buttonDown.justPressed || FlxG.gamepads.anyJustPressed(36) || FlxG.gamepads.anyJustPressed(34))
			{
				if (virtualPad.buttonUp.justPressed || FlxG.gamepads.anyJustPressed(34))
				{
					if (curSelected == 0)
						curSelected = 3;
					else
						curSelected -= 1;
				}
				else
				{
					if (curSelected == 3)
						curSelected = 0;
					else
						curSelected += 1;
				}
			}
			menuUi.forEach(function(text:FlxText)
			{
				if (text.ID == curSelected)
				{
					text.size = 22;
				}
				else
				{
					text.size = 20;
				}
			});
			#end */

		if (FlxG.keys.justPressed.ENTER || FlxG.gamepads.anyJustPressed(0))
		{
			switch (menuList[curSelected])
			{
				case "deleteProgress":
					prompt();
			}
		}
		if (!prompting && FlxG.gamepads.anyJustPressed(1))
			FlxG.switchState(new MainMenuState());

		if (FlxG.keys.justPressed.UP
			|| FlxG.keys.justPressed.DOWN
			|| FlxG.gamepads.anyJustPressed(36)
			|| FlxG.gamepads.anyJustPressed(34))
		{
			if (FlxG.keys.justPressed.UP || FlxG.gamepads.anyJustPressed(34))
			{
				if (curSelected == 0)
					curSelected = 2;
				else
					curSelected -= 1;
			}
			else
			{
				if (curSelected == 2)
					curSelected = 0;
				else
					curSelected += 1;
			}
		}
		menuUi.forEach(function(text:FlxText)
		{
			if (text.ID == curSelected)
			{
				text.borderColor = FlxColor.YELLOW;
				text.size = 22;
			}
			else
			{
				text.borderColor = FlxColor.WHITE;
				text.size = 20;
			}
		});
		if (prompting)
		{
			if (FlxG.keys.justPressed.ENTER || FlxG.gamepads.anyJustPressed(0))
			{
				FlxG.save.data.achievements = [];
				FlxG.save.data.highscore = '' + 0;
				FlxG.save.flush();
				prompting = false;
			}
		}
	}

	function prompt()
	{
		prompting = true;
	}
}
