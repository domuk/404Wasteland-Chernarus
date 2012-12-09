//	@file Version: 1.1
//	@file Name: pickupMoney.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Date modified: 07/12/2012 05:19
//	@file Args:

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat "YOU ARE ALREADY PERFORMING ANOTHER ACTION!";
};

mutexScriptInProgress = true;

_money = ((nearestobjects [getpos player, ["EvMoney"],  5] select 0) getVariable "money");
if(isNil{_money}) exitWith {};

deleteVehicle (nearestobjects [getpos player, ["EvMoney"],  5] select 0);
player setVariable["cmoney", (player getVariable "cmoney")+_money,true];
player playmove "AinvPknlMstpSlayWrflDnon";

sleep 3;

hint format["You have picked up $%1",_money];

sleep 1;
mutexScriptInProgress = false;
player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation. 
