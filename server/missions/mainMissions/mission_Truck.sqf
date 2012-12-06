//Refuel Truck Mission
if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
private ["_rad","_cnps","_hills","_hillcount","_hillnum","_hill","_marker","_boxes","_numb","_boxnum","_box","_picture","_name","_text","_color","_tempPlayer"];

_rad=20000;
_result = 0;
_missionTimeOut = 30;
_missionDelayTime = 5;
_missionTriggerRadius = 100;
_missionPlayerRadius = 50;
_color = "#C5C5C5";
_cnps = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_hills = nearestLocations [_cnps, ["FlatArea"], _rad];
_hillcount = count _hills;
_hillnum = floor (random _hillcount);
_hill = _hills select _hillnum;
_hillpos = getpos _hill;
PlayerPresent = 0;

_text6 = parseText format ["<t align='center' color='#0362f3' shadow='1' shadowColor='#000000' size='1.5'>Side Objective</t>
							<t color='#FFCC33'>Starting in %1 Minutes</t>", _missionDelayTime];
[nil,nil,rHINT,_text6] call RE; 

diag_log format["WASTELAND SERVER - Mission Waiting to run"];
_startTime = currentTime;
waitUntil
{ 
    _currTime = currentTime;
    _result = [_currTime, _startTime, _missionDelayTime] call compareTime;
    (_result == 1)
};
diag_log format["WASTELAND SERVER - Mission Resumed"];
_startTime = currentTime;

_marker = createMarker ["Ammo_Marker", _hillpos ];
"Ammo_Marker" setMarkerType "mil_destroy";
"Ammo_Marker" setMarkerSize [1.25, 1.25];
"Ammo_Marker" setMarkerText "Abandoned Logistics Truck";
"Ammo_Marker" setMarkerColor "ColorRed";

_veh = ["MtvrRefuel","MtvrReammo","MtvrRepair"] call BIS_fnc_selectRandom;

mtvrfuel = createVehicle [_veh,[(getpos _hill select 0), getpos _hill select 1,0],[], 0, "NONE"];

if(isnull mtvrfuel) exitwith 
{
    deleteMarker _marker;
    [1] execVM format ["server\core\missions\mainmission_selector.sqf",_element];
};

_color = "#C5C5C5";
_name = getText (configFile >> "cfgVehicles" >> typeOf mtvrfuel >> "displayName");
_picture = getText (configFile >> "cfgVehicles" >> typeOf mtvrfuel >> "picture");

_text = parseText format ["<t align='center' color='#0362f3' shadow='1' shadowColor='#000000' size='1.5'>Side Objective</t><br/><t align='center' color='#FFCC33'>------------------------------</t><br/><br/><t align='center' color='#666c3f' shadow='1' shadowColor='#000000'><t color='%3'><img size='4' image='%2'/></t><br/><br/><t align='center' color='#ffcc33' shadow='1' shadowColor='#000000'>This <t color='#FFCC33'>%1</t>, is your OBJECTIVE!</t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Get to it first!</t>",   _name, _picture, _color];
[nil,nil,rHINT,_text] call RE; 

_trgw=createTrigger["EmptyDetector", _hillpos]; 
_trgw setTriggerArea[_missionPlayerRadius,_missionPlayerRadius,0,false];
_trgw setTriggerActivation["WEST","PRESENT",true];
_trgw setTriggerStatements["this", "PlayerPresent = 1", "PlayerPresent = 0"];

_trge=createTrigger["EmptyDetector", _hillpos]; 
_trge setTriggerArea[_missionPlayerRadius,_missionPlayerRadius,0,false];
_trge setTriggerActivation["EAST","PRESENT",true];
_trge setTriggerStatements["this", "PlayerPresent = 1", "PlayerPresent = 0"];

_trgr=createTrigger["EmptyDetector", _hillpos]; 
_trgr setTriggerArea[_missionPlayerRadius,_missionPlayerRadius,0,false];
_trgr setTriggerActivation["GUER","PRESENT",true];
_trgr setTriggerStatements["this", "PlayerPresent = 1", "PlayerPresent = 0"]; 

diag_log format["WASTELAND SERVER - Mission Waiting to be Finished"];
waitUntil
{ 
    _currTime = currentTime;
   	_result = [_currTime, _startTime, _missionTimeOut] call compareTime;
    (_result == 1) or (PlayerPresent == 1) or getpos mtvrfuel distance getMarkerPos _marker > _missionTriggerRadius
};

if(_result == 1) then
{
    mtvrfuel setDamage 1;
    _text2 = parseText format ["<t align='center' color='#FF0000' shadow='1' shadowColor='#000000' size='1.5'>Side Objective Failed</t><br/><t align='center' color='#FFCC33'>------------------------------</t><br/><br/><t align='center' color='#666c3f' shadow='1' shadowColor='#000000'><t color='%3'><img size='4' image='%2'/></t><br/><br/><t align='center' color='#ffcc33' shadow='1' shadowColor='#000000'>No players captured the <t color='#FFCC33'>%1</t>. It was destroyed by the enemy.</t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Try harder next time.</t>",   _name, _picture, _color ];
    [nil,nil,rHINT,_text2] call RE;
    diag_log format["WASTELAND SERVER - Mission Failed"];
} else
{
    _text2 = parseText format ["<t align='center' color='#00D60E' shadow='1' shadowColor='#000000' size='1.5'>Side Objective Complete</t><br/><t align='center' color='#FFCC33'>------------------------------</t><br/><br/><t align='center' color='#666c3f' shadow='1' shadowColor='#000000'><t color='%3'><img size='4' image='%2'/></t><br/><br/><t align='center' color='#ffcc33' shadow='1' shadowColor='#000000'>Capture the <t color='#FFCC33'>%1</t>, has been completed!</t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Now Help Your Team</t>",   _name, _picture, _color];
    [nil,nil,rHINT,_text2] call RE;
    diag_log format["WASTELAND SERVER - Mission Finished"];
};
		
deleteMarker _marker;
MissionRunning = false;