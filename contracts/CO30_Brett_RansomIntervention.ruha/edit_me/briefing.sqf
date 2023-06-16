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
            <br/>Alcot Insurance, Ruha Police
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Unknown
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are present near the area of operations.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>A polish businessman named <font color='#FF0000'>Krzysztof Eberhardt</font> has been kidnapped by an unknown group of individuals. We have been hired by his insurance company to negotiate for his release, or recover him by force if necessary.
            <br/>
            <br/>We have been given a location to meet the kidnappers. We are to meet them at the location, and attempt to negotiate for his release.
            <br/>
            <br/>They have set the ransom at <font color='#FF0000'>$2 million</font>. Once we have Mr. Eberhardt, we are to bring him to the airport for extraction.
            <br/>
            <br/>If safe to do so, we are to attempt to recover the ransom money as well and prevent the kidnappers from escaping with it.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
