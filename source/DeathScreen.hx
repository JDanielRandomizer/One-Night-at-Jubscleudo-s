package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

import lime.app.Application;

class DeathScreen extends FlxState
{

	var staticfnaf:FlxSprite;

	var menu:FlxSprite;
	var restart:FlxSprite;

	var clickable:Bool;

	override public function create()
	{
		Application.current.window.title = "One Night at Jubscleudo's";

		menu = new FlxSprite(30, 475, 'assets/images/gameover/menu.png');
		menu.antialiasing = true;
		add(menu);

		restart = new FlxSprite(850, 465, 'assets/images/gameover/restart.png');
		restart.antialiasing = true;
		add(restart);

		staticfnaf = new FlxSprite(0, 0);
		staticfnaf.loadGraphic('assets/images/menu/static.png', true);
		staticfnaf.frames = FlxAtlasFrames.fromSparrow('assets/images/menu/static.png', 'assets/images/menu/static.xml');
		staticfnaf.animation.addByPrefix('idle', 'idle', 0.1, true);
		staticfnaf.animation.play('idle');
		staticfnaf.alpha = 0.3;
		staticfnaf.scale.x = 1.1; staticfnaf.scale.y = 1.1;
		staticfnaf.antialiasing = true;
		add(staticfnaf);

		var perdeu:FlxSprite = new FlxSprite(130, 50, 'assets/images/gameover/voce.png');
		add(perdeu);

		FlxG.camera.zoom = 1.2;
		FlxTween.tween(FlxG.camera, {zoom: 1}, 2, {ease: FlxEase.backOut});
		FlxG.camera.fade(FlxColor.RED, 1, true, null, true);

		new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				clickable = true;
			});

		super.create();
	}

	override public function update(elapsed:Float)
	{

		if (FlxG.mouse.overlaps(menu) || FlxG.mouse.overlaps(restart))
			{
				if (FlxG.mouse.overlaps(menu))
				{
					menu.scale.x = 1.3; menu.scale.y = 1.3;
				}
				if (FlxG.mouse.overlaps(restart))
				{
					restart.scale.x = 1.3; restart.scale.y = 1.3;
				}
			}
			else
			{
				menu.scale.x = 1; menu.scale.y = 1;
				restart.scale.x = 1; restart.scale.y = 1;
			}
	
			if (FlxG.mouse.justReleased && clickable == true)
			{
	
				clickable = false;

				FlxTween.tween(FlxG.camera, {zoom: 2}, 3, {ease: FlxEase.expoInOut});
				FlxG.camera.fade(FlxColor.BLACK, 2, false, null, true);
	
				if (FlxG.mouse.overlaps(menu))
					{
						new FlxTimer().start(2, function(tmr:FlxTimer)
							{
								FlxG.switchState(new MenuState());
							});
					}
				if (FlxG.mouse.overlaps(restart))
					{
						new FlxTimer().start(2, function(tmr:FlxTimer)
							{
								FlxG.switchState(new LoadingState());
							});
					}
			}

		super.update(60);
	}
}
