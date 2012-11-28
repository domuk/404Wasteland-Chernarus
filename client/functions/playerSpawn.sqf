
//	@file Version: 1.0
//	@file Name: playerSpawn.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

playerSpawning = true;
playerUID = getPlayerUID(player);

townSearch = 0;
beaconSearch = 0;

//Check if team killer

//Check if team switcher

//Kick to lobby for appropriate reason
//Teamkiller Kick
if(doKickTeamKiller) exitWith {
	titleText ["", "BLACK IN", 0];
	titleText [localize "STR_WL_Loading_Teamkiller", "black"]; titleFadeOut 9999;
	[] spawn {sleep 20; endMission "LOSER";};
};

//Teamswitcher Kick
if(doKickTeamSwitcher) exitWith {
	titleText ["", "BLACK IN", 0];
	titleText [format[localize "STR_WL_Loading_Teamswitched", localize format ["STR_WL_Gen_Team%1_2", _side]], "black"]; titleFadeOut 9999;
	[] spawn {sleep 20; endMission "LOSER";};
};

titleText ["Loading...", "BLACK OUT", 0.00001];
waitUntil {compiledScripts};

[] execVM "client\functions\loadRespawnDialog.sqf";
waitUntil {respawnDialogActive};

while {respawnDialogActive} do {
	titleText ["", "BLACK OUT", 0.00001];
};
sleep 0.1;

titleText ["", "BLACK IN", 0.00001];
playerSpawning = false;