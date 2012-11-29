//	@file Version: 1.0
//	@file Name: createTownMarkers.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 28/11/2012 05:19
//	@file Args:

_arr = configFile >> "CfgWorlds" >> worldName >> "Names";
for "_i" from 0 to (count _arr)-1 do {
	_loc = (_arr select _i);
    if((getText(_loc >> "type") == "CityCenter")) then {
    	{
        	if((configName(_loc)) == (_x select 0)) then
            {
                if((configName(_loc)) == "ACityC_Berezino") then {
                    _pos = getArray(_loc >> "position");
                    _pos set [0, (_pos select 0) - 450];
					_pos set [1, (_pos select 1) - 475];
                        
                	_markerName = format["marker%1",_forEachIndex];
					_marker = createMarkerLocal [_markerName, _pos];
					_marker setMarkerShapeLocal "ELLIPSE";
					_marker setMarkerSizeLocal [_x select 1, _x select 1];
					_marker setMarkerColorLocal "ColorBlack";
				    _marker setMarkerBrushLocal "SolidBorder";
					_marker setMarkerAlphaLocal 0.3;      
                } else {
                	_markerName = format["marker%1",_forEachIndex];
					_marker = createMarkerLocal [_markerName, getArray(_loc >> "position")];
					_marker setMarkerShapeLocal "ELLIPSE";
					_marker setMarkerSizeLocal [_x select 1, _x select 1];
					_marker setMarkerColorLocal "ColorBlack";
				    _marker setMarkerBrushLocal "SolidBorder";
					_marker setMarkerAlphaLocal 0.3;    
                };	            
            };    
		}forEach cityList;
	};   
};