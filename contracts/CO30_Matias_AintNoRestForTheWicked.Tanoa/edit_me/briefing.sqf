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
            <br/>Tanoan Government, NATO
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Unknown
            <br/>Unknown
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilian pressence is expected in the towns
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Terrain in Tanoa is riddled with jungles.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Recently an ION convoy with three Daltgreen trucks carrying Uranium-235 was ambushed. The convoy was headed to the La Rochelle docks to load the trucks onto a NATO boat so that the Uranium was transported to allied countries. To avoid a gloabal crisis NATO and the Tanoan government have hired Synixe to recover the trucks.
            <br/>
            <br/>We know were the convoy was ambushed, we are tasked with investiganting the remains and finding out where the trucks are. Once we find them we are to take them to where they were originally headed and load them onto the ship that is going to take them out of the country.
            <br/>
            <br/>You are authorized to establish contact with any surviors or nearby civlians to gather clues.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
