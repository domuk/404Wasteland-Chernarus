//Weapon Cache
if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
private ["_rad","_cnps","_hills","_hillcount","_hillnum","_hill","_marker","_boxes","_numb","_boxnum","_box","_picture","_name","_text","_color","_tempPlayer"];

_rad=20000;
_result = 0;
_missionTimeOut = 5;
_missionDelayTime = 20;
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
							<t color='#FFCC33'>Starting in 5 Minutes</t>"];
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

_marker = createMarker ["Weapon_Marker", _hillpos ];
"Weapon_Marker" setMarkerType "mil_destroy";
"Weapon_Marker" setMarkerSize [1.25, 1.25];
"Weapon_Marker" setMarkerText "Supply Drop";
"Weapon_Marker" setMarkerColor "ColorRed";

box = createVehicle ["RULaunchersBox",[(getpos _hill select 0), getpos _hill select 1,0],[], 0, "NONE"];
box2 = createVehicle ["RUSpecialWeaponsBox",[(getpos _hill select 0), (getpos _hill select 1) - 10,0],[], 0, "NONE"];
	
_text = parseText format ["<t align='center' color='#0362f3' shadow='1' shadowColor='#000000' size='1.5'>Side Objective</t><br/><t align='center' color='#FFCC33'>------------------------------</t><br/><br/><t align='center' color='#ffcc33' shadow='1' shadowColor='#000000'>This <t color='#FFCC33'>Supply Drop</t>, is your OBJECTIVE!</t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Be careful, there may be resistance.</t>",   _name, _picture, _color];
[nil,nil,rHINT,_text] call RE;

_group = createGroup civilian;
//Anti Vehicle
man = _group createunit ["Priest", [(getMarkerpos _marker select 0) + 10, getMarkerpos _marker select 1, 0], [], 0, "Form"];
man addMagazine "PG7V";
man addMagazine "PG7V";
man addWeapon "RPG7V";
man addMagazine "30Rnd_545x39_AK";
man addMagazine "30Rnd_545x39_AK";
man addMagazine "30Rnd_545x39_AK";
man addWeapon "AKS_74_U";

//Support
man2 = _group createunit ["Priest", [(getMarkerpos _marker select 0) - 30, getMarkerpos _marker select 1, 0], [], 0, "Form"];
man2 addMagazine "75Rnd_545x39_RPK";
man2 addMagazine "75Rnd_545x39_RPK";
man2 addWeapon "RPK_74";

//Rifleman
man3 = _group createunit ["Priest", [getMarkerpos _marker select 0, (getMarkerpos _marker select 1) + 30, 0], [], 0, "Form"];
man3 addMagazine "30Rnd_762x39_AK47";
man3 addMagazine "30Rnd_762x39_AK47";
man3 addMagazine "30Rnd_762x39_AK47";
man3 addWeapon "AK_47_M";

//Rifleman
man4 = _group createunit ["Priest", [getMarkerpos _marker select 0, (getMarkerpos _marker select 1) + 40, 0], [], 0, "Form"];
man4 addMagazine "30Rnd_762x39_AK47";
man4 addMagazine "30Rnd_762x39_AK47";
man4 addMagazine "30Rnd_762x39_AK47";
man4 addWeapon "AK_47_M";

//Sniper
man5 = _group createunit ["Priest", [getMarkerpos _marker select 0, (getMarkerpos _marker select 1) - 30, 0], [], 0, "Form"];
man5 addMagazine "10Rnd_762x54_SVD";
man5 addMagazine "10Rnd_762x54_SVD";
man5 addMagazine "10Rnd_762x54_SVD";
man5 addWeapon "SVD";

{
	[_x] execVM "core\ai_fnc.sqf";
} foreach units _group;

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
    _result = [_currTime, _startTime, _missionDelayTime] call compareTime;
    (_result == 1) or (PlayerPresent == 1 and !alive man and !alive man2 and !alive man3 and !alive man4 and !alive man5)
};

_text2 = parseText format ["<t align='center' color='#00D60E' shadow='1' shadowColor='#000000' size='1.5'>Side Objective Complete</t><br/><t align='center' color='#FFCC33'>------------------------------</t><br/><br/><t align='center' color='#ffcc33' shadow='1' shadowColor='#000000'>Capture the <t color='#FFCC33'>Weapon Cache</t>, has been completed!</t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Re-Arm All your Kit!</t>",   _name, _picture, _color];
[nil,nil,rHINT,_text2] call RE;

diag_log format["WASTELAND SERVER - Mission Finished"];
deleteMarker _marker;
MissionRunning = false;