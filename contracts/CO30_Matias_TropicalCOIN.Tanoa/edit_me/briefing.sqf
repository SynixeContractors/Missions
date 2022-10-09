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
            <br/>Horizon Islands Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Syndikat forces
            <br/>Enemy forces will stand their ground to defend themselves
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>We will be heading into different towns, so expect some civilan activity

            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font color>
            <br/>The Horizon Islands are home to lush tropical vegetation, so we will be engaging in jungle warfare.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Recently an IDAP camp was hit by the Syndikat, it was razed to the ground and workers vanished into thin air. That was the last straw for the government.
            <br/>The Horizon Islands Government has therefore hired Synixe to run counter insurgency operations against the Syndikat. The main objective is to execute a kill or capture order on the both the heads of the bandit and paramilitary branches of the Syndikat (Alika Erenavula and Theo Barou respectively). If possible find the supplies and/or IDAP workers and take them back to base. HUMINT has revealed the location of the bandit leader but the paramiltary leader is still to be found, however we know of several areas were Syndikat forces were spotted
            <br/>
            <br/>The government will also pay extra for any intel found, supplies destroyed or goods recovered.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
