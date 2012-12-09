if(!isServer) exitWith {};

waitUntil{staticGunSpawningComplete};

diag_log format["WASTELAND SERVER - Started Mission State"];

//Main Mission Array
_MMarray = [];

worldMissionRunning = false;
_startTime = currentTime;
_result = 0;

while {true} do
{
    _currTime = currentTime;
    _result = [_currTime, _startTime, 40] call compareTime;
    
    if(_result == 1) then
    {
    	worldMissionRunning = false;    
    };
    
	if(!worldMissionRunning) then
    {
        sleep 120;
        _mission = _MMarray select (random (count _MMarray - 1));
        execVM format ["server\missions\otherMissions\%1.sqf",_mission];
		worldMissionRunning = true;
        diag_log format["WASTELAND SERVER - Execute New Mission"];
        _startTime = currentTime;
    } else {
    	sleep 1;  
    };    
};