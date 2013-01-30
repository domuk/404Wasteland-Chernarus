//	@file Version: 1.0
//	@file Name: createGunStoreMarkers.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 28/11/2012 05:19
//	@file Args:

_radius = 200;
_status = [];
_gunStores = ["gs1", "gs2", "gs3", "gs4"];
_col_empty = "ColorBlue";
_col_enemy = "ColorRed";
_col_friendly = "ColorGreen";
_col_mixed = "ColorOrange";

//Creates the markers around general stores.
waitUntil {{!isNull(missionNamespace getVariable _x) && ((getPos(missionNamespace getVariable _x) distance [0,0,0]) > 100)} count _gunStores == count _gunStores};
{
	_unit = missionNamespace getVariable _x;

	// Circle zone   
    _markerName = format["marker_shop_zone_%1",_x];
    deleteMarkerLocal _markerName;
	_marker = createMarkerLocal [_markerName, getPos _unit];
	_markerName setMarkerShapeLocal "ELLIPSE";
    _markerName setMarkerColorLocal _col_empty;
	_markerName setMarkerSizeLocal [_radius, _radius];
	_markerName setMarkerBrushLocal "Grid";
	_markerName setMarkerAlphaLocal 0.5;

	// Gun store title    
    _markerName = format["marker_shop_title_%1",_x];
    deleteMarkerLocal _markerName;
	_marker = createMarkerLocal [_markerName, getPos _unit];
	_markerName setMarkerShapeLocal "ICON";
    _markerName setMarkerTypeLocal "Dot";
    _markerName setMarkerColorLocal "ColorRed";
	_markerName setMarkerSizeLocal [0.8,0.8];
	_markerName setMarkerTextLocal "Gun Store";

	// Gun store description    
    _markerName = format["marker_shop_desc_%1",_x];
    deleteMarkerLocal _markerName;
    _pos = getPos _unit; _pos set [1, (_pos select 1) - 100];
	_marker = createMarkerLocal [_markerName, _pos];
	_markerName setMarkerShapeLocal "ICON";
    _markerName setMarkerTypeLocal "mil_dot";
    _markerName setMarkerColorLocal _col_empty;
	_markerName setMarkerSizeLocal [0.8,0.8];
	_markerName setMarkerTextLocal "Gun Store is Empty";
    _markerName setMarkerAlphaLocal 0.5;

	_status set [count _status, "EMPTY"];
} forEach _gunStores;

//Used to set the status of each store.
_setStatus = {
	if(_status select (_this select 0) == (_this select 1)) exitWith {};

	_markerNameZone = format ["marker_shop_zone_%1", _gunStores select (_this select 0)];
	_markerNameDescription = format ["marker_shop_desc_%1", _gunStores select (_this select 0)];
	switch(_this select 1) do {
		case "EMPTY": {
			_markerNameZone setmarkerColorLocal _col_empty;
			_markerNameDescription setmarkerColorLocal _col_empty;
			_markerNameDescription setMarkerTextLocal "Gun Store is Empty";
		};
		case "ENEMY": {
			_markerNameZone setmarkerColorLocal _col_enemy;
			_markerNameDescription setmarkerColorLocal _col_enemy;
			_markerNameDescription setMarkerTextLocal "Gun Store has Enemy Players";
		};
		case "FRIENDLY": {
			_markerNameZone setmarkerColorLocal _col_friendly;
			_markerNameDescription setmarkerColorLocal _col_friendly;
			_markerNameDescription setMarkerTextLocal "Gun Store has Friendly Players";
		};
		case "MIXED": {
			_markerNameZone setmarkerColorLocal _col_mixed;
			_markerNameDescription setmarkerColorLocal _col_mixed;
			_markerNameDescription setMarkerTextLocal "Gun Store has Enemy and Friendly Players";
		};
	};

	if((_this select 2) && ((_this select 1) in ["ENEMY", "MIXED"])) then {
		hintSilent parseText format ["<t size='2' color='#ff0000'>%1</t><br/><br/>%2.","Warning!","Enemy player just entered the area"];
	};

	_status set [_this select 0, _this select 1];
};

//Check each store to see if their state has changed and then calls the update function to make the display the correct state.
showmarkers = true;
while {showmarkers} do {
    {
    	_unit = missionNamespace getVariable (_gunStores select _forEachIndex);
		_friendlyCount = 0;
		_enemyCount = 0;
		{
			if((_x distance _unit < _radius) && (player != _x)) then {
				if(playerSide in [west,east] && playerSide == side _x) then {
					_friendlyCount = _friendlyCount + 1;
				} else {
					_enemyCount = _enemyCount + 1;
				};
			};
		} forEach playableUnits;

		if(player distance _unit < _radius) then {
			if(_enemyCount > 0) then {
				if(_friendlyCount > 0) then {
					[_forEachIndex, "MIXED", true] call _setStatus;
				} else {
					[_forEachIndex, "ENEMY", true] call _setStatus;
				};
			} else {
				[_forEachIndex, "FRIENDLY", true] call _setStatus;
			};
		} else {
			if(_enemyCount > 0) then {
				if(_friendlyCount > 0) then {
					[_forEachIndex, "MIXED", false] call _setStatus;
				} else {
					[_forEachIndex, "ENEMY", false] call _setStatus;
				};
			} else {
				if(_friendlyCount > 0) then {
					[_forEachIndex, "FRIENDLY", false] call _setStatus;
				} else {
					[_forEachIndex, "EMPTY", false] call _setStatus;
				};
			};
		};    
    }forEach _gunStores;
	sleep 1;
};
