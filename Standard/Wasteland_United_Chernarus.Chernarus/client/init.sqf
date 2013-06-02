//@file Version: 1.0
//@file Name: init.sqf
//@file Author: [404] Deadbeat, [404] Costlyy
//@file Created: 20/11/2012 05:19
//@file Description: The client init.

if(!X_Client) exitWith {};

// Disable player from killing in the spawn area.
player enableSimulation false; 
removeAllWeapons player;

// Start the loading screen ASAP.
titleText ["Loading...", "BLACK OUT", 0];

mutexScriptInProgress = false;
respawnDialogActive = false;
groupManagmentActive = false;
pvar_PlayerTeamKiller = objNull;
doCancelAction = false;
currentMissionsMarkers = [];
currentRadarMarkers = [];

//Initialization Variables
playerCompiledScripts = false;
playerSetupComplete = false;

waitUntil {!isNull player};
waitUntil{time > 2};

//Call client compile list.
player call compile preprocessFileLineNumbers "client\functions\clientCompile.sqf";

//Stop people being civ's.
if(!(playerSide in [west, east, resistance])) then {
	endMission "LOSER";
};

//Player setup
player call playerSetup;

//Setup player events.
if(!isNil "client_initEH") then {player removeEventHandler ["Respawn", client_initEH];};
player addEventHandler ["Respawn", {[_this] call onRespawn;}];
player addEventHandler ["Killed", {[_this] call onKilled;}];

//Setup player menu scroll action.
[] execVM "client\clientEvents\onMouseWheel.sqf";

//Setup Key Handler
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];

"currentDate" addPublicVariableEventHandler {[] call timeSync};
"clientMissionMarkers" addPublicVariableEventHandler {[] call updateMissionsMarkers};
"clientRadarMarkers" addPublicVariableEventHandler {[] call updateRadarMarkers};
"pvar_teamKillList" addPublicVariableEventHandler {[] call updateTeamKiller};
"publicVar_teamkillMessage" addPublicVariableEventHandler {if(local(_this select 1)) then {[] spawn teamkillMessage;};};

//client Executes
[] execVM "client\functions\initSurvival.sqf";
[] execVM "client\systems\hud\playerHud.sqf";
[] execVM "client\functions\createTownMarkers.sqf";
[] execVM "client\functions\createGunStoreMarkers.sqf";
[] execVM "client\functions\createGeneralStoreMarkers.sqf";
//true execVM "client\functions\loadAtmosphere.sqf"; // Set to false to disable dust, ash and wind
[] execVM "client\functions\playerTags.sqf";
[] execVM "client\functions\groupTags.sqf";
[] call updateMissionsMarkers;
[] call updateRadarMarkers;
if (isNil "FZF_IC_INIT") then   {
	call compile preprocessFileLineNumbers "client\functions\newPlayerIcons.sqf";
};
sleep 1;
true spawn playerSpawn;
[] execVM "client\functions\antiCheatClient.sqf";
[] spawn FZF_IC_INIT;