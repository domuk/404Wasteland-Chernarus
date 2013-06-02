//	@file Version: 1.0
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Description: Main config.
                                                                                                
//Gunstore Weapon List - Gun Store Base List
// Type, Text name, classname, buy cost, sell amount
weaponsArray = [
	// Pistols
	[1, "Glock 17","glock17_EP1",25,10],
    [1, "Sa.61 Skorpion","Sa61_EP1",35,13],
	[1, "M9 Silenced","M9SD",50,25],
    [1, "UZI Silenced","UZI_SD_EP1",85,35],
    [1, "Golden Revolver","revolver_gold_EP1",250,125],
    
    // Shotguns & Rifles
    [2, "M1014","M1014",35,25],
	[2, "Saiga 12K","Saiga12K",50,25],
	[2, "AK-74","AK_74",50,25],
	[2, "AK-107 Kobra","AK_107_kobra",75,30],
    [2, "M16","M16A2",80,35],
    [2, "AKM","AK_47_M",100,45],
    [2, "M4A1 CCO","M4A1_Aim",120,55],
    [2, "AKS Silenced","AKS_74_UN_kobra",120,55],
    [2, "M4A1 CCO SD","M4A1_AIM_SD_camo",150,65],
    [2, "Mk 16 Holo","SCAR_L_CQC_Holo",190,90],
    [2, "FN FAL","FN_FAL",400,120],
    [2, "Mk 17 CCO","SCAR_H_CQC_CCO",450,220],
    [2, "M14 AIM","M14_EP1",750,330],
    [2, "AA-12 Shotgun","AA12_PMC",1000,425],
    
    // Sniper rifles
    [3, "Mk12 SPR","M4SPR",350,150],
    [3, "M24","M24",600,300],
    [3, "Mk17 Sniper SD","SCAR_H_LNG_Sniper_SD",600,300],
    [3, "Mk17 Sniper","SCAR_H_LNG_Sniper",800,350],
    [3, "Mk17 Sniper TWS","SCAR_H_STD_TWS_SD",1200,600],
    [3, "DMR","DMR",1500,755],
    [3, "M107","m107",2000,1100],
    [3, "M110 TWS","M110_TWS_EP1",2500,2000],
    
    // Machineguns
	[4, "RPK","RPK_74",150,75],
    [4, "M249","M249_EP1",275,120],
    [4, "Mk 48 Mod","Mk_48",350,150],
    [4, "M60 Hog","M60A4_EP1",400,230],
    [4, "Pecheneg","Pecheneg",450,230],
    
    // Anti-tank
    [5, "Carl Gustav","MAAWS",250,120],
    [5, "SMAW","SMAW",300,175],
    [5, "RPG-7","RPG7V",350,200],
    [5, "Stinger","Stinger",1000,550],
    [5, "Javelin","Javelin",1200,750]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = [    
    ["5Rnd. 338 Lapua Magnum Clip","5Rnd_86x70_L115A1",30],
    ["5Rnd. M24 Clip","5Rnd_762x51_M24",20],
    ["6Rnd. Revolver Clip","6Rnd_45ACP",5],
	["8Rnd. M1014 Slug","8Rnd_B_Beneli_74Slug",5],
	["8Rnd. M1014 Pellets","8Rnd_B_Beneli_Pellets",10],
	["8Rnd. Saiga 12K Slug","8Rnd_B_Saiga12_74Slug",5],
    ["8Rnd. Saiga 12K Pellets","8Rnd_B_Saiga12_Pellets",10],
    ["10Rnd. SVD Dragunov","10Rnd_762x54_SVD",25],
    ["15Rnd. M9 Silenced","15Rnd_9x19_M9SD",10],
    ["17Rnd. Glock 17","17Rnd_9x19_glock17",10],
    ["10Rnd. M107","10Rnd_127x99_m107",50],
    ["20Rnd. Sa.62","20Rnd_B_765x17_Ball",10],
    ["20Rnd. FN FAL","20Rnd_762x51_FNFAL",25],
    ["20Rnd. DMR","20Rnd_762x51_DMR",25],
    ["20Rnd. Mk17 / M110","20Rnd_762x51_B_SCAR",25],
	["20Rnd. Mk17 SD","20Rnd_762x51_SB_SCAR",25], 
    ["20Rnd. AA-12 Slug","20Rnd_B_AA12_74Slug",30],
    ["20Rnd. AA-12 Pellets","20Rnd_B_AA12_Pellets",50],   
    ["30Rnd. UZI Silenced","30Rnd_9x19_UZI_SD",10],
	["30Rnd. AK","30Rnd_545x39_AK",8],
	["30Rnd. AKM / Sa58","30Rnd_762x39_AK47",15],
	["30Rnd. STANAG","30Rnd_556x45_Stanag",10],
    ["30Rnd. STANAG SD","30Rnd_556x45_StanagSD",25],
    ["75Rnd. RPK Drum","75Rnd_545x39_RPK",25],
    ["100Rnd. STANAG Drum","100Rnd_556x45_BetaCMag",50],
	["100Rnd. MK48 / M60 Belt","100Rnd_762x51_M240",30],
	["100Rnd. Pencheng Belt","100Rnd_762x54_PK",50],
	["200Rnd. M249 Belt","200Rnd_556x45_M249",50],
    ["1 Carl-Gustav Shot","MAAWS_HEAT",200],  
    ["1 Anti-personnel RPG Rocket","OG7",350],
    ["1 Adv. RPG Rocket","PG7VR",200],
    ["1 Basic RPG Rocket","PG7V",100],  
    ["1 Anti-personnel SMAW Rocket","SMAW_HEDP",750],
    ["1 AT SMAW Rocket","SMAW_HEAA",250],
    ["1 Stinger Missile","Stinger",250],
    ["1 Javelin Missile","Javelin",500]
];

//Gun Store Equipment List
//Text name, classname, buy cost
accessoriesArray = [
	//["1 Hand Grenade","BAF_L109A1_HE", 50],
    //["1 Land Mine","Mine", 75],
	["GPS","ItemGPS", 100],
	["NV Goggles","NVGoggles",100],
	["Range Finder","Binocular_Vector",350]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
generalStore = [
	["Water","water",localize "STR_WL_ShopDescriptions_Water","client\icons\water.paa",30,15],
	["Canned Food","canfood",localize "STR_WL_ShopDescriptions_CanFood","client\icons\cannedfood.paa",30,15],
	["Repair Kit","repairkits",localize "STR_WL_ShopDescriptions_RepairKit","client\icons\briefcase.paa",1000,500],
	["Medical Kit","medkits",localize "STR_WL_ShopDescriptions_MedKit","client\icons\medkit.paa",400,200],
	["Jerry Can (Full)","fuelFull",localize "STR_WL_ShopDescriptions_fuelFull","client\icons\jerrycan.paa",150,75],
    ["Jerry Can (Empty)","fuelEmpty",localize "STR_WL_ShopDescriptions_fuelEmpty","client\icons\jerrycan.paa",50,25],
	["Spawn Beacon","spawnBeacon",localize "STR_WL_ShopDescriptions_spawnBeacon","",3000,1500],
    ["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "",300,150]  
];

// Chernarus town and city array
//Marker Name, Radius, City Name
cityList = [
		["Town_0",600,"Chernogorsk"],
		["Town_1",200,"Prigorodki"],
		["Town_2",200,"Pusta"],
		["Town_3",600,"Elektro"],
		["Town_4",200,"Kamyshovo"],			
		["Town_5",200,"Tulga"],
		["Town_6",250,"Solnychniy"],
		["Town_7",200,"Nizhnoye"],
		["Town_8",500,"Berezino City"],
		["Town_9",500,"Berezino Dock"],
		["Town_10",250,"Khelm"],
		["Town_11",200,"Olsha"],
		["Town_12",350,"Krasnostav"],
		["Town_13",250,"Gvozdno"],
		["Town_14",300,"Grishino"],
		["Town_15",200,"Petrovka"],
		["Town_16",200,"Lopatino"],
		["Town_17",300,"Vybor"],
		["Town_18",250,"Pustoshka"],
		["Town_19",200,"Myshkino"],
		["Town_20",200,"Sosnovka"],
		["Town_21",300,"Zelenogorsk"],
		["Town_22",200,"Pavlovo"],
		["Town_23",200,"Kamenka"],
		["Town_24",200,"Komarovo"],
		["Town_25",200,"Balota"],
		["Town_26",200,"Bor"],
		["Town_27",200,"Drozhino"],
		["Town_28",200,"Kozlovka"],
		["Town_29",200,"Pulkovo"],
		["Town_30",200,"Pogorevka"],
		["Town_31",200,"Rogovo"],
		["Town_32",200,"Kabanino"],
		["Town_33",300,"StarySobor"],
		["Town_34",200,"NovySobor"],
		["Town_35",200,"Vyshnoye"],
		["Town_36",250,"Mogilevka"],
		["Town_37",200,"Guglovo"],
		["Town_38",350,"Gorka"],
		["Town_39",200,"Shakhovka"],
		["Town_40",200,"Staroye"],
		["Town_41",200,"Msta"],
		["Town_42",200,"Dolina"],
		["Town_43",200,"Orlovets"],
		["Town_44",200,"Polana"],
		["Town_45",200,"Nadezhdino"],
		["Town_46",200,"Dubrovka"]
];
cityLocations = [];
