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

_player createDiaryRecord ["Diary", ["Game Rules", "
        <br/>GAME RULES
        <br/>1- Spies must break into the facility, hack all three of the laptops and escape back to base.
        <br/>2- If you die you don't redeploy until the next game.
        <br/>3- Game ends either when the laptops are hacked and at least one spy calls for the extraction or when all the spies are killed.
        <br/>4- Mercs should have at least double the amount of spies
        <br/>
        <br/>The idea is that mercs will have heavy armor, frags, flares, chemlights and assault weapons while the spies have nvgs, no armor, flashbangs, smokes and silenced cqb weapons.
    "]];

switch (side _player) do {
    // BLUFOR briefing
    case west: {
        _player createDiaryRecord ["Diary", ["Briefing", "
            <br/>Listen up,
            <br/>
            <br/>You've been tasked with infiltrating the facility and breaching the security of the laptops there.
            <br/>Once you've breached all three of the laptops you must exfil back to the safehouse and use the radio to call for an extraction.
            <br/>
            <br/>Good Luck, Zero.
        "]];
        
    };

    // OPFOR briefing
    case east: {
        _player createDiaryRecord ["Diary", ["Briefing", "
            <br/>Pay attention comrades,
            <br/>
            <br/>You must protect the facility from american infiltrations at all costs, you must not let them get the information from the laptops.
            <br/>If they get the information you must make sure they don't escape with it.
            <br/>
            <br/>Succeed at all costs, King
        "]];

    };

    // RESISTANCE/INDEPENDENT briefing -- THIS IS THE BRIEFING YOU WANT TO EDIT FOR YOUR MISSION!
    case resistance: {

    };

    // CIVILIAN briefing
    case civilian: {

    };
};
