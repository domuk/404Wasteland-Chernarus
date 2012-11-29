//	@file Version: 1.0
//	@file Name: vehicleRespawn.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

waitUntil {vehicleSpawnComplete};

diag_log format["WASTELAND SERVER - Vehicle Respawn Start"];
waitUntil{currentTime > 0};
_result = 0;
_startTime = currentTime;
_run = true;

while {_run} do
{
    _currTime = currentTime;
    _result = [_currTime, _startTime, 15] call compareTime;
    
    if(_result == 1) then
    {
        [nil,nil,rHINT,"Server Running Vehicle Clean Up"] call RE;
        //Reset Values
        _result = 0;
        _startTime = currentTime;
        
        _hintText = parseText format ["<t align='center' color='#0362f3' shadow='1' shadowColor='#000000' size='1.5'>Running Server Vehicle Clean Up</t>"];
		[nil,nil,rHINT,_hintText] call RE;
        
		{
			//Check if vehicle is damaged
			if((damage (_x select 0) >= 0.8) and (count crew (_x select 0) == 0)) then
			{
				//Get Original Posistion.
				_pos = ((_x select 0) getVariable "origPos");
				//Delete current vehicle.
				deleteVehicle (_x select 0);

				//Remove the vehicle from the array.
				currentVehicles set [_forEachIndex, "REMOVETHISCRAP"];
				currentVehicles = currentVehicles - ["REMOVETHISCRAP"];

				//Get random number for vehicle creation choice.
				_type = 0;

				_num = floor (random 100);
				if (_num < 100) then {_type = 0;};
				if (_num < 35) then {_type = 1;};
				if (_num < 10) then {_type = 2;};
				
				[_pos, _type] call vehicleCreation;
			};
		} forEach currentVehicles;
        [player,nil,rGlobalChat,"Vehicle Clean Up Complete"] call RE;
    } else {
    	sleep 1;  
    };
};