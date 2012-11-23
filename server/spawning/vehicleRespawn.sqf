
//	@file Version: 1.0
//	@file Name: vehicleRespawn.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

waitUntil {vehicleSpawnComplete};

_result = 0;
_startTime = currentTime;

while {true} do 
{
	_currTime = currentTime;
    _result = [_currTime, _startTime, 30] call compareTime;

	if(_result == 1)
	{
		{
			//Check if vehicle is damaged
			if((damage _x >= 0.8) and (count crew _x == 0)) then
			{
				//Get Original Posistion.
				_pos = (_x getVariable "origPos");
				//Delete current vehicle.
				deleteVehicle _x;

				//Remove the vehicle from the array.
				currentVehicles set [_forEachIndex, "REMOVETHISCRAP"];
				currentVehicles = currentVehicles - ["REMOVETHISCRAP"];

				//Get random number for vehicle creation choice.
				_num = floor (random 100);
				if (_num < 100) then {[_pos,0] call vehicleInfo;};
				if (_num < 35) then {[_pos,1] call vehicleInfo;};
				if (_num < 10) then {[_pos,2] call vehicleInfo;};
			};
		} forEach currentVehicles;
	} else {
		sleep 1;
	};
};