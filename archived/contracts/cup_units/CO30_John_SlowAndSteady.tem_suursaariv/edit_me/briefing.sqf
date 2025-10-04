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
            <br/>New Suursaariv Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Former Suursaariv Military turned Terrorists 
            <br/>Terrorizing New Suursaariv Govt. by planting explosives in construction sites, will likely attempt to stop any and all attempts to assist the new Govt. 
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, New Suursaariv Govt. Militia
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Majority of Civilians are in support of New Govt. and their activities, with a vocal minority being against. Workers will be near and around work-sites and will continue what work they can. 
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>The island is covered in forest, with the ability to see long distances being restricted.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>The New Suursaariv Govt. has only recently gotten into power, but already they are making plans to further industrialize the island and expand their export of Lumber. There are terrorists intent on stopping this progress.
            <br/>
            <br/>A work-site (Mattila) and a main exportation harbor (Lounatrivi) have been found to be mined with military grade Anti-Personnel mines as well as some Improvised-Explosive-Devices. These are to be disarmed and collected. Failing that, markers are to be placed for units that are capable of defusal.
            <br/>
            <br/>A ruined village (Miettilä) has also been found to have UneXploded Ordnance (UXO). These UXOs are to be disarmed and collected. Failing that, they are to be marked for defusal by capable units later.
            <br/>
            <br/>When all explosives have been collected/marked, meet with New Suursaariv Govt. Militia (Factory Area) to drop off the explosives for disposal or inform them of the successful markings.
            <br/>
            <br/>Any and all terrorist activity are to be eliminated.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
