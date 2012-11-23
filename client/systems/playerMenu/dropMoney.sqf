#include "dialog\player_sys.sqf";
#define GET_DISPLAY (findDisplay playersys_DIALOG)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
if(isNil {dropActive}) then {dropActive = false};
if(isNil {MoneyInUse}) then {MoneyInUse = false};
if(isnil {player getVariable "cmoney"}) then {player setVariable["cmoney",0,true];};
disableSerialization;

private["_money","_pos","_cash"];
_money = parsenumber(GET_SELECTED_DATA(money_value));

if(MoneyInUse) exitwith {hint "You are already dropping money.";};
if((player getVariable "cmoney" < _money) OR (player getVariable "cmoney" < 0)) exitwith {hint format["You don't have $%1 to drop", _money];};

MoneyInUse = true;
_pos = getPosATL player;
player playmove "AinvPknlMstpSlayWrflDnon";
_cash = "Evmoney" createVehicle (position player); _cash setPos _pos;
_cash setVariable["money",_money,true];
player setVariable["cmoney",(player getVariable "cmoney") - _money,true];
MoneyInUse = false;