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
            <br/>Chernarussian Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Russian Armed Forces
            <br/>Defend the areas they have taken control of
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians have already been evacuated from the island
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>N/A
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Recently the Russian Armed Forces moved into Utes, killing Chernarussian forces stationed there and taking control of the island.
            <br/>
            <br/>Synixe has been hired to lay the ground work for a Chernarussian retaking of the island. We are tasked with destroying key infrastructure that would aid the russians in defending their positions.
            <br/>
            <br/>Contractors are to destroy:
            <br/>- A radar and radio tower
            <br/>- AA weaponry
            <br/>- An ammo cache
            <br/>- A fuel supply
            <br/>- A transmitter tower
            <br/>- Any vehicles that may give the Russians air superiority
            <br/>
            <br/>We have been provided with aerial photos of the island as well as Stingers by the Chernarussians.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
