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
            <br/>Interpol, NATO
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>CSAT, Company Security Forces.
            <br/>AMLCOA: Attack contracotrs on sight if spotted. CSAT reinforcements are expected once contractors engage company forces.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilian pressence expected in the island
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Terrain in the island is mostly flat.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>A months long Interpol investigation in cooperation with NATO has revealed that a company headquartered in Porto is being used as a CSAT front for all kinds of illicit dealings.
            <br/>
            <br/>Contractors have been hired by Interpol and NATO to break into the company's headquarters and gather evidence on their illicit dealings.
            <br/>
            <br/>Illegal or CSAT related items work, but copies of sensitive documents are preferred over other types of evidence. For the contract to be succesful contractors must find irrefutable proof of the company dealing secretly with CSAT.
            <br/>
            <br/>Keep in mind that after contractors are spotted a CSAT response team is expected to arrive on the island.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
