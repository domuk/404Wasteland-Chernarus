//	@file Version: 1.0
//	@file Name: vehicleManagement.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define vehicleManagementDialog 12000
#define vehicleManagementVehicleCount 12002

disableSerialization;

private ["_start","_dialog","_vehicleCountText","_vehicleType","_vehicleCount"];
_start = createDialog "VehicleManagement";

_dialog = findDisplay vehicleManagementDialog;
_vehicleCountText = _dialog displayCtrl vehicleManagementVehicleCount;
_vehicleCount = 0;

{
    _vehicleType = Format["%1",typeOf _x];
	if(((_vehicleType isKindOf "LandVehicle") OR (_vehicleType isKindOf "Air")) AND !(_vehicleType isKindOf "StaticWeapon")) then {
        _vehicleCount = _vehicleCount + 1;
	};
}forEach vehicles;

_vehicleCountText ctrlSetText format["Vehicles on Server: %1", _vehicleCount];