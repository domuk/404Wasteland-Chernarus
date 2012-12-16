if(!isServer) exitWith {};

//waitUntil{ammoCrateSpawnComplete};

diag_log format["WASTELAND SERVER - Started Mission State"];

//Main Mission Array
_MMarray = ["mission_WepCache",
            "mission_ReconVeh",
            "mission_AirWreck",
            "mission_Truck"];

sideMissionRunning = false;
_startTime = currentTime;
_result = 0;

while {true} do
{
    _currTime = currentTime;
    _result = [_currTime, _startTime, 60] call compareTime;
    
    if(_result == 1) then
    {
    	sideMissionRunning = false;    
    };
    
	if(!sideMissionRunning) then
    {
        sleep 30;
        _mission = _MMarray select (random (count _MMarray - 1));
        execVM format ["server\missions\sideMissions\%1.sqf",_mission];
		sideMissionRunning = true;
        diag_log format["WASTELAND SERVER - Execute New Mission"];
        _startTime = currentTime;
    } else {
    	sleep 1;  
    };    
};