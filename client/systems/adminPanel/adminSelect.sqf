//	@file Version: 1.0
//	@file Name: adminSelect.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define genstore_DIALOG 2009
#define genstore_money 2012
#define gunshop_DIALOG 2001
#define gunshop_money 2004

AdminSelect = lbCurSel 2119;

switch (AdminSelect) do
{
    case 0: //Player Menu
	{
            execVM "client\systems\adminPanel\playerMenu.sqf";
	};
	case 1: //Vehicle Management
	{
            execVM "client\systems\adminPanel\vehicleManagement.sqf";
	};
    case 2: //Test Function
    {
		_gunshopDialog = createDialog "gunshopd";

		disableSerialization;
		gunStoreCart = 0;

		_Dialog = findDisplay gunshop_DIALOG;
		_playerMoney = _Dialog displayCtrl gunshop_money;
		_money = player getVariable "cmoney";
		_playerMoney CtrlsetText format["Cash: $%1", _money];
    };
    case 3: //Weapon Test
    {      
       _gunshopDialog = createDialog "genstored";

		disableSerialization;
		genStoreCart = 0;

		_Dialog = findDisplay genstore_DIALOG;
		_playerMoney = _Dialog displayCtrl genstore_money;
		_money = player getVariable "cmoney";
		_playerMoney CtrlsetText format["Cash: $%1", _money];
    };
    case 4: //Test Function
    {
        //icon
        _className = "Fuel_can";
        _item = (configFile >> "CfgVehicles" >>  _className);
        //hint format ["Item %1", _item];
        _picture = getText(_item >> "icon");
        hint format ["Pic URL = %1", _picture]; 
    };
};