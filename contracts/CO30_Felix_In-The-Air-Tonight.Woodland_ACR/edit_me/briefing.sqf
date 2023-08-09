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
            <br/>Chernarus Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Chernarussian Army of the Red Star (ChDKZ)
            <br/>The ChDKZ are known to take over large barns and farming compounds to turn them into their strongholds, they are very hostile towards the CDF, unsupporting locals, and any western-aligned forces.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>The National Part of Chernarus (NAPA) is friendly to contractors, as they want to get rid of the ChDKZ presence and influence on their country by any means possible.
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>The Chernarussian Defence Force (CDF) is neutral to contractors, additionally, they are unaware of their presence and intentions in the country. It is best to avoid them.
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>There are civilians present in the area of operations, they may or may not be in support of either ChDKZ, NAPA, CDF, or contractors.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Extensive mountain ranges, various elevation changes, and dense forests.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Contractors have been reached out by Chernarus in an extended effort to find and track down weapons and supply smuggling in the northwestern region of Chernarus.
            <br/>
            <br/>A head of the ChDKZ known as Dima Sejkora is believed to be one of the main key elements of the weapon smuggling line, as such, contractors have been tasked to find him and take him out.
            <br/>
            <br/>We do not have any further information on his whereabouts or how to identify him, however, what we do know, is that he is somewhere in the designated area of operations and we believe he has links with some of the local ChDKZ cells.
            <br/>
            <br/>Contractors have been hired to eliminate any ChDKZ in the area and to collect any intelligence that could lead to Dima Sejkora's location, and subsequently put an end to his terrorism.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
