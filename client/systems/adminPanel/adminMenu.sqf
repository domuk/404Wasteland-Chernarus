//	@file Version: 1.0
//	@file Name: adminMenu.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_start = createDialog "AdminMenu";

#define AdminMenu 2119

if (((getPlayerUID player) in provingGrounds)) then {
	thingsAvailable = [
		"Player Menu",
		"Vehicle Management",
		"Gun Store",
		"General Store",
		"Debug Function",
		"Fake Respawn Dialog (old)"
	];	    
} else {
	thingsAvailable = [
		"Player Menu"
	];    
};

{
	lbAdd [AdminMenu, _x];
} forEach thingsAvailable;