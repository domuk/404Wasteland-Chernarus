//	@file Version: 1.0
//	@file Name: placeCammoNet.sqf
//  @file Author: [404] Costlyy, [404] Pulse
//	@file Created: 29th May 13

// Firstly remove the cammo net from the player.
player setVariable["camonet",(player getVariable "camonet")-1,true];

_playerPos = getPosATL player;
_playerDir = getDir player;

_deployedCamoNet = "Land_CamoNet_NATO" createVehicle (position player); 
_deployedCamoNet setPos _playerPos;
_deployedCamoNet setDir _playerDir;

hint "Cammo Net successfully deployed.";