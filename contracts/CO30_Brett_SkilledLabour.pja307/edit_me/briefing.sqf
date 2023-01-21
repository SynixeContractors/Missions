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
            <br/>Dariyah Military
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>IDU Terrorists
            <br/>AMLCOA: Attempt to repel the attack, extract the HVT
            <br/>Confirmed Weapons: AKs, RPKs, RPGs, 2-4 DShKM
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Dariyah Military
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are present in the AO
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Too rocky for vehicles, air insertion required.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>The Dariyah military has been trying to locate Abdul-Wahhab Ajani for several months.
            <br/>He is a skilled tactician and leader that has carried out several successful operations against the Dariyah Forces.
            <br/>
            <br/>He has been confirmed to currently be in the town of Anlif, but he has a sizeable force in the town with him.
            <br/>We are tasked with assaulting the town, capturing or killing Ajani, and clearing out the town of any remaining resistance.
            <br/>The Dariyah forces are too inexperienced to handle this mission, but they are nearby and will reinforce us near the end of the firefight to help us clear the town.
            <br/>Once the objective is complete and the Dariyah forces are in place, we can return to our FOB.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
