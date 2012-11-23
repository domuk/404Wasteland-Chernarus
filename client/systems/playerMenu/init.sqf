#include "dialog\player_sys.sqf"; 
if(isnil {player getVariable "cmoney"}) then {player setVariable["cmoney",0,true];};
if(isNil {RogueVar}) then {RogueVar = false;};
if(dialog) exitwith{};
_playerDialog = createDialog "playerSettings";
disableSerialization;

private["_Dialog","_foodtext","_watertext","_moneytext","_mvalue","_rogue"];

_Dialog = findDisplay playersys_DIALOG;
_foodtext = _Dialog displayCtrl food_text;
_watertext = _Dialog displayCtrl water_text;
_moneytext = _Dialog displayCtrl money_text;
_mvalue = _Dialog displayCtrl money_value;
_rogue = _Dialog displayCtrl rogue_text;
_uptime = _Dialog displayCtrl uptime_text;
_foodtext ctrlSettext format["%1 / 100", round(hungerLevel)];
_watertext ctrlSetText format["%1 / 100", round(thirstLevel)];
_moneytext ctrlSetText format["%1", player getVariable "cmoney"];

_mIndex = _mvalue lbadd "$5"; _mvalue lbSetData [(lbSize _mvalue)-1, "5"];
_mIndex = _mvalue lbadd "$15"; _mvalue lbSetData [(lbSize _mvalue)-1, "15"];
_mIndex = _mvalue lbadd "$20"; _mvalue lbSetData [(lbSize _mvalue)-1, "20"];
_mIndex = _mvalue lbadd "$50"; _mvalue lbSetData [(lbSize _mvalue)-1, "50"];
_mIndex = _mvalue lbadd "$75"; _mvalue lbSetData [(lbSize _mvalue)-1, "75"];
_mIndex = _mvalue lbadd "$100"; _mvalue lbSetData [(lbSize _mvalue)-1, "100"];
_mIndex = _mvalue lbadd "$200"; _mvalue lbSetData [(lbSize _mvalue)-1, "200"];
_mIndex = _mvalue lbadd "$300"; _mvalue lbSetData [(lbSize _mvalue)-1, "300"];
_mIndex = _mvalue lbadd "$400"; _mvalue lbSetData [(lbSize _mvalue)-1, "400"];
_mIndex = _mvalue lbadd "$500"; _mvalue lbSetData [(lbSize _mvalue)-1, "500"];
_mIndex = _mvalue lbadd "$1000"; _mvalue lbSetData [(lbSize _mvalue)-1, "1000"];
_mIndex = _mvalue lbadd "$2000"; _mvalue lbSetData [(lbSize _mvalue)-1, "2000"];
_mIndex = _mvalue lbadd "$3000"; _mvalue lbSetData [(lbSize _mvalue)-1, "3000"];
_mIndex = _mvalue lbadd "$4000"; _mvalue lbSetData [(lbSize _mvalue)-1, "4000"];
_mIndex = _mvalue lbadd "$5000"; _mvalue lbSetData [(lbSize _mvalue)-1, "5000"];

true spawn {
	disableSerialization;
	_Dialog = findDisplay playersys_DIALOG;
	_uptime = _Dialog displayCtrl uptime_text;

	private ["_t", "_h", "_m", "_s", "_ms", "_ss", "_str"];

	while{dialog} do {
		_t = serverTime - publicVar_serverStartTime;
		_h = floor(_t / 3600);
		_m = floor((_t % 3600) / 60);
		_s = floor(_t % 60);
		if(_s < 10) then {_ss = format["0%1", _s]} else {_ss = _s};
		if(_m < 10) then {_ms = format["0%1", _m]} else {_ms = _m};
		_str = "";
		if(_h > 0) then {_str = format["%1:%2:%3", _h, _ms, _ss];} else {_str = format["%1:%2", _ms, _ss];};

		_uptime ctrlSetText format [localize "STR_WL_Dlg_PlayerMenuServerTime", _str];

		sleep 0.1;
	};
};