
//	@file Version: 1.0
//	@file Name: buyGuns.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = buy to player 1 = buy to crate)]

#include "dialog\genstoreDefines.sqf";
disableSerialization;

if(genStoreCart > (player getVariable "cmoney")) exitWith {hint "You do not have enough money"};

//Initialize Values
_playerMoney = player getVariable "cmoney";
_size = 0;

// Grab access to the controls
_dialog = findDisplay genstore_DIALOG;
_cartlist = _dialog displayCtrl genstore_cart;
_totalText = _dialog displayCtrl genstore_total;
_playerMoneyText = _Dialog displayCtrl genstore_money;
_size = lbSize _cartlist;

if(_size <= 0) exitWith {hint "You have no items in the cart"};

for [{_x=0},{_x<=_size},{_x=_x+1}] do
{
	_itemText = _cartlist lbText _x;
    switch (_itemText) do {
        
        case "Water": {
            if((player getVariable "water") + 1 <= 4) then {
                player setVariable["water",(player getVariable "water") + 1,true];	
            } else {
                _price = 0;
                {if(_x select 0 == "Water") then{_price = _x select 4;};}forEach generalStore;
            	genStoreCart = genStoreCart - _price;    
            };
        };
        
		case "Canned Food":	{
            if((player getVariable "canfood") + 1 <= 4) then {
                player setVariable["canfood",(player getVariable "canfood") + 1,true];
            } else {
            	_price = 0;
                {if(_x select 0 == "Canned Food") then{_price = _x select 4;};}forEach generalStore;
            	genStoreCart = genStoreCart - _price;    
            };
        };
        
		case "Medical Kit": {
            if((player getVariable "medkits") + 1 <= 2) then {
                player setVariable["medkits",(player getVariable "medkits") + 1,true];
            } else {
            	_price = 0;
                {if(_x select 0 == "Medical Kit") then{_price = _x select 4;};}forEach generalStore;
            	genStoreCart = genStoreCart - _price;    
            };
        };
        
		case "Repair Kit": {
            if((player getVariable "repairkits") + 1 <= 2) then {
                player setVariable["repairkits",(player getVariable "repairkits") + 1,true];
            } else {
            	_price = 0;
                {if(_x select 0 == "Repair Kit") then{_price = _x select 4;};}forEach generalStore;
            	genStoreCart = genStoreCart - _price;    
            };
        };
        
        case "Jerry Can (Full)": {
            if(((player getVariable "fuelFull") + 1 <= 1) AND ((player getVariable "fuelEmpty") + 1 <= 1)) then {
                player setVariable["fuelFull",(player getVariable "fuelFull") + 1,true];
            } else {
            	_price = 0;
                {if(_x select 0 == "Jerry Can (Full)") then{_price = _x select 4;};}forEach generalStore;
            	genStoreCart = genStoreCart - _price;    
            };
        };
        
        case "Jerry Can (Empty)": {
            if(((player getVariable "fuelEmpty") + 1 <= 1) AND ((player getVariable "fuelEmpty") + 1 <= 1)) then {
                player setVariable["fuelEmpty",(player getVariable "fuelEmpty") + 1,true];
            } else {
            	_price = 0;
                {if(_x select 0 == "Jerry Can (Empty)") then{_price = _x select 4;};}forEach generalStore;
            	genStoreCart = genStoreCart - _price;    
            };
        };
        case "Spawn Beacon": {
            if(((player getVariable "spawnBeacon") + 1 <= 1) AND ((player getVariable "spawnBeacon") + 1 <= 1)) then {
                player setVariable["spawnBeacon",(player getVariable "spawnBeacon") + 1,true];
            } else {
            	_price = 0;
                {if(_x select 0 == "Spawn Beacon") then{_price = _x select 4;};}forEach generalStore;
            	genStoreCart = genStoreCart - _price;    
            };
        };
    };
};

player setVariable["cmoney",_playerMoney - genStoreCart,false];
_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];

genStoreCart = 0;
_totalText CtrlsetText format["Total: $%1", genStoreCart];
lbClear _cartlist;