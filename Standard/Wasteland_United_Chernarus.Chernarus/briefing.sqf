player createDiarySubject ["404games", "404Games Information"];
player createDiarySubject ["changelog", "404Games Change Log"];
player createDiarySubject ["wasteland", "What is Wasteland?"];

player createDiaryRecord["changelog",
[
"0.1",
"
<br/>
		[Fixed] - Server performance issues.<br/>
		[Fixed] - Vehicle cleanup.<br/>
		[Fixed] - Team locking time which is actually 3 mins now.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"2.1",
"
<br/>
		[Added] - Towing Limit Now Set to 1 Vehicle and Cars can Tow<br/>
		[Added] - Some Static Helis<br/>
		[Added] - Spawn Beacons<br/>
		[Added] - Client Markers<br/>
		[Added] - Outpost Mission<br/>
		[Added] - Concurrent Missions<br/>
		[Added] - Welcome Message<br/>
		[Added] - Admin Levels<br/>
		[Added] - More Ammo Types<br/>
		[Added] - More Player Roles, Now 120 Total<br/>
		[Changed] - Object List to have more Objects<br/>
		[Changed] - Balanced Mission Ammo Caches<br/>
		[Changed] - Faction Starting Pistols now more appropriate<br/>
		[Changed] - Missions Rewriten to Address Multiple Bugs<br/>
		[Redesigned] - Gun Store<br/>
		[Redesigned] - General Store<br/>
		[Fixed] - Animation not working correctly<br/>
		[Fixed] - Money Drop Bug and Exploit<br/>
		[Fixed] - JIP Loading Bug<br/>
		[Fixed] - AI Running to Other Mission<br/>
		[Fixed] - Numerous minor bugs and tweeks<br/>  
"
]
];

