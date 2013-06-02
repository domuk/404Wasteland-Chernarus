//	@file Version: 1.0
//	@file Name: useMedicalKit.sqf
//  @file Author: [404] Costlyy
//	@file Created: 29th May 13

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat localize "STR_WL_Errors_InProgress";
};
            	
mutexScriptInProgress = true;
_currState = animationState player;
_delayTime = 5 * 10; // 5 seconds.

// If the player is only scratched.
if((damage player) < 0.05) exitwith {
	hint "You are not seriously injured. You apply a plaster and move on.";
	player setDamage 0;
    mutexScriptInProgress = false;
};

if ((vehicle player) == player) then { player switchMove "AinvPknlMstpSnonWnonDnon_healed_1"; };
                
for "_i" from 1 to _delayTime do {
	if (doCancelAction) exitWith {// Player selected "cancel action"
		mutexScriptInProgress = false;
	}; 
	sleep 0.1;
};

if (!(doCancelAction)) then {
	player setVariable["medkits",(player getVariable "medkits")-1,true];
	player setDamage 0;
    player switchMove _currState;
    hint "You have successfully applied the Medkit to your wounds.";
} else {	
	doCancelAction = false;
    player switchMove _currState;
};

mutexScriptInProgress = false;