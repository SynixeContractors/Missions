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
            <br/>Chernarus Military
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Chernarus Military
            <br/>AMLCOA: Defend their camp
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Chernarus Military
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>The camp may have non-military members
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>The area should be free of civilians, but there will be some in nearby towns
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>The Chernaurs Military has been dealing with issues in their ranks. One such issue is a group of roughly 60 soldiers that have been doing their own training outside of the base during downtime. They have been doing this for a few months now, and the base commander has decided to send a team to investigate. The problem is he doesn't know the full membership of the group, and has decided to bring us in to help. We will be going in to the area and investigating the group.
            <br/>
            <br/>Recent inventory has revealed a small number of static weapons, explosives, electronics and ammunition missing. Although not uncommon for some ammunition to go missing, the explosives and electronics are a bit more concerning.
            <br/>
            <br/>We have been provided with two vehicles, but we can optionally bring some of our own as well.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
