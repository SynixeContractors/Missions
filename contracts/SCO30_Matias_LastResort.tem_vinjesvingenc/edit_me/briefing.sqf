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
            <br/>Central Intelligence Agency (C.I.A)
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Local Cartel
            <br/>AMLCOA: Protect the target
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilian pressence expected in local towns and around the region
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Terrain in the AO is mountainous and riddled with forests.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>The CIA is currently chasing a Takistani Army officer named Jabr Aybak who they suspect is attempting to put American lives in danger.
            <br/>
            <br/>They attempted to capture him on a previous operation but he escaped. He is now under the protection of a local cartel who will attempt to smuggle him into the US.
            <br/>
            <br/>The CIA has tasked Synixe to execute a kill or capture order on Aybak. If he is captured he must be brought back to base, but if he is killed his body should be retrieved for proper identification and to prevent the Takistanis from retrieving it.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
