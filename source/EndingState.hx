package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;

class EndingState extends FlxState
{

    var clickable:Bool = false;

    override public function create()
    {
        FlxG.sound.playMusic('assets/music/Final_Theme.ogg', 1);

        var bomDia:FlxSprite = new FlxSprite(0, 0, 'assets/images/end/bom dia.png');
		add(bomDia);

        FlxG.camera.zoom = 2;
        FlxG.camera.angle = 360;
		FlxTween.tween(FlxG.camera, {zoom: 1}, 2, {ease: FlxEase.expoOut});
        FlxTween.tween(FlxG.camera, {angle: 0}, 2, {ease: FlxEase.expoOut});
		FlxG.camera.fade(FlxColor.BLACK, 2, true, null, true);

		new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				clickable = true;
			});

        new FlxTimer().start(7, function(tmr:FlxTimer)
            {

                FlxG.camera.zoom = 1.1;
                FlxTween.tween(FlxG.camera, {zoom: 1}, 2, {ease: FlxEase.expoOut});

                new FlxTimer().start(3, function(tmr:FlxTimer)
                    {
                        if (clickable == true)
                        {
                            FlxG.camera.zoom = 1.1;
                            FlxTween.tween(FlxG.camera, {zoom: 1}, 2, {ease: FlxEase.expoOut});
                        }
                    }, 0);
            });

        new FlxTimer().start(48, function(tmr:FlxTimer)
            {
                leave();
            });

        super.create();
    }

    override public function update(elapsed:Float)
    {
        if (FlxG.mouse.justReleased && clickable == true)
        {
            leave();
        }

        super.update(60);
    }

    function leave()
    {
        clickable = false;

        FlxTween.tween(FlxG.camera, {zoom: 2}, 2, {ease: FlxEase.expoInOut});
        FlxG.camera.fade(FlxColor.BLACK, 2, false, null, true);

        new FlxTimer().start(2, function(tmr:FlxTimer)
			{
                FlxG.sound.music.stop();
				FlxG.switchState(new MenuState());
			});
    }
}