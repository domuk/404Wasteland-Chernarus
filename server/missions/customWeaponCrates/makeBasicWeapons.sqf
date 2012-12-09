//	@file Version: 1.0
//	@file Name: makeBasicWeapons.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 15:19
//	@file Args:

private ["_crate"];

_crate = _this select 0;

clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;

_crate addWeaponCargoGlobal ["M4A1_AIM_SD_CAMO",2];
_crate addWeaponCargoGlobal ["M4A1_HWS_GL_CAMO",2];
_crate addWeaponCargoGlobal ["DMR",2];
_crate addWeaponCargoGlobal ["M24",2];
_crate addWeaponCargoGlobal ["M9",2];
_crate addWeaponCargoGlobal ["M9SD",2];
_crate addWeaponCargoGlobal ["MakarovSD",2];

_crate addWeaponCargoGlobal ["Binocular_Vector",1];
_crate addWeaponCargoGlobal ["NVGoggles",5];
_crate addWeaponCargoGlobal ["Binocular",5];

_crate addMagazineCargoGlobal ["15Rnd_9x19_M9",10];
_crate addMagazineCargoGlobal ["15Rnd_9x19_M9SD",10];
_crate addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD",10];
_crate addMagazineCargoGlobal ["1Rnd_HE_M203",20];
_crate addMagazineCargoGlobal ["FlareRed_M203",20];
_crate addMagazineCargoGlobal ["1Rnd_Smoke_M203",20];
_crate addMagazineCargoGlobal ["FlareGreen_M203",20];
_crate addMagazineCargoGlobal ["HandGrenade",15];
_crate addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",20];
_crate addMagazineCargoGlobal ["30Rnd_556x45_Stanag",50];
_crate addMagazineCargoGlobal ["20Rnd_762x51_DMR",15];
_crate addMagazineCargoGlobal ["5Rnd_762x51_M24",15];