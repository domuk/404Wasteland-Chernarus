
//	@file Version: 1.0
//	@file Name: compareTime.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

private["_currTime","_startTime","_duration","_result","_return"];

_currTime = _this select 0;
_startTime = _this select 1;
_duration = _this select 2;
_result = 0;

if((_currTime - _startTime) >=  _duration) then {_result = 1};

_return = _result;
_return;