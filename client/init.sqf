//@file Version: 1.0
//@file Name: init.sqf
//@file Author: [404] Deadbeat
//@file Created: 20/11/2012 05:19
//@file Description: The client init.
//@file Args:

if(!X_Client) exitWith {};

cityLocationsComplete = false;
mutexScriptInProgress = false;
respawnDialogActive = false;
playerSetupComplete = false;
compiledScripts = false;

//Call client compile list.
[] execVM "client\functions\clientCompile.sqf";

waitUntil{compiledScripts};
waitUntil{player == player};
waitUntil{time > 0};

[] execVM "client\functions\setupCityLocations.sqf";
waitUntil {cityLocationsComplete};

//Player setup
player call playerSetup;

//Stop people being civ's.
if(!(playerSide in [west, east, resistance])) then {
	endMission "LOSER";
};

//Setup player events.
if(!isNil "client_initEH") then {player removeEventHandler ["Respawn", client_initEH];};
player addEventHandler ["Respawn", {[_this] call onRespawn;}];
player addEventHandler ["Killed", {[_this] call onKilled;}];

//Setup player menu scroll action.
[] execVM "client\clientEvents\onMouseWheel.sqf";

//Setup Key Handler
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];

currentMissionsMarkers = [];
"clientMissionMarkers" addPublicVariableEventHandler {[] call updateMissionsMarkers};

currentRadarMarkers = [];
"clientRadarMarkers" addPublicVariableEventHandler {[] call updateRadarMarkers};

"publicVar_teamkillMessage" addPublicVariableEventHandler {if(local(_this select 1)) then {[] spawn teamkillMessage;};};

pvar_PlayerTeamKiller = objNull;
"pvar_teamKillList" addPublicVariableEventHandler {
	if(str(playerSide) in ["WEST", "EAST"]) then {
		{
			if(_x select 0 == playerUID) then {
				if((_x select 1) >= 2) then {
					titleText ["", "BLACK IN", 0];
					titleText [localize "STR_WL_Loading_Teamkiller", "black"]; titleFadeOut 9999;
                    removeAllWeapons player;
					[] spawn {sleep 20; endMission "LOSER";};
				};
			};
		} forEach pvar_teamKillList;
	};
};

//client Executes
[] execVM "client\functions\initSurvival.sqf";
[] execVM "client\systems\hud\playerHud.sqf";
[] execVM "client\functions\createTownMarkers.sqf";
[] execVM "client\functions\createGunStoreMarkers.sqf";
[] execVM "client\functions\createGeneralStoreMarkers.sqf";
[] execVM "client\functions\createPlayerIcons.sqf";
[] call updateMissionsMarkers;
[] call updateRadarMarkers;

waitUntil {playerSetupComplete};
true spawn playerSpawn;
