
//	@file Version: 1.0
//	@file Name: currentTime.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:


if(!X_Server) exitWith {};

while {true} do {
   
   	_dateTime = "Arma2Net.Unmanaged" callExtension "DateTime ['now', 'HH:mm:ss dd/MM/yyyy']";
    _timeArray = toArray _dateTime;
    
	_hour = parseNumber format["%1%2",toString [_timeArray select 1], toString [_timeArray select 2]];
	_min = parseNumber format["%1%2",toString [_timeArray select 4], toString [_timeArray select 5]];
    _year = parseNumber format["%1%2%3%4",toString [_timeArray select 16], toString [_timeArray select 17], toString [_timeArray select 18], toString [_timeArray select 19]];
    
    _year = _year - (_year - 1);
    _yearInMins = _year * 365 * 24 * 60;
    _hourInMins = _hour * 60;
    
    currentTime = _yearInMins + _hourInMins + _min;
    publicVariable "currentTime";
    //To broadcast clientRaderMarkers to clients from the server due to clients not being able to broadcast server wide variables with eventhandlers.
    publicVariable "clientRadarMarkers";

    sleep 1; 
};