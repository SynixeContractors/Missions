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
            <br/>INSERT NAME OF EMPLOYER HERE
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>INSERT ENEMIES HERE
            <br/>INSERT ENEMY AMLCOA (Most Likely Course of Action, AKA, what they're doing, how they act, how they'll act towards us, what we know, etc)
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, INSERT FRIENDLIES HERE
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>INSERT INDEPENDENT FORCES IF THERE ARE ANY, OTHERWISE REMOVE THIS LINE AND ONE ABOVE
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>INSERT THINGS TO CONSIDER ABOUT CIVILIANS, PRESENCE/ABSENCE AND/OR BEHAVIOUR/SUPPORT TO FRIENDLIES OR ENEMIES
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>INSERT ANYTHING YOU FIND RELEVANT ABOUT HOW THE TERRAIN MAY BE ADVANTAGEOUS OR DISADVANTAGEOUS
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>YOU CAN WRITE YOUR MISSION DESCRIPTION HERE,
            <br/>
            <br/>THE BR THING INDICATES THE BEGINNING OF EACH PARAGRAPH, IF LEFT EMPTY, IT'LL BE A SPACE.
            <br/>
            <br/>YOU CAN ADD AS MUCH AS YOU FEEL IS RELEVANT.
            <br/>
            <br/>AS A RULE OF THUMB, CONSIDER: WHO, WHAT (TASKS), WHERE, WHEN, AND WHY
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
