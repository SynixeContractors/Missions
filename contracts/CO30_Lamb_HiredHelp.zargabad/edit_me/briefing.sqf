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
            <br/>They've taken control of the city with the help of Wagner forces and are likely to have fortified their defenses. IED's, roadblocks and static weapons are to be expected. 
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Blue Falcon Company, Yongshi Security Service
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians have evacuated the city due to the local terrorists taking over the city. 
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Outside of Zargabad it is mostly flat terrain but the city itself is heavily urban, windows and alleys are of chief concern.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Zargabad has been deemed a point of interest by the D.O.D. While the marines have already pushed through, the city still needs to be secured for access to its airfield.
            <br/>
            <br/>Two other PMC's have also been hired for this task. Yongshi Security Service has cleared and is holding the town located at the GridCoord 040035. Blue Falcon Company is holding a security checkpoint at at the GridCoord 038027. 
            <br/>
            <br/>It is advised that Synixe contractors familiarize themselves with the other PMC's present at Zarghabad to avoid friendly fire incidents. 
            <br/>
            <br/>Synixe's objective is to clear Zargabad of any and all enemy forces.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
