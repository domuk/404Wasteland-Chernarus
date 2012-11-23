#define respawn_dialog 3400
#define respawn_title 3401
#define respawn_text 3402
#define respawn_button_random 3403
#define respawn_button_random_title 3404
#define respawn_button_city 3410
#define respawn_button_city_title 3420

class RespawnSelectionDialog {
	idd = respawn_dialog;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "uiNamespace setVariable ['RespawnSelectionDialog', _this select 0]";
	
	class controlsBackground {
		class MainTitle:w_RscText {
			idc = respawn_title;
			style = ST_CENTER;
			text = "Respawn Menu";
			sizeEx = 0.10;
			shadow = 2;
			
			x = 0.25;
			y = 0.05;
			w = 0.50;
			h = 0.1;
		};

		class WhiteLine:w_RscText {
			idc = -1;
			text = "";
			sizeEx = 0.01;

			colorBackground[] = {1,1,1,1};
			
			x = 0.1;
			y = 0.15;
			w = 0.8;
			h = 0.005;
		};

		class WhiteLine2:WhiteLine {
			idc = -1;
			y = 0.37;
		};

		class RespawnText:w_RscText {
			idc = respawn_text;
			type = CT_STRUCTURED_TEXT+ST_LEFT;
			size = 0.0305;
			shadow = 2;

			x = 0.1;
			y = 0.17;
			w = 0.8;
			h = 0.1;

			text = "Please select where you would like to spawn. In order to spawn in specific town it should have at least 1 friendly player in it and no enemy players.";
		};

		class RandomTitle:w_RscText {
			idc = respawn_button_random_title;
			type = CT_STRUCTURED_TEXT+ST_LEFT;
			size = 0.0305;
			shadow = 2;

			x = 0.32;
			y = 0.305;
			w = 0.58;
			h = 0.03;

			text = "Random village or town around the map.";
		};

		class CityTitle1:w_RscText {
			idc = respawn_button_city_title;
			type = CT_STRUCTURED_TEXT+ST_LEFT;
			size = 0.0305;
			shadow = 2;

			x = 0.32;
			y = 0.405;
			w = 0.58;
			h = 0.03;

			text = "";
		};
		class CityTitle2:CityTitle1 {idc = respawn_button_city_title + 1; y = 0.465;};
		class CityTitle3:CityTitle1 {idc = respawn_button_city_title + 2; y = 0.525;};
		class CityTitle4:CityTitle1 {idc = respawn_button_city_title + 3; y = 0.585;};
		class CityTitle5:CityTitle1 {idc = respawn_button_city_title + 4; y = 0.645;};

		class ButtonBG1:w_RscPicture {
			idc = -1;
			text = "\ca\ui\data\igui_button_normal_ca.paa";
			colorText[] = {1, 1, 1, 0.2};

			x = 0.1;
			y = 0.4;
			w = 0.2;
			h = 0.06;// * (SafeZoneW / SafeZoneH);
		};
		class ButtonBG2:ButtonBG1 {y = 0.46;};
		class ButtonBG3:ButtonBG1 {y = 0.52;};
		class ButtonBG4:ButtonBG1 {y = 0.58;};
		class ButtonBG5:ButtonBG1 {y = 0.64;};
	};

	class controls {
		class RandomButton:w_RscButton {
			idc = respawn_button_random;
			text = "Random";
			onButtonClick = "-1 call spawnAction;";

			size = 0.03;
			shadow = 2;
			
			x = 0.1; y = 0.3;
			w = 0.2; h = 0.06;
		};

		class CityButton1:w_RscButton {
			idc = respawn_button_city;
			text = "";
			onButtonClick = "0 call spawnAction;";

			size = 0.03;
			shadow = 2;
			
			x = 0.1; y = 0.4;
			w = 0.2; h = 0.06;
		};
		class CityButton2:CityButton1 {idc = respawn_button_city + 1; onButtonClick = "1 call spawnAction;"; y = 0.46;};
		class CityButton3:CityButton1 {idc = respawn_button_city + 2; onButtonClick = "2 call spawnAction;"; y = 0.52;};
		class CityButton4:CityButton1 {idc = respawn_button_city + 3; onButtonClick = "3 call spawnAction;"; y = 0.58;};
		class CityButton5:CityButton1 {idc = respawn_button_city + 4; onButtonClick = "4 call spawnAction;"; y = 0.64;};
	};
};