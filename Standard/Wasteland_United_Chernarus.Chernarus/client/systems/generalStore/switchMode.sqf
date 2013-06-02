
//	@file Version: 1.0
//	@file Name: switchMode.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = buy to player 1 = buy to crate)]

#include "dialog\genstoreDefines.sqf";
disableSerialization;

_dialog = findDisplay genstore_DIALOG;
_switch = _dialog displayCtrl genstore_switch;
_buysell = _dialog displayCtrl genstore_buysell;
_iteminv = _dialog displayCtrl genstore_iteminventory;
_cartlist = _dialog displayCtrl genstore_cart;
_itemlist = _dialog displayCtrl genstore_item_list;
_totalText = _dialog displayCtrl genstore_total;
_itemInfo = _dialog displayCtrl genstore_item_Info;

//Clear old data
genStoreCart = 0;
lbClear _cartlist;
lbClear _itemlist;
_totalText CtrlsetText format["Total: $%1", genStoreCart];
_itemInfo ctrlSetStructuredText parseText "";

//Check which state we want to be in.
_switchText = Ctrltext _switch;
switch (_switchText) do
{
	case "Sell Items":
	{
		_switch ctrlSetText "Buy Items";
		_buysell ctrlSetText "Sell";
		_iteminv ctrlSetText "Inventory";
		[] execVM "client\systems\generalStore\getInventory.sqf";
	};
	case "Buy Items":
	{
		_switch ctrlSetText "Sell Items";
		_buysell ctrlSetText "Buy";
		_iteminv ctrlSetText "Items";
		[] execVM "client\systems\generalStore\populateGenStore.sqf";
	};
	case default
	{
	
	};
};