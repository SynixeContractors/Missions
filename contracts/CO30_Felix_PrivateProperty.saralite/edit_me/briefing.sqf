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
            <br/>Schnell, by contract from Mark Duncan
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Militarized insurgency
            <br/>Insurgents are highly aggresive and will resort to smash and grab measures. They will not negotiate.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians will be present in nearby towns.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Desert, open area. Plan carefully, set up strategic positions and defenses.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>We have been contracted to protect private assets owned by Schnell, located West of the town of Cayo.
            <br/>
            <br/>Schnell is a fuel company which has oiling premises across Sahrani, most notable the one located by Cayo.
            <br/>
            <br/>It is believed that insurgents may attack this property on this date in order to destabilize local supplies; we are unsure as of yet whether they will be attempting to take over or destroy the assets.
            <br/>
            <br/>We will be protecting the oil pump fields from insurgent presence should any become apparent. You are to engage enemy presence with aim to kill etiquette.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
