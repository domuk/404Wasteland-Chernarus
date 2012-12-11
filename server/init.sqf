//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Description: The server init.
//	@file Args:

if(!X_Server) exitWith {};

sideMissions = 1;
serverSpawning = 1;
vehicleRespawn = 0;

//Execute Server Side Scripts.
[] execVM "server\functions\serverVars.sqf";
[] execVM "server\functions\serverCompile.sqf";
[] execVM "server\functions\currentTime.sqf";
[] execVM "server\functions\relations.sqf";
waitUntil{serverCompiledScripts};

diag_log format["WASTELAND SERVER - Server Complie Finished"];

//Execute Server Spawning.
if (serverSpawning == 1) then {
    diag_log format["WASTELAND SERVER - Initilizing Server Spawning"];
    vehicleSpawnComplete = false;
    objectSpawnComplete = false;
    ammoCrateSpawnComplete = false;
    staticGunSpawningComplete = false;
	[] execVM "server\functions\vehicleSpawning.sqf";
    [] execVM "server\functions\objectsSpawning.sqf";
    [] execVM "server\functions\boxSpawning.sqf";
    [] execVM "server\functions\staticGunSpawning.sqf";
};

//Start Vehicle Respawn Script.
if(vehicleRespawn == 1) then {
    diag_log format["WASTELAND SERVER - Initilizing Vehicle Respawning"];
    //[] execVM "server\functions\vehicleRespawn.sqf";
};

//Execute Server Missions.
if (sideMissions == 1) then {
	diag_log format["WASTELAND SERVER - Initilizing Missions"];
    [] execVM "server\missions\sideMissionController.sqf";
    [] execVM "server\missions\mainMissionController.sqf";
    //[] execVM "server\missions\worldMissionController.sqf";
};