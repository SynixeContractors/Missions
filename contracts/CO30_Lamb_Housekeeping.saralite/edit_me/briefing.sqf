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
            <br/>Blue Falcon Company
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Possible Insurgents
            <br/>There have been a few clashes between the Insurgents and local Army. The insurgents seem to have access to armored-up technicals. They may be involved with the unaccounted for Blue Falcon security team.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Blue Falcon Company
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>It is early in the morning, civilians are likely to be still at home.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Blue Falcon Company is very impressed with Synixe's ability to troubleshoot particular problems, and have contracted Synixe to investigate a possible issue.   
            <br/>
            <br/>A VIP is being accompanied by a Blue Falcon Company security team in Southern Sahrani at a town called Arcadia. They are currently residing in the hotel near the center of town.
            <br/>
            <br/>The security team hasn't responded to the hourly check-in and Blue Falcon Company has their hands full with pulling security for the Airport.
            <br/>
            <br/>Synixe is being contracted to go find out what happened, and if the worse has come to pass to bring the VIP back to Synixe's FOB for transfer to Blue Falcon Company custody at another time.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
