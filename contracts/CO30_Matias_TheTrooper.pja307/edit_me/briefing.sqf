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
            <br/>Department of Defense (D.O.D)
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Takistani Army
            <br/>AMLCOA: Attack anyone who's on their territory on sight
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, US Army
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>N/A
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>The terrain on the takistani side is hilly with thick vegetation on some parts
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Recently an LRRP that was sent to scout an oil pumping facility under Takistani control has gone MIA. The patrol consists of four delta team operators who were being accompanied by an army officer.
            <br/>
            <br/>Contractors have been tasked with brining all of the members of the patrol back, wether they are dead or alive. It is suggested they start by investigating the pumping facility.
            <br/>
            <br/>The US army holds one side of the region while the Takistanis have set themselves up on the other one.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
