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
			case "fuelFull": {player setVariable["fuelFull",(player getVariable "fuelFull")-1,true]; _temp = "Fuel_can" createVehicle (position player); _temp setVariable["fuel", true, true]; _temp setPos _pos;};
			case "fuelEmpty": {player setVariable["fuelEmpty", (player getVariable "fuelEmpty")-1,true]; _temp = "Fuel_can" createVehicle (position player); _temp setVariable["fuel", false, true]; _temp setPos _pos;};
			case "repairkits": {player setVariable["repairkits", (player getVariable "repairkits")-1,true]; _temp = "Suitcase" createVehicle (position player); _temp setPos _pos;};
			case "water": {player setVariable["water", (player getvariable "water")-1,true]; _temp = "Land_Teapot_EP1" createVehicle (position player); _temp setPos _pos;};
			case "medkit": {player setVariable["medkits", (player getVariable "medkits")-1,true]; _temp = "CZ_VestPouch_EP1" createVehicle (position player); _temp setPos _pos;};
		};
			dropActive = false;
			closeDialog 0;
	};
};