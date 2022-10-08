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
            <br/>Central Intelligence Agency (C.I.A)
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Takistani Army
            <br/>The army will try to prevent the extraction of the HVT, possible QRF is expected.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors
            <br/>Squad of undercover SAC operatives
            <br/>

            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>Some civilians are expected in the main city

            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font color>
            <br/>The outskirts of Zargabad are relatively flat and desert, except for some trees.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Three months ago the C.I.A got confirmation that Takistan had renewed it's chemical weapons program.
            <br/>At the possible threat of a nerve agent being developed Synixe has been hired by the C.I.A to apprehend and extract the head of the CW program.
            <br/>
            <br/>The target is located on his personal villa, surronded by a multitude of soldiers. Intel shows a confirmed gunship stationed in the AO.
            <br/>It is also knwon that he is closely guarded by a team of Takistani spec ops, who are willing to die to defend him.
            <br/>
            <br/>Contractors are tasked with apprehending the HVT and loading him up in a plane waiting at the airport, after that he will be flown out of the area by the SAC squad.
            <br/>Be advised that the SAC team is undercover as militia, so watch your fire as we don't want any blue on blue.
            <br/>We have been provided with locally sourced SUVs for this job, aswell as a box of Stingers in order to deal with the gunship. A possible QRF is expected out of the local military base
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
