//Recon Vehicle
if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
private ["_rad","_cnps","_hills","_hillcount","_hillnum","_hill","_marker","_boxes","_numb","_boxnum","_box","_picture","_name","_text","_color","_tempPlayer"];

_rad=20000;
_result = 0;
_missionTimeOut = 20;
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

_marker = createMarker ["Recon_Vehicle", _hillpos ];
"Recon_Vehicle" setMarkerType "mil_destroy";
"Recon_Vehicle" setMarkerSize [1.25, 1.25];
"Recon_Vehicle" setMarkerText "Recon Vehicle";
"Recon_Vehicle" setMarkerColor "ColorRed";

_veh = ["UAZ_AGS30_RU","UAZ_MG_INS","Offroad_SPG9_Gue","Offroad_DSHKM_Ins","LandRover_MG_TK_INS_EP1","LandRover_SPG9_TK_EP1","LandRover_Special_CZ_EP1","BAF_Jackal2_L2A1_w","ArmoredSUV_PMC"] call BIS_fnc_selectRandom;

tank = createVehicle [_veh, getMarkerpos _marker,[], 0, "NONE"];
	tank setFuel random 1;
	tank setVehicleAmmo 1;
	tank setdamage 0.25;

if(isnull tank) exitwith 
{
    deleteMarker _marker;
    [1] execVM format ["server\core\missions\mainmission_selector.sqf",_element];
};

tank setVehicleLock "LOCKED";

_name = getText (configFile >> "cfgVehicles" >> typeOf tank >> "displayName");
_picture = getText (configFile >> "cfgVehicles" >> typeOf tank >> "picture");

_text = parseText format ["<t align='center' color='#0362f3' shadow='1' shadowColor='#000000' size='1.5'>Side Objective</t><br/><t align='center' color='#FFCC33'>------------------------------</t><br/><br/><t align='center' color='#666c3f' shadow='1' shadowColor='#000000'><t color='%3'><img size='4' image='%2'/></t><br/><br/><t align='center' color='#ffcc33' shadow='1' shadowColor='#000000'>This <t color='#FFCC33'>%1</t>, is your OBJECTIVE!</t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Get to it first!</t>",   _name, _picture, _color];
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
man2 = _group createunit ["Priest", [(getMarkerpos _marker select 0) - 10, getMarkerpos _marker select 1, 0], [], 0, "Form"];
man2 addMagazine "75Rnd_545x39_RPK";
man2 addMagazine "75Rnd_545x39_RPK";
man2 addWeapon "RPK_74";

//Rifleman
man3 = _group createunit ["Priest", [getMarkerpos _marker select 0, (getMarkerpos _marker select 1) + 15, 0], [], 0, "Form"];
man3 addMagazine "30Rnd_762x39_AK47";
man3 addMagazine "30Rnd_762x39_AK47";
man3 addMagazine "30Rnd_762x39_AK47";
man3 addWeapon "AK_47_M";

//Rifleman
man4 = _group createunit ["Priest", [getMarkerpos _marker select 0, (getMarkerpos _marker select 1) + 20, 0], [], 0, "Form"];
man4 addMagazine "30Rnd_762x39_AK47";
man4 addMagazine "30Rnd_762x39_AK47";
man4 addMagazine "30Rnd_762x39_AK47";
man4 addWeapon "AK_47_M";

//Sniper
man5 = _group createunit ["Priest", [getMarkerpos _marker select 0, (getMarkerpos _marker select 1) - 10, 0], [], 0, "Form"];
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
    (_result == 1) or (PlayerPresent == 1 and !alive man and !alive man2 and !alive man3 and !alive man4 and !alive man5) or getpos tank distance getMarkerPos _marker > _missionTriggerRadius
};

tank setVehicleLock "UNLOCKED";

if(_result == 1) then
{
    tank setDamage 1;
    _text2 = parseText format ["<t align='center' color='#FF0000' shadow='1' shadowColor='#000000' size='1.5'>Side Objective Failed</t><br/><t align='center' color='#FFCC33'>------------------------------</t><br/><br/><t align='center' color='#666c3f' shadow='1' shadowColor='#000000'><t color='%3'><img size='4' image='%2'/></t><br/><br/><t align='center' color='#ffcc33' shadow='1' shadowColor='#000000'>No players captured the <t color='#FFCC33'>%1</t>. It was destroyed by the enemy.</t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Try harder next time.</t>",   _name, _picture, _color ];
        [nil,nil,rHINT,_text2] call RE;
        diag_log format["WASTELAND SERVER - Mission Failed"];
} else
{
    _text2 = parseText format ["<t align='center' color='#00D60E' shadow='1' shadowColor='#000000' size='1.5'>Side Objective Complete</t><br/><t align='center' color='#FFCC33'>------------------------------</t><br/><br/><t align='center' color='#666c3f' shadow='1' shadowColor='#000000'><t color='%3'><img size='4' image='%2'/></t><br/><br/><t align='center' color='#ffcc33' shadow='1' shadowColor='#000000'>Capture the <t color='#FFCC33'>%1</t>, has been completed!</t><br/><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Destroy The Enemy!</t>",   _name, _picture, _color ];
        [nil,nil,rHINT,_text2] call RE;
        diag_log format["WASTELAND SERVER - Mission Finished"];
};

deleteMarker _marker;
MissionRunning = false;