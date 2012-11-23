
//	@file Version: 1.0
//	@file Name: onRespawn.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private["_player","_corpse","_town","_spawn","_temp"];

_player call playerSetup;
[] execVM "client\functions\playerSpawn.sqf";

//diag_log format["WASTELAND SERVER - Entered OnRespawn"];

_player = (_this select 0) select 0;
_corpse = (_this select 0) select 1;
_corpse removeAction playerMenuId;
{
	_corpse removeAction _x;
} forEach aActionsIDs;

[] spawn {
	waitUntil{client_respawnDialogActive};
	waitUntil{!client_respawnDialogActive};

	if(!isNull pTeamkiller) then {
		pDialogTeamkiller = pTeamkiller;
		pTeamkiller = objNull;

		[] execVM "core\client_teamkillDialog.sqf";
	};
};
