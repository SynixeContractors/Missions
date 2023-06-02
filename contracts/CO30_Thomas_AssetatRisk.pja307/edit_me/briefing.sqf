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
            <br/>U.S. Department of Defense
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Warlord Forces
            <br/>AMLCOA: Move mostly on bike and on foot due to rocky, mountainous terrain.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Armed Forces of Kushan
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>N/A
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Present in all towns, many don't like the U.S. and local warlords forces.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Mountainous terrain with lots of trees and large rocks, provides lots of concealment and cover. Infil by land deemed both impractical and impossible.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>While Hezbollah-e-Kushan is not present in the AO, as their forces are being held back in the southern part of Kushan with the introduction of Coalition forces into the region, a local warlord (Abbas Khalili) and his men have been gaining power in the mountainous, northern regions of Kushan. Due to Kushan Forces and sparse Coalition forces being mainly focused on the South, the situation quickly grew out of hand. The CIA has focused part of their attention on the warlord's forces in an attempt to keep the region stable, which has included the use of informants and insiders into the group.
            <br/>
            <br/>One informant (Jabr Anwari) has given the CIA many leads into the innerworkings of the group, although many of his physical leads being mixed bags. Upon further analysis, other insiders have reported this informant working with the Warlord to ambush and attack Kushanate Forces and Ground Branch teams working in the area. However, the informant has suddenly requested that he be brought out of the country in return for major information on the Warlord's location. It seems that the Warlord's forces were unaware that the informant was working with the United States, leading to the Warlord putting a large bounty on his head.
            <br/>
            <br/>With Synixe contractors already in the area, we have been hired by the CIA to secure the informant and bring him to the outpost in Ben Geurrir. Due to the make and distance of the terrain, the CIA will provide transport into the AO to a pre-designated LZ a kilometer away from the town of Oum Ali (where the informant is located).
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
