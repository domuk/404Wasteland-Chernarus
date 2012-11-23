
//	@file Version: 1.0
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Description: Main config.
//	@file Args:


//Main Features
sideMissions = 1;
serverSpawning = 1;
generalStores = 1;
vehicleStores = 1;
gunStores = 1;

maxCivVehicles = 1;
maxMilitVehicles = 1;
maxArmedMilitVehicles = 1;
maxPickups = 1;
maxObjects = 1;

//Standard admin panel, use at your own risk.
adminPanelUIDS = ["18836358",
				"20243782",
				"18519302",
				"32879878",
				"57199878"];

//Heavy debuging tool, use at your own risk.
provingGrounds = ["18836358",
				"20243782",
				"32879878"];

//Gunstore Weapon List
weaponsArray = [
	["AK-74","AK_74",50],
	["AK-107 Kobra","AK_107_kobra",75],
	["AKM","AK_47_M",75],
    ["M16A4","M16A4",75],
    ["M4A1","M4A1",50],
    ["M4A1 CCO","M4A1_Aim",100],
    ["M1014","M1014",50],
    ["Saiga 12K","Saiga 12K",100],
    ["M249","M249_EP1",250],
    ["Mk_48 Mod","Mk_48",250],
    ["M240","M240",250],
    ["Pecheneg","Pecheneg",250],
    ["RPG-7","RPG7V",300],
    ["SMAW","SMAW",300],
    ["Stinger","Stinger",1000],
    ["Javelin","Javelin",1500],
    ["Mk12 SPR","M4SPR",200],
    ["Mk17 Sniper","SCAR_H_LNG_Sniper",500],
    ["Mk17 Sniper SD","SCAR_H_LNG_Sniper_SD",750],
    ["M110 NV","M110_NVG_EP1",1000],
    ["Mk17 Sniper TWS","SCAR_H_STD_TWS_SD",1500],
    ["M107","m107",2000],
    ["M110 TWS","M110_TWS_EP1",2500]
];

ammoArray = [
	["30Rnd AK","30Rnd_545x39_AK",10],
	["AKM Mag","30Rnd_762x39_AK47",10],
	["30Rnd. STANAG","30Rnd_556x45_Stanag",10],
	["8Rnd. M1014 Slug","8Rnd_B_Beneli_74Slug",10],
	["8Rnd. Saiga 12K Slug","8Rnd_B_Saiga12_74Slug",10],
	["200Rnd. M249 Belt","200Rnd_556x45_M249",50],
	["100Rnd. M240","100Rnd_762x51_M240",25],
	["PKM Mag.","100Rnd_762x54_PK",25],
	["PG-7V.","PG7V",100],
	["SMAW-HEAA","SMAW_HEAA",100],
	["Mk17 Mag.","20Rnd_762x51_B_SCAR",25],
	["Mk17 SD Mag.","20Rnd_762x51_SB_SCAR",25],
	["10Rnd. M107","10Rnd_127x99_m107",50]
];

accessoriesArray = [
	["Range Finder","Binocular_Vector",500],
	["NV Goggles","NVGoggles",100]
];

//Display Name, Class Name, Description, Buy Price, Sell Price.
generalStore = [
	["Water","water","",30,15],
	["Canned Food","canfood","",30,15],
	["Repair Kit","repairkits","",1000,500],
	["Medical Kit","medkits","",400,200]
	//["Jerry Can","fuelFull","",150,75]
];

//Vehicle Config
civilianVehicles = ["car_hatchback",
					"car_sedan",
					"datsun1_civil_2_covered",
					"SkodaGreen",
					"Lada2",
					"V3S_Civ",
					"UralCivil",
					"VWGolf",
					"MMT_Civ",
					"Ikarus_TK_CIV_EP1",
					"Lada1_TK_CIV_EP1",
					"Old_moto_TK_Civ_EP1",
					"S1203_TK_CIV_EP1",
					"UAZ_Unarmed_TK_CIV_EP1",
					"ATV_US_EP1",
					"BAF_Offroad_W",
					"S1203_ambulance_EP1"];

militaryVehicles = ["UAZ_CDF",
					"SUV_PMC",
					"MTVR",
					"BAF_Offroad_W",
					"HMMWV",
					"HMMWV_Ambulance",
					"S1203_ambulance_EP1",
					"GAZ_Vodnik_MedEvac"];

armedMilitaryVehicles = ["ArmoredSUV_PMC",
							"Pickup_PK_GUE",
							"UAZ_MG_TK_EP1",
							"LandRover_MG_TK_INS_EP1",
							"HMMWV_M2",
							"HMMWV_Armored",
							"HMMWV_MK19",
							"HMMWV_TOW",
							"GAZ_Vodnik"];

//Item Config
pickupList = ["Satelit",
				"EvMoney",
				"Suitcase",
				"Fuel_can"];

//Object Config
objectList = ["Land_Barrel_water",
				"Land_stand_small_EP1",
				"Base_WarfareBBarrier10xTall",
				"Base_WarfareBBarrier10x",
				"Base_WarfareBBarrier5x",
				"Land_Misc_deerstand",
				"Fort_Barricade",
				"Concrete_Wall_EP1",
				"Land_fort_bagfence_round",
				"Land_fortified_nest_small_EP1",
				"Land_Misc_deerstand",
				"Land_fort_bagfence_long",
				"Land_HBarrier_large",
				"Land_Misc_Scaffolding",
				"Barrels",
				"Land_fort_artillery_nest_EP1",
				"Land_fort_rampart_EP1",
				"Land_Fort_Watchtower_EP1",
				"DSHKM_TK_INS_EP1",
				"Land_fortified_nest_big",
				"M2StaticMG_US_EP1",
				"RampConcrete",
				"WarfareBDepot",
				"WarfareBCamp",
				"Land_ConcreteBlock"];

//Vars not to be changed
currentTime = 0;
currentVehicles = [];
pvar_teamSwitchList = [];
pvar_teamKillList = [];