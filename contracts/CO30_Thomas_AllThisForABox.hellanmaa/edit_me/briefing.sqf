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
            <br/>MEDEX and CIA
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Safe Sea
            <br/>AMLCOA: Hostile against contractors but should not prolong an engagement unless acting defensively.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>U.N.A.
            <br/>AMLCOA: Most likely expected to engage Contractors on sight, unknown how far spread they are in the area or how they will react to firefights. Contractors should try to limit contact with them, but they can be engaged if fired upon by U.N.A. forces.
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Absent from the area.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>N/A
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Synixe has been hired to recover cargo taken from a MEDEX Research and Development Office about a month ago, when the region was cordoned off by Finnish Armed Forces and U.N.A. Peacekeepers due to unknown circumstances. The culprits are most likely to be the rogue contractors from Safe Sea, a subsidiary company of another Security Contractor, who MEDEX had hired to protect their staff and sites. The size of this force is unknown, same with any other information about the ongoing conflict, as the region is being kept under heavy surveillance by various western agencies.
            <br/>
            <br/>The CIA has agreed to sneak the Contractors, their gear, and vehicles into the area, and found individuals willing to give information about the area to the Contractors. However, the trade-off and finding the container (Known to be a green container with HAZMAT symbols on the side) and anything after that is up to the Contractors to solve. With that in mind, MEDEX has worked out a price that is satisfactory to the individuals, known as 'Firebrand. The Contractors are to meet with Firebrand and, once payment is placed on the tarp at the meeting place, Contractors will be given information on a notepad that will assist them with the recovery of the cargo.
            <br/>
            <br/>To keep the operation clandestine, the CIA has advised that Contractors are equipped with suppressors and require that Contractors keep all air assets grounded as the airspace is prohibited to all aircraft except Finish and UNA aircraft.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
