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
            <br/>Altian government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>F.I.A (Freedom and Independence Army)
            <br/>Enemies will defend the positions both from contractors and landing troops
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, AAF (Altis Armed Forces)
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>No civilian pressence in the AO
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Terrain near the objectives provides good vantage points
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>A few months ago the FIA guerrillas managed to organize themselves enough to the extent that they were able to capture the now militarized island of Stratis.
            <br/>
            <br/>The government has mounted an invasion of the island and wants contractors to secure several landing points so that AAF troops can reach the shore safely.
            <br/>
            <br/>Ninety minutes after contractors begin their assault on the positions several AAF troops will head for the coast. It is imperative that most of the troops survive the assault so that the invasion can continue.
            <br/>
            <br/>As trained and equipped as the AAF are, it is recommended that contractors don't rely on their ability to capture the objectives by their lonesome.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
