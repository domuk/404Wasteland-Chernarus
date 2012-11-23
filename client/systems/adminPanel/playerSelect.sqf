//	@file Version: 1.0
//	@file Name: playerSelect.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

PlayersSelect = lbCurSel 13371;
PSID = lbData [13371, PlayersSelect];
thiss = _this select 0;

_pList = allUnits;
j = count _pList;
j=j-1;
i = 0;

check = 0;
for "i" from 0 to j do {
    v = _pList select i;
    if (str(v) == PSID) then {
        target = v;
        nice = i;
        check = 1;
    };
};

if (check == 0) then {exit;};

_thistxt = ctrlText(19000);
if (thiss == 0) then {
    target setVehicleInit format["if (name player == ""%1"") then {player setdamage 1; Endmission ""END1"";failMission ""END1"";forceEnd; deletevehicle player;};",name target];
    processInitCommands;
    clearVehicleInit target;
};
if (thiss == 1) then {
    ctrltxt = ctrlText(19001);
    if (ctrltxt == "Cam") then {
        ctrlSetText[19001, "Viewing"];
        player commandChat format ["Viewing %1.", name target];
        camDestroy _camadm;
        _camadm = "camera" camCreate ([(position vehicle target select 0) - 5,(position vehicle target select 1), (position vehicle target select 2) + 10]);
        _camadm cameraEffect ["external", "TOP"];
        _camadm camSetTarget (vehicle target);
        _camadm camCommit 1;
        target setVehicleInit format["if (IsServer) then {diag_log ""%1 is spying on %2.""};",name player,name target];
        processInitCommands;
        clearVehicleInit target;
        rnum = 0;
        while {ctrlText(19001) == "Viewing"} do {
            switch (rnum) do 
            {
                if (daytime > 19 || daytime < 5) then {camUseNVG true;} else {camUseNVG false;};
                case 0: {detach _camadm; _camadm attachTo [(vehicle target), [0,-10,4]]; _camadm setVectorUp [0, 1, 5];}; 
                case 1: {detach _camadm; _camadm attachTo [(vehicle target), [0,10,4]]; _camadm setDir 180; _camadm setVectorUp [0, 1, -5];};
                case 2: {detach _camadm; _camadm attachTo [(vehicle target), [0,1,50]]; _camadm setVectorUp [0, 50, 1];};
                case 3: {detach _camadm; _camadm attachTo [(vehicle target), [-10,0,2]]; _camadm setDir 90; _camadm setVectorUp [0, 1, 5];};
                case 4: {detach _camadm; _camadm attachTo [(vehicle target), [10,0,2]]; _camadm setDir -90; _camadm setVectorUp [0, 1, -5];};                                                                        
            };
            player commandchat "Viewing cam " + str(rnum) + " on " + str(name vehicle target);
            rnum = rnum + 1;
            if (rnum > 4) then {rnum = 0;};
            sleep 5;
        };
    } else {
        ctrlSetText[19001, "Cam"];
        player commandchat format ["No Longer Viewing.", name _target];
        target setVehicleInit format["if (IsServer) then {diag_log ""%1 stopped spying on %2.""};",name player,name target];
        processInitCommands;
        clearVehicleInit target;
        player cameraEffect ["terminate","back"];
        camDestroy _camadm;
    };
};
if (thiss == 2) then {
        target setVehicleInit format["if (name player == ""%2"") then {titleText [""%1"", ""plain""]; titleFadeOut 10;};",_thistxt,name target];
        processInitCommands;
        clearVehicleInit target;
};