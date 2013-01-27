//	@file Version: 1.0
//	@file Name: mainMissionController.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19

#include "mainMissions\mainMissionDefines.sqf";

if(!isServer) exitWith {};

diag_log format["WASTELAND SERVER - Started Mission State"];

//Main Mission Array
_MMarray = ["mission_SupplyDrop",
			"mission_APC",
			"mission_Heli",
			"mission_LightArmVeh",
			"mission_LightTank",
			"mission_MBT",
			"mission_Outpost",
			"mission_RadarTruck"
			];

while {true} do
{
	_mission = _MMarray select (random (count _MMarray - 1));
	_missionRunning = [] ExecVM format ["server\missions\mainMissions\%1.sqf",_mission];
    diag_log format["WASTELAND SERVER - Execute New Mission"];
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", mainMissionDelayTime / 60, mainMissionColor, subTextColor];
	[nil,nil,rHINT,_hint] call RE;
	waitUntil{sleep 0.1; scriptDone _missionRunning}; 
};