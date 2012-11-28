//	@file Version: 1.0
//	@file Name: loadRespawnDialog.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define respawn_Content_Text 3401
#define respawn_MissionUptime_Text 3402
#define respawn_Town_Button0 3403
#define respawn_Town_Button1 3404
#define respawn_Town_Button2 3405
#define respawn_Town_Button3 3406
#define respawn_Town_Button4 3407

disableSerialization;

createDialog "respawnDialog";
_display = uiNamespace getVariable "RespawnSelectionDialog";
_display displayAddEventHandler ["KeyDown", "_return = false; if(respawnDialogActive && (_this select 1) == 1) then {_return = true;}; _return"];
_respawnText = _display displayCtrl respawn_Content_Text;

_side = "";
if(playerSide in [west]) then {_side = "Blufor"};
if(playerSide in [east]) then {_side = "Opfor"};
if(str(playerSide) == "GUER") then {_side = "Independent"};

_respawnText ctrlSetStructuredText parseText (format["You are on %1.<br/>Please select a spawn point.",_side]);
respawnDialogActive = true;
