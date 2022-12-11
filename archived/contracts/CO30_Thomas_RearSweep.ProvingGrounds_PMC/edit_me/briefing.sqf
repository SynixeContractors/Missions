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
            <br/>Czech Republic
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Slovakian Partisans
            <br/>AMLCOA: Has high presence in the area and is expected to respond to any contractor action.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>N/A
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Area is devoid of non-combatants
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>N/A
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Synixe has been hired to clear the stretch of road in the AO, as well as three marked sites of interest, of any danger to Czech forces that plan on using the route for logistics. The area itself is not safe, but part of an area controlled by Slovak Separtists, but encirlced by Czech forces after a recent blitz into Separtist Territory. While this is an unsafe way to bring resources to the front, the spread and unorganized Czech forces and their need for immediate supplies, has created the need for such dire tactics and our services.
            <br/>
            <br/>The make of the separtist soldiers in the encircled area is mostly unknown, however caution is advised as a force, which included infantry and 3 tanks, was ambushed and forced to pull back, losing two tanks and taking heavy infantry casualties during the course of the engagement. 
            <br/>
            <br/>Moreover, a U.S. jet supporting Czech forces by attacking possible strongholds in the area had a weapons malfuntion and missed its main target, the military base along the road. Due to the error in the targetting system, and with no eyes on the ground to confirm the location of the ordnance, it is unknown where the payload landed and what damage was caused.
            <br/>
            <br/>If anything on the road cannot be cleared off the road, mark down its location. However, we are expected to clear any explosive or human danger to logistics coming through the area. Anything obstacles unable to be moved by contractors will be cleared out by the Czech reservists guarding the first convoy coming through the AO.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
