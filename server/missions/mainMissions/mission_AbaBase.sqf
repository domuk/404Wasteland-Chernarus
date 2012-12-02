//Abandoned Base
if(!isServer) exitwith {};
sleep 10;
diag_log format["WASTELAND SERVER - Mission Started"];
// <editor-fold desc="Variables">
private ["_rad","_cnps","_hills","_hillcount","_hillnum","_hill","_marker","_boxes","_numb","_boxnum","_box","_picture","_name","_text","_color","_tempPlayer"];

_rad=20000;
_missionTimeOut = 1200;
_missionDelayTime = 1;
_missionTriggerRadius = 100;
_missionPlayerRadius = 50;
_temptime = 0;
_color = "#C5C5C5";
_cnps = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_hills = nearestLocations [_cnps, ["FlatArea"], _rad];
_hillcount = count _hills;
_hillnum = floor (random _hillcount);
_hill = _hills select _hillnum;
_hillpos = getpos _hill;
PlayerPresent = 0;
// </editor-fold>

_text6 = parseText format ["<t align='center' color='#0362f3' shadow='1' shadowColor='#000000' size='1.5'>Main Objective</t>
							<t color='#FFCC33'>Starting in 10 Minutes</t>"];
[nil,nil,rHINT,_text6] call RE; 
_time = floor serverTime;
diag_log format["WASTELAND SERVER - Mission Waiting to run"];
waitUntil
{ 
    _temptime = serverTime - _time;
    (_temptime >= _missionDelayTime)
};
diag_log format["WASTELAND SERVER - Mission Resumed"];
_time = floor serverTime;

_marker = createMarker ["MBT_Marker", _hillpos ];
"MBT_Marker" setMarkerType "mil_destroy";
"MBT_Marker" setMarkerSize [1.25, 1.25];
"MBT_Marker" setMarkerText "Capture Base";
"MBT_Marker" setMarkerColor "ColorRed";


_base = ["Camp3_US","WeaponsStore1_US","AntiAir1_RU","WeaponsStore1_RU","Camp2_INS","Camp1_INS","VehicleParking1_RU","VehicleParking1_US","CheckPoint1_US","CheckPoint1_RU","RadarSite1_RU","RadarSite1_US","FuelDepot_US","FuelDepot_RU","MediumTentCamp_RU","MediumTentCamp2_RU","Camp2_US","Firebase1_US","Firebase1_RU"] call BIS_fnc_selectRandom;
null= ["test_comp", 0, getpos _hill] execVM "Compositions\CreateComposition.sqf";

_text7 = parseText format ["<t align='center' color='#0362f3' shadow='1' shadowColor='#000000' size='1.5'>Main Objective</t><br/><t align='center' color='#FFCC33'>------------------------------</t><br/><br/><t align='center' color='#ffcc33' shadow='1' shadowColor='#000000'>An <t color='#FFCC33'>abandoned base</t>, is your OBJECTIVE!</t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Get to it first!</t>"];
[nil,nil,rHINT,_text7] call RE; 

// <editor-fold desc="Triggers">
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
// </editor-fold>

diag_log format["WASTELAND SERVER - Mission Waiting to be Finished"];
waitUntil
{ 
    _temptime = serverTime - _time;
    (_temptime >= _missionTimeOut) or (PlayerPresent == 1)
};

if(_temptime >= _missionTimeOut) then
{
    _text2 = parseText format ["<t align='center' color='#FF0000' shadow='1' shadowColor='#000000' size='1.5'>Main Objective Failed</t><br/><t align='center' color='#FFCC33'>------------------------------</t><br/><br/><t align='center' color='#666c3f' shadow='1' shadowColor='#000000'><t color='%3'><img size='4' image='%2'/></t><br/><br/><t align='center' color='#ffcc33' shadow='1' shadowColor='#000000'>No players captured the <t color='#FFCC33'>%1</t>. It was destroyed by the enemy.</t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Try harder next time.</t>",   _name, _picture, _color ];
    [nil,nil,rHINT,_text2] call RE;
    diag_log format["WASTELAND SERVER - Mission Failed"];
} else
{
    _text2 = parseText format ["<t align='center' color='#00D60E' shadow='1' shadowColor='#000000' size='1.5'>Main Objective Complete</t><br/><t align='center' color='#FFCC33'>------------------------------</t><br/><br/><t align='center' color='#666c3f' shadow='1' shadowColor='#000000'><t color='%3'><img size='4' image='%2'/></t><br/><br/><t align='center' color='#ffcc33' shadow='1' shadowColor='#000000'>Capture the <t color='#FFCC33'>%1</t>, has been completed!</t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Destroy The Enemy!</t>",   _name, _picture, _color ];
    [nil,nil,rHINT,_text2] call RE;
    diag_log format["WASTELAND SERVER - Mission Finished"];
};

deleteMarker _marker;
diag_log format["WASTELAND SERVER - Execute New Mission"];
[1] execVM format ["server\core\missions\mainmission_selector.sqf",_element];