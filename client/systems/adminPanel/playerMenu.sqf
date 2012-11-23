//	@file Version: 1.0
//	@file Name: playerMenu.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_start = createDialog "PlayersMenu";

#define PlayersMenu 13371



{
    //Calculate Health 0 - 100
    _decimalPlaces = 2;
    _health = damage _x;
    _health = round (_health * (10 ^ _decimalPlaces)) / (10 ^ _decimalPlaces);
    _health = 100 - (_health * 100);
    
    namestr = name(_x) + " [UID:" + getplayerUID(_x) + " - ID:" + format["%1",owner _x] + "] [Side:" + format["%1",side(_x)] + "] [Skin:" + typeOf(_x) + "] [Object:" + format["%1",_x] + "] [Health:" + format["100"] + "%] [Alive:" + format["%1",alive _x] + "] [Vehicle:" + Format["%1",typeOf(vehicle _x)] + "] [Speed:" + format["%1",round(speed (vehicle _x))] + "] [Weap:" + format["%1",currentWeapon (vehicle _x)] + "]";
    _num1 = lbAdd [PlayersMenu, namestr];
    lbSetData [PlayersMenu, _num1, str(_x)];
    
} forEach playableUnits;