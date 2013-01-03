//	@file Version: 1.0
//	@file Name: groupIcons.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 28/11/2012 05:19

private["_inGroup","_isLeader","_refresh","_distance","_myGroup","_tempArray","_icon"];

_tempArray = [];

while {true} do
{
    if(count units group player > 1) then 
    {	
        //Getting your group
		_tempArray = [];
        {
        	_tempArray set [count _tempArray,getPlayerUID _x];    
        }forEach units player;
        
		//Player Tags	   
		_target = cursorTarget;
		if (_target isKindOf "Man" && player == vehicle player) then 
        {
			if(player distance _target < 300)then 
            {
				if(getPlayerUID _target in _tempArray) then
                {
                	_nameString = "<t size='0.3' shadow='2' color='#7FFF00'>" + format['%1',_target getVariable ['unitname', name _target]] + "</t>";
					[_nameString,0,0.8,__REFRESH,0,0,3] spawn bis_fnc_dynamicText;	    
                };				
			};
		};
	    
	    if ((_target isKindOf "Car" || _target isKindOf "Motorcycle" || _target isKindOf "Tank") && player == vehicle player) then 
        {
			if(player distance _target < 300)then 
            {
				if(getPlayerUID _target in _tempArray) then
                {
					_nameString = "<t size='0.3' shadow='2' color='#7FFF00'>" + format['%1',_target getVariable ['unitname', name _target]] + "</t>";
					[_nameString,0,0.8,__REFRESH,0,0,3] spawn bis_fnc_dynamicText;		    
                };				
			};
		}; 	
	} else {
		_tempArray = [];
        sleep 1;        
    };
};