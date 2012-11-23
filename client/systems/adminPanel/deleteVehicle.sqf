//	@file Version: 1.0
//	@file Name: deleteVehicle.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

PlayersSelect = lbCurSel 13372;
PSID = lbData [13372, PlayersSelect];
_pList = vehicles;
j = count _pList;
j=j-1;
i = 0;
player commandChat format ["%1 ----",PSID];

for "i" from 0 to j do {
    v = _pList select i;
    if (str(v) == PSID) then {
        player commandChat "Deleting vehicle";
        {
            _x leaveVehicle v;
        } forEach crew v;
        deleteVehicle v;
    };
};

closeDialog 0;
execVM "client\systems\adminPanel\vehicleManagement.sqf";