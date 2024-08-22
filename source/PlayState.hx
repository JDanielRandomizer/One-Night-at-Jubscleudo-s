package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import MenuState;

import lime.app.Application;

class PlayState extends FlxState
{

	var bone:FlxSprite;
	var welcomeText:FlxText;
	var nightHour:FlxSprite;
	var closableVent:FlxSprite;
	var button:FlxSprite;
	var bateriaText:FlxText;
	var monitorPull:FlxSprite;
	var monitor:FlxSprite;
	var minimapa:FlxSprite;
	var staticfnaf:FlxSprite;
	var jeraldoFace:FlxSprite;
	var cameraView:FlxSprite;
	var jumpscare:FlxSprite;
	var throwBone:FlxSprite;
	var jurelma:FlxSprite;
	var cameraBuzzTween:FlxTween;
	var alphaJoaquim:FlxTween;
	var joaquimHead:FlxSprite;
	var jubscleudoCam:FlxSprite;
	var jubscleudo:FlxSprite;

	var groupOfCam:FlxTypedGroup<FlxSprite>;
    var camButton:FlxSprite;

	public static var amHour:Float;
	public static var haveBone:Float;
	public static var closingVent:Float;
	public static var closeVentBattery:Float;
	public static var jeraldoRoom:Float;
	public static var watchingCam:Int;
	public static var monitorIsUp:Bool;
	public static var cooldown:Bool;
	public static var jurelmaRoom:Float;
	public static var jubscleudoRoom:Float;
	public static var canDieForJubs:Bool;

