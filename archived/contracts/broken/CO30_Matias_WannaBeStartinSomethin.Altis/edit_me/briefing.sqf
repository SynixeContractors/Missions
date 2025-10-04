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
            <br/>Altian Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Freedom and Independence Army (FIA)
            <br/>AMLCOA: Hide and protect the caches.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>AAF
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>N/A
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>The terrain in the AO is mostly composed of mountains and forests
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>An AAF intel gathering operation found that the FIA has been planning an assault on the town of Oreokastro. The Government has evacuated the civilians from the town and has stationed some AAF troops there.
            <br/>
            <br/>Since the town is already undermanned the Government has contracted Synixe to find the weapon caches the FIA are planning to use to assault the town and destroy them.
            <br/>
            <br/>The intel the AAF has gathered says that there are six caches in the area around Oreokastro.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
