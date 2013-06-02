//	@file Version: 1.0
//	@file Name: loadSellConfirm.sqf
//	@file Author: [404] Costlyy
//	@file Created: 13th May 2013
//	@file Args:

// Close the dialog.
closeDialog 0;

//Initialize Values
private["_primaryWeapon","_magazineType","_weaponValue","_magazineValue"];

_magazineValue = 0;
_weaponValue = 25; // Default value for unknown weapons.
_primaryWeapon = currentWeapon player;
_weaponMagazineArray = (getArray (configFile >> "Cfgweapons" >> _primaryWeapon >> "magazines"));

// PREREQUISITE: Player must have a weapon to sell, othewise do nothing.
if(_primaryWeapon == "") exitWith {};

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat "ERROR: ALREADY PERFORMING ANOTHER ACTION!";
};	

// Check if player is alive.
if(!(alive player)) exitWith {
	player globalChat "ERROR: YOU ARE CURRENTLY DEAD.";
    closeDialog 0;
};	

mutexScriptInProgress = true;

// Get magazine type.
{
	if(_x in magazines player) then
    {
		_magazineType = _x;
        
        // Calculate the value of the magazines the player has for the gun being sold.
        {
			if (_x == _magazineType) then {
		    	_magazineValue = _magazineValue + 5;
                player removeMagazine _x;
		    };
		} forEach magazines player;
    };
} forEach _weaponMagazineArray;

// Get primary weapon and retrieve value.
{
	if(_x select 2 == _primaryWeapon) then {
    	_weaponValue = _x select 4;
    };
}forEach weaponsArray;

// Calculate the total amount due back to the player...
_totalValue = _magazineValue + _weaponValue;

diag_log format["total value = %1", _totalValue];
diag_log format["mag value = %1", _magazineValue];
diag_log format["weap value = %1", _weaponValue];

player removeWeapon _primaryWeapon;
player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _totalValue, true];
hint format["Sold weapon and magazines for $%1", _totalValue];

mutexScriptInProgress = false;;