	override public function create()
	{
		// vou estar usando  os "//" para separar as coisas que faco

		// imagens da sala
		jeraldoFace = new FlxSprite(1000, 415, 'assets/images/gameplay/jeraldo.png');
		jeraldoFace.alpha = 0;
		add(jeraldoFace);

		closableVent = new FlxSprite(1003, 290, 'assets/images/gameplay/doorlock.png');
		add(closableVent);

		var room:FlxSprite = new FlxSprite(-30, -75, 'assets/images/gameplay/room.png');
		add(room);

		button = new FlxSprite(890, 410, 'assets/images/gameplay/button.png');
		add(button);

		bone = new FlxSprite(160, 585, 'assets/images/gameplay/osso.png');
		bone.antialiasing = true;
		add(bone);

		jubscleudo = new FlxSprite(500, 150, 'assets/images/gameplay/jubscleudo.png');
		jubscleudo.visible = false;
		add(jubscleudo);

		var mesa:FlxSprite = new FlxSprite(350, 500, 'assets/images/gameplay/table.png');
		mesa.scale.x = 1.2; mesa.scale.y = 1.2;
		mesa.antialiasing = true;
		add(mesa);

		monitor = new FlxSprite(-50, -20);
		monitor.loadGraphic('assets/images/gameplay/monitor.png', true);
		monitor.frames = FlxAtlasFrames.fromSparrow('assets/images/gameplay/monitor.png', 'assets/images/gameplay/monitor.xml');
		monitor.animation.addByPrefix('up', 'monitor up', 0.005, true);
		monitor.animation.addByPrefix('down', 'monitor down', 0.005, true);
		monitor.visible = false;
		add(monitor);

		cameraView = new FlxSprite(-165, -250, 'assets/images/gameplay/cameras/cameras/' + watchingCam +'.png');
		cameraView.visible = false;
		add(cameraView);

		jurelma = new FlxSprite(0, 0, 'assets/images/gameplay/cameras/chars/jurelma.png');
		jurelma.visible = false;
		add(jurelma);

		jubscleudoCam = new FlxSprite(-16, 18, 'assets/images/gameplay/cameras/chars/jubscleudo.png');
		jubscleudoCam.visible = false;
		add(jubscleudoCam);

		staticfnaf = new FlxSprite(0, 0);
		staticfnaf.loadGraphic('assets/images/menu/static.png', true);
		staticfnaf.frames = FlxAtlasFrames.fromSparrow('assets/images/menu/static.png', 'assets/images/menu/static.xml');
		staticfnaf.animation.addByPrefix('idle', 'idle', 0.1, true);
		staticfnaf.animation.play('idle');
		staticfnaf.visible = false;
		staticfnaf.alpha = 0.3;
		add(staticfnaf);

		minimapa = new FlxSprite(950, 230, 'assets/images/gameplay/cameras/minimap.png');
		minimapa.alpha = 0.7;
		minimapa.visible = false;
		add(minimapa);
		
		throwBone = new FlxSprite(25, 491, 'assets/images/gameplay/cameras/jogar.png');
		throwBone.alpha = 0.7;
		throwBone.visible = false;
		add(throwBone);

		groupOfCam = new FlxTypedGroup<FlxSprite>();
        add(groupOfCam);

		for(i in 1 ... 4)
			{
				camButton = new FlxSprite(0, 0, 'assets/images/gameplay/cameras/cam/' + i +'.png');

				switch(i) 
				{
					case 1:
						camButton.setPosition(1105, 255);
					case 2:
						camButton.setPosition(950, 370);
					case 3:
						camButton.setPosition(1047, 460);
				}

				camButton.ID = i;

				camButton.visible = false;
				
				groupOfCam.add(camButton);
			}

		monitorPull = new FlxSprite(351, 600, 'assets/images/gameplay/monitorPull.png');
		monitorPull.alpha = 0;
		add(monitorPull);

		joaquimHead = new FlxSprite(550, 600, 'assets/images/gameplay/joaquimHead.png');
		joaquimHead.alpha = 0;
		add(joaquimHead);

		// hud legal

		bateriaText = new FlxText(10, 10, 0, 'Bateria do duto: ' + closeVentBattery + '%', 20);
        bateriaText.setFormat('Daydream.ttf', 20, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		bateriaText.alpha = 0;
		add(bateriaText);

		welcomeText = new FlxText(284, 232, 0, 'Noite: todas\n\nBoa Sorte', 64);
        welcomeText.setFormat('Daydream.ttf', 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		welcomeText.alpha = 0;
		add(welcomeText);

		nightHour = new FlxSprite(1100, 15, 'assets/images/gameplay/hours/' + amHour + '.png');
		nightHour.alpha = 0;
		add(nightHour);

		jumpscare = new FlxSprite(-500, -225);
		jumpscare.visible = false;
		add(jumpscare);

		// entrada

		FlxG.camera.zoom = 5;
		FlxTween.tween(FlxG.camera, {zoom: 1}, 2, {ease: FlxEase.expoOut});
		FlxG.camera.fade(FlxColor.BLACK, 2, true, null, true);

		new FlxTimer().start(3, function(tmr:FlxTimer)
			{
				FlxTween.tween(welcomeText, {alpha: 1}, 1, {ease: FlxEase.linear});

				new FlxTimer().start(5, function(tmr:FlxTimer)
					{
						FlxTween.tween(welcomeText, {alpha: 0}, 1,
							{
								onComplete: nightStart
							}
						);
					});
			});
 
			new FlxTimer().start(0.1, function(tmr:FlxTimer) // timer de coisas que descem em segundos (obs, só o botão ficou com isso)
				{
	
					if (closableVent.y == 390)
					{
						closeVentBattery -= 2;
					}
	
					if (closeVentBattery <= 0 || closingVent == 2)
					{
						closingVent = 2;
	
						if (closableVent.y == 390)
						{
							FlxG.sound.play('assets/sounds/fechaPorta.ogg');

							FlxTween.tween(closableVent, {y: 290}, 1, {ease: FlxEase.backOut});
							button.loadGraphic('assets/images/gameplay/button.png');
						}
	
						closeVentBattery += 1;
	
						if (closeVentBattery >= 100)
							{
								closingVent = 0;
							}
					}
	
					bateriaText.text = 'Bateria do duto: ' + closeVentBattery + '%';
				}, 0);

		super.create();
	}

	override public function update(elapsed:Float)
	{

		if (FlxG.mouse.justReleased) // coisas interagiveis
			{
				if (FlxG.mouse.overlaps(button) && closingVent == 0 && monitorIsUp == false) // para fechar a portinha do jeraldo
				{
					FlxG.sound.play('assets/sounds/fechaPorta.ogg');

					closingVent = 1;

					if (closableVent.y == 390)
					{
						button.loadGraphic('assets/images/gameplay/button.png');
						FlxTween.tween(closableVent, {y: 290}, 1, {ease: FlxEase.backOut});
					}
					else
					{
						button.loadGraphic('assets/images/gameplay/buttonUsed.png');
						FlxTween.tween(closableVent, {y: 390}, 1, {ease: FlxEase.bounceOut});
					}

					new FlxTimer().start(1, function(tmr:FlxTimer)
						{
							closingVent = 0;
						});
				}

				if (FlxG.mouse.overlaps(bone) && haveBone == 0 && monitorIsUp == false && bone.visible == true) // coletar o osso
				{
					FlxG.sound.play('assets/sounds/ossoPegadinha.ogg');

					haveBone = 1;
					bone.visible = false;
				}

				if (FlxG.mouse.overlaps(throwBone) && monitorIsUp == true && haveBone == 1) // usar o osso
				{
					usedBone();
				}

				if (FlxG.mouse.overlaps(jubscleudo) && monitorIsUp == false && jubscleudo.visible == true && jubscleudoRoom == 4 && canDieForJubs == true) // tirar o jubscleudo
					{
						canDieForJubs = false;
						FlxG.camera.fade(FlxColor.BLACK, 1, true, null, true);
						jubscleudo.visible = false;
						cameraBuzz(watchingCam);
						jubscleudoRoom = 1;
					}
			}

			if (FlxG.mouse.overlaps(bone)) // osso ficar maior
				{
					bone.scale.x = 1.1; bone.scale.y = 1.1;
				}
				else
				{
					bone.scale.x = 1.0; bone.scale.y = 1.0;
				}


			if (FlxG.mouse.overlaps(monitorPull) && monitorPull.visible == true && monitorPull.alpha == 0.7) // abrir o monitor
			{
				monitorPull.visible = false;

				pullMonitor(monitorIsUp);

				if (monitorIsUp == true)
				{
					monitorIsUp = false;
				}
				else
				{
					monitorIsUp = true;
				}
			}

			groupOfCam.forEach(function(camerasb:FlxSprite) // botões funcionais para trocar de camera
				{
					if (FlxG.mouse.justReleased)
						{
							if (FlxG.mouse.overlaps(camerasb))
								{
									if (cooldown == false)
										{
											cameraBuzz(camerasb.ID);
										}
								}
						}
				});

			if(monitorIsUp == false)
			{
				jurelma.visible = false;
				jubscleudoCam.visible = false;
			}

		super.update(60);
	}

	function nightStart(_):Void // seta umas coisas aleatorias quando a noite comecar que nao sao setadas no loading
	{

		Application.current.window.title = "One Night at Jubscleudo's | Noite: Todas";

		FlxTween.tween(nightHour, {alpha: 1}, 1, {ease: FlxEase.linear});
		FlxTween.tween(bateriaText, {alpha: 1}, 1, {ease: FlxEase.linear});
		FlxTween.tween(monitorPull, {alpha: 0.7}, 1, {ease: FlxEase.linear});

		new FlxTimer().start(MenuState.timeNight, function(tmr:FlxTimer) // hora que passa
			{
				amHour += 1;
				nightHour.loadGraphic('assets/images/gameplay/hours/' + amHour + '.png');
				nightHour.scale.x = 1.3; nightHour.scale.y = 0.7;

				FlxTween.tween(nightHour.scale, {x: 1, y: 1}, 0.6, {ease: FlxEase.backOut});

				if (amHour == 6)
				{
					nightEnd();
				}

			}, 0);

			// programacao dos personagens em sequencia que foram feitos

		new FlxTimer().start((FlxG.random.int(8, 30)), function(tmr:FlxTimer) // programacao do jeraldo
			{
				FlxG.sound.play('assets/sounds/fechaPorta.ogg');
				
				jeraldoRoom = 1;
				FlxTween.tween(jeraldoFace, {alpha: 1}, 0.4, {ease: FlxEase.linear});

				new FlxTimer().start(7, function(tmr:FlxTimer)
					{
						
						if (closableVent.y == 390)
						{
							jeraldoFace.alpha = 0;
							jeraldoRoom = 0;
						}
						else
						{
							FlxTween.tween(jeraldoFace, {alpha: 0}, 0.4, {ease: FlxEase.linear});

							new FlxTimer().start(1, function(tmr:FlxTimer)
								{
									jumpScared('jeraldo');
								});
						}

					});

			}, 0);

		new FlxTimer().start((FlxG.random.int(15, 30)), function(tmr:FlxTimer) // programacao da jurelma
		{
			jurelmaRoom = FlxG.random.int(1, 3);
			cameraBuzz(watchingCam);

			new FlxTimer().start(FlxG.random.int(7, 10), function(tmr:FlxTimer)
			{
				if (jurelmaRoom != 0)
				{
					jurelmaRoom = 4;
					cameraBuzz(watchingCam);
					jumpScared('jurelma');
				}
			});
		}, 0);


		new FlxTimer().start(FlxG.random.int(5, 20), function(tmr:FlxTimer) // programacao do joaquim
			{
				joaquimHead.alpha = 0.05;
				alphaJoaquim = FlxTween.tween(joaquimHead, {alpha: 1}, 5, {ease: FlxEase.linear});

				new FlxTimer().start(5, function(tmr:FlxTimer)
					{
						if (joaquimHead.alpha == 1)
						{
							jumpScared('joaquim');
						}
					});
			}, 0);

		var deveOcorrer:Bool;

		new FlxTimer().start(FlxG.random.int(9, 15), function(tmr:FlxTimer) // programacao do jubscleudo nas cameras
			{
				if(jubscleudoRoom <= 3)
				{
					jubscleudoRoom += 1;
					cameraBuzz(watchingCam);
					if(jubscleudoRoom == 4)
					{
						jubscleudo.visible = true;

						if(monitorIsUp == false)
						{
							FlxG.camera.fade(FlxColor.BLACK, 1, true, null, true);
						}
						
						new FlxTimer().start(2, function(tmr:FlxTimer)
						{
							canDieForJubs = true;
						});
					}
				}
			}, 0);

		new FlxTimer().start(FlxG.random.int(6, 8), function(tmr:FlxTimer) // programacao do jubscleudo nas na sala
			{
				if(jubscleudoRoom == 4)
				{
					if(jubscleudo.visible == true && canDieForJubs == true)
					{
						jubscleudo.visible = false;

						if(monitorIsUp == false)
							{
								FlxG.camera.fade(FlxColor.BLACK, 1, true, null, true);
							}

						new FlxTimer().start(2, function(tmr:FlxTimer)
							{
								jumpScared('jubscleudo');
							});
					}
				}
			}, 0);
	}

	function nightEnd() // coisas que acontece quando a noite acaba
	{
		FlxTween.tween(FlxG.camera, {zoom: 5}, 2, {ease: FlxEase.expoOut});
		FlxG.camera.fade(FlxColor.BLACK, 2, false, null, true);

		new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				FlxG.save.data.beatNight = 'true';
				FlxG.save.flush();

				FlxG.switchState(new EndingState());
			});
	}

