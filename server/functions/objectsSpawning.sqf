//	@file Version: 1.0
//	@file Name: vehicleTestSpawn.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_rad = 20000;
_count = 0;
_cnps = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_house = nearestObjects [_cnps, ["House"], _rad];

waitUntil{vehicleSpawnComplete};

{
    if((typeOf _x) in blacklist) then {} else
    {
        _pos = getPos _x;
	    _secondRad = 200;
	    _objects = nearestObjects [_pos, ["Land_Barrel_water",
					"Land_stand_small_EP1",
					"Base_WarfareBBarrier10xTall",
					"Base_WarfareBBarrier10x",
					"Base_WarfareBBarrier5x",
					"Land_Misc_deerstand",
					"Fort_Barricade",
					"Concrete_Wall_EP1",
					"Land_fort_bagfence_round",
					"Land_fortified_nest_small_EP1",
					"Land_Misc_deerstand",
					"Land_fort_bagfence_long",
					"Land_HBarrier_large",
					"Land_Misc_Scaffolding",
					"Barrels",
					"Land_fort_artillery_nest_EP1",
					"Land_fort_rampart_EP1",
					"Land_Fort_Watchtower_EP1",
					"DSHKM_TK_INS_EP1",
					"Land_fortified_nest_big",
					"M2StaticMG_US_EP1",
					"RampConcrete",
					"WarfareBDepot",
					"WarfareBCamp",
					"Land_ConcreteBlock"], _secondRad];
	    
	    //Check to see if there are not to many cars in area.
	    if((count _objects) <= 15) then
	    { 
	        _thirdRad = 75;
	    	_objects = nearestObjects [_pos, ["Land_Barrel_water",
					"Land_stand_small_EP1",
					"Base_WarfareBBarrier10xTall",
					"Base_WarfareBBarrier10x",
					"Base_WarfareBBarrier5x",
					"Land_Misc_deerstand",
					"Fort_Barricade",
					"Concrete_Wall_EP1",
					"Land_fort_bagfence_round",
					"Land_fortified_nest_small_EP1",
					"Land_Misc_deerstand",
					"Land_fort_bagfence_long",
					"Land_HBarrier_large",
					"Land_Misc_Scaffolding",
					"Barrels",
					"Land_fort_artillery_nest_EP1",
					"Land_fort_rampart_EP1",
					"Land_Fort_Watchtower_EP1",
					"DSHKM_TK_INS_EP1",
					"Land_fortified_nest_big",
					"M2StaticMG_US_EP1",
					"RampConcrete",
					"WarfareBDepot",
					"WarfareBCamp",
					"Land_ConcreteBlock"], _thirdRad];
	        
	        //Check that there isn't a car right next to it.
	        if((count _objects == 0)) then 
	        {
	            //_hint = "Objects Spawning";
	            //[nil,nil,rHINT,_hint] call RE;
				[_pos] call objectCreation;
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
    };
}forEach _house;

_hint = format["%1 Objects Spawned",_count];
diag_log format["WASTELAND SERVER - %1 Objects Spawned",_count];

objectSpawnComplete = true;

