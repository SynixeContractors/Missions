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
            <br/>Chernarussian National Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Chernarussian Movement of the Red Star
            <br/>Enemies are known to have settled in previously civilian farming settlements out in the country and have been stashing weapons for use in their uprising. They will engage with lethal force on any sighting of an enemy force.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Chernarussian Defence Force
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are present in the area and may be for or against our involvement in the region.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Elevation changes, dense forests, and bad weather conditions.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>There have been reports of a ChDKZ cell setting camp on the northwestern end of the chernarussian region.
            <br/>
            <br/>We have been informed that they are often seen in and around some of the outer compounds of the area of operations, most of them with large barns and housing structures within - which have been advantengous for the ChDKZ to use as storage sites for their supplies.
            <br/>
            <br/>Synixe has been contracted to locate any and all enemy force supply caches in the area of operations and to destroy them, alongside with any enemy presence in the area.
            <br/>
            <br/>Our intelligence reports that they have suspicion of four supply storage sites within the area of operations.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