	function usedBone() // quando você usa o osso
	{
		haveBone = 0;
		throwBone.visible = false;

		if (jurelmaRoom == watchingCam)
		{
			jurelmaRoom = 0;
			cameraBuzz(watchingCam);
		}

		new FlxTimer().start(15, function(tmr:FlxTimer)
			{
				haveBone = 0;
				bone.alpha = 0;
				bone.y = 545;
				bone.visible = true;

				FlxTween.tween(bone, {y: 585}, 1, {ease: FlxEase.bounceOut});
				FlxTween.tween(bone, {alpha: 1}, 0.2, {ease: FlxEase.linear});
			});
	}

	function pullMonitor(?side : Bool) // quando levanta ou baixa o monitor e a direção
	{
		FlxG.sound.play('assets/sounds/puxarMonitor.ogg');

		if (side == false)
		{
			monitor.animation.play('up');
		}
		else
		{
			monitor.animation.play('down');
		}

		if (joaquimHead.alpha != 0)
		{
			alphaJoaquim.cancel();
			joaquimHead.alpha = 0;
		}

		// umas coisas que ficam invisiveis ao abrir ou fechar o monitor

		monitor.visible = true;
		minimapa.visible = false;
		staticfnaf.visible = false;
		cameraView.visible = false;
		jurelma.visible = false;
		jubscleudoCam.visible = false;
		for (camButton in groupOfCam.members)
			{
				camButton.visible = false;
			}
		throwBone.visible = false;

		new FlxTimer().start(0.3, function(tmr:FlxTimer)
			{
				// coisas que aparecem a abrir a camera

				monitor.visible = false;
				if (monitorIsUp == true)
				{
					minimapa.visible = true;

					for (camButton in groupOfCam.members)
						{
							camButton.visible = true;
						}
					
					staticfnaf.visible = true;
					cameraView.visible = true;

					if (haveBone == 1)
					{
						throwBone.visible = true;
					}

					cooldown = true;
					cameraBuzz(watchingCam);
				}

				new FlxTimer().start(1, function(tmr:FlxTimer)
					{
						monitorPull.visible = true;
					});
			});
	}

