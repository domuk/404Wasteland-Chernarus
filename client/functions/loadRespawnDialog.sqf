
//	@file Version: 1.0
//	@file Name: loadRespawnDialog.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

disableSerialization;

createDialog "RespawnSelectionDialog";
_display = uiNamespace getVariable "RespawnSelectionDialog";
_display displayAddEventHandler ["KeyDown", "_return = false; if(respawnDialogActive && (_this select 1) == 1) then {_return = true;}; _return"];

respawnDialogActive = true;