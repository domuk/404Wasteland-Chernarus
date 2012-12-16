//	@file Version: 1.0
//	@file Name: vehicleTestSpawn.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

waitUntil{vehicleSpawnComplete};

private ["_counter","_pos","_markerName","_marker","_amountOfVehicles","_hint"];
_counter = 0;

diag_log format["Objects Spawning Started"];

while {_counter < 770} do
{
    _pos = getMarkerPos format ["Spawn_%1", _counter];
    
    _newpos = [_pos, 10, 20, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
	[_newpos] call objectCreation;
    
    _newpos = [_pos, 21, 40, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    [_newpos] call objectCreation;
    
    /*
    _markerName = format["marker%1",_counter];
	_marker = createMarker [_markerName, _pos];
	_marker setMarkerType "dot";
	_marker setMarkerSize [1.25, 1.25];
	_marker setMarkerColor "ColorRed";
    */
    
    _counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Objects Spawned",_counter * 2];
objectSpawnComplete = true;