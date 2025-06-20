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
            <br/>Central Intelligence Agency (C.I.A)
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Takistani militia
            <br/>It is believed they've been working with the hacker themselves and that they'll protect him.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>No civilan pressence in the AO
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>N/A
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>A month ago a CIA black site was wiped out. The takistani militia took credit for the attack and claimed that more would come.
            <br/>
            <br/>After gathering information and doing surveillance the CIA found out that the Takistanis have been working with a hacker in order to learn about american positions in the region.
            <br/>
            <br/>Contractors have been hired to apprehend the hacker and extract him out of the region.
            <br/>
            <br/>Through tracking a series of keystrokes the CIA has learned that the militia has been mainting contact with the hacker mainly from the town of <marker name = 'Abad'>Abad</abad>
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
