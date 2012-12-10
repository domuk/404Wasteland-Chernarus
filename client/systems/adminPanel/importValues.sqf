//	@file Version: 1.0
//	@file Name: importValues.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define vehicleManagementDialog 12000
#define vehicleManagementListBox 12001
#define vehicleWeaponsText 12003
#define vehicleUsersText 12004
#define vehicleDamageText 12005
#define vehicleSpeedText 12006

disableSerialization;

private ["_index1","_type1","_dialog","_vehicleListBox","_weaponText","_userText","_damageText","_speedText","_data1"];
_index1 = _this select 1;
_type1 = _this select 0;

_dialog = findDisplay vehicleManagementDialog;
_vehicleListBox = _dialog displayCtrl vehicleManagementListBox;
_weaponText = _dialog displayCtrl vehicleWeaponsText;
_userText = _dialog displayCtrl vehicleUsersText;
_damageText = _dialog displayCtrl vehicleDamageText;
_speedText = _dialog displayCtrl vehicleSpeedText;

if (_type1 == 1) then {
    _data1 = _vehicleListBox lbData _index1;
    {
        if (str(_x) == _data1) exitwith {
           _weaponText ctrlSetText format["Weapons: %1",weapons _x];
           _speedText ctrlSetText format["Speed: %1",speed _x];
           _userText ctrlSetText format["Users: %1",crew _x];
           _damageText ctrlSetText format["Damage: %1",damage _x];
        };
    } foreach vehicles;
};

if (_type1 == 2) then {
    _data1 = lbData [13371, _index1];
    {
        if (str(_x) == _data1) exitwith {
            ctrlSetText [38861, format["Items: %1",weapons _x]];
            ctrlSetText [38862, format["Current Weapon: %1",currentWeapon _x]];
            ctrlSetText [38863, format["Magazines: %1",magazines _x]];
            ctrlSetText [38864, format["Position: %1",position _x]];
        };
    } foreach playableUnits;
};