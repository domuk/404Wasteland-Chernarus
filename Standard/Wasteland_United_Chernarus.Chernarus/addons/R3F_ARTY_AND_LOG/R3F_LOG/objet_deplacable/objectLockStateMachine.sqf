//	@file Author: [404] Costlyy
//	@file Version: 1.0
//  @file Date:	21/11/2012	
//	@file Description: Locks an object until the player disconnects.
//	@file Args: [object,player,int,lockState(lock = 0 / unlock = 1)]

// Check if mutex lock is active.
if(R3F_LOG_mutex_local_verrou) exitWith {
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
};

// Check if mutex lock 2 is active.
if(mutexScriptInProgress) exitWith {
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
};

R3F_LOG_mutex_local_verrou = true;
mutexScriptInProgress = true;

private["_locking", "_currObject", "_lockState", "_lockDuration", "_stringEscapePercent", "_interation", "_unlockDuration", "_totalDuration"];

_currObject = _this select 0;
_lockState = _this select 3;
_currState = animationState player;
_totalDuration = 0;
_stringEscapePercent = "%";

switch (_lockState) do {
    case 0:{ // LOCK
    
    	
		_totalDuration = 5;
		_lockDuration = _totalDuration;
		_iteration = 0;
		
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		
		for "_iteration" from 1 to _lockDuration do {
		    
            if(player distance _currObject > 10) exitWith { // If the player dies, revert state.
		        2 cutText ["ERROR: You are too far away to do that.", "PLAIN DOWN", 1];
                R3F_LOG_mutex_local_verrou = false;
                mutexScriptInProgress = false;
			};
            
            if (!(alive player)) exitWith {// If the player dies, revert state.
				2 cutText ["Object lock interrupted...", "PLAIN DOWN", 1];
                R3F_LOG_mutex_local_verrou = false;
                mutexScriptInProgress = false;
			};
            
            if (doCancelAction) exitWith {// Player selected "cancel action"
            	2 cutText ["Object lock canceled...", "PLAIN DOWN", 1];
                sleep 3;
                R3F_LOG_mutex_local_verrou = false;
				mutexScriptInProgress = false;
                doCancelAction = false;
			}; 
            
            if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the unlock.
                player switchMove "AinvPknlMstpSlayWrflDnon_medic";
            };
            
			_lockDuration = _lockDuration - 1;
		    _iterationPercentage = floor (_iteration / _totalDuration * 100);
		    
			2 cutText [format["Object lock %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
		    sleep 1;
		    
			if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that lock has completed.
		        sleep 1;
                _currObject setVariable ["objectLocked", true, true];
                2 cutText ["", "PLAIN DOWN", 1];
                R3F_LOG_mutex_local_verrou = false;
                mutexScriptInProgress = false;
		    }; 
		};
		
		player SwitchMove _currState; // Redundant reset of animation state to avoid getting locked in animation.       
    };
    case 1:{ // UNLOCK
        
		_totalDuration = 45;
		_unlockDuration = _totalDuration;
		_iteration = 0;
		
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		
		for "_iteration" from 1 to _unlockDuration do {
		    
            if(player distance _currObject > 10) exitWith { // If the player dies, revert state.
		        2 cutText ["ERROR: You are too far away to do that.", "PLAIN DOWN", 1];
                R3F_LOG_mutex_local_verrou = false;
                mutexScriptInProgress = false;
			};
            
            if (!(alive player)) exitWith {// If the player dies, revert state.
				2 cutText ["Object unlock interrupted...", "PLAIN DOWN", 1];
                R3F_LOG_mutex_local_verrou = false;
                mutexScriptInProgress = false;
			};
            
            if (doCancelAction) exitWith {// Player selected "cancel action"
            	2 cutText ["Object unlock canceled...", "PLAIN DOWN", 1];
                sleep 3;
				mutexScriptInProgress = false;
                R3F_LOG_mutex_local_verrou = false;
                doCancelAction = false;
			}; 
            
            if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the unlock.
                player switchMove "AinvPknlMstpSlayWrflDnon_medic";
            };
            
			_unlockDuration = _unlockDuration - 1;
		    _iterationPercentage = floor (_iteration / _totalDuration * 100);
		    
			2 cutText [format["Object unlock %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
		    sleep 1;
		    
			if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that lock has completed
		        sleep 1;
                _currObject setVariable ["objectLocked", false, true];
                2 cutText ["", "PLAIN DOWN", 1];
                R3F_LOG_mutex_local_verrou = false;
				mutexScriptInProgress = false;
		    }; 
		};
		
		player SwitchMove _currState; // Redundant reset of animation state to avoid getting locked in animation.     
    };
    default{  // This should not happen... 
        diag_log format["WASTELAND DEBUG: An error has occured in LockStateMachine.sqf. _lockState was unknown. _lockState actual: %1", _lockState];
    };
    
    if !(R3F_LOG_mutex_local_verrou) then {
        R3F_LOG_mutex_local_verrou = false;
        diag_log format["WASTELAND DEBUG: An error has occured in LockStateMachine.sqf. Mutex lock was not reset. Mutex lock state actual: %1", R3F_LOG_mutex_local_verrou];
    }; 
    
    mutexScriptInProgress = false;
};
