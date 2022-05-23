package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import lime.app.Application;
import lime.system.System;

class PlayState extends FlxState
{
	var player:Player = new Player();
	var RandObst:RandomObst = new RandomObst();
	var tex:FlxText = new FlxText(0, 0, 0, 'null');
	var tex2:FlxText = new FlxText(0, 10, 0, 'null');
	var score:Float = 0;

	override public function create()
	{
		super.create();
		add(player);
		add(RandObst);
		add(tex);
		add(tex2);
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

	var highscore:Float = Std.parseFloat(FlxG.save.data.highscore);
	var stop:Bool = false;

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		/*#if html5
			if (FlxG.gamepads.anyJustPressed(1))
				FlxG.switchState(new MainMenuState());
			achievements();
			highscore = Std.parseFloat(FlxG.save.data.highscore);
			if (FlxG.overlap(player, RandObst))
				stop = true;
			tex.text = '' + score;
			tex2.text = '' + highscore;
			if (stop == false)
			{
				RandObst.forEach(function(sus:FlxSprite)
				{
					sus.x -= 25;
					if (sus.x == player.x + 5)
					{
						score += 0.5;
						if (score >= highscore)
						{
							FlxG.save.data.highscore = '' + score;
							FlxG.save.flush();
						}
					}
				});
			}
			else
			{
				player.sstop();
			}
			#end */

		if (FlxG.keys.justPressed.ESCAPE || FlxG.gamepads.anyJustPressed(1))
			FlxG.switchState(new MainMenuState());
		achievements();
		highscore = Std.parseFloat(FlxG.save.data.highscore);
		if (FlxG.overlap(player, RandObst))
			stop = true;
		tex.text = '' + score;
		tex2.text = '' + highscore;
		if (stop == false)
		{
			RandObst.forEach(function(sus:FlxSprite)
			{
				sus.x -= 25;
				if (sus.x == player.x + 5)
				{
					score += 0.5;
					if (score >= highscore)
					{
						FlxG.save.data.highscore = '' + score;
						FlxG.save.flush();
					}
				}
			});
		}
		else
		{
			player.sstop();
		}
	}

	function achievements()
	{
		if (highscore == 10)
		{
			FlxG.save.data.achievements.push("decent");
			FlxG.save.flush();
		}
		if (highscore == 50)
		{
			FlxG.save.data.achievements.push("doing good");
			FlxG.save.flush();
		}
		if (highscore == 100)
		{
			FlxG.save.data.achievements.push("epic");
			FlxG.save.flush();
		}
	}
}
