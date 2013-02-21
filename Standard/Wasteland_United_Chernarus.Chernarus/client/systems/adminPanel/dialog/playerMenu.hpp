#define playerMenuDialog 55500
#define playerMenuPlayerSkin 55501
#define playerMenuPlayerGun 55502
#define playerMenuPlayerItems 55503
#define playerMenuPlayerPos 55504
#define playerMenuPlayerList 55505
#define playerMenuSpectateButton 55506
#define playerMenuPlayerObject 55507
#define playerMenuPlayerHealth 55508
#define playerMenuWarnMessage 55509

class PlayersMenu
{
	idd = playerMenuDialog;
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		
		class MainBackground: w_RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			x = 0.1875 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.837499 * safezoneW;
			h = 0.661111 * safezoneH;
		};

		class DialogTitleText: w_RscText
		{
			idc = -1;
			text = "Player Menu";

			x = 0.203125 * safezoneW + safezoneX;
			y = 0.175 * safezoneH + safezoneY;
			w = 0.0844792 * safezoneW;
			h = 0.0448148 * safezoneH;
		};

		class PlayerObjectText: w_RscText
		{
			idc = playerMenuPlayerObject;
			text = "Slot:";
			sizeEx = 0.030;
			x = 0.225 * safezoneW + safezoneX;
			y = 0.59 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class PlayerSkinText: w_RscText
		{
			idc = playerMenuPlayerSkin;
			text = "Skin:";
			sizeEx = 0.030;
			x = 0.225 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class PlayerGunText: w_RscText
		{
			idc = playerMenuPlayerGun;
			text = "Money:";
			sizeEx = 0.030;
			x = 0.225 * safezoneW + safezoneX;
			y = 0.63 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class PlayerItemsText: w_RscText
		{
			idc = playerMenuPlayerItems;
			text = "Items:";
			sizeEx = 0.030;
			x = 0.225 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.40 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class PlayerHealthText: w_RscText
		{
			idc = playerMenuPlayerHealth;
			text = "Health:";
			sizeEx = 0.030;
			x = 0.225 * safezoneW + safezoneX;
			y = 0.67 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class PlayerPosistionText: w_RscText
		{
			idc = playerMenuPlayerPos;
			text = "Position:";
			sizeEx = 0.030;
			x = 0.225 * safezoneW + safezoneX;
			y = 0.69 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.04 * safezoneH;
		};
	};
	
	class controls {

		class PlayerEditBox:w_RscEdit
		{
			idc=playerMenuWarnMessage;
			x = 0.60 * safezoneW + safezoneX;
			y = 0.745 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class PlayerListBox: w_RscListbox
		{
			idc = playerMenuPlayerList;
			onLBSelChanged="[2,_this select 1] execVM ""client\systems\adminPanel\importvalues.sqf"";";
			x = 0.227604 * safezoneW + safezoneX;
			y = 0.25463 * safezoneH + safezoneY;
			w = 0.545417 * safezoneW;
			h = 0.343889 * safezoneH;
		};

		class SpectateButton: w_RscButton
		{
			idc = playerMenuSpectateButton;
			text = "Spectate";
			onButtonClick = "[0] execVM 'client\systems\adminPanel\playerSelect.sqf'";
			x = 0.2 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class WarnButton: w_RscButton
		{
			idc = -1;
			text = "Warn";
			onButtonClick = "[1] execVM 'client\systems\adminPanel\playerSelect.sqf'";
			x = 0.535 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
		};

		class SlayButton: w_RscButton
		{
			idc = -1;
			text = "Slay";
			onButtonClick = "[2] execVM 'client\systems\adminPanel\playerSelect.sqf'";
			x = 0.2625 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};

		class UnlockTeamSwitchButton: w_RscButton
		{
			idc = -1;
			text = "Unlock Team Switch";
			onButtonClick = "[3] execVM 'client\systems\adminPanel\playerSelect.sqf'";
			x = 0.325 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			color[] = {0.1,0.95,0.1,1};
		};

		class UnlockTeamKillerButton: w_RscButton
		{
			idc = -1;
			text = "Unlock Team Kill";
			onButtonClick = "[4] execVM 'client\systems\adminPanel\playerSelect.sqf'";
			x = 0.4375 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.0875 * safezoneW;
			h = 0.04 * safezoneH;
			color[] = {0.1,0.95,0.1,1};
		};
	};
};


