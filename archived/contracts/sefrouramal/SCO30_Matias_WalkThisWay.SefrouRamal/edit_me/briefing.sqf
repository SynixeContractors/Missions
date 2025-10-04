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
            <br/>UNMA (United Assistance Mission in Argana)
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Tura
            <br/>AMLCOA: Transport the trucks to their destination.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are expected in the region.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Terrain in the AO lacks vegetation.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Through HUMINT the UNA have gotten wind of a weapons shipment that is going to be transported by Tura insurgents from the town of Bir Tiguisit to the town of Rissani. It is believed that said guns will be used to attack the surface mine operated by the Daltgreen corporation.
            <br/>
            <br/>Contractors are tasked with recovering the trucks carrying the weapons and brining them back to the UNA base so that they can be analyzed in order to track down who's supplying the Tura.
            <br/>
            <br/>According to UNA intelligence the convoy will leave Bir Tiguisit at 1530.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
