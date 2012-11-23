/*
	@file Version: 1.0
	@file Name: init.sqf
	@file Author: [404] Deadbeat
	@file Created: 20/11/2012 05:19
	@file Description: The client init.
	@file Args:
*/

if(!X_Client) exitWith {};

respawnDialogActive = false;

//Call client compile list.
[] execVM "client\functions\clientCompile.sqf";

waitUntil{player == player};

//Stop people being civ's.
if(!(playerSide in [west, east, resistance])) then {
	endMission "LOSER";
};

//Setup player events.
player addEventHandler ["Respawn", {[_this] call onRespawn;}];
player addEventHandler ["Killed", {[_this] call onKilled;}];

//Setup player menu scroll action.
terminate playerMenuHandle;
playerMenuHandle = [] spawn {
	waituntil {!isnull player};
	private ["_veh"];
	while {true} do {
		waituntil {vehicle player == player};
		if (!isnil "_veh") then {_veh removeaction playerMenuId};
		playerMenuId = player addAction [format ["<t color='#BE6300'>%1</t>", "Player Menu"], "client\systems\playerMenu\init.sqf",[],-10,false,false,"","local player"];
		waituntil {vehicle player != player};
		player removeaction playerMenuId;
		_veh = vehicle player;
		playerMenuId = _veh addAction [format ["<t color='#BE6300'>%1</t>", "Player Menu"], "client\systems\playerMenu\init.sqf",[],-10,false,false,"","local player"];
	};
};

//Setup Key Handler
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];

//Player setup
player call playerSetup;
[] execVM "client\functions\playerSpawn.sqf";

//client Executes
[] execVM "client\functions\initSurvival.sqf";
[] execVM "client\systems\hud\playerHud.sqf";
//[] execVM "core\client_playerIcons.sqf";
//[] spawn client_initShopsMarkers;