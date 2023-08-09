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
            <br/>Tura
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Rebel Forces
            <br/>AMLCOA: Ambush ourselves or the government forces, disrupt communications equipment
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>Civilians may be operating in organized or unorganized militas when under threat
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Most civilians are supportive of the government forces, but some may be sympathetic to the rebels
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Vehicles are not able to operate in the area
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>We have been hired to help with some tasks at an outpost while government forces undergo training.
            <br/>
            <br/>We have 3 tasks to complete:
            <br/>1. Collect diagnostic data from a <marker name=""tower"">communications tower</marker>
            <br/>2. Deliver supplies from the <marker name=""fob"">FOB</marker> to the <marker name=""infantry"">outpost</marker>
            <br/>3. Conduct a patrol through the surrounding villages, investigate and report any suspicious activity.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
