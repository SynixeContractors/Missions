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
            <br/>United Assistance Mission in Argana (UNMA)
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Tura Insurgents
            <br/>The Tura will attempt to disrupt the water delivery in order to further destabilize the region.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>UNA forces
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Expect some civilian presence in the towns.

            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>The Sefrou-Ramal region of the Sefrawi Desert is characterized by inhospitable sand dunes; so expect open sightlines and little cover aside from buildings
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Three days ago a firefight took place near a water treatment plant that supplies local towns, when the firefight ended key equipment in the plant was damaged after a UNA tank fired on it.
            <br/>UNA engineers are already working on fixing the water treatment plant, in the meantime Synixe has been hired to deliver boxes filled with water bottles to the towns that no longer have acces to clean drinking water.
            <br/>UNA has also asked us to deliver a toolkit to the engineer crew in the water treatment plant and some water to a checkpoint.
            <br/>
            <br/>Synixe has been provided with a HEMTT in order to transport the water, UNA is worried that Tura insurgents will attempt to stop the water delivery in orden to worsen UNA realtions with the locals.
            <br/>Scouts have been spotted around the base so be on the lookout for hostile forces while in transit to the towns. We are authorized to open fire on anyone who attempts to stop us from delivering the water.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
