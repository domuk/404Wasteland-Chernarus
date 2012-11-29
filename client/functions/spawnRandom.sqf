//	@file Version: 1.0
//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 28/11/2012 05:19
//	@file Args:

waituntil {!isnil "bis_fnc_init"};

private ["_rad"];

_randomLoc = cityLocations select (random (count cityLocations - 1));
if((configName(_randomLoc)) == "ACityC_Berezino") then {
    _pos = getArray(_randomLoc >> "position");
    _pos set [0, (_pos select 0) - 450];
	_pos set [1, (_pos select 1) - 475];
    _pos = [_pos,5,100,1,0,0,0] call BIS_fnc_findSafePos;
    
    player setPos _pos;
} else {
    _pos = getArray(_randomLoc >> "position");
    _pos = [_pos,5,100,1,0,0,0] call BIS_fnc_findSafePos;

    player setPos _pos;
};

respawnDialogActive = false;
closeDialog 0;