private["_vehicle","_veh_type"];

_vehicle = nearestObjects[player, ["LandVehicle", "Air", "Ship"], 6] select 0;
_veh_type = typeOf _vehicle;

if(vehicle player != player) exitWith {hint "You can't refuel the vehicle while in it";};
if(isNil{_vehicle}) exitWith {hint "No vehicle within range";};
if(_vehicle isKindOf "Bicycle") exitWith {hint "You can't refuel a bicycle";};
if((fuel _vehicle) >= 0.99) exitWith {hint "Vehicle has full fuel tank, no point in refueling.";};

_fuel = 0.33;

switch true do {
	case (_vehicle isKindOf "Air"): {_fuel = 0.10;};
	case (_vehicle isKindOf "Tank"): {_fuel = 0.15;};
	case (_vehicle isKindOf "Motorcycle"): {_fuel = 1;};
	case (_vehicle isKindOf "ATV_Base_EP1"): {_fuel = 1;};
};

player setVariable["fuelFull",0,true];
player setVariable["fuelEmpty",1,true];

titleText [format["Refueling %1", _veh_type], "PLAIN"];
player switchMove "AinvPknlMstpSlayWrflDnon_medic";
waitUntil {sleep 0.1; animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
titleText ["","PLAIN"];

if(!(local _vehicle)) then {
//	hint localize "STR_WL_Action_Refuel_DriverSeat";
	[nil, _vehicle, "loc", rSPAWN, [_vehicle, _fuel], {(_this select 0) setFuel (fuel(_this select 0) + (_this select 1))}] call RE;
} else {
	_vehicle setFuel ((fuel _vehicle) + _fuel);
};