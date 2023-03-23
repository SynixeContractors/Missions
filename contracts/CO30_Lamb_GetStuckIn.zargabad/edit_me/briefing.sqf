#include "..\do_not_edit\script_component.hpp"
/*
 * Author: Kresky, Jonpas
 * Adds briefing based on side.
 * Call from initPlayerLocal.sqf.
 * Copy to other side briefings if you want to add briefings to those sides.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call FUNC(briefing);
 *
 * New Line:
 * <br/>
 *
 * Text Colour (Hex colour Code)
 * <font color='#FF0000'>TEXT HERE</font>
 *
 * Clickable Marker Link:
 * <marker name = 'MARKER_NAME'>MARKER_TEXT</marker>
 *
 * Image:
 * <img image='FOLDER\IMAGE.jpg' width='200' height='100'/>
 */

params ["_player"];

switch (side _player) do {
    // BLUFOR briefing
    case west: {
        
    };

    // OPFOR briefing
    case east: {

    };

    // RESISTANCE/INDEPENDENT briefing -- THIS IS THE BRIEFING YOU WANT TO EDIT FOR YOUR MISSION!
    case resistance: {
        _player createDiaryRecord ["Diary", ["Employer", "
            <br/>United States Department of Defense
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Local Terrorists
            <br/>Terrorists have already used roadside IEDs as well as ambush tactics. More IEDs are to be expected. They will likely stop any attempts to rescue/recover Marines.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, United States Marine Corps
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians have been evacuated for the most part due to the heavy fighting. 
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Outside of Zargabad it is mostly flat terrain but the city itself is heavily urban, windows and alleys are of chief concern.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>A Marine convoy has been ambushed en route to Zargabad. A Marine Force Recon unit was tasked with clearing a route through Zargabad in their place but have come under heavy fire and have become seperated.
            <br/>
            <br/>BluFor Trackers have indicated that their unit has been seperated into 3 pieces. They're indicated to be at the following GridCoords/Location: 042040, 038040, and The Villa.
            <br/>
            <br/>The Force Recon unit, at their time of tasking, was 13 men strong. The objective is recover the dead and provide relief to the living.
            <br/>
            <br/>Bodybags for the Force Recon dead will be provided at the location of the initial ambush. The ambulance has been parked nearby and will also serve as the location for the bodies to be left.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
