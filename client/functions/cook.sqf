//	@file Version: 1.0
//	@file Name: cook.sqf
//	@file Author: 
//	@file Created: 20/11/2012 05:19
//	@file Args:

player switchMove "AinvPknlMstpSlayWrflDnon_medic";

private["_chicken","_cow","_boar","_goat","_rabbit"];
_chicken = player getVariable "chickenmeat";
_cow = player getVariable "cowmeat";
_goat = player getVariable "goatmeat";
_boar = player getVariable "boarmeat";
_rabbit = player getVariable "rabitmeat";
_sheep = player getVariable "sheepmeat";

if(_chicken > 0) then
{
	player setVariable["chickenmeatc", (player getVariable "chickenmeatc") + _chicken,true];
	player setVariable["chickenmeat", 0, true];
};

if(_cow > 0) then
{
	player setVariable["cowmeatc", (player getVariable "cowmeatc") + _cow,true];
	player setVariable["cowmeat", 0, true];
};

if(_goat > 0) then
{
	player setVariable["goatmeatc", (player getVariable "goatmeatc") + _goat,true];
	player setVariable["goatmeat", 0, true];
};
if(_boar > 0) then
{
	player setVariable["boarmeatc", (player getVariable "boarmeatc") + _boar,true];
	player setVariable["boarmeat", 0, true];
};
if(_rabbit > 0) then
{
	player setVariable["rabitmeatc", (player getVariable "rabitmeatc") + _rabbit,true];
	player setVariable["rabitmeat", 0, true];
};

if(_sheep > 0) then
{
	player setVariable["sheepmeatc", (player getVariable "sheepmeatc") + _sheep,true];
	player setVariable["sheepmeat", 0, true];
};

hintSilent "You have cooked all your raw meat";
