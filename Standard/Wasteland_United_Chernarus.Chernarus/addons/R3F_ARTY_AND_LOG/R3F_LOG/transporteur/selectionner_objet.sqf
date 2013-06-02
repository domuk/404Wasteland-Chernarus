/**
 * Sélectionne un objet à charger dans un transporteur
 * 
 * @param 0 l'objet à sélectionner
 */
 


if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
}
else
{
	// Set mutex lock to active.
	R3F_LOG_mutex_local_verrou = true;

	_doExit = false;
    _ownerMinDistance = 150;
	_playerSideR3F = ((_this select 0) getVariable "R3F_Side");
    
    if(isNil {_objet getVariable "R3F_Side"}) then {
		_objet setVariable ["R3F_Side", (side player), true];
    };
    
	if (side player != _playerSideR3F) then {
		{
            if ((side _x ==  _playerSideR3F) AND (alive _x) AND (_x distance (_this select 0) < _ownerMinDistance)) exitwith {
                _doExit = true;
            };
        } foreach AllUnits;
	};
    
	if (_doExit) exitwith {
    	hint format["This item belongs to %1.", _playerSideR3F]; 
        R3F_LOG_mutex_local_verrou = false;
    };
	
	R3F_LOG_objet_selectionne = _this select 0;
	player globalChat format [STR_R3F_LOG_action_selectionner_objet_charge_fait, getText (configFile >> "CfgVehicles" >> (typeOf R3F_LOG_objet_selectionne) >> "displayName")];
	R3F_LOG_mutex_local_verrou = false;
};