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
            <br/>Takistani Insurgents - Mobile guerilla fighters who employ a mix of explosive and small arms ambushes. However, they can utilize dated, but lethal, armor and heavy weaponry. Considered direct enemies with NATO and the current Takistani Government, and are expected to disrupt contractor activity in the area.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, NATO, Takistani Army
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>Yongshi Security Services, CSAT
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are present in all towns and villages, however their allegiance is split between numerous groups.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Most roads in the AO sit between mountains in valleys, lots of cover for hidden forces. 
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Due to non-existant arms production in the country, the Takistani Government implemented a plan to purchase military equipment from the United States to replace their military's dated arsenal. To the dismay of Russia and CSAT, who bid against the U.S. to supply the Takistani Army, the details of transaction had been finalized and shipments of weaponry, body armor, and vehicles were moved to the joint NATO-TA Airbase in Rasman.
            <br/>
            <br/>Contractors have been hired by the Takistani Government, with the oversight and approval of the DOD, to supply the initial rollout of weaponry and ammunition to TA Forces in the region. The bases designated by the Takistani Goverment for delivery are:
            <br/>- Rasman Gate Base
            <br/>- Feruz Abad Military Base
            <br/>- Garmsar Military Base
            <br/>- Loy Manara Airbase (CSAT-TA Joint Airbase)
            <br/>
            <br/>Contractors should be made aware that the southern part of the AO is currently experiencing open conflict between TA and Insurgent forces, and are advised to perform their tasks with caution.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
