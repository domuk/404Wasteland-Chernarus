
//	@file Version: 1.0
//	@file Name: sellWeapon.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

//Initialize Values
private["_primary","_magazine","_weapon_value","_magSell"];
_magSell = 0;
_primary = "";
_primary = currentWeapon player;
if(_primary == "") exitWith {hint "You don't have a current weapon in your hand to sell!";};

{
	if(_x in magazines player) then
    {
		_magazine = _x;
    };
} foreach (getArray (configFile >> "Cfgweapons" >> _primary >> "magazines"));

_weapon_value = 20;

if(isNil {_weapon_value}) exitWith {hint "The current gun you have isn't sellable."};

player removeWeapon _primary;
player removeMagazines _magazine;

player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _weapon_value, true];
//hint format["You made a total of: $%1", _weapon_value];