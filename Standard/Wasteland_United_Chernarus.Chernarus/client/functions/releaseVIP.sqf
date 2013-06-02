//	@file Version: 1.0
//	@file Name: releaseVIP.sqf
//	@file Author: [404] Costlyy
//	@file Created: 30th May 13
//	@file Args:

_unitVIP = nearestObjects [player, ["Functionary1"],  5] select 0;
_positionVIP = getPosATL _unitVIP;

if (!(alive _unitVIP)) then {
	hint "The VIP is dead...";
} else {
	_droppedCash = "Evmoney" createVehicle (_positionVIP); 
	_droppedCash setPos _positionVIP;
	_droppedCash setVariable["money",1000,true];
	_droppedCash setVariable["owner","world",true];
	
	_droppedCash = "Evmoney" createVehicle (_positionVIP); 
	_droppedCash setPos _positionVIP;
	_droppedCash setVariable["money",1000,true];
	_droppedCash setVariable["owner","world",true];
};

processVIP = _unitVIP;
publicVariableServer "processVIP";


