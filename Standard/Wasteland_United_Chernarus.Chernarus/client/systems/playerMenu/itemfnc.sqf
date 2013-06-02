
//	@file Version: 1.0
//	@file Name: itemfnc.sqf
//  @file Author: [404] Costlyy, [404] Deadbeat
//	@file Created: 01/01/1970 00:00
//	@file Args: [int (0 = use | 1 = drop)]

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
	case 0: // Use item
	{
		closeDialog 0;
		switch(_data) do 
		{
			case "fuelFull": 
			{
				[] call refuelVehicle;
			};

			case "fuelEmpty": 
			{
				hint "You can refuel Fuel Can at gas station through action menu";
			};

			case "repairkits": 
			{
				[] call repairVehicle;
			};

			case "canfood": 
			{
				[0] call useEdibleItem;
			};
			case "water": 
			{
				[1] call useEdibleItem; 
			};
			case "medkit": 
			{
                [] call useMedicalKit;
			};
			case "camonet": 
			{
				[] call placeCammoNet;
			};            
            case "spawnBeacon": 
            {
            	[] call placeSpawnBeacon;
            };
		};
	};

	case 1: //Drop item
	{

		if(_data == "") exitWith {
        	player globalChat "YOU NEED TO SELECT AN ITEM TO DROP!";
        };
		// Check if mutex lock is active.
		if(mutexScriptInProgress) exitWith {
			player globalChat "YOU ARE ALREADY PERFORMING ANOTHER ACTION!";
		};
        
		if(vehicle player != player) exitwith {
        	player globalChat "YOU ARE CURRENTLY BUSY!";
        };
        
        if (!(player getVariable "canDrop")) exitWith {
        	player globalChat "YOU CANNOT DROP ITEMS YET!";
        };
        
        mutexScriptInProgress = true;
        _prevState = animationState player;
        
		player switchMove "AinvPknlMstpSlayWrflDnon_medic"; // Begin the full medic animation...
		sleep 3;
		_pos = getPosATL player;
        
		//Drops the item and sets values & variables
		switch(_data) do 
		{
			case "canfood": {player setVariable["canfood",(player getVariable "canfood")-1,true]; _temp = "Land_Sack_EP1" createVehicle (position player); _temp setPos [(_pos select 0)+1, _pos select 1, _pos select 2]; _temp setVariable["food",10,true];};
			case "fuelFull": {player setVariable["fuelFull",(player getVariable "fuelFull")-1,true]; _temp = "Fuel_can" createVehicle (position player); _temp setVariable["fuel", true, true]; _temp setPos _pos;};
			case "fuelEmpty": {player setVariable["fuelEmpty", (player getVariable "fuelEmpty")-1,true]; _temp = "Fuel_can" createVehicle (position player); _temp setVariable["fuel", false, true]; _temp setPos _pos;};
			case "repairkits": {player setVariable["repairkits", (player getVariable "repairkits")-1,true]; _temp = "Suitcase" createVehicle (position player); _temp setPos _pos;};
			case "water": {player setVariable["water", (player getvariable "water")-1,true]; _temp = "Land_Teapot_EP1" createVehicle (position player); _temp setPos _pos;};
			case "medkit": {player setVariable["medkits", (player getVariable "medkits")-1,true]; _temp = "CZ_VestPouch_EP1" createVehicle (position player); _temp setPos _pos;};
            case "spawnBeacon": {
	            player setVariable["spawnBeacon", (player getVariable "spawnBeacon")-1,true]; 
	            _droppedBeacon = "Satelit" createVehicle (position player);
	            _droppedBeacon setVariable["spawnsRemaining", 100, true];
	            _droppedBeacon setVariable["faction","WORLD",true];
	            _droppedBeacon setPos _pos;
            };
		};
        
       	sleep 1;
        
        mutexScriptInProgress = false;
        player SwitchMove _prevState; // Redundant reset of animation state to avoid getting locked in animation. 
        closeDialog 0; // To fix the listbox not updating properly.
	};
};