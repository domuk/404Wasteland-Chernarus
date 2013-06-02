
//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_player = _this;
//Player initialization
_player setskill 0;
{_player disableAI _x} foreach ["move","anim","target","autotarget"];
_player setVariable ["BIS_noCoreConversations", true];

enableSentences false;
_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";
removeAllWeapons _player;
removeBackpack _player;

//Default case means something fucked up.
_player addMagazine "6Rnd_45ACP";
_player addMagazine "6Rnd_45ACP";
_player addWeapon "revolver_gold_EP1";
_player selectWeapon "revolver_gold_EP1";

if(str(playerSide) in ["WEST"]) then
{
    removeAllWeapons _player;
    _player addMagazine "7Rnd_45ACP_1911";
    _player addMagazine "7Rnd_45ACP_1911";
	_player addWeapon "Colt1911";
	_player selectWeapon "Colt1911";
};

if(str(playerSide) in ["EAST"]) then
{
    removeAllWeapons _player;
    _player addMagazine "8Rnd_9x18_Makarov";
    _player addMagazine "8Rnd_9x18_Makarov";
    _player addMagazine "8Rnd_9x18_Makarov";
	_player addWeapon "Makarov";
	_player selectWeapon "Makarov";
};

if(str(playerSide) in ["GUER"]) then
{
    removeAllWeapons _player;
    _player addMagazine "17Rnd_9x19_glock17";
	_player addWeapon "glock17_EP1";
	_player selectWeapon "glock17_EP1";
};

_player addrating 1000000;
_player switchMove "amovpknlmstpsraswpstdnon_gear";

thirstLevel = 100;
hungerLevel = 100;

_player setVariable["cmoney",100,false];
_player setVariable["canfood",1,false];
_player setVariable["medkits",0,false];
_player setVariable["water",1,false];
_player setVariable["fuel",0,false];
_player setVariable["repairkits",0,false];
_player setVariable["fuelFull", 0, false];
_player setVariable["fuelEmpty", 1, false];
_player setVariable["bombs",false,false];
_player setVariable["spawnBeacon",0,false];
_player setVariable["camonet",0,false];
player setVariable["canDrop",false,false];

[] execVM "client\functions\playerActions.sqf";

_player groupChat format["Player Initialization Complete"];
playerSetupComplete = true;