//	@file Version: 1.0
//	@file Name: onKilled.sqf
//	@file Author: [404] Deadbeat, [404] costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

private["_dialog","_magazineArray","_control","_item","_val","_max"];

if (isnil {_player getVariable "cmoney"}) then {
	_player setVariable["cmoney",0,true];
};

_player = (_this select 0) select 0;
_killer = (_this select 0) select 1;
_playerMoney = _player getVariable["cmoney",0];
_currencyLimit = 10 * 1000;

_playerPos = getPosATL _player;
_playerPos = [_playerPos select 0, _playerPos select 1, 0];
_playerDir = getDir _player;

// Close any active dialogs.
closeDialog 0;

PlayerCDeath = [_player, _killer];
publicVariable "PlayerCDeath";
if (isServer) then {
	_id = PlayerCDeath spawn serverPlayerDied; 
};

if(!local _player) exitwith {};

// Don't know what smack whoever was on when they wrote THIS shit...
if((_player != _killer) && (vehicle _player != vehicle _killer) && (playerSide == side _killer) && (str(playerSide) in ["WEST", "EAST"])) then {
	pvar_PlayerTeamKiller = objNull;
	if(_killer isKindOf "CAManBase") then {
		pvar_PlayerTeamKiller = _killer;
	} else {
		_veh = (_killer);
		_trts = configFile >> "CfgVehicles" >> typeof _veh >> "turrets";
		_paths = [[-1]];
		if (count _trts > 0) then {
			for "_i" from 0 to (count _trts - 1) do {
				_trt = _trts select _i;
				_trts2 = _trt >> "turrets";
				_paths = _paths + [[_i]];
				for "_j" from 0 to (count _trts2 - 1) do {
					_trt2 = _trts2 select _j;
					_paths = _paths + [[_i, _j]];
				};
			};
		};
		_ignore = ["SmokeLauncher", "FlareLauncher", "CMFlareLauncher", "CarHorn", "BikeHorn", "TruckHorn", "TruckHorn2", "SportCarHorn", "MiniCarHorn", "Laserdesignator_mounted"];
		_suspects = [];
		{
			_weps = (_veh weaponsTurret _x) - _ignore;
			if(count _weps > 0) then {
				_unt = objNull;
				if(_x select 0 == -1) then {_unt = driver _veh;}
				else {_unt = _veh turretUnit _x;};
				if(!isNull _unt) then {
					_suspects = _suspects + [_unt];
				};
			};
		} forEach _paths;

		if(count _suspects == 1) then {
			pvar_PlayerTeamKiller = _suspects select 0;
		};
	};
};

if(!isNull(pvar_PlayerTeamKiller)) then {
	publicVar_teamkillMessage = pvar_PlayerTeamKiller;
	publicVariable "publicVar_teamkillMessage";
};

// Check if the player is allowed to drop items yet.
if (player getVariable "canDrop") then {

	if(_playerMoney > 0) then {
		_newObject = "EvMoney" createVehicle (position _player);
		_newObject setVariable ["owner", "world", true];
	    
	    if (_playerMoney <= _currencyLimit) then {
	    	_newObject setVariable["money", _playerMoney, true];
	    } else {
	    	_newObject setVariable["money", _currencyLimit, true];
	    };
	};
	
	if((_player getVariable "medkits") > 0) then {
		for "_i" from 1 to (_player getVariable "medkits") do {	
			_newObject = "CZ_VestPouch_EP1" createVehicle (position _player);
		};
	};
	
	if((_player getVariable "repairkits") > 0) then {
		for "_i" from 1 to (_player getVariable "repairkits") do {	
			_newObject = "Suitcase" createVehicle (position _player);
		};
	};
};

createGearDialog [_player, "RscDisplayGear"];
_dialog = findDisplay 106;
closeDialog 106;
_magazineArray = [];

//Primary Mags
for "_i" from 109 to 120 do 
{
	_control = _dialog displayCtrl _i;
	_item = gearSlotData _control;
	_val = gearSlotAmmoCount _control;
	_max = getNumber (configFile >> "CfgMagazines" >> _item >> "count");
	if (_item != "") then {
		if (_val != _max) then {
			_magazineArray set [count _magazineArray,[_item,_val]];
		} else {
			_magazineArray set [count _magazineArray,[_item,_val]];
		};
	};
};

//Secondary Mags
for "_i" from 122 to 129 do 
{
	_control = _dialog displayCtrl _i;
	_item = gearSlotData _control;
	_val = gearSlotAmmoCount _control;
	_max = getNumber (configFile >> "CfgMagazines" >> _item >> "count");
	if (_item != "") then {
		if (_val != _max) then {
			_magazineArray set [count _magazineArray,[_item,_val]];
		} else {
			_magazineArray set [count _magazineArray,[_item,_val]];
		};
	};
};

// Now that all of the details about the player's weapons and amgs have been recorded, strip them from the dead body.
// This is to stop people looting the dead body before it disappears and duplicating weapons.
_playerWeapons = weapons _player;
removeAllWeapons _player;

// hide the body asap.
hideBody _player;

// Create the tombstone objects.
_graveBase = createVehicle ["Grave", _playerPos, [], 0, "NO_COLLIDE"];
_graveBase setPosATL _playerPos; // setPos again because arma.
_graveBase setDir _playerDir;

// Disable damage for tombstones.
_graveBase addEventHandler["handledamage", { false }];

// Disable physics for the tombstone on all clients.      
_announce = [nil,_graveBase,"per",rENABLESIMULATION,false] call RE;

// Create a loot container inside the grave.
_tempContainer = createVehicle ["weaponHolder", getPosATL _graveBase, [], 0, "can_collide"];
_containerLoc = getPosATL _tempContainer;
_containerLoc = [((_containerLoc select 0) + 0),((_containerLoc select 1) + 0),0];    
_tempContainer setPosATL _containerLoc;   

// Make sure people can't move the objects around.
_tempContainer setVariable ["R3F_LOG_disabled", true, true];
_graveBase setVariable ["R3F_LOG_disabled", true, true];

// Add the weapons that were on the player to the new weapon container.
{
    _tempContainer addWeaponCargoGlobal [_x,1]; 
} forEach _playerWeapons;

// Add the magazines that were on the player to the new weapon container.
{
	_currMagazine = _x select 0;
	_currMagAmmoCount = _x select 1;
    
    // TODO: Figure out how to use this once the magazine is inside the cargo container...
    _currMagCapacity = (getNumber(configFile >> "CfgMagazines" >> _currMagazine >> "count"));
    _newAmmoAmount = _currMagAmmoCount / _currMagCapacity;

    _tempContainer addMagazineCargoGlobal [_currMagazine,1];
} forEach _magazineArray;

// Create the thread to blackout the user's screen when the respawn timer is low.
true spawn {
	waitUntil {playerRespawnTime < 2};
	titleText ["", "BLACK OUT", 1];
};

// Grave cleanup after 15 minutes. This is to stop the spam of these across the map.
[_graveBase, _tempContainer] spawn {
	sleep 900; // 15 minutes.
    
    // Prenthesis are VERY important here, otherwise it attempts to delete the whole _this array.
    deleteVehicle (_this select 0);
    deleteVehicle (_this select 1);
};
