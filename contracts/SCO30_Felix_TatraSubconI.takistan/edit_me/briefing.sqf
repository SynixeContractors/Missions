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
            <br/>Takistani government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Takistani militia
            <br/>The takistani militia have been occupying civilian towns and causing sieges across the region, often employing scorched earth policies. They will attempt to intervene with any operations that may gain influence for their opposition, while also trying to distort and manipulate the other side's reputation with the local population.
            <br/>The takistani militia may be in posession of: BTR40s, MT-LBs, Hiluxes, Land Rovers, Mines, and Static emplacements.
            <br/>

            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>British Armed Forces, IDAP
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>N/A
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are present in the AO and may or may not be supportive of contractors.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>n/a
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>We have been contracted by the Takistani government to assist in regainin the local's support for Takistan's leadership.
            <br/>
            <br/>Insurgents have been forcing, either by manipulation or by influence, the local population to side with them. They have been redistributing supplies to those who support them, and cutting supplies to whole towns that dissaprove of them.
            <br/>
            <br/>Contractors have been tasked with displacing militia forces from towns they've occupied, delivering supplies and aid to towns in need, and sabotaging all militia operations in the AO.
            <br/>
            <br/>Specific tasks may be handed out by either the Takistani government, the British Armed Forces, or IDAP.
            <br/>
            <br/>Contractors will be provided with 1x Tatra with enhanced cargo capabilities (8). If this Tatra is destroyed and contractors don't posess one, mission can not be continued and is a mission failure if no tasks have been completed.
        "]];

        _player createDiaryRecord ["Diary", ["Tasks", "
            <br/>IDAP will need 4 stacks of Water Bottles and 2 Medical Supplies Boxes.
            <br/>
            <br/>The town of Timurkalay and Mulladost need 2 Sacks of Food each.
            <br/>
            <br/>Contractors have been tasked with displacing militia forces from towns they've occupied, delivering supplies and aid to towns in need, and sabotaging all militia operations in the AO.
            <br/>
            <br/>There is enemy presence in Garmsar and in Lalezar, you must end their operations.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
