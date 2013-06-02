//	@file Version: 1.0
//	@file Name: onMouseWheel.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13
//	@file Args:

terminate playerMenuHandle;

playerMenuHandle = [] spawn {
	waituntil {!isnull player};
	private ["_veh"];
	while { true } do {
    
		waituntil {vehicle player == player};
		if (!isnil "_veh") then {_veh removeaction playerMenuId};
		playerMenuId = player addAction [format ["<t color='#BE6300'>%1</t>", "Player Menu"], "client\systems\playerMenu\init.sqf",[],-10,false,true,"","local player"];
        
		waituntil {vehicle player != player};
		player removeaction playerMenuId;
		_veh = vehicle player;
		playerMenuId = _veh addAction [format ["<t color='#BE6300'>%1</t>", "Player Menu"], "client\systems\playerMenu\init.sqf",[],-10,false,true,"","local player"];
	};
};