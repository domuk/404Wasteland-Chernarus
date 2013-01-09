//	@file Version: 1.0
//	@file Name: serverPlayerDied.sqf
//	@file Author: [404] Pulse
//	@file Created: 20/11/2012 05:19

if(!X_Server) exitWith {};

private["_newObject"];
_newObject = _this select 0;
_newObject setVariable["processedDeath",time];