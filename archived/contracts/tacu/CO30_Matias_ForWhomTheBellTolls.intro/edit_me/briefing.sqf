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
            <br/>DOJ (Department of Justice)
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Security guards
            <br/>AMLCOA: Defend the target and his assets
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>There may be prisoners in the island
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>The terrain in the island is pretty clear, providing open sight lines
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Recently the DOJ put out a warrant for the arrest of James Erling, a business mogul involved in a human trafficking ring. However before they could arrest him, Erling fled to his private island.
            <br/>
            <br/>Since the island is outside of the DOJ's jurisdiction they have hired Synixe to infiltrate it and arrest Erling. Should there be any prisoners in the island they've asked us to secure them.
            <br/>
            <br/>They have also agreed to pay us extra for any other evidence we can gather that would help their case against Erling.
            <br/>
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