player createDiaryRecord["changelog",
[
"2.2",
"
<br/>
		[Added] - Body Clean Up after a short period.<br/>
		[Added] - Mobile Radar Station Mission.<br/>
		[Changed] - Vehicle Clean made less aggressive.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"2.2b",
"
<br/>
		[Changed] - Server Spawning Less Aggressive.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"2.3",
"
<br/>
		[Fixed] - Drinking and Eating While in the car animation.<br/>
        [Fixed] - Other minor bugs.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"2.4",
"
<br/>
		[Added] - Three new objects.<br/>
		[Added] - More anti hack for vehicles.<br/>
		[Added] - Check to make sure missions don't pop up in the same place.<br/>
		[Added] - Static Boats.<br/>
		[Changed] - Increased length of welcome message.<br/>
		[Changed] - Mission failover to 60 mins.<br/>
		[Changed] - Increased delay for body clean up to 15 mins.<br/>
		[Fixed] - Vehicle respawn script.<br/>
		[Removed] - Some debuging.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"2.5",
"
<br/>
		[Added] - Default weapon crates have been nerfed and more gun variations added.<br/>
		[Added] - Static helis now spawn in random locations.<br/>
		[Added] - When a static heli fails to spawn, a wreck is spawned instead.<br/>
		[Added] - Cammo nets have been added to the general store.<br/>
		[Fixed] - Players are now able to buy LMG's at the gun store.<br/>
		[Fixed] - Weapons now have varying sell prices relative to gun cost.<br/>
		[Fixed] - When buying a full jerry can, the empty one is automatically removed from player inventory.<br/>
		[Changed] - Various balance and price tweaks made to stores.<br/>
		[Changed] - Chernarus is now in summer time. Longer days to be had by all.<br/>
		[Changed] - Player starting money reduced to $100.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"2.6",
"
<br/>
		[Added] - Groups.<br/>
        [Added] - Body and Object clean up.<br/>
		[Added] - Static helis now spawn in random locations.<br/>
		[Added] - Default weapon crates have been nerfed and more gun variations added.<br/>
		[Added] - When a static heli fails to spawn, a wreck is spawned instead.<br/>
		[Added] - Player Tags thanks to [OcUK]Melbo.<br/>
		[Added] - Yellow tint, falling ash and dust for wasteland.<br/>
		[Added] - Cammo nets have been added to the general store.<br/>
        [Fixed] - Fix vehicle cleanup and respawn.<br/>
		[Fixed] - Players are now able to buy LMG's at the gun store.<br/>
		[Fixed] - Weapons now have varying sell prices relative to gun cost.<br/>
		[Fixed] - When buying a full jerry can, the empty one is automatically removed from player inventory.<br/>
		[Changed] - Town marker procedural generation optimised for reduced start-up lag.<br/>
		[Changed] - Admin menu can now remove player teamlock and teamkiller, also added a three tier permission system for greater flexibility.<br/>
		[Changed] - Player starting money reduced to $100.<br/>
		[Changed] - Various balance and price tweaks made to stores.<br/>
		[Changed] - Chernarus is now in summer time. Longer days to be had by all.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"2.6 Dev3",
"
<br/>
		[Fixed] - Flickering Icons.<br/>
		[Fixed] - Spawning with guns.<br/>
		[Fixed] - Spawning in a group.<br/>
		[Changed] - Removed Green Icons From Groups.<br/>
"
]
];
player createDiaryRecord["changelog",
[
"2.7",
"
<br/>
		[Added] - Better player join flow.<br/>
		[Added] - Independent groups now have icons back.<br/>
		[Fixed] - Disapearing icons on players who have been alive a long time.<br/>
		[Fixed] - Player Setup and Initialization.<br/>
		[Fixed] - Joining with a group.<br/>
		[Fixed] - Feedback messages missing.<br/>
        [Fixed] - Money dupe.<br/>
		[Changed] - Time Sync to just sync time and not accelerate it.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"2.8",
"
<br/>
		[Added] - When spawning on a spawn beacon, you come in via HALO jump.<br/>
		[Added] - New store interaction system.<br/>
		[Added] - Supply drop mission written by OCUK MarKeR and tweaked by 404Games.<br/>
		[Added] - Lots of new mission spawn locations.<br/>
		[Fixed] - Floating crates/objects sometimes appearing above Novy.<br/>
		[Fixed] - AI Team defend script. Be careful, they now actually use their mounted weapons!<br/>
		[Fixed] - Vehicles no longer spawn in silly places / silly angles.<br/>
		[Fixed] - Not able to interact with stores sometimes.<br/>
		[Fixed] - Outpost having overpowered weapons.<br/>
		[Fixed] - Other misc fixes that have been mentioned on the forums, Thanks for your help!<br/>
		[Improved] - Vehicle HUD to now show the players respective role within the vehicle.<br/>
		[Improved] - Mission spawning system thanks to Kettlewell.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"2.8a",
"
<br/>
		[Fixed] - AI getting into mission vehicles.<br/>
		[Fixed] - Fixed some issues with missions.<br/>
		[Fixed] - Added in some defines for missions to easily edit the times.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"2.9",
"
<br/>
		[Added] - Most interactions have a Cancel Action option now.<br/>
		[Fixed] - Abandoned Truck showing up as recon vehicle.<br/>
		[Fixed] - Object lock now functions correctly.<br/>
		[Fixed] - Spawn beacon, radar, object etc unlock/lock actions now stop on death.<br/>    
		[Fixed] - The mission RPT errors.<br/>
		[Fixed] - The vehicle count RPT error.<br/>
		[Fixed] - mission_Outpost timeout.<br/>
		[Changed] - Gun and General stores no longer have over-powered super radars.<br/>
		[Changed] - Player now starts with only 1x food and water.<br/>
		[Changed] - Added more variation to vehicle weapons spawns and removed OP weapons.<br/>
		[Enhancement] - Refuel and Repair vehicle functions have been improved.<br/>
		[Enhancement] - The mission RPT's to have more information to help with debuging.<br/>
		[Enhancement] - Server startup optimizations.<br/>
		[Enhancement] - General mission optimizations; many changes to improve performance.<br/>
		[Enhancement] - Made some changes to defend area to make the AI more aware.<br/>
		[Enhancement] - The mission system is now all pre compiled and steamlined to make it run smoother.<br/>
		[Enhancement] - Mission will no longer run the same one twice.<br/>  
"
]
];

player createDiaryRecord["changelog",
[
"2.9b",
"
<br/>
		[Fixed] - Fuel Cans not refilling.<br/>
		[Fixed] - Deer Stand Flying.<br/>
		[Fixed] - No limit on gunstore ammo.<br/>
		[Fixed] - Supply Drop Mission Food Stand.<br/>
		[Could Not Recrate] - The Mission_LightArmVeh Mission is not spawning the BTR40_MG_TK_GUE_EP1.<br/>
		[Could Not Recrate] - Arma2Net version of 2.9a has got a problem with the groups system.<br/>
		Could Not Recrate] - Teamkill Message Not Working.<br/>
"
]
];

