//	@file Version: 1.0
//	@file Name: dropMoney.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13
//	@file Args:

///// VARIABLES /////

_delayTime = 5 * 10; // 5 seconds.


///// GET SELECTED AMOUNT OF MONEY /////

#include "dialog\player_sys.sqf";
#define GET_DISPLAY (findDisplay playersys_DIALOG)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
if(isNil {dropActive}) then {dropActive = false};
if(isNil {MoneyInUse}) then {MoneyInUse = false};
if(isNil {player getVariable "cmoney"}) then {player setVariable["cmoney",0,true];};
disableSerialization;
_moneyAmount = parseNumber(GET_SELECTED_DATA(money_value));

///// PREREQUISITES /////

if((player getVariable "cmoney" < _moneyAmount) OR (player getVariable "cmoney" < 0)) exitwith {
	hint format["You don't have $%1 to drop!", _moneyAmount];
};

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat "ERROR: ALREADY PERFORMING ANOTHER ACTION!";
};

// Check the player is allowed to drop money.
if (!(player getVariable "canDrop")) exitWith {
	player globalChat "YOU CANNOT DROP MONEY YET!";
};	

// Check if the amount selected is 0 or null.
if(_moneyAmount < 1) exitWith {}; // Don't do anything if user selects 0 money to drop.

///// PROCESS DROP REQUEST /////

mutexScriptInProgress = true;
            	
_prevState = animationState player;
                
if((vehicle player) == player) then {player playMove "AinvPknlMstpSnonWnonDnon_healed_1";};
                
for "_i" from 1 to _delayTime do {
	if (doCancelAction) exitWith { 
	    mutexScriptInProgress = false; 
	    player switchMove _prevState; 
    }; 
	sleep 0.1;
};       
             
if (!(doCancelAction)) then {

	_currPosition = getPosATL player;
	_droppedCash = "Evmoney" createVehicle (position player); _droppedCash setPos _currPosition;
	_droppedCash setVariable["money",_moneyAmount,true];
	_droppedCash setVariable["owner","world",true];
	player setVariable["cmoney",(player getVariable "cmoney") - _moneyAmount,true];
} else {
	hint format["Money drop cancelled."];
	player switchMove _prevState;
	
};  

doCancelAction = false;
mutexScriptInProgress = false;
