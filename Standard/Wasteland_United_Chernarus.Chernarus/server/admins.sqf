//	@file Version: 1.0
//	@file Name: admins.sqf
//	@file Author: [404] Costlyy
//	@file Created: NA
//	@file Args:

if(!X_Server) exitWith {};

//Admin menu access levels
moderators = ["32077894", //Krykiln
				"87053254", //Shaneyport
				"105267654", //Kaizee
				"12793798", //Bane
				"73698182", //unDead
				"59344390", //Ian				
				"2771014", //MiniDude
                "91598150", //Rainforger
                "90615878", // Killer4791
				"92186310", //Jellygunner
                "2264774", //Vesper
				"76397766", //Alan
				"11104390", //Reasoner
				"92123142", // Sam
                "106336326", // gwen
				"36719174" //Dervish
				]; 
publicVariable "moderators"; 
           
administrators = ["18519302", //Venny
					"57199878", //Garey
					"38204230" //JellaFish
                    ];
publicVariable "administrators";

serverAdministrators = ["18836358",
					"19714694", //Pulse
					"20243782", //Dom
					"32879878" //Costlyy
                    ]; 
publicVariable "serverAdministrators";