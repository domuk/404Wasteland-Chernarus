// Cargo drop script.
// Created by MarKeR - Helo and assistance from F2k Sel. Much obliged.
// For Use - Anyone, just leave these lines in here please. Thanks

// Cargo drop script used by 404Games with permission from [OCUK] MarKeR.
// Modifications made by [404] Costlyy

private ["_result","_startTime","_randomIndex","_GotLoc","_randomPos","_selectedMarker","_markerSubText","_markerLocation","_missionType","_picture","_vehicleName","_mainTextColour","_subTextColour","_centerPos","_flatAreas","_pilot","_plane","_parachute","_dropPosition","_parachute_1","_parachute_2","_parachute_3","_parachute_4","_cargo_1","_cargo_2","_cargo_3","_cargo_4","_effectSmoke_1","_effectSmoke_2","_effectSmoke_3","_effectSmoke_4","_effectSmoke_5","_effectSmoke_6","_effectSmoke_7","_effectSmoke_8","_cargoLandPos_1","_cargoLandPos_2","_cargoLandPos_3","_cargoLandPos_4"]; // variables weren't seen outside fn_findMissionSpot

if (!isServer) exitWith {};

waituntil {!isnil "bis_fnc_init"};

fn_findMissionSpot = {
	_markerLocation = createMarker ["Supply", _randomPos];
	_markerLocation setMarkershape "ELLIPSE";
	_markerLocation setMarkerColor "ColorRed";
	_markerLocation setMarkerBrush "Grid";
	_markerLocation setMarkerSize [250,250];
	
	_markerSubText = createMarker ["supplytext", _randomPos];
	_markerSubText setMarkertype "mil_objective";
	_markerSubText setMarkerColor "ColorBlack";
	_markerSubText setmarkerText " Supply Drop Area";
	
	group _pilot Move getmarkerpos "supplytext";
	
	Call fn_supplydrop;
};

fn_supplydrop = {

	Waituntil {((_plane distance getmarkerPos "supplytext") < 1500)};
	
	_plane animate ["ramp_top",1];
	_plane animate ["ramp_bottom",1];
	_plane FlyInHeight 125;
	_plane forceSpeed 150;

	sleep 0.5;

	// Spawn a parallel flare thread to make the drop off more realistic
	[_plane] spawn {
		private["_plane"];	
		_plane = _this select 0;
		sleep 3; // Slight delay before getting to drop zone to prevent excess flare spam

		for "_i" from 1 to 45 do {
			if ((_plane ammo "CMFlareLauncher") == 0) then {
				_plane addMagazineTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
        		reload _plane;
			};
			_plane action ["useWeapon", _plane, driver _plane,0];
			sleep 0.3;
		};
	};
	
	Waituntil {((_plane distance getmarkerPos "supplytext") < 200)};
	
	If ((getPosATL _plane select 2) > 200) then {
		hint "Supply Drop Mission Aborted. Finding New Drop Zone!";
		Deletemarker _markerLocation;
		Deletemarker _markerSubText;
		call fn_findMissionSpot;
	} else {
		// TODO: Put the following create vehicle commands into a loop to reduce code duplication
		_dropPosition = getpos _plane;
		sleep 1; // This is critical and must remain after the first getPos. This gives the plane time to escape from the falling object that might otherwise damage it.

		_parachute_1 = createVehicle [_parachute, _dropPosition, [], 0, "NONE"];
		_cargo_1 = createVehicle [_cargoItem_1, _dropPosition, [], 0, "NONE"];
		_cargo_1 attachTo [_parachute_1, [0,0,3]];
		_parachute_1 setpos _dropPosition;
	
		_dropPosition_2 = getpos _plane;
		Sleep 0.5;

		_parachute_2 = createVehicle [_parachute, _dropPosition_2, [], 0, "NONE"];
		_cargo_2 = createVehicle [_cargoItem_2, _dropPosition_2, [], 0, "NONE"];
		_cargo_2 attachTo [_parachute_2, [0,0,3]];
		_parachute_2 setpos _dropPosition_2;	
		
		_dropPosition_3 = getpos _plane;
		Sleep 0.5;

		_parachute_3 = createVehicle [_parachute, _dropPosition_2, [], 0, "NONE"];
		_cargo_3 = createVehicle [_cargoItem_3, _dropPosition_2, [], 0, "NONE"];
		_cargo_3 attachTo [_parachute_3, [0,0,2]];
		_parachute_3 setpos _dropPosition;
		
		_dropPosition_4 = getpos _plane;   
		Sleep 0.5;
             
		_parachute_4 = createVehicle [_parachute, _dropPosition_4, [], 0, "NONE"];
		_cargo_4 = createVehicle [_cargoItem_4, _dropPosition_4, [], 0, "NONE"];
		_cargo_4 attachTo [_parachute_4, [0,0,3]];
		_parachute_4 setpos _dropPosition_4;
		
		// Set smoke effects
		Sleep 2;
		
		_effectSmoke_1 = "smokeShellPurple" createVehicle _dropPosition;
		_effectSmoke_2 = "smokeShellPurple" createVehicle _dropPosition_2;
		_effectSmoke_3 = "smokeShellPurple" createVehicle _dropPosition_3;
		_effectSmoke_4 = "smokeShellPurple" createVehicle _dropPosition_4;
		
		_effectSmoke_1 attachto [_cargo_1, [0,0,0]];
		_effectSmoke_2 attachto [_cargo_2, [0,0,0]];
		_effectSmoke_3 attachto [_cargo_3, [0,0,0]];
		_effectSmoke_4 attachto [_cargo_4, [0,0,0]];
		
		_plane setspeedmode "full";
		_plane flyInHeight 500;
		
		_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Supply Drop Succesfull!</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The<t color='%4'> %3</t>, has relinquished the supplies.</t>", _missionType, _picture, _vehicleName, _mainTextColour, _subTextColour];
		[nil,nil,rHINT,_hint] call RE;
		
		// Closing Cargo Bay Doors
		_plane animate ["ramp_top",0];
		_plane animate ["ramp_bottom",0];
		
		// Flying Away and deleting things etc!
		_plane flyInHeight 1200;
		_plane forceSpeed 300;
		Waituntil {((_plane distance getmarkerPos "supply") > 4000)};
		
		deletevehicle _plane;
		deletevehicle _pilot;
		deleteMarker _markerLocation;
		deletemarker _markerSubText;
		
		Sleep 0.1;
		
		// Reset smoke effects for landed items
		_cargoLandPos_1 = getpos _cargo_1;
		_cargoLandPos_2 = getpos _cargo_2;
		_cargoLandPos_3 = getpos _cargo_3;
		_cargoLandPos_4 = getpos _cargo_4;

		_effectSmoke_5 = "smokeShellPurple" createVehicle _cargoLandPos_1;
		_effectSmoke_6 = "smokeShellPurple" createVehicle _cargoLandPos_2;
		_effectSmoke_7 = "smokeShellPurple" createVehicle _cargoLandPos_3;
		_effectSmoke_8 = "smokeShellPurple" createVehicle _cargoLandPos_4;     

	};
	sleep 2;
}; //End fn_supplydrop function


