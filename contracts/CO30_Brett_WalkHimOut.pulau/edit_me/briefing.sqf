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
            <br/>David Morely
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Local Militia, known to operate near coastal towns for shipments in and out of the island
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>Pulua Security Forces
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians may be present in some towns, but unlikely to still be near the AO
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>An American man named David Morely was temporarily residing in Pulau, in the resort town of Nirwana. Last night the town was raided by local militia, and David was taken hostage. The small Pulau Security Forces are unable to mount a rescue operation, and associates of David have hired Synixe to rescue him.
            <br/>
            <br/>Primary Objectives
            <br/>- Secure Mr. Morely's laptop from his house in Nirwana or the local militia
            <br/>- Secure David Morely and bring him to Synixe's FOB
            <br/>
            <br/>Secondary Objectives
            <br/>- Secure David's Laptop from his house in Nirwana or the local militia
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
