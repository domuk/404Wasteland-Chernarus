private["_corpse","_startTime","_result","_currTime"];

_corpse  = _this select 0;
_startTime = currentTime;

waitUntil
{ 
    _currTime = currentTime;
    _result = [_currTime, _startTime, 15] call compareTime;
    (_result == 1)
};

deleteVehicle _corpse;