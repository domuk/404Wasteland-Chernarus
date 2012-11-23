
//	@file Version: 1.0
//	@file Name: onKeyPress.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:


private["_handled", "_faceCP", "_faceVP"];

_key     = _this select 1;
_shift   = _this select 2;
_handled = false;

if(isstunned) exitwith

	{

	if(_key == 50)then{_handled = true};
	if(_key == 11)then{_handled = true};

	_handled

	};

switch _key do
{      
    //U key
    case 22:
    {
		execVM "client\systems\adminPanel\checkAdmin.sqf";
    };
    
    //tilde
    case 41:
    {
        [] call loadPlayerMenu;
    };
    
    //Y key
    case 21:
    {
        if(((getPlayerUID player) in provingGrounds)) then
		{
			createDialog "balca_debug_main";
		};
    };
};

_handled;



