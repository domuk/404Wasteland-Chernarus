//	@file Version: 1.0
//	@file Name: serverTimeSync.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19

_dateStamp = Date;
currentDate = _dateStamp;
publicVariable "currentDate";

_startTime = time;
while{true} do
{
	sleep 60; 	
	if(time - _startTime > 900) then
	{
	_dateStamp = Date;
	_dateStamp set [4, (30 + (_dateStamp select 4))];
	setDate _dateStamp;
	currentDate = _dateStamp;
	publicVariable "currentDate";	
	_startTime = time;    
	};	    
};