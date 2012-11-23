
//	@file Version: 1.0
//	@file Name: vehicleCreation.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private ["_marker","_cartype","_car","_num","_tipped","_carpos","_type","_townpos"];
_type = _this select 1;
_pos = _this select 0;

//Create Civilian Vehicle
if (_type == 0) then {
	//Car Initilization, Pick Car Type.
    _cartype = civilianVehicles call BIS_fnc_selectRandom;
    _car = createVehicle [_cartype,_pos,[], 20,"None"];
    _car setpos [getpos _car select 0,getpos _car select 1,0];

	//Clear Cars Inventory
    clearMagazineCargoGlobal _car;
    clearWeaponCargoGlobal _car;

	//Set Cars Attributes
    _car setFuel (0.50);
    _car setDamage (random 0.50);
    _car setDir (random 360);
    [_car] call randomWeapons;

	//Set original posistion then add to vehicle array
	_car setVariable["origPos",_pos,false];
	currentVehicles set [count currentVehicles, [_car]];
};

//Create Military Vehicle
if (_type == 1) then {
	//Car Initilization, Pick Car Type.
    _cartype = militaryVehicles call BIS_fnc_selectRandom;
    _car = createVehicle [_cartype,_pos, [], 30, "None"];
    _car setpos [getpos _car select 0,getpos _car select 1,0];

	//Clear Cars Inventory
    clearMagazineCargoGlobal _car;
    clearWeaponCargoGlobal _car;

	//Set Cars Attributes
    _car setFuel (0.50);
    _car setDamage (random 0.50);
    _car setDir (random 360);
    [_car] call randomWeapons;

	//Set original posistion then add to vehicle array
	_car setVariable["origPos",_pos,false];
	currentVehicles set [count currentVehicles, [_car]];
};

//Create Armed Military Vehicle
if (_type == 2) then {
	//Car Initilization, Pick Car Type.
    _cartype = armedMilitaryVehicles call BIS_fnc_selectRandom;
    _car = createVehicle [_cartype,_pos, [], 30, "None"];
    _car setpos [getpos _car select 0,getpos _car select 1,0];

	//Clear Cars Inventory
    clearMagazineCargoGlobal _car;
    clearWeaponCargoGlobal _car;

	//Set Cars Attributes
    _car setFuel (0.50);
    _car setDamage (random 0.50);
    _car setDir (random 360);
    _car setVehicleAmmo (random 0.90);
    [_car] call randomWeapons;

	//Set original posistion then add to vehicle array
	_car setVariable["origPos",_pos,false];
	currentVehicles set [count currentVehicles, [_car]];
};