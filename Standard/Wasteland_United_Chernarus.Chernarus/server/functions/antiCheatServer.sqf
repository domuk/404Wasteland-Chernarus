//	@file Version: 1.0
//	@file Name: antiCheatServer.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13
//	@file Args:

if(!X_Server) exitWith {};

_currencyLimit = 10 * 1000; // 10k money limit for initial config.
_instantKick = false; // Kick the nasty little scalliwags immediately or taunght them a little?

while {true} do {
    //Iterate through the playable object and set some values.
    {
    	// Get the player's money and ensure it is < 10.5k.
		_playerMoney = _x getVariable["cmoney",0];    
        if (_playerMoney > _currencyLimit) then {
        	_x setVariable["cmoney",_currencyLimit, true];
        };
        
        // Re-enable input incase it has been disabled.
        _x enableSimulation true;
        
        // Show the player incase they are trying to be a sneaky little neckbearded fuck.
        _x hideObject false;
        [nil, _x, "loc", rHideObject, false] call RE;
        
	}forEach playableUnits;
        	
	// Don't loop too fast, with 60+ people connected this might be quite straining.
    sleep 3; 
};
