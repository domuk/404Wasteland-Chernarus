//	@file Version: 1.0
//	@file Name: vehicleManagement.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_start = createDialog "VehicleManagement";

#define _lbxVehicles 13372

_exclude = [
    "ClutterCutter_EP1",
    "Notebook",
    "Stinger_Pod",
    "Radio",
    "Land_arrows_yellow_L",
    "Land_arrows_yellow_R",
    "FoldTable",
    "Suitcase",
    "EvMoney",
    "Land_Barrel_water",
    "M2StaticMG",
    "DSHKM_TK_INS_EP1",
    "DSHkM_Mini_TriPod",
    "KORD_high_UN_EP1",
    "M2HD_mini_TriPod"
];

_allVehicles = vehicles;
{
   _vehicleType = Format["%1",typeOf _x];
   _vehicleClass = "Vehicle";

    if(!(_vehicleType in _exclude)) then {
        
        _vehiclePrefix = ["Car","Motorcycle","Tank","Boat","Helicopter","Plane"];
        {
            if (_vehicleType isKindOf _x) then {_vehicleClass = _x;};
        } forEach _vehiclePrefix;
        
        _vehicleSummary = "[Class: " + _vehicleClass + "] [Type: " + _vehicleType + "]";
        
        _index = lbAdd [_lbxVehicles, _vehicleSummary];
        lbSetData [_lbxVehicles, _index, str(_x)];
    };
} forEach _allVehicles;





