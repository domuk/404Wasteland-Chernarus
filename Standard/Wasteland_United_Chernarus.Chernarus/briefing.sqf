//	@file Version: 1.0
//	@file Name: briefing.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 30th May 13

player createDiarySubject ["404Games", "404Games Information"];
player createDiarySubject ["Changelog", "404Games Change Log"];
player createDiarySubject ["Wasteland", "What is Wasteland?"];

player createDiaryRecord["Changelog",
[
"3.0",
"
<br/>
		General:<br/>
			- New improved and refined gun store.<br/>
			- Added multiple new weapon and ammunition types.<br/>
			- Added multiple new vehicles and static weapons.<br/>
			- Vastly improved anti-cheat system.<br/>
			- Weapon caches are now spawned by crash sites upon server reset.<br/>
			- Helicopters and Planes are now guarded by AI upon server reset.<br/>
			- Significant changes made to Weapon Caches.<br/>
			- Towed vehicles can now hold players.<br/>
			- Players are no longer able to drop money for the first few minutes upon spawning.<br/>
			- Medikits used above 95hp are no longer consumed.<br/>
			- Numerous code improvements and clean-ups.<br/>
			- Added Cancel Action option to eating, drinking, locking and more.<br/>
			- OPFOR now start with an extra Makarov magazine.<br/>
			- Player bodies are now turned into tombstones upon death.<br/>
				- Player tombstones can be removed by using the Hide Grave action.<br/>
			- Mobile radar now disabled for Independent teams.<br/>
			- Weapons found in cars have been adjusted.<br/>
			- 10k money limit for players.<br/>
			- Spawn beacons can be packed and destroyed by Independent players.<br/><br/>

		Missions:<br/>
			- Added new VIP rescue mission.<br/>
			- Added new small helicopter side mission.<br/>
			- The Capture Outpost mission will now be airstriked and cleared of all AI and objects upon failure.<br/>
			- New APCs added to the mission list.<br/>
			- New Recon Vehicles added to the mission list.<br/>
			- New Light Tanks added to the mission list.<br/>
			- New Light Helicopters added to the mission list.<br/>
			- US Special Weapons is no longer the only consisting crate to spawn for the Aircraft Wreck mission.<br/>
			- Reduced delay between missions.<br/><br/>

		Bug Fixes:<br/>
			- Fixed a bug that allowed multiple cars to be towed to the same vehicle.<br/>
			- Fixed a bug that allowed players to be loaded into vehicles whilst still on a stationary gun.<br/>
			- Fixed a bug where the mission Capture Outpost was not despawning after failing.<br/>
			- Fixed a bug where Spawn Beacons were not working for Independent players and groups.<br/>
			- Fixed a bug where multiple helicopter explosions would occur upon server reset.<br/>
			- Fixed a bug that allowed a player to drop money whilst buying a weapon from the gunstore.<br/>
			- Sell Current Weapon gunstore feature is now fixed and working as intended.<br/>
			- Spamming Buy Weapon no longer causes undefined behaviour.<br/>
			- Stopped players killing each other in the spawn area on connection.<br/>
			- Various other minor fixes to the gun store.<br/>
			- Fixed multiple small bugs with the mission system.<br/>
"
]
];

player createDiaryRecord["404Games",
[
"Credits",
"
	404Games Team:<br/><br/>
		Costlyy - Lead Developer<br/>
		Deadbeat - Developer<br/>
		Pulse - Developer<br/>
		Domuk - Community Manager<br/><br/>
    
	404Games Testers:<br/><br/>
		Jellafish<br/>
		Smibbs<br/>
		Gwen<br/>
		Joshy Fagence<br/>
"
]
];

player createDiaryRecord["404Games",
[
"Bug and Cheat Reporting",
"
<br/>
	Found a bug? Please report it at: http://www.404games.co.uk/bugs<br/><br/>
	Suspect a player is hacking or exploiting? Please report it at: http://www.404games.co.uk/bans<br/><br/>
"
]
];

player createDiaryRecord["404Games",
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

player createDiaryRecord["Wasteland",
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

player CreateDiaryRecord["Wasteland",
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