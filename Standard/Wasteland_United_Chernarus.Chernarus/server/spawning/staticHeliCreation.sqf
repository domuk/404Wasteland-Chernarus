//	@file Version: 1.0
//	@file Name: staticHeliCreation.sqf
//	@file Author: [404] Costlyy
//	@file Created: 20/12/2012 21:00
//	@file Description: Random static helis
//	@file Args: [int (0 = not wreck | 1 = wreck), array (position)]

if(!X_Server) exitWith {};

private["_spawnPos", "_spawnType", "_currHeli"];

_isWreck = _this select 0;
_spawnPos = _this select 1;
_nerfBoxes = ["basicUS","basicUS2","basicRU","basicRU2","basicGER","basicPMC","basicSpecial","basicSpecial2","basicSpecial3"];

if (_isWreck == 0) then {
	//diag_log "Spawning heli complete...";
	_spawnType = staticHeliList select (random (count staticHeliList - 1));
	_currHeli = createVehicle [_spawnType,_spawnPos,[], 50,"None"]; 
	
	_currHeli setpos [getpos _currHeli select 0,getpos _currHeli select 1,0];
	_currHeliLocation = getPosATL _currHeli;
    
	clearMagazineCargoGlobal _currHeli;
	clearWeaponCargoGlobal _currHeli;
	
	//Set original status to stop ner-do-wells
	_currHeli setVariable["newVehicle",1,true];
} else {
	//diag_log "Spawning heli wreck...";staticHeliWrecks
	_spawnType = staticHeliWrecks select (random (count staticHeliWrecks - 1));
	_currHeli = createVehicle [_spawnType,_spawnPos,[], 50,"None"]; 
	
	_currHeli setpos [getpos _currHeli select 0,getpos _currHeli select 1,0];
    _currHeliLocation = getPosATL _currHeli;
    
	clearMagazineCargoGlobal _currHeli;
	clearWeaponCargoGlobal _currHeli;
    
    // Spawn a weapon crate.
	_currBox = _nerfBoxes select (random (count _nerfBoxes - 1));
	_safePos = [_currHeliLocation, 2, 8, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
	[_currBox, _safePos] execVM "server\spawning\boxCreation.sqf";   
    
    // Stop the heli wreck from being destroyed.
    _currHeli addEventHandler["handleDamage", { false } ];
    _currHeli setVehicleAmmo (random 0.3);
 
	//Set original status to stop ner-do-wells
	_currHeli setVariable["newVehicle",1,true];
    _currHeli setVariable["R3F_LOG_disabled", true, true];  
};