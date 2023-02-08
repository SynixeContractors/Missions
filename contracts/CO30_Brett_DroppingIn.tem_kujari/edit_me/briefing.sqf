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
            <br/>Kujari Military
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Local rebel forces
            <br/>AMLCOA: Defend their territorial gains, including the Airfield and nearby towns.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Kujari Military
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>May be present in nearby towns.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>A military airfield has been taken over by rebel forces. The airfield is a vital asset to the Kujari Military, and must be retaken.
            <br/>We are being sent in via parachute to take back the airfield.
            <br/>
            <br/>A smuggler will take two crates into the area, put any backpacks or other gear you need in them. They will be taken to the yellow area marked on the map.
            <br/>
            <br/>Once you are ready, have the OL tell the smuggler you are ready to go, then plane will take off a few seconds later. The pilot will call when it is time to jump, double tap V once he calls GO GO GO.
            <br/>
            <br/>Once you have your gear and regrouped, take the airfield and repel any enemy forces that try to take it back.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
