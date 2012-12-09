//	@file Version: 1.0
//	@file Name: repair.sqf
//	@file Author: TAW_Tonic
//	@file Created: 01/01/1970 00:00
//	@file Args: 

private["_vehicle","_veh_type"];

_vehicle = nearestObjects[player, ["LandVehicle", "Air", "Ship"], 6] select 0;
_veh_type = typeOf _vehicle;

if(vehicle player != player) exitWith {hint "You can't repair the vehicle while in it";};
if(isNil{_vehicle}) exitWith {hint "No vehicle within range";};
//if(!(local _vehicle)) exitWith {hint "Please enter driver seat before repairing";};

if(((damage _vehicle) > 0.05) || !(canMove _vehicle) || (_vehicle isKindOf "Air") || ((count crew _vehicle > 0) && (count(configFile >> "CfgVehicles" >> (_veh_type) >> "Turrets") > 0) && !(canFire _vehicle))) then {
	player setVariable["repairkits",(player getVariable "repairkits")-1,false];
	titleText [format["Repairing %1", _veh_type], "PLAIN"];
	player switchMove "AinvPknlMstpSlayWrflDnon_medic";
	waitUntil {sleep 0.1; animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
	titleText ["","PLAIN"];
	_vehicle setDamage 0;
} else {
	{[_vehicle, _x, 0] call client_setHit;} forEach ["HitGlass1", "HitGlass2", "HitGlass3", "HitGlass4", "HitGlass5", "HitGlass6"];
	hint "Vehicle is very operational, no point in using up repair kit.";
}