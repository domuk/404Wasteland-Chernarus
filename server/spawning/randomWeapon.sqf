
//	@file Version: 1.0
//	@file Name: randomWeapon.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private ["_car","_mags","_rnd","_weapon","_mag"];

//Server check
if (!isServer) exitWith {};

//Grabs carname from array in execVM
_car = _this select 0;

//Sets up weapon array
_num = floor (random 100);
if (_num < 100) then {CVG_weapons = CVG_Rifles};
if (_num < 25) then {CVG_weapons = CVG_Heavy};
if (_num < 15) then {CVG_weapons = CVG_Scoped};
if (_num < 10) then {CVG_weapons = CVG_pistols};

_num = floor (random 100);
if (_num < 75) then { _car addWeaponCargoGlobal ["Binocular", 1]};
if (_num < 15) then { _car addWeaponCargoGlobal ["NVgoggles", 1]};

//Does some randomessness
_rnd = floor random (count CVG_weapons);
_weapon = CVG_weapons select _rnd;

_mag = (getArray (configFile >> "Cfgweapons" >> _weapon >> "magazines")) select 0;

//Add guns and magazines, note the Global at the end..
_car addMagazineCargoGlobal [_mag,1];
_car addMagazineCargoGlobal [_mag,(random 4)];
_car addWeaponCargoGlobal [_weapon,1];