package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class AchievementsState extends FlxState
{
	override function create()
	{
		super.create();
		for (i in 0...FlxG.save.data.achievements.length)
		{
			var array:Array<String> = FlxG.save.data.achievements;
			if (array[i] == "decent")
			{
				var congrats = new FlxSprite(0, 0).loadGraphic('assets/achievements/decent.png');
				add(congrats);
			}
			if (array[i] == "doing good")
			{
				var congrats2 = new FlxSprite(90, 0).loadGraphic('assets/achievements/doing good.png');
				add(congrats2);
			}
			if (array[i] == "epic")
			{
				var congrats3 = new FlxSprite(180, 0).loadGraphic('assets/achievements/epic.png');
				add(congrats3);
			}
		}
		/*if (FlxG.save.data.achievements.contains("doing good"))
			{
				var congrats2 = new FlxSprite(90, 0).loadGraphic('assets/achievements/doing good.png');
				add(congrats2);
			}
			if (FlxG.save.data.achievements.contains("epic"))
			{
				var congrats3 = new FlxSprite(180, 0).loadGraphic('assets/achievements/epic.png');
				add(congrats3);
		}*/
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		/*#if html5
			if (FlxG.gamepads.anyJustPressed(1))
				FlxG.switchState(new MainMenuState());
			var quit = new FlxText(1000, 0, 0, "tap me to quit", 10);
			for (touch in FlxG.touches.list)
			{
				if (touch.justPressed)
				{
					if (touch.overlaps(quit))
						FlxG.switchState(new MainMenuState());
				}
			}
			#end */

		if (FlxG.gamepads.anyJustPressed(1) || FlxG.keys.justPressed.ESCAPE)
			FlxG.switchState(new MainMenuState());
	}
}
