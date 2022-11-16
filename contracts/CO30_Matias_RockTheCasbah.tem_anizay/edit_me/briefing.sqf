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
 * <font color='#FF0000'>TEXT HERE</font color>
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
            <br/>C.I.A (Central Intelligence Agency)
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Ansar Allah (Houthis)
            <br/>Protect the locations in which they're stationed
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>No civilian pressence in the AO
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font color>
            <br/>The terrain in the AO is fairly flat
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>For a while now the CIA has been hunting Mahomet Hamady, the leader of Anizay's local Huthis cell. Recently Houthis released a video starring Hamady in which he executed three IDAP aid workers that were captured in a nearby village.
            <br/>
            <br/>Using geolocation technology the CIA pinpointed the approximate area in which the video was filmed. Contractors have been tasked to search the area for any clues that may point to where Hamady is headed next.
            <br/>
            <br/>Should Hamady's next location be within the region, contractors are allowed to execute a kill or capture order on his head. If he's headed somewhere outside the region contractors should bring back the exact location to where he's headed.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
