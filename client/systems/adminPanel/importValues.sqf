//	@file Version: 1.0
//	@file Name: importValues.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_index1 = _this select 1;
_type1 = _this select 0;

if (_type1 == 1) then {
    _data1 = lbData [13372, _index1];
    {
        if (str(_x) == _data1) exitwith {
            ctrlSetText [38761, format["Object: %1",_x]];
            ctrlSetText [38762, format["Type: %1",typeOf _x]];
            ctrlSetText [38763, format["Weapons: %1",weapons _x]];
            ctrlSetText [38764, format["Speed: %1",speed _x]];
            ctrlSetText [38765, format["Users: %1",crew _x]];
            ctrlSetText [38766, format["Damage: %1",damage _x]];
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