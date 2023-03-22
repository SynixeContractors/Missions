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
            <br/>Ruha Goverment
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Ruhanian liberation front, Unknown weapons dealers
            <br/>Ruhanian intellegence has recived word that the Ruhanian Liberation Front(RIF) is receiving weapons from an unknown source.
            <br/>The Ruhanian Liberation Front(RIF) should be considered hostile as they know that the Ruhanian Goverment has hired private contractors to take action against them.
            <br/>The RIF are well equiped and most have previous military service/training.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Ruha Military
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>N/A
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians remain neutral in fear of reprisal from both sides of the conflict.

        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Synixe has been hired by the Ruhanian goverment to find and disrupt the delevery of weapons to the Radical milita group the Ruhanian Liberation Front (RIF).
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
