package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxSave;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.text.FlxText;

class MenuState extends FlxState
{

	var jubscleudo:FlxSprite;
	var version:String = 'c';
	var play:FlxSprite;
	var delete:FlxSprite;
	var clickable:Bool = false;
	
	public static var timeNight:Int;

	override public function create()
	{

		timeNight = 60;

		var staticfnaf:FlxSprite = new FlxSprite(0, 0);
		staticfnaf.loadGraphic('assets/images/menu/static.png', true);
		staticfnaf.frames = FlxAtlasFrames.fromSparrow('assets/images/menu/static.png', 'assets/images/menu/static.xml');
		staticfnaf.animation.addByPrefix('idle', 'idle', 0.1, true);
		staticfnaf.animation.play('idle');
		staticfnaf.alpha = 0.3;
		add(staticfnaf);

		jubscleudo = new FlxSprite(560, 60, 'assets/images/menu/jubscleudo/jubscleudo-' + version + '-n.png');
		add(jubscleudo);

		var logo = new FlxSprite(20, 20, 'assets/images/menu/logo.png');
		add(logo);

		play = new FlxSprite(15, 475, 'assets/images/menu/play.png');
		play.antialiasing = true;
		add(play);

		delete = new FlxSprite(20, 600, 'assets/images/menu/save.png');
		delete.antialiasing = true;
		add(delete);

		if (FlxG.save.data.beatNight == 'true')
		{
			var star = new FlxSprite(290, 225, 'assets/images/menu/star.png');
			add(star);
		}

		FlxG.camera.zoom = 2;
		FlxTween.tween(FlxG.camera, {zoom: 1}, 2, {ease: FlxEase.expoInOut});
		FlxG.camera.fade(FlxColor.BLACK, 2, true, null, true);

		new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				clickable = true;
			});

		new FlxTimer().start((FlxG.random.int(1, 10)), function(tmr:FlxTimer)
			{

				jubscleudo.loadGraphic('assets/images/menu/jubscleudo/jubscleudo-' + version + '-a.png');

				new FlxTimer().start(1, function(tmr:FlxTimer)
					{
						jubscleudo.loadGraphic('assets/images/menu/jubscleudo/jubscleudo-' + version + '-n.png');
					});
			}, 0);

			FlxG.sound.playMusic('assets/music/Menu_Theme.ogg', 1, true);
		
		super.create();
	}

	override public function update(elapsed:Float)
	{
		
		if (FlxG.mouse.overlaps(play) || FlxG.mouse.overlaps(delete))
		{
			if (FlxG.mouse.overlaps(play))
			{
				play.scale.x = 1.3; play.scale.y = 1.3; play.x = 30;
			}
			if (FlxG.mouse.overlaps(delete))
			{
				delete.scale.x = 1.3; delete.scale.y = 1.3; delete.x = 50;
			}
		}
		else
		{
			play.scale.x = 1; play.scale.y = 1;
			delete.scale.x = 1; delete.scale.y = 1;

			play.x = 15;
			delete.x = 20;
		}

		if (FlxG.mouse.justReleased && clickable == true)
		{

			clickable = false;

			if (FlxG.mouse.overlaps(play))
				{
					FlxTween.tween(FlxG.camera, {zoom: 2}, 3, {ease: FlxEase.expoInOut});
					FlxG.camera.fade(FlxColor.BLACK, 2, false, null, true);

					new FlxTimer().start(2, function(tmr:FlxTimer)
						{
							FlxG.sound.music.stop();
							FlxG.switchState(new LoadingState());
						});
				}
				if (FlxG.mouse.overlaps(delete))
				{
					FlxG.save.data.beatNight = 'false';
					FlxG.save.flush();

					FlxG.camera.zoom = 1.1;
					FlxTween.tween(FlxG.camera, {zoom: 1}, 0.2, {ease: FlxEase.expoIn});

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
						{
							clickable = true;
						});
				}
		}

		if (FlxG.mouse.justReleasedRight && FlxG.camera.zoom == 1)
		{
			FlxG.camera.zoom = 1.1;
			FlxTween.tween(FlxG.camera, {zoom: 1}, 0.2, {ease: FlxEase.expoOut});

			new FlxTimer().start(0.2, function(tmr:FlxTimer)
				{
					clickable = true;
				}); 
		}

		if (FlxG.keys.justPressed.H)
		{
			if(timeNight == 60)
			{
				timeNight = 30;
			}
			else
			{
				timeNight = 60;
			}
			var easyMode = new FlxText(0, 0, 0, 'segundos para hora: ' + timeNight + ' segundos', 20);
    		easyMode.setFormat('Daydream.ttf', 20, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			easyMode.alpha = 1;
			add(easyMode);

			FlxTween.tween(easyMode, {alpha: 0}, 2, {ease: FlxEase.linear});
		}

		super.update(60);
	}
}
