//	@file Version: 1.0
//	@file Name: checkAdmin.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_uid = "";
_uid = getPlayerUID player;

if (_uid in adminPanelUIDS) then {
    player execVM "client\systems\adminPanel\adminMenu.sqf"; 
    hint "Welcome Admin";
} 
else {
    sleep 1;
    _handle = player execVM "client\systems\adminPanel\checkAdmin2.sqf"; 
    waitUntil {scriptDone _Handle};
};