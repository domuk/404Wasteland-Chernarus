#include "dialog\player_sys.sqf";
disableSerialization;

_switch = _this select 0;

_dialog2 = findDisplay playersys_DIALOG;
_itemList = _dialog2 displayCtrl item_list;

if(player getVariable "canfood" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Canned Food", player getVariable "canfood"];
_itemList lbSetData [(lbSize _itemList)-1, "canfood"];
};
if(player getVariable "rabitmeat" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Raw Rabbit Meat", player getVariable "rabitmeat"];
_itemList lbSetData [(lbSize _itemList)-1, "rabitmeat"];
};
if(player getVariable "rabitmeatc" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Cooked Rabbit Meat", player getVariable "rabitmeatc"];
_itemList lbSetData [(lbSize _itemList)-1, "rabitmeatc"];
};
if(player getVariable "cowmeat" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Raw Cow Meat", player getVariable "cowmeat"];
_itemList lbSetData [(lbSize _itemList)-1, "cowmeat"];
};
if(player getVariable "cowmeatc" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Cooked Cow Meat", player getVariable "cowmeatc"];
_itemList lbSetData [(lbSize _itemList)-1, "cowmeatc"];
};
if(player getVariable "chickenmeat" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Raw Chicken Meat", player getVariable "chickenmeat"];
_itemList lbSetData [(lbSize _itemList)-1, "chickenmeat"];
};
if(player getVariable "chickenmeatc" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Cooked Rabbit Meat", player getVariable "chickenmeatc"];
_itemList lbSetData [(lbSize _itemList)-1, "chickenmeatc"];
};
if(player getVariable "boarmeat" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Raw Boar Meat", player getVariable "boarmeat"];
_itemList lbSetData [(lbSize _itemList)-1, "boarmeat"];
};
if(player getVariable "boarmeatc" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Cooked Boar Meat", player getVariable "boarmeatc"];
_itemList lbSetData [(lbSize _itemList)-1, "boarmeatc"];
};
if(player getVariable "goatmeat" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Raw Goat Meat", player getVariable "goatmeat"];
_itemList lbSetData [(lbSize _itemList)-1, "goatmeat"];
};
if(player getVariable "goatmeatc" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Cooked Goat Meat", player getVariable "goatmeatc"];
_itemList lbSetData [(lbSize _itemList)-1, "goatmeatc"];
};
if(player getVariable "sheepmeat" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Raw Sheep Meat", player getVariable "sheepmeat"];
_itemList lbSetData [(lbSize _itemList)-1, "sheepmeat"];
};
if(player getVariable "sheepmeatc" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Cooked Sheep Meat", player getVariable "sheepmeatc"];
_itemList lbSetData [(lbSize _itemList)-1, "sheepmeatc"];
};
if(player getVariable "water" > 0) then {
_itemListIndex = _itemList lbAdd format["%1x - Water bottle", player getVariable "water"];
_itemList lbSetData [(lbSize _itemList)-1, "water"];
};
if(player getVariable "fuelFull") then {
_itemListIndex = _itemList lbAdd "Fuel Can";
_itemList lbSetData [(lbSize _itemList)-1, "fuelFull"];
};
if(player getVariable "fuelEmpty") then {
_itemListIndex = _itemList lbAdd "Empty Fuel Can";
_itemList lbSetData [(lbSize _itemList)-1, "fuelEmpty"];
};
if(player getVariable "repairkits" > 0) then {
_str = "Repair Kit";
if(player getVariable "repairkits" > 1) then {_str = format ["%1x - Repair Kit", player getVariable "repairkits"];}
else {_str = "Repair Kit"};
_itemListIndex = _itemList lbAdd _str;
_itemList lbSetData [(lbSize _itemList)-1, "repairkits"];
};
if(player getVariable "medkits" > 0) then {
_str = "Medkit";
if(player getVariable "medkits" > 1) then {_str = format ["%1x - Medkit", player getVariable "medkits"];}
else {_str = "Medkit";};
_itemListIndex = _itemList lbAdd _str;
_itemList lbSetData [(lbSize _itemList)-1, "medkit"];
};
if(player getVariable "bombs") then
{
	_itemListIndex = _itemList lbAdd "Time Bomb";
	_itemList lbSetData [(lbSize _itemList)-1, "bombs"];
};