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
            <br/>Takistani Insurgent Militia
            <br/>The Takistani insurgents are known to associate and mix between the locals, alongside this, they utilise their supporters to help them store supplies in difficult and controversial locations to access for most militaries; the locals' homes. They are highly violent and will quickly respond to western threats.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>United States Marine Corps
            <br/>Rarely seen on foot nowadays, the vestiges of their pull out remain, sometimes establishing local security... although, their remnants of war are scattered amongst destroyed homes and bombed fields.
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are present in the area, and may be cooperating with the local militia.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Open fields and tree lines. Previously a war zone victim to many bombings during the war on terror.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Contractors have been tasked with investigating a few local compounds to ensure they are free of the local militia's influence.
            <br/>
            <br/>In order to achieve this, contractors have been contracted to look into homes and search for any clues that could identify an association with the local militia, additionally, contractors must identify if any weapon caches are present, and report them.
            <br/>
            <br/>Due to the previous Takistani conflict, it is highly advised to watch out for UXOs in open fields and destroyed structures, and hidden IEDs alongside roads. It is in your best interest to stick to roads and to try to avoid going off path as you go town to town.
            <br/>
            <br/>Additionally, contractors have been deployed on foot with no access to their own vehicles. It is a hot day for takistani weather - and it is recommended to conserve stamina and ensure proper weapon safety measures.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
