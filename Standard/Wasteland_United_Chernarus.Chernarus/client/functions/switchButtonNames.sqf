
//	@file Version: 1.0
//	@file Name: switchButtonNames.sqf
//	@file Author: [404] Costlyy
//	@file Created: 08/12/2012 18:30
//	@file Args: [int(0 = show towns | 1 = show beacons)]

_selectedButton = _this select 0;

#define respawn_PlayersInTown_Text0 3408
#define respawn_PlayersInTown_Text1 3409
#define respawn_PlayersInTown_Text2 3410
#define respawn_PlayersInTown_Text3 3411
#define respawn_PlayersInTown_Text4 3412

disableSerialization;

_display = uiNamespace getVariable "RespawnSelectionDialog";
_textZero = _display displayCtrl respawn_PlayersInTown_Text0;
_textOne = _display displayCtrl respawn_PlayersInTown_Text1;
_textTwo = _display displayCtrl respawn_PlayersInTown_Text2;
_textThree = _display displayCtrl respawn_PlayersInTown_Text3;
_textFour = _display displayCtrl respawn_PlayersInTown_Text4;

if(_selectedButton == 0) then {
	// Spawn in town buttons show
	showBeacons = false;
} else {
	// Spawn at beacon buttons show
	showBeacons = true;

    sleep 0.5;
    
    _blank = "";
	_textZero ctrlSetText _blank;
	_textOne ctrlSetText _blank;
	_textTwo ctrlSetText _blank;
	_textThree ctrlSetText _blank;
	_textFour ctrlSetText _blank;
};