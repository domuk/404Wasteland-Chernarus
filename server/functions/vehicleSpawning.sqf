//	@file Version: 1.0
//	@file Name: vehicleTestSpawn.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_rad = 20000;
_cnps = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_house = nearestObjects [_cnps, ["House"], _rad];
_startTime = 0;

waitUntil{currentTime > 0};

_startTime = currentTime;
waitUntil
{ 
    _currTime = currentTime;
    _result = [_currTime, _startTime, 2] call compareTime;
    (_result == 1)
};

_hint = "Spawning Started";
[nil,nil,rHINT,_hint] call RE;

{
    if((typeOf _x) in blacklist) then {} else
    {
    	_type = 0;
		_pos = getPos _x;
	    _secondRad = 1000;
	    _vehicles = nearestObjects [_pos, ["Car"], _secondRad];
	    
	    //Check to see if there are not to many cars in area.
	    if((count _vehicles) <= 19) then
	    { 
	        _thirdRad = 100;
	    	_vehicles = nearestObjects [_pos, ["Car","Truck","Tank","Motorcycle"], _thirdRad];
	        
	        //Check that there isn't a car right next to it.
	        if((count _vehicles == 0)) then 
	        {
	            //_hint = "Vehicles Spawning";
	            //[nil,nil,rHINT,_hint] call RE;
	            _num = floor (random 100);
				if (_num < 100) then {_type = 0;};
				if (_num < 35) then {_type = 1;};
				if (_num < 10) then {_type = 2;};
				[_pos, _type] call vehicleCreation;
		        
                /*
		        _markerName = format["marker%1",_forEachIndex];
			    _marker = createMarker [_markerName, _pos];
				_marker setMarkerType "mil_destroy";
				_marker setMarkerSize [1.25, 1.25];
				_marker setMarkerText "Vehicle";
				_marker setMarkerColor "ColorRed"; 
                */        
	        };   
	    };    
    };
}forEach _house;

_amountOfVehicles = count currentVehicles;
diag_log format["WASTELAND SERVER - %1 Vehicles Spawned",_amountOfVehicles];

vehicleSpawnComplete = true;