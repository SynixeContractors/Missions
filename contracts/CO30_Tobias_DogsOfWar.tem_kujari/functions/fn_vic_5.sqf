private _group = group vic_6;

private _wp = _group addWaypoint [getPos park_5, 5];  
_wp setWaypointSpeed "LIMITED";
_wp setWaypointFormation "COLUMN";  

private _wp1 = _group addWaypoint [getPos park_5, 1];  
_wp1 setWaypointType "GETOUT";
 
private _wp2 = _group addWaypoint [getPos tent_3, 5]; 
_wp2 setWaypointType "SENTRY"; 


