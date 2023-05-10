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
            <br/>Chernarus Ministry of Defence
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Chernarussian Movement of the Red Star
            <br/>The ChDKZ have been at war with the CDF for the past few months. The CDF has attempted to de-escalate the situation by offering refugee status to any members of the ChDKZ who desert it's military regime. They are a militarized insurrection.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors, Chernarus Defence Force, United States Marine Corps.
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>Civilians are present in the Chernarussian region.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Synixe Contractors have been tasked with assisting the CDF in securing POWs deserting from the Chernarussian Movement of the Red Star.
            <br/>
            <br/>As part of this operation, we will be meeting with a CDF commander who will be giving us a brief by 0830.
            <br/>
            <br/>The CDF have planned this operation throughout, and as such, it is of utmost importance that we are on time for any of their requests. This is of utmost importance for the safety of everyone involved in the operation. Contractors must treat all POWs with respect and keep them safe, alongside providing them open space to surrender safely.
            <br/>
            <br/>This is a time-gated operation, make wise use of your time. Contractors are to be at each designated location on time, and must stay within the premises of the AO when not en route to their FOB, additionally, the airspace is restricted to the CDF only. Failure to comply with these requirements is grounds for termination of the contract.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
