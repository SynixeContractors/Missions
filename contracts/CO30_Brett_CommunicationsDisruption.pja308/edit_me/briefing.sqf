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
 * <font color='#FF0000'>TEXT HERE</font color>
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
            <br/>Lapoliski Republic
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Loyalists
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>Civilians may be present in and around towns, but military facilities should be clear of civilians.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>The young Lapoliski Republic is fighting to secure its independence. THe South East region remains in Loyalist hands.
            <br/>We are being sent in to disrupt their communications before a larger assault force can be sent in.
            <br/>
            <br/>4 Communications Towers need to be destroyed. All have been marked in red on your map.
            <br/>
            <br/>The Loyalists have been spotted in the area, but we are not sure how many. Be prepared for a fight.
            <br/>
            <br/>Good luck, and Godspeed.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
