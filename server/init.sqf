
//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Description: The server init.
//	@file Args:

if(!X_Server) exitWith {};

//Execute Server Side Scripts.
[] execVM "server\functions\serverCompile.sqf";
[] execVM "server\functions\serverVars.sqf";
[] execVM "server\functions\relations.sqf";

//Execute Server Spawning.
if (serverSpawning == 1) then {
		
};

//Execute Server Missions.
if (sideMissions == 1) then {
	
};