	function cameraBuzz(camWatch:Int):Void // quando abre o monito, troca de camera ou personagem anda (jubscleudo e a jurelma), o argumento dele serve para trocar a camera
	{
		
		if (monitorIsUp == true)
		{
			FlxG.sound.play('assets/sounds/buzz.ogg');
		}

		cooldown = true;
		watchingCam = camWatch;

		jurelma.visible = false;
		jubscleudoCam.visible = false;

		// se o personagem aparece
		if (jurelmaRoom == watchingCam || (jurelmaRoom == 0 && watchingCam == 2) && monitorIsUp == true)
		{
			jurelma.loadGraphic('assets/images/gameplay/cameras/chars/jurelma/jurelma' + jurelmaRoom + '.png');
			jurelma.visible = true;
		}
	
		if (jubscleudoRoom == watchingCam && monitorIsUp == true)
		{
			jubscleudoCam.loadGraphic('assets/images/gameplay/cameras/chars/jubscleudo/jubscleudo' + jubscleudoRoom + '.png');
			jubscleudoCam.visible = true;
		}
		cameraView.loadGraphic('assets/images/gameplay/cameras/cameras/' + watchingCam +'.png');

		if (staticfnaf.alpha != 0.3)
		{
			cameraBuzzTween.cancel();
		}
		staticfnaf.alpha = 1;
		cameraBuzzTween = FlxTween.tween(staticfnaf, {alpha: 0.3}, 0.5, {ease: FlxEase.linear});

		if (monitorIsUp == false) // check duplo
		{
			jurelma.visible = false;
			jubscleudoCam.visible = false;
		}

		new FlxTimer().start(0.5, function(tmr:FlxTimer)
			{
				cooldown = false;
			});
	}

	function jumpScared(jumpscared:String) // quando leva jumpscare, o argumento e qual personagem te matou (para carregar a animação correta)
	{

		FlxG.sound.play('assets/sounds/jumpscare.ogg');
		jumpscare.loadGraphic('assets/images/gameplay/jumpscares/' + jumpscared + '.png');
		jumpscare.frames = FlxAtlasFrames.fromSparrow('assets/images/gameplay/jumpscares/' + jumpscared + '.png', 'assets/images/gameplay/jumpscares/' + jumpscared + '.xml');
		jumpscare.animation.addByPrefix('jump', jumpscared, 0.007, true);
		jumpscare.animation.play('jump');
		jumpscare.visible = true;

		new FlxTimer().start(2.3, function(tmr:FlxTimer)
			{
				FlxG.switchState(new DeathScreen());
			});

	}
}
