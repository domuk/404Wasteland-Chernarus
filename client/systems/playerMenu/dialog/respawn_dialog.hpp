#define respawn_dialog 3400
#define respawn_Content_Text 3401
#define respawn_MissionUptime_Text 3402
#define respawn_Town_Button0 3403
#define respawn_Town_Button1 3404
#define respawn_Town_Button2 3405
#define respawn_Town_Button3 3406
#define respawn_Town_Button4 3407


	class RespawnSelectionDialog {
		idd = respawn_dialog;
		movingEnable = false;
		enableSimulation = true;
		onLoad = "uiNamespace setVariable ['RespawnSelectionDialog', _this select 0]";
	
	class controlsBackground {

		class MainBackground: RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";

			x = 0.2745 * safezoneW + safezoneX;
			y = 0.166 * safezoneH + safezoneY;
			w = 0.600 * safezoneW;
			h = 0.650 * safezoneH;
		};

		class RespawnMenuTitle: RscText
		{
			idc = -1;
			text = "Respawn Menu";
			sizeEx = 0.06;

			x = 0.4475 * safezoneW + safezoneX;
			y = 0.190 * safezoneH + safezoneY;
			w = 0.105 * safezoneW;
			h = 0.035 * safezoneH;
		};

		class RespawnStructuredText: RscStructuredText
		{
			idc = respawn_Content_Text;
			text = "";

			x = 0.350 * safezoneW + safezoneX;
			y = 0.246 * safezoneH + safezoneY;
			w = 0.300 * safezoneW;
			h = 0.060 * safezoneH;
		};

		class TopLine: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";

			x = 0.328 * safezoneW + safezoneX;
			y = 0.360 * safezoneH + safezoneY;
			w = 0.343 * safezoneW;
			h = 0.0025 * safezoneH;
		};

		class MiddleLine: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";

			x = 0.328 * safezoneW + safezoneX;
			y = 0.426 * safezoneH + safezoneY;
			w = 0.343 * safezoneW;
			h = 0.0025 * safezoneH;
		};

		class BottomLine: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(1,1,1,1)";

			x = 0.328 * safezoneW + safezoneX;
			y = 0.693 * safezoneH + safezoneY;
			w = 0.343 * safezoneW;
			h = 0.0025 * safezoneH;
		};

		class MissionUptimeText: RscText
		{
			idc = respawn_MissionUptime_Text;
			text = "Mission Uptime: 00:00:00";

			x = 0.562 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.110 * safezoneW;
			h = 0.025 * safezoneH;
		};
	};
	
	class controls {

		class RandomSpawnButton: w_RscButton
		{
			idc = -1;
			onButtonClick = "[0] execVM 'client\functions\spawnAction.sqf'";
			text = "Random";

			x = 0.460* safezoneW + safezoneX;
			y = 0.310 * safezoneH + safezoneY;
			w = 0.078 * safezoneW;
			h = 0.033 * safezoneH;
		};
	
		class LoadTownsButton: w_RscButton
		{
			idc = -1;
			onButtonClick = "[0] execVM 'client\functions\switchButtonNames.sqf'";
			text = "Towns";

			x = 0.406 * safezoneW + safezoneX;
			y = 0.384 * safezoneH + safezoneY;
			w = 0.078 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class LoadBeaconsButton: w_RscButton
		{
			idc = -1;
			onButtonClick = "[1] execVM 'client\functions\switchButtonNames.sqf'";
			text = "Beacons";

			x = 0.515 * safezoneW + safezoneX;
			y = 0.384 * safezoneH + safezoneY;
			w = 0.078 * safezoneW;
			h = 0.033 * safezoneH;
		};
	
		class TownButton0: w_RscButton
		{
			idc = respawn_Town_Button0;
			onButtonClick = "[1,0] execVM 'client\functions\spawnAction.sqf'";
			text = "";

			x = 0.343 * safezoneW + safezoneX;
			y = 0.443 * safezoneH + safezoneY;
			w = 0.078 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class TownButton1: w_RscButton
		{
			idc = respawn_Town_Button1;
			onButtonClick = "[1,1] execVM 'client\functions\spawnAction.sqf'";
			text = "";

			x = 0.343 * safezoneW + safezoneX;
			y = 0.493 * safezoneH + safezoneY;
			w = 0.078 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class TownButton2: w_RscButton
		{
			idc = respawn_Town_Button2;
			onButtonClick = "[1,2] execVM 'client\functions\spawnAction.sqf'";
			text = "";

			x = 0.343 * safezoneW + safezoneX;
			y = 0.543 * safezoneH + safezoneY;
			w = 0.078 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class TownButton3: w_RscButton
		{
			idc = respawn_Town_Button3;
			onButtonClick = "[1,3] execVM 'client\functions\spawnAction.sqf'";
			text = "";

			x = 0.343 * safezoneW + safezoneX;
			y = 0.593 * safezoneH + safezoneY;
			w = 0.078 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class TownButton4: w_RscButton
		{
			idc = respawn_Town_Button4;
			onButtonClick = "[1,4] execVM 'client\functions\spawnAction.sqf'";
			text = "";

			x = 0.343 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.078 * safezoneW;
			h = 0.033 * safezoneH;
		};

		class BackToLobby: w_RscButton
		{
			idc = -1;
			onButtonClick = "endMission 'LOSER'";
			text = "Lobby";

			x = 0.328 * safezoneW + safezoneX;
			y = 0.752 * safezoneH + safezoneY;
			w = 0.078 * safezoneW;
			h = 0.033 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};	
	};
};