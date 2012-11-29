//	@file Version: 1.0
//	@file Name: setupCityLocations.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args: [int(which button)]

_arr = configFile >> "CfgWorlds" >> worldName >> "Names";
for "_i" from 0 to (count _arr)-1 do {
	_loc = (_arr select _i);
    if((getText(_loc >> "type") == "CityCenter")) then {
		cityLocations set [count cityLocations, _loc];
	};
};

cityLocationsComplete = true;