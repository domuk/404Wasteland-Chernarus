if(!isServer) exitWith {};

waitUntil{staticGunSpawningComplete};

diag_log format["WASTELAND SERVER - Started Mission State"];

//Main Mission Array
_MMarray = ["mission_MBT",
            "mission_LightTank",
            "mission_LightArmVeh",
            "mission_APC",
            "mission_Heli",
            "mission_WepCache",
            "mission_ReconVeh",
            "mission_AirWreck",
            "mission_Truck"];

MissionRunning = false;
_startTime = currentTime;
_result = 0;

while {true} do
{
    _currTime = currentTime;
    _result = [_currTime, _startTime, 40] call compareTime;
    
    if(_result == 1) then
    {
    	MissionRunning = false;    
    };
    
	if(!MissionRunning) then
    {
        sleep 5;
        _mission = _MMarray select (random (count _MMarray - 1));
        execVM format ["server\missions\mainMissions\%1.sqf",_mission];
		MissionRunning = true;
        diag_log format["WASTELAND SERVER - Execute New Mission"];
        _startTime = currentTime;
    } else {
    	sleep 1;  
    };
    
};