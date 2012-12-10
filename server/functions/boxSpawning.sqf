//	@file Version: 1.0
//	@file Name: boxSpawning.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_rad = 20000;
_count = 0;
_boxes = ["USBasicWeaponsBox","RUBasicWeaponsBox","GERBasicWeapons_EP1","USBasicWeapons_EP1","TKBasicWeapons_EP1","SpecialWeaponsBox","Ammobox_PMC"];
_cnps = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_capital = nearestLocations [_cnps, ["NameCityCapital"], _rad];
_cities = nearestLocations [_cnps, ["NameCity"], _rad];
_towns = nearestLocations [_cnps, ["NameVillage"], _rad];
_locations = _capital + _cities;
_locations = _locations + _towns;

waitUntil{objectSpawnComplete};

{
    _pos = getpos _x;
     _secondRad = 2000;
	 _objects = nearestObjects [_pos, ["USBasicWeaponsBox",
								     "RUBasicWeaponsBox",
								     "GERBasicWeapons_EP1",
								     "USBasicWeapons_EP1",
								     "TKBasicWeapons_EP1",
								     "SpecialWeaponsBox",
								     "Ammobox_PMC"], _secondRad];
	        
	//Check that there isn't a car right next to it.
	if((count _objects == 0)) then 
	{
		_box = _boxes select (random (count _boxes - 1));
	    _box = createVehicle [_box, _pos,[], 30, "NONE"];
		_box setpos [getpos _box select 0,getpos _box select 1,0];
		_count = _count + 1; 
		
        /*	    
		_markerpos = getpos _box;
		_markerName = format["marker%1",_forEachIndex];
		_marker = createMarker [_markerName, _markerpos];
		_marker setMarkerType "mil_destroy";
		_marker setMarkerSize [1.25, 1.25];
		_marker setMarkerText "Ammo Box";
		_marker setMarkerColor "ColorRed";    
        */
	};   
}forEach _locations;

diag_log format["WASTELAND SERVER - %1 Ammo Caches Spawned",_count];

ammoCrateSpawnComplete = true;