#include "dialog\player_sys.sqf";
#define GET_DISPLAY (findDisplay playersys_DIALOG)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
if(isNil {dropActive}) then {dropActive = false};
disableSerialization;

private["_switch","_data","_vehicle_type","_pos","_bomb"];
_switch = _this select 0;
_data = GET_SELECTED_DATA(item_list);
switch(_switch) do 
{
	case 0:
	{
		closeDialog 0;
		switch(_data) do 
		{
			case "bombs":
			{
				player playmove "AinvPknlMstpSlayWrflDnon";
				player setVariable["bombs", false, false];
				sleep 1.2;
				hint "You have placed the bomb!\n\n20 seconds till it explodes!";
				_pos = getPosATL player;
				_pos set [2, (_pos select 2) + 0.05];
				_bomb = "bomb" createVehicle getPos player;
				_vecu = vectorUp _bomb;
				_bomb setPosATL _pos;
				_bomb setVectorUp _vecu;
				/*_bomb spawn {for "_i" from 1 to 10 do {switch(_i) do {
						case 10: {_this say3D "CodeRight"; sleep 1; _this say3D "CodeRight";};
						default {_this say3D "missile_inbound";};
						};sleep 1.95;};};*/
				_bomb enableSimulation false;
				_bomb setVariable["bArmed", true, true];

				[_bomb] execVM "client\systems\playerMenu\bomb.sqf";
			};

			case "fuelFull": 
			{
				[] call compile preProcessFile "client\systems\playerMenu\refuel.sqf";
			};

			case "fuelEmpty": 
			{
				hint "You can refuel Fuel Can at gas station through action menu";
			};

			case "repairkits": 
			{
				[] call compile preProcessFile "client\systems\playerMenu\repair.sqf";
			};

			case "canfood": 
			{
				if((vehicle player) == player) then { player playmove "AinvPknlMstpSnonWnonDnon_healed_1"; };
				player setVariable["canfood",(player getVariable "canfood")-1,true];
				hungerLevel = hungerLevel + 30;
				if(hungerLevel > 100) then {hungerLevel = 100};
				hint format["You have eaten some canned food\nHunger Level: %1",hungerLevel];
				sleep  1;
				player playmove "AinvPknlMstpSnonWnonDnon_healed_1";
			};
			case "water": 
			{
				if((vehicle player) == player) then { player playmove "AinvPknlMstpSnonWnonDnon_healed_1"; };
				player setVariable["water",(player getVariable "water")-1,true];
				thirstLevel = thirstLevel + 50;
				if(thirstLevel > 100) then {thirstLevel = 100};
				hint format["You've drank some water.\n\n Hydration Level: %1",thirstLevel];
				sleep  1;
				player playmove "AinvPknlMstpSnonWnonDnon_healed_1";
			};

			case "medkit": 
			{
				if((damage player) < 0.25) exitwith {

					if((damage player) < 0.01) then {
						hint "You do not require a medkit";
					} else {
						hint "You have healed minor injures";
					};
					player setDamage 0;
				};

				if((vehicle player) == player) then { player playmove "AinvPknlMstpSlayWrflDnon_medic"; };

				player setVariable["medkits",(player getVariable "medkits")-1,true];
				sleep 6.5;
				player setDamage 0;
				hint "You are now fully healed";
			};
		};
	};

	case 1:
	{

		if(_data == "") exitWith {hint "You didn't select anything to drop";};
		if(dropActive) exitwith {hint "You're already dropping something";};
		if(vehicle player != player) exitwith {hint "You can't use this action while in a vehicle."};
		player playmove "AinvPknlMstpSlayWrflDnon";
		dropActive = true;
		sleep 1.5;
		_pos = getPosATL player;
		//Drops the item and sets values & variables
		switch(_data) do 
		{
			case "canfood": {player setVariable["canfood",(player getVariable "canfood")-1,true]; _temp = "Land_Bag_EP1" createVehicle (position player); _temp setPos [(_pos select 0)+1, _pos select 1, _pos select 2]; _temp setVariable["food",10,true];};
			case "rabitmeat": {player setVariable["rabitmeat", (player getVariable "rabitmeat")-1,true]; _temp = "Land_Sack_EP1" createVehicle (position player); _temp setPos _pos; _temp setVariable["raw", true, true]; _temp setVariable["item", "rabit",true]};
			case "fuelFull": {player setVariable["fuelFull", false,false]; _temp = "Fuel_can" createVehicle (position player); _temp setVariable["fuel", true, true]; _temp setPos _pos;};
			case "fuelEmpty": {player setVariable["fuelEmpty", false,false]; _temp = "Fuel_can" createVehicle (position player); _temp setVariable["fuel", false, true]; _temp setPos _pos;};
			case "repairkits": {player setVariable["repairkits", (player getVariable "repairkits")-1,true]; _temp = "Suitcase" createVehicle (position player); _temp setPos _pos;};
			case "water": {player setVariable["water", (player getvariable "water")-1,true]; _temp = "Land_Teapot_EP1" createVehicle (position player); _temp setPos _pos;};
			case "medkit": {player setVariable["medkits", (player getVariable "medkits")-1,true]; _temp = "CZ_VestPouch_EP1" createVehicle (position player); _temp setPos _pos;};
			case "goatmeat": {player setVariable["goatmeat", (player getVariable "goatmeat")-1,true]; _temp = "Land_Sack_EP1" createVehicle (position player); _temp setPos _pos; _temp setVariable["raw", true, true]; _temp setVariable["item", "goat",true]};
			case "cowmeat": {player setVariable["cowmeat", (player getVariable "cowmeat")-1,true]; _temp = "Land_Sack_EP1" createVehicle (position player); _temp setPos _pos; _temp setVariable["raw", true, true]; _temp setVariable["item", "cow",true]};
			case "boarmeat": {player setVariable["boarmeat", (player getVariable "boarmeat")-1,true]; _temp = "Land_Sack_EP1" createVehicle (position player); _temp setPos _pos; _temp setVariable["raw", true, true]; _temp setVariable["item", "boar",true]};
			case "chickenmeat": {player setVariable["chickenmeat", (player getVariable "chickenmeat")-1,true]; _temp = "Land_Sack_EP1" createVehicle (position player); _temp setPos _pos; _temp setVariable["raw", true, true]; _temp setVariable["item", "chicken",true]};
			case "chickenmeatc": {player setVariable["chickenmeatc", (player getVariable "chickenmeatc")-1,true]; _temp = "Land_Sack_EP1" createVehicle (position player); _temp setPos _pos; _temp setVariable["item", "chicken",true]; _temp setVariable["raw",false,true];};
			case "sheepmeat": {player setVariable["sheepmeat", (player getVariable "sheepmeat")-1,true]; _temp = "Land_Sack_EP1" createVehicle (position player); _temp setPos _pos; _temp setVariable["raw", true, true]; _temp setVariable["item", "sheep",true]};
			case "rabitmeatc": {player setVariable["rabitmeatc", (player getVariable "rabitmeatc")-1,true]; _temp = "Land_Sack_EP1" createVehicle (position player); _temp setPos _pos; _temp setVariable["item", "rabit",true]; _temp setVariable["raw",false,true];};
			case "boarmeatc": {player setVariable["boarmeatc", (player getVariable "boarmeatc")-1,true]; _temp = "Land_Sack_EP1" createVehicle (position player); _temp setPos _pos; _temp setVariable["item", "boar",true]; _temp setVariable["raw",false,true];};
			case "goatmeatc": {player setVariable["goatmeatc", (player getVariable "goatmeatc")-1,true]; _temp = "Land_Sack_EP1" createVehicle (position player); _temp setPos _pos; _temp setVariable["item", "goat",true]; _temp setVariable["raw",false,true];};
			case "cowmeatc": {player setVariable["cowmeatc", (player getVariable "cowmeatc")-1,true]; _temp = "Land_Sack_EP1" createVehicle (position player); _temp setPos _pos; _temp setVariable["item", "cow",true]; _temp setVariable["raw",false,true];};
			case "sheepmeatc": {player setVariable["sheepmeatc", (player getVariable "sheepmeatc")-1,true]; _temp = "Land_Sack_EP1" createVehicle (position player); _temp setPos _pos; _temp setVariable["item", "sheep",true]; _temp setVariable["raw",false,true];};
			case "bombs": {
				_bomb = "bomb" createVehicle getPos player;
				_bomb setVariable["bArmed", false, true];
				_bomb enableSimulation false;
				player setVariable["bombs", false, false];
				_pos set [2, (_pos select 2) + 0.05];
				_bomb setPosATL _pos;
			};
		};
			dropActive = false;
			closeDialog 0;
	};
};