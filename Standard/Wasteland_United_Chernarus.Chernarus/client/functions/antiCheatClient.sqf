//	@file Version: 1.0
//	@file Name: antiCheatClient.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13
//	@file Args:

// This anti-cheat file is a a work-in-progress and is not intended to replace vigilance and or anticheat software.
// The reason that I wrote this file is to mitigate some of the most irritating but not server destroying hacks that
// players complain about the most.

// I couldn't figure out a way to extract all weapons of superClass "cannonBase" and as a result, we have this ugly monstrosity below.
// TODO: Find a better way of doing this...
_bannedWeapons = [
    "2A14","2A38M","2A42","2A46M","2A46MRocket","2A70","2A70Rocket","2A72","2B14","57mmLauncher","57mmLauncher_128","57mmLauncher_64",
    "80mmLauncher","9M311Laucher","AALauncher_twice","AGS17","AGS30_heli","AirBombLauncher","AT10LauncherSingle","AT11LauncherSingle","AT13LauncherSingle","AT2Launcher","AT5Launcher","AT5LauncherSingle",
    "AT6Launcher","AT9Launcher","AZP85","BAF_GMG","BombLauncher","BombLauncherA10","BombLauncherF35","Ch29Launcher","Ch29Launcher_Su34","CMFlareLauncher","CRV7_FAT","CRV7_HEPD",
    "CRV7_PG","CTWS","D10","D30","D81","DT_veh","FFARLauncher","FFARLauncher_14","GAU12","GAU8","GRAD","GSh23L",
    "GSh23L_L39","GSh301","GSh302","HeliBombLauncher","HellfireLauncher","HellfireLauncher_AH6","Igla_twice","KPVT","Laserdesignator_mounted","M119","M120","M134",
    "M134_2","M168","M197","M230","M242","M242BC","M252","M256","M2BC","M32_heli","M3P","M621",
    "M68","MaverickLauncher","MissileLauncher","Mk82BombLauncher","Mk82BombLauncher_6","MLRS","R73Launcher","R73Launcher_2","RocketPods","S8Launcher","SidewinderLaucher","SidewinderLaucher_AH1Z",
    "SidewinderLaucher_AH64","SidewinderLaucher_F35","SmokeLauncher","SPG9","StingerLaucher","StingerLaucher_4x","StingerLauncher_twice","TOWLauncher","TOWLauncherSingle","TwinM134","TwinVickers","VikhrLauncher",
    "YakB","ZiS_S_53" ];
    
// TODO: Make mission vehicles sit in public arrays, then extrapolate the vehicles out of the cfgVehicles in full
//  and just compare to make sure the selected vehicle is not in any of the mission arrays.
_bannedVehicles = [
	"F35B","A10","AH1Z","AH64D","AV8B","C130","C130J","CruiseMissile1","CruiseMissile2","Ka52","RM70_ACR","T810_Des_ACR","T810_ACR","T810Reammo_ACR",
    "Ka52Black","MQ9PredatorB","Mi24_D","Pchela1T","Su25_CDF","Su25_Ins","Su39","F35","Su25_TK_EP1","Mi24_D_TK_EP1","T810Reammo_Des_ACR",
    "Chukar_EP1","L39_TK_EP1","An2_2_TK_CIV_EP1","M1114_AGS_ACR", "An2_TK_EP1", "An2_1_TK_CIV_EP1","AV8B2","AV8B","T810Refuel_ACR","T810Refuel_Des_ACR",
    "C130J_US_EP1", "L159_ACR", "L39_ACR","L39_TK_EP1", "L39_TK_EP1", "MQ9PredatorB_US_EP1", "A10_US_EP1", "Chukar", "L39_2_ACR","T810A_Des_MG_ACR",
    "BRDM2_ATGM_CDF","BRDM2_ATGM_INS","BRDM2_CDF","BRDM2_Gue","BRDM2_HQ_Gue","BRDM2_INS","BTR90_HQ","GRAD_CDF","T810A_MG_ACR",
	"GRAD_INS","GRAD_RU","GRAD_CDF","HMMWV_Avenger","Ikarus","KamazOpen","KamazReammo","KamazRefuel","RM70_ACR",
	"KamazRepair","LAV25_HQ","MMT_USMC","2S6M_Tunguska","BMP2_Ambul_CDF","BMP2_CDF","2S6M_Tunguska","BMP2_Gue",
	"BMP2_HQ_CDF","BMP2_HQ_INS","BMP2_INS","M1A1","M1A2_TUSK_MG","MLRS","T72_CDF","T72_Gue","T72_RU","ZSU_CDF","ZSU_INS","AH64D_Sidewinders",
    "Ka52","Ka52Black","MH60S","Mi17_CDF","Mi17_Ins", "Pandur2_ACR", "BVP1_TK_ACR", "BVP1_TK_GUE_ACR", "BRDM2_Desert_ACR", "BRDM2_ACR", "BMP2_ACR",
	"Mi17_rockets_RU","Mi24_P","Mi24_V","AH64D_EP1","Mi17_TK_EP1","Mi17_UN_CDF_EP1","Mi171Sh_CZ_EP1", "BMP2_Des_ACR",
    "T810_Open_ACR","T810_Open_Des_ACR","T810Repair_ACR","T810Repair_Des_ACR","Dingo_GL_DST_ACR","Dingo_GL_Wdl_ACR","Dingo_WDL_ACR","Dingo_DST_ACR",
    "LandRover_ACR","LandRover_Ambulance_ACR","LandRover_Ambulance_Des_ACR","Octavia_ACR","UAZ_Unarmed_ACR",
    "Mi171Sh_rockets_CZ_EP1","UH1H_TK_EP1","Su34","BAF_Apache_AH1_D","AH6J_EP1","Mi24_D_CZ_ACR","AW159_Lynx_BAF","M1114_AGS_ACR","M1114_DSK_ACR"];
    
    
