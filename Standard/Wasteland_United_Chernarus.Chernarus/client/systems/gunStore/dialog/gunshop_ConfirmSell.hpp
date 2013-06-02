#include "gunstoreDefines.sqf"

class ConfirmSellDialog {

	idd = confirmSell;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class MainBG:w_RscPicture {
			idc = -1;
			text = "\ca\ui\data\ui_audio_background_ca.paa";
			moving = true;

			x = 0.25;
			y = 0.10;
			w = 0.70;
			h = 0.35 * (SafeZoneW / SafeZoneH);
		};

		class ConfirmMainText:w_RscText {
			idc = -1;
			style = ST_CENTER;
			text = "Are you sure you want to sell:";
			sizeEx = 0.04;
			shadow = 2;
			
			x = 0.35;
			y = 0.20;
			w = 0.46;
			h = 0.03;
		};		

		class WeaponNameText:w_RscText {
			idc = confirmSellWeapon;
			type = CT_STRUCTURED_TEXT+ST_LEFT;
			size = 0.04;
			
			x = 0.26;
			y = 0.25;
			w = 0.65;
			h = 0.358;

			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			text = "$weapon";
			
			class Attributes {
    			font = "TahomaB";
    			align = "center";
    			valign = "middle";
    			shadow = 2;
  			};
		};

		class ConfirmSubText:w_RscText {
			idc = -1;
			style = ST_CENTER;
			text = "For value (Gun & Ammo):";
			sizeEx = 0.04;
			shadow = 2;
			
			x = 0.35;
			y = 0.30;
			w = 0.46;
			h = 0.03;
		};	

		class WeaponValueText:w_RscText {
			idc = confirmSellValue;
			type = CT_STRUCTURED_TEXT+ST_LEFT;
			size = 0.04;
			
			x = 0.26;
			y = 0.35;
			w = 0.65;
			h = 0.358;

			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			text = "$value";
			
			class Attributes {
    			font = "TahomaB";
    			align = "center";
    			valign = "middle";
    			shadow = 2;
  			};
		};
	};
	
	class controls {
		class ForgiveButton:w_RscButton {
			idc = -1;
			text = "YES";
			onButtonClick = "[] call sellWeaponConfirmed";

			size = 0.031;
			color[] = {0.10, 0.95, 0.10, 1};
			
			x = 0.30; 
			y = 0.435;

			w = 0.16; 
			h = 0.065;
		};
		

		class PunishButton:w_RscButton {
			idc = -1;
			text = "NO";
			onButtonClick = "closeDialog 0";

			size = 0.031;
			color[] = {0.95, 0.10, 0.10, 1};
			
			x = 0.71; 
			y = 0.435;

			w = 0.16; 
			h = 0.065;
		};

	};
};