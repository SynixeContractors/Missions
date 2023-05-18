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
            <br/>Finnish Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Anti-NATO Militia
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>None
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are present, and may relay information to enemy forces.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>A group of Anti-NATO militiamen are planning an operation against a newly setup joint NATO base in Finland.
            <br/>Not wanting to involve NATO forces in a domestic issue so early into the new partnership, the Finnish government has hired Synixe Contractors to deal with the threat.
            <br/>
            <br/>Finnish Inteligence services have provided us with three locations on an island where the militia is known to operate from. An insider has said that they have split some of their plans onto 4 yellow flashdrives.
            <br/>The data has been sharded, and each flashdrive contains only a part of the plans. We need to find all 4 flashdrives to decode the plans, if don't secure all 4, they will not be able to decode the plans.
            <br/>We will be inserting and extracting via boat, and will not have access to our vehicles.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
