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
            <br/>Catari government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Islamic Republic of Iran
            <br/>Protect the airfields
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>N/A
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font color>
            <br/>Terrain in the AO is mostly flat
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Recently Iran has been moving a great part of their aerial fleet to a set of airfields in the desert.
            <br/>
            <br/>The Catari government is afraid that the Iranians are gonna be flying close to their airspace in order to make a show of force during an event that is taking place in the country.
            <br/>
            <br/>In order for the Catari air force to not be undermined by the Iranian air force they have hired us to destroy the aircraft in these airfields.

        "]];

    };

    // CIVILIAN briefing
    case civilian: {

    };
};
