//	@file Version: 1.0
//	@file Name: admins.sqf
//	@file Author: [404] Costlyy
//	@file Created: NA
//	@file Args:

if(!X_Server) exitWith {};

//Admin menu access levels
moderators = ["0000000", //Example Mod
				"0000000" //Example Mod 2
				]; 
publicVariable "moderators"; 
           
administrators = ["00000000" //Example Admin 
                    ];
publicVariable "administrators";

serverAdministrators = ["18836358", //DEVDeadbeat
					"19714694", //DEVPulse
					"20243782", //DEVDomUK
					"32879878" //DEVCostlyy
                    ]; 
publicVariable "serverAdministrators";