//	@file Version: 1.0
//	@file Name: useMedicalKit.sqf
//  @file Author: [404] Costlyy
//	@file Created: 29th May 13
//  @file Args: 0 = food / 1 = water

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat localize "STR_WL_Errors_InProgress";
};

// Check if player is alive.
if(!(alive player)) exitWith {
	player globalChat localize "YOU ARE CURRENTLY BUSY.";
};
            	
mutexScriptInProgress = true;
_currState = animationState player;
_switch = _this select 0;
_delayTime = 5 * 10; // 5 seconds.
                
if((vehicle player) == player) then { player switchMove "AinvPknlMstpSnonWnonDnon_healed_1"; };
                
for "_i" from 1 to _delayTime do {
	if (doCancelAction) exitWith {// Player selected "cancel action"
		mutexScriptInProgress = false;
	}; 
	sleep 0.1;
};

if (!(doCancelAction)) then {
	switch (_switch) do {
	    case 0 : { // Food
	    	player setVariable["canfood",(player getVariable "canfood")-1,true];
			hungerLevel = hungerLevel + 30;
			if(hungerLevel > 100) then {hungerLevel = 100};
	    };
	    case 1 : { // Water
	    	player setVariable["water",(player getVariable "water")-1,true];
			thirstLevel = thirstLevel + 40;
			if(thirstLevel > 100) then {thirstLevel = 100};
	    };
	};   
} else {
	player switchMove _currState;
	doCancelAction = false;
};
    
mutexScriptInProgress = false;                 