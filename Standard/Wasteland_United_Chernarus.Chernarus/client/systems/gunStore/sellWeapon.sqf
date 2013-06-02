
//	@file Version: 1.0
//	@file Name: sellWeapon.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args:

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

mutexScriptInProgress = false;

// Value calculations complete.. Now we load the confirmation dialog.
_confirmSell = [_primaryWeapon, _totalValue] call loadSellConfirm;

