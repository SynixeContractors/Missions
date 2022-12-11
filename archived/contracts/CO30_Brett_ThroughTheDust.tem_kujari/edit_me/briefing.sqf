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

    // RESISTANCE/INDEPENDENT briefing
    case resistance: {
        _player createDiaryRecord ["Diary", ["Employer", "
            <br/>Kujari Government
        "]];

		_player createDiaryRecord ["Diary", ["Intelligence", "
            <br/>The militia forces are mostly made up of untrained fighters with late cold war equipment.
            <br/>They have been known to use RPGs and heavy machine guns, although their supply of these weapons is small.
            <br/>Expect mostly infantry resistance, they will most likely attempt to capture any supplies we are transporting.
        "]];

        _player createDiaryRecord ["Diary", ["Equipment", "
            <br/><font color='#0ECE68'>GROUND ASSETS:</font>
            <br/>- 2x Land Rover (M2)
            <br/>- 2x Land Rover (Transport)
            <br/>
            <br/><font color='#0ECE68'>AIR ASSETS:</font>
            <br/>- N/A
            <br/>
            <br/><font color='#0ECE68'>SPECIAL ASSETS:</font>
            <br/>- N/A
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/>Multiple factions in the area are fighting over the control of local supplies. Some may be openly hostile, others may be neutral.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>- Synixe Contractors
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>- Local Militias
            <br/>
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>- Local Militias
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>We have been contracted to deliver supplies to a remote village. The region suffers from lack of infrastructure and supplies. Several factions have been competing for control of the area.
            <br/>
            <br/><font color='#E3D310'>PRIMARY OBJECTIVES:</font>
            <br/>- Transport the supplies to <marker name = 'delivery'>Turawa</marker>
            <br/>
            <br/><font color='#E3D310'>SECONDARY OBJECTIVES:</font>
            <br/>- Construct a bridge in the <marker name = 'bridge'>designated area.</marker>
        "]];        
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
