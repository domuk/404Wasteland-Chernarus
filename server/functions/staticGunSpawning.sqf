//	@file Version: 1.0
//	@file Name: vehicleTestSpawn.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_rad = 20000;
_count = 0;
_cnps = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_house = nearestObjects [_cnps, ["House"], _rad];

waitUntil{ammoCrateSpawnComplete};

{
    if((typeOf _x) in blacklist) then {} else
    {
        _pos = getPos _x;
	    _secondRad = 1500;
	   	_objects = nearestObjects [_pos, ["M2StaticMG_US_EP1",
					"DSHKM_TK_INS_EP1"], _secondRad];
	        
	    //Check that there isn't a car right next to it.
	    if((count _objects == 0)) then 
	    {
	    	//_hint = "Objects Spawning";
	        //[nil,nil,rHINT,_hint] call RE;
			[_pos] call staticGunCreation;
	        _count = _count + 1;
            
            /*    
            _markerName = format["marker%1",_forEachIndex];
			_marker = createMarker [_markerName, _pos];
			_marker setMarkerType "mil_destroy";
			_marker setMarkerSize [1.25, 1.25];
			_marker setMarkerText "Object";
			_marker setMarkerColor "ColorRed";   
            */ 
		};   
    };
}forEach _house;

diag_log format["WASTELAND SERVER - %1 Static Guns Spawned",_count];

_hint = "Spawning Complete";
[nil,nil,rHINT,_hint] call RE;

staticGunSpawningComplete = true;