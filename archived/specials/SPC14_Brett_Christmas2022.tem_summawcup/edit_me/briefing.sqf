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
            <br/>Christmas Spirit
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Gran Rebelde de Invierno Nación contra Holidays (GRINCH)
            <br/>AMLCOA: Try to kill any that support Santa and his Christmas objectives
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Civilian Resistance
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>All civilians have either fled or joined the resistance
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>It is snow, guns and equipment can be found scattered around and near settlements
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>GRINCH has risen up to stop joyous holidays! Their first target is Christmas!
            <br/>Your mission is to stop them from destroying Christmas!
            <br/>
            <br/>Civilians have either fled or joined the resistance, we are joining the resistance, but we are scattered and lacking supplies.
            <br/>We need to scavenge for supplies and fight back, but we need to be careful, GRINCH has a lot of soldiers and they are well equipped.
            <br/>
            <br/>Try to regroup and make your way to Santa's FOB in the region, and arm up to defend Christmas against those who would destroy it!
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
