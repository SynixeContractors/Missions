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
            <br/>CIA
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>PMC Wagner
            <br/>AMLCOA: Will defend base, heli-borne reinforcements from nearby FOB are expected.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>N/A
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font color>
            <br/>Only hill in the area overlooks the entire pipeline.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Synixe has been hired by the CIA to attack and destroy a Russian-guarded pipeline in the deserts of Takistan. As tensions rise between NATO and CSAT, the U.S. is looking for ways to weaken Russian influence in Takistan by staging an attack on one of many well guarded oil pipelines -- showing the Takistani government that PMC Wagner (The entity in control of the security of most national pipelines) is unfit to do so and cannot protect their assets. 
            <br/>
            <br/>Decimate the enemy staged in the AO and destroy the pipeline before returning to base. Due to the only feasible way for reinforcements to arrive to aid Wagner are Heliborne, AA is recommended (and can be supplied by the CIA).
            <br/>
            <br/>As this operation is not to be linked back to Synixe or NATO in any way, nothing that would identify Contractors is to be left behind or else the mission is a failure -- keeping the identity of the attackers unknown is more important than the objective itself.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
