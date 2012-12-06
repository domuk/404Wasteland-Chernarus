//	@file Version: 1.0
//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 28/11/2012 05:19
//	@file Args:

waituntil {!isnil "bis_fnc_init"};

private ["_rad","_townName"];

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

_mins = floor(60 * (daytime - floor(daytime)));
{if(_x select 0 == (configName(_randomLoc))) then {_townName = _x select 3;};}forEach cityList;
[
	getText(configFile >> "CfgWorlds" >> worldName >> "Names" >> _townName >> "name"),
	format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]
] spawn BIS_fnc_infoText;
