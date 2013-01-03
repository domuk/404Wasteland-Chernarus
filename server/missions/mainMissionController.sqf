if(!isServer) exitWith {};

//waitUntil{ammoCrateSpawnComplete};

diag_log format["WASTELAND SERVER - Started Mission State"];

//Main Mission Array
_MMarray = ["mission_MBT",
            "mission_LightTank",
            "mission_LightArmVeh",
            "mission_APC",
            "mission_Heli",
            "mission_Outpost",
            "mission_RadarTruck"];          

mainMissionRunning = false;
_startTime = floor(time);
_result = 0;

while {true} do
{
    _currTime = floor(time);
	if(_currTime - _startTime >= 3600) then {_result = 1;};
    
    if(_result == 1) then
    {
    	mainMissionRunning = false;    
    };
    
	if(!mainMissionRunning) then
    {
        sleep 60;
        _mission = _MMarray select (random (count _MMarray - 1));
        execVM format ["server\missions\mainMissions\%1.sqf",_mission];
		mainMissionRunning = true;
        diag_log format["WASTELAND SERVER - Execute New Mission"];
        _startTime = floor(time);
        _result = 0;
    } else {
    	sleep 1;  
    };    
};