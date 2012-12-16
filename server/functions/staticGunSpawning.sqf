//	@file Version: 1.0
//	@file Name: vehicleTestSpawn.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

waitUntil{ammoCrateSpawnComplete};

private ["_counter","_pos","_markerName","_marker","_hint","_newpos","_countActual"];
_counter = 0;
_countActual = 0;

diag_log format["Static Guns Spawning Started"];

while {_counter < 770} do
{
    _pos = getMarkerPos format ["Spawn_%1", _counter];
    _newpos = [_pos, 25, 50, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
	[_newpos] call staticGunCreation;
    
    /*      
    _markerName = format["marker%1",_counter];
	_marker = createMarker [_markerName, _newpos];
	_marker setMarkerType "dot";
	_marker setMarkerSize [1.25, 1.25];
	_marker setMarkerColor "ColorRed";
    */
    
    _counter = _counter + 20;
    _countActual = _countActual + 1;
};

diag_log format["WASTELAND SERVER - %1 Static Guns Spawned",_countActual];
staticGunSpawningComplete = true;