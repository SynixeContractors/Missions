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
            <br/>Chernarussian Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Chernarussian Movement of the Red Star
            <br/>They will attack contractors on sight.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Chernarussian Defense Forces
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>The only civilians remaining in the island have been radicalized and are aiding the enemy
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Terrain in the AO is mountainous and partially covered by forests
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Recently the Chernarussian governemnt have found out that the Chernarussian Movement of the Red Star have been using the long abandoned island of Utes as a smuggling hub. From there they fly out contraband to fund their operations as well as supplies for their troops.
            <br/>
            <br/>When the government decided to do something about it they sent a chopper with a squad but found out that the situation is worse than they thought. The chopper got shot down and they've lost contact with the troops.
            <br/>
            <br/>Synixe has been hired to move in on the island and destroy any and all vehicles being used in the operation. We've also been tasked with stopping any vehicles from either leaving or coming in, as well as destroying the any defenses that may prevent the CDF from moving in on the island when they retake it.
            <br/>
            <br/>We've also been informed that one of the pilots of the helicopter managed to activate his ESAT so we know that at least he made it out. He's probably being held prisoner somewhere close to where the plane crash occured. Rescuing him would help with our reputation in the eyes of the Chernarus government.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
