package;

import PlayState;
import flixel.FlxState;
import flixel.FlxG;

class LoadingState extends FlxState
{

    // stuff load really fast here

    override public function create()
    {

        PlayState.haveBone = 0;
        PlayState.amHour = 0;
        PlayState.closingVent = 0;
        PlayState.closeVentBattery = 100;
        PlayState.monitorIsUp = false;
        PlayState.watchingCam = 1;
        PlayState.jeraldoRoom = 0;
        PlayState.cooldown = true;
        PlayState.jurelmaRoom = 0;
        PlayState.jubscleudoRoom = 1;
        PlayState.canDieForJubs = false;

        FlxG.switchState(new PlayState());

        super.create();
    }
}