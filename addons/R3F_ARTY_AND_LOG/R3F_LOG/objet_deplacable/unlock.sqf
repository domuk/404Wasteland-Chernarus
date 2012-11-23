/*
By Sa-Matra

Don't use my code without asking first
*/

if(R3F_LOG_mutex_local_verrou) exitWith {
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
};

client_actionInterrupt = false;
R3F_LOG_mutex_local_verrou = true;

_locking = true;
_failed = false;
_loops_trgt = 30 * 10;
_loops = 0;
_object = _this select 0;

while {_locking} do {
	if(_loops >= _loops_trgt) then {
		_locking = false;
	};
	if(client_actionInterrupt || isNull(_object) || (player distance _object > 50)) exitWith {
		R3F_LOG_mutex_local_verrou = false;

		cutText ["", "PLAIN DOWN", 0];
		player globalChat "Unlocking cancelled!";

		_failed = true;
	};

	if((_loops % 10) == 0) then {
		cutText [format["Unlocking object... (%1)", ceil((_loops_trgt - _loops) / 10)], "PLAIN DOWN", 1];
	};

	_loops = _loops + 1;
	player playActionNow "Medic";

	sleep 0.1;
};

if(!_failed) then {
	(_this select 0) setVariable ["R3F_Locked", false, true];

	R3F_LOG_mutex_local_verrou = false;

	cutText ["", "PLAIN DOWN", 0];
	player globalChat "Object unlocked!";
};

[objNull, player, rSwitchMove, ""] call RE;
player playActionNow "stop";

[objNull, player, rSwitchMove, "AinvPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon"] call RE;
//[objNull, player, rSwitchMove, "AinvPknlMstpSnonWnonDnon_AmovPknlMstpSrasWpstDnon"] call RE;