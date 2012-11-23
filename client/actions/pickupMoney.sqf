
//	@file Version: 1.0
//	@file Name: pickupMoney.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_money = ((nearestobjects [getpos player, ["EvMoney"],  5] select 0) getVariable "money");
if(isNil{_money}) exitWith {};

player setVariable["cmoney", (player getVariable "cmoney")+_money,true];
deleteVehicle (nearestobjects [getpos player, ["EvMoney"],  5] select 0);
player playmove "AinvPknlMstpSlayWrflDnon";
hint format["You have picked up $%1",_money];