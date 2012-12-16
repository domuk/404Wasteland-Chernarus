//	@file Version: 1.0
//	@file Name: vehicleTestSpawn.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private ["_counter","_pos","_type","_num","_markerName","_marker","_amountOfVehicles","_hint"];
_counter = 0;

diag_log format["Vehicle Spawning Started"];

while {_counter < 770} do
{
    _pos = getMarkerPos format ["Spawn_%1", _counter];
	_type = 0;
    _num = floor (random 100);
	if (_num < 100) then {_type = 0;};
	if (_num < 35) then {_type = 1;};
	if (_num < 10) then {_type = 2;};
	[_pos, _type] call vehicleCreation;
    _counter = _counter + 1;
    
    /*
    _markerName = format["marker%1",_counter];
	_marker = createMarker [_markerName, _pos];
	_marker setMarkerType "dot";
	_marker setMarkerSize [1.25, 1.25];
	_marker setMarkerColor "ColorRed";
    */
};

_amountOfVehicles = count currentVehicles;
diag_log format["WASTELAND SERVER - %1 Vehicles Spawned",_amountOfVehicles];

vehicleSpawnComplete = true;