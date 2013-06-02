
//	@file Version: 1.0
//	@file Name: populateGunStore.sqf
//	@file Author: [404] Deadbeat, [404] costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = populate list with guns (1..5 are subsections such as snipers) 6 = populate list with ammo 7 = populate list with equipment)]

#include "dialog\gunstoreDefines.sqf";
disableSerialization;

_switch = _this select 0;

// Grab access to the controls
_dialog = findDisplay gunshop_DIALOG;
_gunlisttext = _dialog displayCtrl gunshop_gun_TEXT;
_gunpicture = _dialog displayCtrl gunshop_gun_pic;
_gunlist = _dialog displayCtrl gunshop_gun_list;								
_gunInfo = _dialog displayCtrl gunshop_gun_Info;
_btnQuickAmmo = _dialog displayCtrl gunshop_btn_quickAddAmmo;

// Hide the quick ammo button by default.
_btnQuickAmmo ctrlShow false;


//Clear the list before repopulating.
lbClear _gunlist;
_gunlist lbSetCurSel -1;
_gunpicture ctrlSettext "";
_gunlisttext ctrlSettext "";
_gunInfo ctrlSetStructuredText parseText "";


switch(_switch) do 
{
	case 0: // Weapons button pressed.
	{
        _btnQuickAmmo ctrlShow true;

		// Populate the gun shop weapon list
		{
			_gunlistIndex = _gunlist lbAdd format["%1",_x select 1];
		} forEach weaponsArray;
	};
    
    case 1: // Weapons - Pistols button pressed.
	{
		_btnQuickAmmo ctrlShow true;

		// Populate the gun shop weapon list
		{
        	if (_x select 0 == 1) then {
            	_gunlistIndex = _gunlist lbAdd format["%1",_x select 1];
            };
		} forEach weaponsArray;
	};
    
    case 2: // Weapons - Rifles button pressed.
	{
		_btnQuickAmmo ctrlShow true;

		// Populate the gun shop weapon list
		{
        	if (_x select 0 == 2) then {
            	_gunlistIndex = _gunlist lbAdd format["%1",_x select 1];
            };
		} forEach weaponsArray;
	};
    
    case 3: // Weapons - Snipers button pressed.
	{
		_btnQuickAmmo ctrlShow true;

		// Populate the gun shop weapon list
		{
        	if (_x select 0 == 3) then {
            	_gunlistIndex = _gunlist lbAdd format["%1",_x select 1];
            };
		} forEach weaponsArray;
	};
    
    case 4: // Weapons - Machineguns button pressed.
	{
		_btnQuickAmmo ctrlShow true;

		// Populate the gun shop weapon list
		{
        	if (_x select 0 == 4) then {
            	_gunlistIndex = _gunlist lbAdd format["%1",_x select 1];
            };
		} forEach weaponsArray;
	};
    
    case 5: // Weapons - RPGs button pressed.
	{
		_btnQuickAmmo ctrlShow true;

		// Populate the gun shop weapon list
		{
        	if (_x select 0 == 5) then {
            	_gunlistIndex = _gunlist lbAdd format["%1",_x select 1];
            };
		} forEach weaponsArray;
	};
	
	case 6: // Ammunition button pressed.
	{
		// Populate the gun shop ammo list
		{
			_gunlistIndex = _gunlist lbAdd format["%1",_x select 0];
		} forEach ammoArray;	
	};

	case 7: // Equipment button pressed.
	{
		// Populate the gun shop equipment list
		{
			_gunlistIndex = _gunlist lbAdd format["%1",_x select 0];
		} forEach accessoriesArray;	
	};
};