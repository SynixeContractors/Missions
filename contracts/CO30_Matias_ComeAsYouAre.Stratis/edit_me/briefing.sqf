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
            <br/>NATO
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Altis Armed Forces (AAF)
            <br/>Attack contractors on sight. They have fortified the airbase and the town of Agia Marina.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>No civilian pressence in the AO
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Terrain in the AO is hilly, with sparse vegetation.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>NATO is preparing an invasion of the currently AAF controlled island of Stratis.Since they will mostly be carrying out the invasion by air we have been hired to neutralize enemy AA capabilites.
            <br/>
            <br/>In Agia Marina we must neutralize a vehicle and supply depot near the town and any AA vehicles or emplacements we see.
            <br/>
            <br/>In the airbase we must neutralize two SAM sites, two Radars, a frigate and a C-130 waiting in the runway which when destroy would block enemy fighters from taking off.
            <br/>
            <br/>We've been provided with a pair of SDVs and some diving gear to make infiltration easier. They're waiting by our F.O.B.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
