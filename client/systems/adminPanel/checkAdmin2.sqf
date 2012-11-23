//	@file Version: 1.0
//	@file Name: checkAdmin2.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_isAdmin = serverCommandAvailable "#kick";

if (_isAdmin) then {
    player execVM "client\systems\adminPanel\adminMenu.sqf"; 
    hint "Welcome Admin";
    //isitadmin = true;
} else {
    sleep 1;
    //hint "You do not have permission to use the admin menu";
};