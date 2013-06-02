
//	@file Version: 1.0
//	@file Name: sellItems.sqf
//	@file Author: [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\genstoreDefines.sqf";
disableSerialization;

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat "ERROR: ALREADY PERFORMING ANOTHER ACTION!";
};	

// Check if player is alive.
if(!(alive player)) exitWith {
	player globalChat "ERROR: YOU ARE CURRENTLY BUSY.";
};	

mutexScriptInProgress = true;

//Initialize Values
_playerMoney = player getVariable "cmoney";
_size = 0;

// Grab access to the controls
_dialog = findDisplay genstore_DIALOG;
_cartlist = _dialog displayCtrl genstore_cart;
_totalText = _dialog displayCtrl genstore_total;
_playerMoneyText = _Dialog displayCtrl genstore_money;
_size = lbSize _cartlist;

for [{_x=0},{_x<=_size},{_x=_x+1}] do
{
	_itemText = _cartlist lbText _x;
	switch (_itemText) do
	{
		case "Water": {player setVariable["water",(player getVariable "water") - 1,false];};
		case "Canned Food": {player setVariable["canfood",(player getVariable "canfood") - 1,false];};
		case "Medical Kit": {player setVariable["medkits",(player getVariable "medkits") - 1,false];};
		case "Repair Kit": {player setVariable["repairkits",(player getVariable "repairkits") - 1,false];};
		case "Jerry Can (Full)": {player setVariable["fuelFull",(player getVariable "fuelFull") - 1,false];};
		case "Jerry Can (Empty)": {player setVariable["fuelEmpty",(player getVariable "fuelEmpty") - 1,false];};
		case "Spawn Beacon": {player setVariable["spawnBeacon",(player getVariable "spawnBeacon") - 1,false];};
		case "Camo Net": {player setVariable["camonet",(player getVariable "camonet") - 1,false];};
		case default
		{
			genStoreCart = 0;
		};
	};
};

player setVariable["cmoney",_playerMoney + genStoreCart,false];
_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];

genStoreCart = 0;
_totalText CtrlsetText format["Total: $%1", genStoreCart];
lbClear _cartlist;

mutexScriptInProgress = false;