_currencyLimit = 10 * 1000; // 10k money limit for initial config.
_moneyKickCeiling = 30 * 1000; // money kick ceiling - default value is 30k.
_instantKick = false; // Kick the bastards immediately or taunght them a little?
_moneyKick = true; // Kick players who greatly exceed the money limit? Note: THIS MAY LEAD TO FALSE-POSITIVES! YOU HAVE BEEN WARNED...

func_tauntHacker = {                
	// Black their screen out and taunt them with silly messages! Mwahahahaha!
	titleText ["", "BLACK IN", 0];
	titleText ["ERROR: User performed an illegal operation. \n\n If the problem persists, contact your system administrator or stop using hacked items.","black"]; 
	sleep 10; titleFadeOut 10; 
};


while {true} do {
     
	// Re-enable input incase it has been disabled.
	player enableSimulation true;
    disableUserInput false;
	        
	// Show the player incase they are trying to be a sneaky little neckbearded fuck.
	player hideObject false;
	[nil, player, "loc", rHideObject, false] call RE;
    
    // Remove existing event handlers before adding them back.
    player removeAllEventHandlers "Killed";
    player removeAllEventHandlers "Respawn";
    player removeAllEventHandlers "handleDamage";
    
    // Add event handlers back incase hacker has disabled them.
    if(!isNil "client_initEH") then { player removeEventHandler ["Respawn", client_initEH]; };
	player addEventHandler ["Respawn", {[_this] call onRespawn;}];
	player addEventHandler ["Killed", {[_this] call onKilled;}];
    player addEventHandler ["handleDamage", { _this select 2 }];
    player allowDamage true;
    
    // Get the player's money and ensure it is < 10k.
	_money = player getVariable["cmoney",0];    
	if (_money > _currencyLimit) then {
    	if (_moneyKick AND _money > _moneyKickCeiling) then { 
        	if (!_instantKick) then { [] call func_tauntHacker; };
            endMission "LOSER";
        } else {
        	player setVariable["cmoney",_currencyLimit, true];
        };
	};
      
    { // Check for illegal weapons. 
    	if (currentWeapon player == _x) exitWith {
        	// Firstly MITIGATE the damage by removing the infringing weaponry.
    		removeAllWeapons player;
            if (!_instantKick) then { [] call func_tauntHacker; }; 
            endMission "LOSER";
        };
    }forEach _bannedWeapons;
    
    { // Check for illegal vehicles. 
    	if ((typeOf (vehicle player)) == _x) then {
        	deleteVehicle (vehicle player);
            playSound "IncomingChallenge";
        	[] call func_tauntHacker;
        };
    }forEach _bannedVehicles;
              	
	// Loop speed not much of an issue clientside.
	sleep 0.5; 
};

