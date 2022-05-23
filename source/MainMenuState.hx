package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.touch.FlxTouch;
import flixel.text.FlxText;
import flixel.ui.FlxVirtualPad;

class MainMenuState extends FlxState
{
	var menuUi:FlxTypedGroup<FlxText> = new FlxTypedGroup<FlxText>();
	var menuList = ["Start", "Achievements", "Options"];
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
		if (FlxG.save.data.highscore == null)
		{
			FlxG.save.data.highscore = '' + 0;
			FlxG.save.flush();
		}
		if (FlxG.save.data.achievements == null)
		{
			FlxG.save.data.achievements = [];
			FlxG.save.flush();
		}
	}

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
					case "Start":
						FlxG.switchState(new PlayState());
					case "Achievements":
						FlxG.switchState(new AchievementsState());
					case "Options":
						FlxG.switchState(new OptionsMenu());
				}
			}
			for (touch in FlxG.touches.list)
			{
				if (touch.justPressed && !touch.overlaps(virtualPad))
				{
					switch (menuList[curSelected])
					{
						case "Start":
							FlxG.switchState(new PlayState());
						case "Achievements":
							FlxG.switchState(new AchievementsState());
						case "Options":
							FlxG.switchState(new OptionsMenu());
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
				case "Start":
					FlxG.switchState(new PlayState());
				case "Achievements":
					FlxG.switchState(new AchievementsState());
				case "Options":
					FlxG.switchState(new OptionsMenu());
			}
		}

		if (FlxG.keys.justPressed.UP
			|| FlxG.keys.justPressed.DOWN
			|| FlxG.gamepads.anyJustPressed(36)
			|| FlxG.gamepads.anyJustPressed(34))
		{
			if (FlxG.keys.justPressed.UP || FlxG.gamepads.anyJustPressed(34))
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
	}
}
