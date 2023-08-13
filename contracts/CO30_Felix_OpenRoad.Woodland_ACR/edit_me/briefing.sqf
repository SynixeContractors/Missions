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
            <br/>Lenny Loggins Company
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Chernarussian Movement of the Red Star (ChDKZ)
            <br/>The ChDKZ have declared an all out war against all foreign interests in the region, as such, it is highly likely that supply roads and multinational business are being targeted under the current regime.
            <br/>
            <br/>It is known they have access to multiple soviet-era small arms, alongside surplus DShKMs, BRDMs, and BTRs; these are usually kept to zones of higher influence designated within the area of operations.
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are present in the area and are believed to be unsupportive to ChDKZ, thus friendly to contractors.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Extensive mountain ranges and dense forests.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Contractors have been hired to provide logistics for the client, ensuring the delivery of three Zamak trucks carrying timber piles to the designated locations marked within the area of operations.
            <br/>
            <br/>It is known that ChDKZ are operating in the area, mostly around zones of influence marked around in the area of operations; however, it is likely that there are unknown cells operating in other parts of the region, either garrisoning forward positions or being on the lookout for potential targets to ambush. As such, it is best if contractors are to avoid nearing said zones under ChDKZ influence.
            <br/>
            <br/>Once you arrive at each destination, each truck, alongside with the corresponding cargo, is to be left within the premises.
            <br/>
            <br/>Additionally, contractors must make sure to see that the workers of the designated settlements are safe and sound upon contractors' arrival and until contractors' departure.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
