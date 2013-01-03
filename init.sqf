//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Description: The main init.
//	@file Args:

//"Arma2Net.Unmanaged" callExtension "Activate";
if (isnil "RE") then {[] execVM "\ca\Modules\MP\data\scripts\MPframework.sqf"};

StartProgress = false;
enableSaving[false,false];

X_Server = false;
X_Client = false;
X_JIP = false;
hitStateVar = false;
versionName = "v2.6 Dev3";

if(isServer) then { X_Server = true;};
if(!isDedicated) then { X_Client = true;};
if(isNull player) then {X_JIP = true;};

true spawn {
	if(!isDedicated) then {
		titleText ["Please wait for your player to setup", "BLACK OUT", 1];
		waitUntil {player == player};
		client_initEH = player addEventHandler ["Respawn", {removeAllWeapons (_this select 0);}];
	};
};

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "briefing.sqf";

if(X_Client) then {
	[] execVM "client\init.sqf";
    
    player removeWeapon "ItemGPS";
	removeAllWeapons player;
	removeBackpack player;
	enableRadio false;
    
    if(count units group player > 1) then
    {  
    	[player] join grpNull;    
    };
};

if(X_Server) then {
    diag_log format["WASTELAND SERVER - Initilizing Server"];
	[] execVM "server\init.sqf";
};

//init 3rd Party Scripts
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
[] execVM "addons\proving_Ground\init.sqf";
[0.1, 0.9, 1] execVM "addons\scripts\DynamicWeatherEffects.sqf";