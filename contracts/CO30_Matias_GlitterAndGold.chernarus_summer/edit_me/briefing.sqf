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
            <br/>The Pan-Global Corporation
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Chernarussian Movement of the Red Star
            <br/>Protect what they've stolen
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilian pressence expected in towns.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Outside of cities Chernarus is mainly covered by forests.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Recently four trucks loaded with gold ore were stolen from a mine owned by the Pan-Global corporation.
            <br/>
            <br/>HUMINT has revealed that the people responsible for the theft are the Chernarussian Movement of the Red Star and that they plan to sell the trucks to fund their operations.
            <br/>
            <br/>Chedakis have been spotted at the Balota airfield, so Pan-Global has hired Synixe to go to the airifield and recover all four trucks.
            <br/>
            <br/>Once the trucks have been acquired they are to be dropped off at the docks south of Komarovo, where a Pan-Global sensitive cargo recovery team is waiting to take them to a secure location.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
