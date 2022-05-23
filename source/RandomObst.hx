package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.util.FlxColor;

class RandomObst extends FlxTypedGroup<FlxSprite>
{
	var positionArray = [180, 360, 540];
	var curPosition:Int = 0;
	var davar = 0;
	var cantpick = -1;

	public function new()
	{
		super();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		davar += 1;
		if (davar == 36)
		{
			for (i in 0...2)
			{
				var rand = FlxG.random.int(0, 2, [cantpick]);
				var newSprite:FlxSprite = new FlxSprite(1280, positionArray[rand]).makeGraphic(100, 100, FlxColor.RED);
				cantpick = rand;
				add(newSprite);
			}
			cantpick = -1;
			davar = 0;
		}
	}
}
