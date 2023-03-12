#include "do_not_edit\script_component.hpp"
#include "do_not_edit\initPlayerLocal.sqf"

//This creates the sounds for the hacks and extractions

["mission_alarm", {
    playSound "Alarm";
}] call CBA_fnc_addEventHandler;

["mission_hackAbort", {
    playSound "ACE_Javelin_Locked";
}] call CBA_fnc_addEventHandler;

["mission_extract", {
    playSound "SN_Flare_Fired_4";
}] call CBA_fnc_addEventHandler;


//This will hide the Spies markers from the mercs

if (side player != west) then 
{
    {deleteMarkerLocal "safehouse"} forEach allMapMarkers;
    {deleteMarkerLocal "infMark1"} forEach allMapMarkers;
    {deleteMarkerLocal "infMark2"} forEach allMapMarkers;
    {deleteMarkerLocal "infMark3"} forEach allMapMarkers;
    {deleteMarkerLocal "infMark4"} forEach allMapMarkers;
    {deleteMarkerLocal "infMark5"} forEach allMapMarkers
};
