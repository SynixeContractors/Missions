call compile preprocessFileLineNumbers "vr\initPlayerLocal.sqf";

call compile preprocessFileLineNumbers "ranges\autorifleman.sqf";
call compile preprocessFileLineNumbers "ranges\engineer.sqf";
call compile preprocessFileLineNumbers "ranges\grenadier.sqf";
call compile preprocessFileLineNumbers "ranges\helicopter.sqf";

private _fnc_lat = compile preprocessFileLineNumbers "ranges\lat.sqf";
[shop_lat_1] call _fnc_lat;
[shop_lat_2] call _fnc_lat;
