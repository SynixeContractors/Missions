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
            <br/>British Armed Forces, IDAP
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Takistani Militia
            <br/>Attack Contractors on sight. They are staged to the west of the village.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, British Armed Forces
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilian pressence is expected, as well as an IDAP camp mounted in the village.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>The terrain in the AO is mountainous.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Tensions are high in the Takistan Mountains as the British Armed Forces have been helping IDAP with humanitarian missions, which the Takistani militia sees as a threat.
            <br/>
            <br/>Yesterday an attack occured on a village which is currently home to an IDAP aid camp. The Takistani milita had been amassing to the West of the village but were not percieved as a threat. In the attack aside from opening fire on civilians they abducted the village elder. It is believed that he will be used as a bargaining chip to get the British to leave the area.
            <br/>
            <br/>The British have hired Synixe to move into enemy territory and gather information to find where the elder is and bring him back home if possible. IDAP has also asked us to deliver some supplies to their aid camp in the village.
            <br/>
            <br/>British Armed Forces have set up a checkpoint between the enemy territory and the village. They have notified us that there is a stretch of road that is mined, which IDAP is planning to clear with an UGV. If Synixe were to clear it it would certainly help improve our reputation.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
