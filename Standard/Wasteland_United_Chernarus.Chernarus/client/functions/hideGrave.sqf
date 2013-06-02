//	@file Version: 1.0
//	@file Name: hideGrave.sqf
//	@file Author: [404] costlyy
//	@file Created: 01 June 13

// This is not very accurate but it is quick and dirty.
_graveHead = nearestObjects [player, ["GraveCrossHelmet"],  5] select 0;

_graveLoc = getPosATL _graveHead;
_graveBase = _graveHead getVariable["base",objNull];

// Validate the results from getting the grave details.
if (isNull _graveBase) exitWith {
	hint "ERROR: Cannot locate grave";
};

if (!(_graveBase isKindOf "Grave")) exitWith {
	hint "ERROR: Cannot validate grave type";
};

deleteVehicle (_graveHead);
deleteVehicle (_graveBase);