player createDiaryRecord["404games",
[
"Credits",
"
<br/>
	Contributors:<br/><br/>
	Credit to Tonic for original game-mode creation.<br/><br/>
	404 Developers:<br/><br/>
	Developer - Deadbeat<br/>
	Developer - Costlyy<br/>
    Developer - Pulse<br/>
	Server Host - Domuk<br/>
"
]
];

player createDiaryRecord["404games",
[
"Bug and Cheat Reporting",
"
<br/>
	Found a bug? Please report it at: http://www.404games.co.uk/bugs<br/><br/>
	Suspect a player is hacking or exploiting? Please report it at: http://www.404games.co.uk/bans<br/><br/>
	Please remeber this game-mode is in continuous development and there will be bugs. 
"
]
];

player createDiaryRecord["404games",
[
"Teamspeak",
"
<br/>
	There is a public Teamspeak 3 server available for players of this server.<br/><br/>
	Teamspeak IP: ts.404games.co.uk<br/><br/>
	Please join and say hello! (Please speak English)
"
]
];

player createDiaryRecord["wasteland",
[
"Hints & Tips",
"
<br/>
    At the start of the game, spread out and find supplies before worrying about where to establish a meeting place or a base, supplies are important and very valuable.<br/><br/>
    When picking a base location, it is best advised to pick a place that is out of the way and not so obvious such as airports, cities, castles, etc. remember, players randomly spawn in and around towns and could even spawn inside your base should you set it up in a town.<br/><br/>
    If you spawn in an area with no vehicles or supplies in the immediate area, DO NOT just click respawn from the pause menu, chances are if you search an area of a few hundred meters, you will find something.<br/><br/>
    Always be on the lookout for nightvision. Two pairs are located in the Large Cache, and there are pairs scattered throughout cars. You can also purchase them from the gunstores. Nighttime without them SUCKS, and if you have them, you can conduct stealth raids on enemy bases under the cover of complete darkness.<br/><br/>
    When you set up a base, never leave your supplies unguarded, one guard will suffice, but it is recommended you have at least 2, maybe 3 guards at base at all times.<br/><br/>
    The helicopter from the side mission spawns with no fuel, so do not make a mad dash for the chopper unless you are armed and plan to protect it, or have some fuel which can be found in the fuel truck, or in the palated barrels from the abandoned base.<br/>
    There are very aggressive AI characters that spawn with most side missions and will protect the mission objectives with deadly force, be aware of them.<br/>
"
]
];

player CreateDiaryRecord["wasteland",
[
"WELCOME TO THE WASTELAND",
"
The Wasteland is a team versus team versus team sandbox survival experience. The objective of this mission is to rally your faction, scavenge supplies, weapons, and vehicles, and destroy the other factions. It is survival at its best! Keep in mind this is a work in progress, please direct your reports to 404Games.
<br/><br/>

FAQ<br/>
Q. What am I supposed to do here?<br/>
A. See the above description<br/>
<br/>
Q. Where can I get a gun?<br/>
A. Weapons are found in one of three places, first in ammo caches that randomly spawn around the map inside and outside buildings, and second, in the gear section of the vehicles, which also randomly spawn around the map. The last place to find a gun would be at the gunshops located throughout the map. You can also find them on dead players whose bodies have not yet been looted.
<br/><br/>
Q. What are the circles on the map?<br/>
A. The circles represent town limits. If friendly soldiers are in a town, you can spawn there from the re-spawn menu; however if there is an enemy presence, you will not be able to spawn there.
<br/><br/>
Q. Why is it so dark, I cant see.<br/>
A. The server has a day/night cycle just like in the real world, and as such, night time is a factor in your survival. It is recommended that you find sources of light or Night Vision Goggles before the darkness sets in. You can find night vision goggles in vehicles, or you can purchase them at the gunshops.
<br/><br/>
Q. Is it ok for me to shoot my team mates?<br/>
A. If you are member of BLUFOR or OPFOR teams, then you are not allowed to shoot or steam items and vehicles from other players. If you play as Independent, you are free to engage anyone as well as team up with anyone you want.
<br/><br/>
Q. Whats with the teapots and big bags?<br/>
A. This game has a food and water system that you must stay on top of if you hope to survive. You can collect food and water from water barrels, food stands, or dead players bodies. Food and water will randomly spawn around the map. Other items that will randomly spawn are fuel cans for refueling vehicles, medkits for healing yourself, and repair kits for repairing vehicles. Each of these is a one-time-only use item.
<br/><br/>
Q. I saw someone breaking a rule, what do I do?<br/>
A. Simply go into global chat and get the attention of one of the admins or visit www.404games.co.uk/forum and make a report if the offence is serious.
<br/>
"]
];