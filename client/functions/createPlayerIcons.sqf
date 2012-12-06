#define icons_idc 3100

disableSerialization;

playerIcons = true;

private ["_units", "_unit", "_icon"];
_units = [];

switch(str(side player)) do {
	case "WEST": {
		_units = ["blufor1", "blufor2", "blufor3", "blufor4", "blufor5", "blufor6", "blufor7", "blufor8", "blufor9", "blufor10", "blufor11", "blufor12", "blufor13", "blufor14", "blufor15", "blufor16", "blufor17", "blufor18", "blufor19", "blufor20", "blufor21", "blufor22", "blufor23", "blufor24", "blufor25", "blufor26", "blufor27", "blufor28", "blufor29", "blufor30", "blufor31", "blufor32", "blufor33", "blufor34", "blufor35", "blufor36", "blufor37", "blufor38", "blufor39", "blufor40"];
		_icon = "\ca\ui\data\igui_side_blufor_ca.paa";
	};
	case "EAST": {
		_units = ["opfor1", "opfor2", "opfor3", "opfor4", "opfor5", "opfor6", "opfor7", "opfor8", "opfor9", "opfor10", "opfor11", "opfor12", "opfor13", "opfor14", "opfor15", "opfor16", "opfor17", "opfor18", "opfor19", "opfor20", "opfor21", "opfor22", "opfor23", "opfor24", "opfor25", "opfor26", "opfor27", "opfor28", "opfor29", "opfor30", "opfor31", "opfor32", "opfor33", "opfor34", "opfor35", "opfor36", "opfor37", "opfor38", "opfor39", "opfor40"];
		_icon = "\ca\ui\data\igui_side_opfor_ca.paa";
	};
	case "GUER": {
		_units = ["indep1", "indep2", "indep3", "indep4", "indep5", "indep6", "indep7", "indep8", "indep9", "indep10", "indep11", "indep12", "indep13", "indep14", "indep15", "indep16", "indep17", "indep18", "indep19", "indep20", "indep21", "indep22", "indep23", "indep24", "indep25", "indep26", "indep27", "indep28", "indep29", "indep30", "indep31", "indep32", "indep33", "indep34", "indep35", "indep36", "indep37", "indep38", "indep39", "indep40"];
		_icon = "\ca\ui\data\igui_side_indep_ca.paa";
	};
};

if((side player) == resistance) exitWith {};

unitsIntersect = [];
for "_i" from 0 to 40 do {unitsIntersect set [_i, true];};

_units spawn {
	while{playerIcons} do {
		for "_i" from 0 to 40 do {
			_unit = nil;
			if(_i < count _this) then {
				_unit = missionNamespace getVariable (_this select _i);
			};
			if(!isNil{_unit}) then {
				if(!isNull(_unit)) then {
					_dst = _unit distance player;
					if((_unit != player) && ((_dst) < 1000)) then {
						if(_dst < 10) then {
							unitsIntersect set [_i, false];
						} else {
							_pos1 = getPosASL player;
							_pos2 = getPosASL _unit;
							_pos1 set [2, (_pos1 select 2) + 1.5];
							_pos2 set [2, (_pos2 select 2) + 1.5];
							unitsIntersect set [_i, terrainIntersectASL [_pos1, _pos2]];
							//unitsIntersect set [_i, lineIntersects [_pos1, _pos2, player, _unit]];
						};
					};
				};
			};
		};
		sleep 1;
	};
};

5 cutrsc["PlayerIcons", "PLAIN"];

_display = uiNamespace getVariable "PlayerIcons";

_oldpos = [];

for "_i" from 0 to 40 do {
	_control = _display displayCtrl (icons_idc + _i);
	_control ctrlSetText _icon;
	_control ctrlSetFade 1;
	_control ctrlShow true;
	_control ctrlCommit 0;
	_oldpos set [_i, [0, 0]];
};

while{playerIcons} do {
	for "_i" from 0 to 40 do {
		_unit = nil;
		if(_i < count _units) then {
			_unit = missionNamespace getVariable (_units select _i);
		};
		if(isNull(_unit)) then {_unit = nil;};
		_good = false;
		if(!isNil{_unit} && !visibleMap) then {
			_dst = _unit distance player;
			//_test = format ["%1\nu:%2, a:%3, p:%4, d:%5, i:%6", _test, _unit, (alive _unit), (_unit != player), (_dst < 1000), (unitsIntersect select _i)];
                        //&& !(unitsIntersect select _i)
			if((alive _unit) && (_unit != player) && (_dst < 1000)) then {
				_pos = getPosATL _unit;
				if(surfaceIsWater (getPos _unit)) then {_pos = getPosASL _unit;};
				if((vehicle player) == (vehicle _unit)) then {_dst = 0;};
				if((vehicle _unit) != _unit) then {
					_pos set [2, (_pos select 2) + 1];
				} else {
					_pos set [2, (_pos select 2) + 2.1];
				};
				_screen = worldToScreen _pos;

				if((count _screen) > 1) then {
					_sx = _screen select 0;
					_sy = _screen select 1;
					_scale = 1 min ((1 - ((_dst) - 3) / 15) max 0.4);
					if(_dst > 100) then {_scale = 0.4;};

					_control = _display displayCtrl (icons_idc + _i);
					_control ctrlSetPosition [_sx, _sy, 0.03, 0.04];
					_control ctrlSetScale _scale;
					_control ctrlSetFade 0.0;
					_control ctrlCommit 0;
					_good = true;
					waituntil {ctrlCommitted _control};
				};
			};
		};
		if(!_good) then {
			_control = _display displayCtrl (icons_idc + _i);
			_control ctrlSetFade 1;
			_control ctrlCommit 0;
			waituntil {ctrlCommitted _control};
		};
	};
	sleep 0.01;
};

for "_i" from 0 to 40 do {
	_control = _display displayCtrl (icons_idc + _i);
	_control ctrlShow false;
	_control ctrlCommit 0;
};