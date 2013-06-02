//	@file Version: 1.0
//	@file Name: loadSellConfirm.sqf
//	@file Author: [404] Costlyy
//	@file Created: 13th May 2013
//	@file Args: [current weapon (obj), total value (int)]

#include "dialog\gunstoreDefines.sqf";
disableSerialization;

createDialog "ConfirmSellDialog";
_dialog = findDisplay confirmSell;
_dialogWeapon = _dialog displayCtrl confirmSellWeapon;
_dialogValue = _dialog displayCtrl confirmSellValue;

_currWeapon = _this select 0;
_currValue = _this select 1;

_tempPrice = ("$" + str(_currValue));

_dialogWeapon ctrlSetText str(_currWeapon);
_dialogValue ctrlSetText _tempPrice;
