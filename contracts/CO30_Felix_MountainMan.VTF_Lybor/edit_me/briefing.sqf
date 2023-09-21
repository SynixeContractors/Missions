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
            <br/>Lyborian Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Local guerrilla
            <br/>The local guerrilla is only known to have small arms capacity, and they will attack contractors on sight. They are garrisoning up in the southern mountains of Lybor.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>N/A
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>N/A
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians may be present in the area, but it is unlikely.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Dangerous cliffsides and extensive mountain ranges.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Due to recent events in the Kinney-Kadeny conflict and the violence witnessed during the Mayson Festival, the local guerrillas protesting the new Government of Lybor have been pushed away into the southern mountains of Lybor after continued engagements with contractors and the police.
            <br/>
            <br/>The Lyborian police does not have sufficient resources to deal with the guerrillas down south, specially given that there are rumours that they are stashing up equipment in order to expand the reach of their forces by further arming their newest recruits.
            <br/>
            <br/>Contractors have been hired to eliminate and/or arrest all guerrilla fighters in the designated area within the southern mountains by any means necessary, alongside destroying and keeping track of any supply caches they find.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
