
//	@file Version: 1.0
//	@file Name: buyGuns.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = buy to player 1 = buy to crate)]

#include "dialog\gunstoreDefines.sqf";
disableSerialization;

if(gunStoreCart > (player getVariable "cmoney")) exitWith {hint "You do not have enough money"};

//Initialize Values
_switch = _this select 0;

_playerMoney = player getVariable "cmoney";
_size = 0;
gsLocation = g_ammo_1;

// Grab access to the controls
_dialog = findDisplay gunshop_DIALOG;
_cartlist = _dialog displayCtrl gunshop_cart;
_totalText = _dialog displayCtrl gunshop_total;
_playerMoneyText = _Dialog displayCtrl gunshop_money;
_size = lbSize _cartlist;

switch(_switch) do 
{
	//Buy To Player
	case 0: 
	{
		for [{_x=0},{_x<=_size},{_x=_x+1}] do
		{
			_itemText = _cartlist lbText _x;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
				player addWeapon _class;
			}}forEach weaponsArray;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
				player addMagazine _class;
			}}forEach ammoArray;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
				player addWeapon _class;
			}}forEach accessoriesArray;
		};

		player setVariable["cmoney",_playerMoney - gunStoreCart,false];
		_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];

		gunStoreCart = 0;
		_totalText CtrlsetText format["Total: $%1", gunStoreCart];
		lbClear _cartlist;
	};
	
	//Buy To Crate
	case 1:
	{
		for [{_x=0},{_x<=_size},{_x=_x+1}] do
		{
			_itemText = _cartlist lbText _x;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
				gsLocation addWeaponCargoGlobal [_class, 1];
			}}forEach weaponsArray;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
				gsLocation addMagazineCargoGlobal [_class, 1];
			}}forEach ammoArray;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
				gsLocation addWeaponCargoGlobal [_class, 1];
			}}forEach accessoriesArray;
		};

		gunStoreCart = 0;
		player setVariable["cmoney",_playerMoney - gunStoreCart,false];
		_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];
		
		gunStoreCart = 0;
		_totalText CtrlsetText format["Total: $%1", gunStoreCart];
		lbClear _cartlist;
	};
};
