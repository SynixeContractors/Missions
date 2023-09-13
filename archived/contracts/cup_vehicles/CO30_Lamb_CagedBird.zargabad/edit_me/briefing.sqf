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
            <br/>United States Department of Defense
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Local Terrorists
            <br/>Intelligence gathered from captured Wagner contractors points to an upcoming assault on Zargabad and its airfield by the local terrorist force. They've been provided with APCs by Wagner.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Blue Falcon Company, Yongshi Security Service
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians have evacuated the city due to the local terrorists taking over the city. 
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Outside of Zargabad it is mostly flat terrain but the city itself is heavily urban, windows and alleys are of chief concern.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>The debriefing of the Wagner contractors have led to the information that the local terrorists will be assaulting PMC positions within and around Zargabad early in the morning. They will be under the direction of Wagner advisors in a Command Post within or nearby Zargabad. 
            <br/>
            <br/>Blue Falcon Company has set up a hasty defense at the airfield, and Yonshi Security Service have set up a defense and patrol in the village of Yarum.
            <br/>
            <br/>Blue Falcon Company is in charge of keeping the Airfield in friendly hands. Yongshi Security Service's responsibility is to contain the fighting within Zargabad.
            <br/>
            <br/>Synixe's objective is to clear Zargabad of enemy forces as well as find the Wagner Command Post.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
