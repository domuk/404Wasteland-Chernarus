//	@file Version: 1.0
//	@file Name: dropLoot.sqf
//	@file Author: [404] Costlyy
//	@file Created: 30th May 13
//	@file Args: Unit

_chance = random 1;
_unit = _this select 0 select 0;

if (_chance <= 0.35) then {
	_amount = 75;
	_amount = _amount + round (random 50);
    _unitPos = position _unit;
    
	_droppedCash = "Evmoney" createVehicle _unitPos; 
    _droppedCash setPos _unitPos;
	_droppedCash setVariable["money",_amount,true];
	_droppedCash setVariable["owner","world",true];
};

