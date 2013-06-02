//	@file Version: 1.0
//	@file Name: serverPlayerDied.sqf
//	@file Author: [404] Pulse, [404] Costlyy
//	@file Created: 20/11/2012 05:19
#include "setup.sqf"
if(!X_Server) exitWith {};

private["_newObject"];
_player = _this select 0;
_killer = _this select 1;

#ifdef __A2NET__
_player setVariable["processedDeath",netTime];
#else
_player setVariable["processedDeath",time];
#endif

//diag_log format["Checking KILLER and PLAYER..."];

if (((str(side _killer)) == "GUER") AND ((str(side _player)) == "GUER")) then { 
	//diag_log format["Killer and Player are INDEPENDENT."]; 
    {
    	if ((vehicle _killer) == _x) then {
        	//diag_log format["Found the killer, adding score..."];
        	_x addScore 2; 
        };
    } forEach playableUnits;
} else {
	//diag_log format["Killer and/or Player are not INDEPENDENT."];
};