_rad=20000;
_missionType = "C130 Supply Drop";
_mainTextColour = "#52bf90";
_successTextColour = "#17FF41";
_failTextColour = "#FF1717";
_subTextColour = "#FFFFFF";
_missionDelayTime = 1200;
_cargoItem_1 = "RUVehicleBox";
_cargoItem_2 = "USVehicleBox"; 
_cargoItem_3 = "Barrels";
_cargoItem_4 = "Land_stand_small_EP1"; 
_parachute = "ParachuteMediumWest";
_planeType = "C130J_US_EP1"; // Vehicle
_result = 0;

_GotLoc = false;

while {!_GotLoc} do 
{
	_randomIndex = random (count MissionSpawnMarkers - 1);

	//If the index of the mission markers array is false then break the loop and finish up doing the mission
	if (!((MissionSpawnMarkers select _randomIndex) select 1)) then 
	{
		_selectedMarker = MissionSpawnMarkers select _randomIndex select 0;
		_randomPos = getMarkerPos _selectedMarker;
		MissionSpawnMarkers select _randomIndex set[1, true];
		_GotLoc = true;
	};
};

//ensure the rest of the script doesn't continue until we are done
waitUntil {_GotLoc};

//Tell everyone their will be a mission soon.
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>Starting in %1 Minutes</t>", _missionDelayTime / 60, _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

//Wait till the mission is ready to be ran.
diag_log format["WASTELAND SERVER - Mission Waiting to run"];

_startTime = floor(time);
waitUntil
{ 
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionDelayTime) then {_result = 1;};
    (_result == 1)
};

_result = 0;
diag_log format["WASTELAND SERVER - Mission Resumed"];

_plane = createVehicle [_planeType, getMarkerPos "plane2", [], 0, "FLY"]; //Creating vehicle
_plane flyInHeight 300;
_plane setspeedmode "normal";
_plane forceSpeed 220;
_plane allowDamage false;
_plane setVariable["original",1,true];

sleep 0.5;
_plane setvehiclevarname "_plane";
_grp = creategroup west;

_pilot = _grp createunit ["USMC_Soldier_Pilot",getmarkerpos "spawn2",[],0,"FORM"];
_pilot moveindriver _plane;
_pilot assignAsDriver _plane;
                
_picture = getText (configFile >> "cfgVehicles" >> typeOf _plane >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _plane >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>UN Supply Drop</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, has been designated to fly in supplies.</t>", _missionType, _picture, _vehicleName, _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

call fn_findMissionSpot;
diag_log format["WASTELAND SERVER - Mission starting plane animations"];
Call fn_supplydrop;
diag_log format["WASTELAND SERVER - Mission Finished"];

Sleep 1;
