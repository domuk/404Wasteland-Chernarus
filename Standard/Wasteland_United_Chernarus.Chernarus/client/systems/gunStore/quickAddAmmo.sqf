
//	@file Version: 1.0
//	@file Name: quickAddAmmo.sqf
//	@file Author: [404] Costlyy
//	@file Created: 30/04/2013
//	@file Args:

private["_magazineTypeArray", "_doExit"];

#include "dialog\gunstoreDefines.sqf";
disableSerialization;

if (local player) then {

	//Initialize Values
	_price = 0;
	_checkWeapon = "";
	_checkAmmo = "";
	_checkAccessor = "";
    _doExit = false;

	// Grab access to the controls
	_dialog = findDisplay gunshop_DIALOG;
	_gunlist = _dialog displayCtrl gunshop_gun_list;
	_cartlist = _dialog displayCtrl gunshop_cart;
	_totalText = _dialog displayCtrl gunshop_total;

	//Get Selected Item
	_selectedItem = lbCurSel _gunlist;
	_itemText = _gunlist lbText _selectedItem;
    
    // Firstly, get an array of ammo that CAN be used in the selected gun.
    {
    	if(_itemText == (_x select 1)) then {           
			_magazineTypeArray = getArray (configFile >> "Cfgweapons" >> (_x select 2) >> "magazines");
        };
    }forEach weaponsArray;
    
    // Now find a salable ammo item from the total available ammo. Not all the ammo usable in guns is available for sale.
    {
    	_currAmmo = _x;
        {
        	if((_x == _currAmmo select 1) AND (!(_doExit))) exitWith {
            	if (((_currAmmo select 0) == "100Rnd. STANAG Drum") AND (_itemText != "M249")) then {
                	_itemText = "30Rnd. STANAG";
                	_doExit = true;
                } else {
                	_itemText = _currAmmo select 0;
                };
        	};
        } forEach _magazineTypeArray;
    }forEach ammoArray;
    

	//Check Items Price
	{if(_itemText == _x select 1) then{_price = _x select 3;}}forEach weaponsArray;
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach ammoArray;
	{if(_itemText == _x select 0) then{_price = _x select 2;}}forEach accessoriesArray;

	gunStoreCart = gunStoreCart + _price;
	_totalText CtrlsetText format["Total: $%1", gunStoreCart];

	_cartlist lbAdd format["%1",_itemText];
};