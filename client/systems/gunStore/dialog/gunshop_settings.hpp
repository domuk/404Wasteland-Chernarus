#include "gunstoreDefines.sqf"

class gunshopd {

	idd = gunshop_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	//onLoad = "[] execVM 'client\systems\gunStore\gunStoreInit.sqf'";

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
			text = "Gun Store Menu";
			
			x = 0.35; y = 0.109;
			w = 0.4; h = 0.07;
		};

		class PlayerMoney : w_RscText {
		
			idc = gunshop_money;
			
			text = "";
			sizeEx = 0.025;
		
			x = 0.89; y = 0.109;
			w = 0.4; h = 0.07;
		};

		class TotalInCart : w_RscText {
		
			idc = gunshop_total;
			
			text = "Total: $0";
			sizeEx = 0.025;
		
			x = 0.89; y = 0.600;
			w = 0.4; h = 0.07;
		};

		class GunPrice: w_RscText {
		
			idc = gunshop_gun_TEXT;
			
			text = "";
			sizeEx = 0.025;
		
			x = 0.732; y = 0.300;
			w = 0.125; h = 0.05;
		};

		class gunPicture : w_RscPicture {
			
			idc = gunshop_gun_pic;
		
            text = "";
            sizeEx = 0.025;
		
            x = 0.675; y = 0.2;
            w = 0.200; h = 0.110;
		};
	};
	
	class controls {
		
		class CurrentItems : w_Rsclist {
		
			idc = gunshop_gun_list;
			onLBSelChanged = "[] execvm 'client\systems\gunStore\weaponInfo.sqf'";
		
			x = 0.50; y = 0.200;
			w = 0.150; h = 0.400;
		};

		class PlayerCart : w_Rsclist {
		
			idc = gunshop_cart;
		
			x = 0.90; y = 0.200;
			w = 0.150; h = 0.400;
		};

		class BuyGuns : w_RscButton {
			
			text = "Guns";
			onButtonClick = "[0] execVM 'client\systems\gunStore\populateGunStore.sqf'";
			
			x = 0.35; y = 0.200;
			w = 0.125; h = 0.05;
		};

		class BuyAmmo : w_RscButton {
			
			text = "Ammo";
			onButtonClick = "[1] execVM 'client\systems\gunStore\populateGunStore.sqf'";
			
			x = 0.35; y = 0.250;
			w = 0.125; h = 0.05;
		};

		class BuyAccessories : w_RscButton {
			
			text = "Accessories";
			onButtonClick = "[2] execVM 'client\systems\gunStore\populateGunStore.sqf'";
			
			x = 0.35; y = 0.300;
			w = 0.125; h = 0.05;
		};

		class AddToCart : w_RscButton {
			
			text = "Add";
			onButtonClick = "[] execVM 'client\systems\gunStore\addToCart.sqf'";
			
			x = 0.720; y = 0.375;
			w = 0.125; h = 0.05;
		};

		class RemoveFromCart : w_RscButton {
			
			text = "Remove";
			onButtonClick = "[] execVM 'client\systems\gunStore\removeFromCart.sqf'";
			
			x = 0.720; y = 0.425;
			w = 0.125; h = 0.05;
		};

		class CancelButton : w_RscButton {
			
			text = "Cancel";
			onButtonClick = "closeDialog 0;";
			
			x = 0.35; y = 0.685;
			w = 0.125; h = 0.05;
		};

		class SellCurrentWeapon : w_RscButton {
			
			text = "Sell Current Weapon";
			onButtonClick = "[] execVM 'client\systems\gunStore\sellWeapon.sqf'";
			
			x = 0.625; y = 0.685;
			w = 0.125; h = 0.05;
		};

		class BuyToPlayer : w_RscButton {
			
			text = "Buy to Player";
			onButtonClick = "[0] execVM 'client\systems\gunStore\buyGuns.sqf'";
			
			x = 0.775; y = 0.685;
			w = 0.125; h = 0.05;
		};

		class BuyToCrate : w_RscButton {
			
			text = "Buy to Crate";
			onButtonClick = "[1] execVM 'client\systems\gunStore\buyGuns.sqf'";
			
			x = 0.925; y = 0.685;
			w = 0.125; h = 0.05;
		};

	};
};