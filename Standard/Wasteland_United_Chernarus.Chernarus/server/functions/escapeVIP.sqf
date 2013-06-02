//	@file Version: 1.0
//	@file Name: escapeVIP.sqf
//	@file Author: [404] Costlyy
//	@file Created: 30th May 13
//	@file Args:


_unitVIP = _this select 0 select 1;

//diag_log format["VIP = %1",_unitVIP];

_unitVIP setVariable["released",1,true];

_unitVIP enableAI "MOVE";
_unitVIP enableAI "ANIM";

_group = createGroup civilian;

[_unitVIP] join _group;
_unitVIP = leader _group;

///// NOT WORKING - SORRY :(:(    //////
///// If you can fix it, tell me! //////

//diag_log format ["VIP group = %1",str(_group)];
//_group Move [0,0,0];
//[nil,_group,"per",rMOVE,[0,0,0]] call RE;

//_waypoint = _group addWaypoint [[0,0,0], 0];
//_waypoint setWaypointType "MOVE";
//[_group, 1] setWaypointSpeed "FULL";
//[_group, 1] setWaypointCompletionRadius 50;
//diag_log format ["Sent waypoint..."];

sleep 5;

_unitVIP setPosATL [0,0,0];
hideObject _unitVIP;
deleteVehicle _unitVIP;