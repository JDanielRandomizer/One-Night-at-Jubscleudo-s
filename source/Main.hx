package;

import flixel.FlxGame;
import openfl.display.Sprite;
import lime.app.Application;
import flixel.FlxG;

import openfl.display.FPS;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(1280, 720, MenuState, 60, 60, true, false));
		Application.current.window.resizable = false;
		FlxG.mouse.load('assets/images/mouse.png');

		//FlxG.autoPause = false;
		addChild(new FPS(0, 703, 0xffffff));
	}
}
