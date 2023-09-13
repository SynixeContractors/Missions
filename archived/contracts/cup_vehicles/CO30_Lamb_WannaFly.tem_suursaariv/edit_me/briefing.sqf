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
            <br/>New Suursaariv Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>PMC Wagner
            <br/>Working in Russian interest to regain control of the island, they've garrisoned the once abandoned Airbase in an effort to exert power of the New Government.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>The Airbase and its island was long abandoned, no civilians will be present.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Half of the island is covered in forest, with the other being cut down to make room for the Airbase and airstrip.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>The New Suursaariv Govt. is still working to make themselves fully independent, but are now being strong-armed by PMC Wagner's presence on the nearby Airbase.
            <br/>
            <br/>The island of Säyvö is West of the main land, and has been abandoned since Suursaariv's initial independence. Wagner has garrisoned the base once more and Govt. forces have reported seeing a couple of airframes arriving on the island, including a fast-mover.
            <br/>
            <br/>The Airbase is to be cleared out of any and all enemy forces. Any airframes are to be disposed of, and the Airbase to be rendered useless to deter any future attempts of garrisoning it by enemy forces.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
