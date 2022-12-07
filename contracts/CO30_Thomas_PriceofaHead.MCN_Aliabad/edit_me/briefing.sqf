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
            <br/>United States Department of Defense
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Hamas Al Qassam
            <br/>AMLCOA: fighters expected to ambush contractors when present in the northern part of the region that Hamas controls, unknown how they will do so.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font color>
            <br/>Ansar Allah (Houthis)
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>Civilians are present across the entirety of the AO, most likely includes civilian presence in enemy strongholds. Caution is advised when engaging hostiles in urban environments.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font color>
            <br/>N/A
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Contractors have been hired by the D.O.D. to rescue the Commander of the armed political group, Ansar Allah, from a Hamas prison in the Aliabad Region. The Commander, Arif Bakhtari, was captured during an ambush led by Hamas forces, who plan on executing him the following day from today.
            <br/>
            <br/>Once Commander Bakhtari is rescued, head to a marked site held by Ansar Allah. An officer will meet you after your arrival to the site and trade the Commander for documents that contains information pertaining to the abduction of a CIA informant by unknown forces.
            <br/>
            <br/>While Ansar Allah are buddy-buddy with contractors at the current moment, it should be noted that the group is officially designated as a terror group by the United States, caution should be entertained when operating around Houthi forces. That being said, the Hamas prison is most likely holding more than just the Houthi Commander and any other prisoner found on-site is to be held by contractors regardless of prisoner affiliation, and NOT turned over to the Houthi forces.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
