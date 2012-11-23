//	@file Version: 1.0
//	@file Name: clientCompile.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:


onRespawn = compile preprocessfile "client\clientEvents\onRespawn.sqf";
onKilled = compile preprocessfile "client\clientEvents\onKilled.sqf";
onKeyPress = compile preprocessFile "client\clientEvents\onKeyPress.sqf";
loadPlayerMenu = compile preprocessFile "client\systems\playerMenu\init.sqf";

playerSetup = compile preprocessFileLineNumbers "client\functions\playerSetup.sqf";
spawnAction = compile preprocessFileLineNumbers "client\functions\spawnAction.sqf";

compiledScripts = true;