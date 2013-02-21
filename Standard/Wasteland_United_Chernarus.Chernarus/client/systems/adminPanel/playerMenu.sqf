//	@file Version: 1.0
//	@file Name: playerMenu.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define playerMenuDialog 55500
#define playerMenuPlayerList 55505
                
disableSerialization;
				
private ["_start","_dialog","_playerListBox","_decimalPlaces","_health","_namestr","_index","_punishCount","_side"];
_uid = getPlayerUID player;
if ((_uid in moderators) OR (_uid in administrators) OR (_uid in serverAdministrators)) then {
	_start = createDialog "PlayersMenu";
	_punishCount = 0;				
	_dialog = findDisplay playerMenuDialog;
	_playerListBox = _dialog displayCtrl playerMenuPlayerList;
	                
	{
		{if((_x select 0) == (getPlayerUID player)) then {_punishCount = _x select 1;};}forEach pvar_teamKillList;
	    if(str(playerSide) in ["WEST"] OR str(playerSide) in ["EAST"]) then {if(str(playerSide) in ["WEST"]) then {_side = "Blufor";} else {_side = "Opfor";};} else {_side = "Independent";};
		_namestr = name(_x) + " [UID:" + getplayerUID(_x) + "] [Side:" + format["%1",_side] + "] [Vehicle:" + Format["%1",typeOf(vehicle _x)] + "] [Speed:" + format["%1",round(speed (vehicle _x))] + "] [Weap:" + format["%1",currentWeapon (vehicle _x)] + "] [Punish Count:" + format["%1",_punishCount]+ "]";             
		_index = _playerListBox lbAdd _namestr;
		_playerListBox lbSetData [_index, str(_x)];   
	} forEach playableUnits;
} else {
  exit;  
};