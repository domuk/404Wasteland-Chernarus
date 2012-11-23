#include "genstoreDefines.sqf"

class genstored {

	idd = genstore_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'client\systems\generalStore\populateGenStore.sqf'";

	class controlsBackground {
		
		class MainBG : w_RscPicture {
		
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			
			moving = true;
			
			x = 0.325; y = 0.1;
			w = 1.0; h = 0.65;
		};
		
		class MainTitle : w_RscText {
		
			idc = -1;
			text = "General Store Menu";
			
			x = 0.35; y = 0.109;
			w = 0.4; h = 0.07;
		};

		class PlayerMoney : w_RscText {
		
			idc = genstore_money;
			
			text = "";
			sizeEx = 0.025;
		
			x = 0.89; y = 0.109;
			w = 0.4; h = 0.07;
		};

		class TotalInCart : w_RscText {
		
			idc = genstore_total;
			
			text = "Total: $0";
			sizeEx = 0.025;
		
			x = 0.89; y = 0.600;
			w = 0.4; h = 0.07;
		};

		class ItemPrice: w_RscText {
		
			idc = genstore_item_TEXT;
			
			text = "";
			sizeEx = 0.025;
		
			x = 0.732; y = 0.300;
			w = 0.125; h = 0.05;
		};

		class ItemPicture : w_RscPicture {
			
			idc = genstore_item_pic;
		
            text = "";
            sizeEx = 0.025;
		
            x = 0.675; y = 0.2;
            w = 0.200; h = 0.110;
		};
	};
	
	class controls {
		
		class CurrentItems : w_Rsclist {
		
			idc = genstore_item_list;
			onLBSelChanged = "[] execvm 'client\systems\generalStore\itemInfo.sqf'";
		
			x = 0.50; y = 0.200;
			w = 0.150; h = 0.400;
		};

		class PlayerCart : w_Rsclist {
		
			idc = genstore_cart;
		
			x = 0.90; y = 0.200;
			w = 0.150; h = 0.400;
		};

		class LoadItems : w_RscButton {
			
			idc = genstore_iteminventory;

			text = "Items";
			onButtonClick = "[] execVM 'client\systems\generalStore\populateSwitch.sqf'";
			
			x = 0.35; y = 0.200;
			w = 0.125; h = 0.05;
		};

		class AddToCart : w_RscButton {
			
			text = "Add";
			onButtonClick = "[] execVM 'client\systems\generalStore\addToCart.sqf'";
			
			x = 0.720; y = 0.375;
			w = 0.125; h = 0.05;
		};

		class RemoveFromCart : w_RscButton {

			text = "Remove";
			onButtonClick = "[] execVM 'client\systems\generalStore\removeFromCart.sqf'";
			
			x = 0.720; y = 0.425;
			w = 0.125; h = 0.05;
		};

		class CancelButton : w_RscButton {
			
			text = "Cancel";
			onButtonClick = "closeDialog 0;";
			
			color[] = {0.95, 0.10, 0.10, 1};
			x = 0.350; y = 0.685;
			w = 0.125; h = 0.05;
		};

		class SaleBuy : w_RscButton {
			
			idc = genstore_switch;

			text = "Sell Items";
			onButtonClick = "[] execVM 'client\systems\generalStore\switchMode.sqf'";

			x = 0.635; y = 0.685;
			w = 0.125; h = 0.05;
		};

		class BuyToPlayer : w_RscButton {
			
			idc = genstore_buysell;

			text = "Buy";
			onButtonClick = "[0] execVM 'client\systems\generalStore\buysellSwitch.sqf'";

			color[] = {0.10, 0.95, 0.10, 1};
			x = 0.920; y = 0.685;
			w = 0.125; h = 0.05;
		};

	};
};