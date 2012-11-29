//	@file Version: 1.0
//	@file Name: spawnAction.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args: [int(type of spawn)]

_switch = _this select 0;
_button = _this select 1;

switch(_switch) do 
{
    case 0:{execVM "client\functions\spawnRandom.sqf"};
    case 1:{[_button] execVM "client\functions\spawnInTown.sqf"};
    case 2:{};
};