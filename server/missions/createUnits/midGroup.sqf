//	@file Version: 1.0
//	@file Name: midGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 21:58
//	@file Args:

private ["_group","_pos","_man1","_man2","_man3","_man4","_man5","_man6","_man7"];

_group = _this select 0;
_pos = _this select 1;

//Anti Vehicle
_man1 = _group createunit ["Priest", [(_pos select 0) + 10, _pos select 1, 0], [], 0, "Form"];
_man1 addMagazine "PG7V";
_man1 addMagazine "PG7V";
_man1 addWeapon "RPG7V";
_man1 addMagazine "30Rnd_545x39_AK";
_man1 addMagazine "30Rnd_545x39_AK";
_man1 addMagazine "30Rnd_545x39_AK";
_man1 addWeapon "AKS_74_U";

//Support
_man2 = _group createunit ["Priest", [(_pos select 0) - 30, _pos select 1, 0], [], 0, "Form"];
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addWeapon "RPK_74";

//Rifle_man
_man3 = _group createunit ["Priest", [_pos select 0, (_pos select 1) + 30, 0], [], 0, "Form"];
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addWeapon "AK_47_M";

//Rifle_man
_man4 = _group createunit ["Priest", [_pos select 0, (_pos select 1) + 40, 0], [], 0, "Form"];
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addWeapon "AK_47_M";

//Rifle_man
_man5 = _group createunit ["Priest", [_pos select 0, (_pos select 1) + 40, 0], [], 0, "Form"];
_man5 addMagazine "30Rnd_762x39_AK47";
_man5 addMagazine "30Rnd_762x39_AK47";
_man5 addMagazine "30Rnd_762x39_AK47";
_man5 addWeapon "AK_47_M";

//Sniper
_man6 = _group createunit ["Priest", [_pos select 0, (_pos select 1) - 30, 0], [], 0, "Form"];
_man6 addMagazine "10Rnd_762x54_SVD";
_man6 addMagazine "10Rnd_762x54_SVD";
_man6 addMagazine "10Rnd_762x54_SVD";
_man6 addWeapon "SVD";

//Grenadier
_man7 = _group createunit ["Priest", [_pos select 0, (_pos select 1) - 40, 0], [], 0, "Form"];
_man7 addMagazine "30Rnd_762x39_AK47";
_man7 addMagazine "30Rnd_762x39_AK47";
_man7 addMagazine "30Rnd_762x39_AK47";
_man7 addMagazine "1Rnd_HE_GP25";
_man7 addMagazine "1Rnd_HE_GP25";
_man7 addMagazine "1Rnd_HE_GP25";
_man7 addWeapon "AK_74_GL";