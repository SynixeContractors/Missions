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
            <br/>Takistani Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Takistani Militia
            <br/>The Takistani Militia is known to be operating in large across the northwestern Takistani Mountains, specially after recently destroying a keypoint oil drilling installation.
            <br/>
            <br/>They have been keeping the Takistani mountains terrorised, having mined both the oil drilling installations as well as the mountains nearing their area of influence, keeping local and international forces on their toes.
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are present in the area of operations and may or may not be in support of either contractors or the takistani militia.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Dense tree cover.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>A recent scorched-earth policy carried out by the Takistani Militia has enraged the Takistani government, and caused a largely negative impact on the multinational companies operating in Takistan.
            <br/>
            <br/>The Takistani Militia has not only destroyed one of Takistan's most important oil drilling facilities, they have also completely terrorised the northwestern Takistani mountains, having mined their flanks as a safety measure. Demining the oil drilling facilities, let alone the mountains, is unfeasible, and due to this, it is highly recommended that contractors stick to ASRs and villages.
            <br/>
            <br/>As such, contractors have been hired as a retaliatory procedure; intending to be a final cease-and-desist letter to the Takistani cell operating in the northwestern Takistani mountains.
            <br/>
            <br/>It is known that the Takistani Militia has been operating in a suspiciously organized manner, having led international forces to believe they must have seized an important asset from the locals; drone footage has revealed that there is a tall radiocommunications tower in the area of operations in close proximity to the town of Nagara.
            <br/>
            <br/>Contractors must find this tower and ensure that it is fully destroyed, additionally, they must eliminate any and all Takistani Militia forces they encounter in the area.
            <br/>
            <br/>It is worth noting that under the current contract, contractor vehicles have not been allowed into the area of operations, and the airspace is restricted for any aerial procedures.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
