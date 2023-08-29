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
            <br/>Daltgreen Mining and Exploration LTD.
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Sefrawi Militia
            <br/>Their most likely course of action will to sabotage the surface mine
            <br/>by conducting coordinated attacks and implementing guerilla tactics.
			<br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Deltagreen Armed Security
            <br/>
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Local populace lives far away; Nomads are unlikely to venture close to the mines. 
            <br/>Do not expect a civilian presence on the premises.
			<br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>The surface mine borders the sand sea of the Sefrawi desert. There are significant variations  
			<br/>in elevation, but otherwise little to no natural borders and/or obstacles.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>The surface mine in Sefrou-Ramal was closed due on-going tension in the region.
            <br/>Our employer has however decided to reopen the mine due to the rising demand
            <br/>in precious metals. The rewards now seem to outweigh the risks. However, after resuming
            <br/>mining operations, Daltgreen employees have been met with heavy resistance by the local
            <br/>populace. There have been two IED attacks in the past three weeks. Daltgreen's mining
            <br/>personnel have been evacuated until their safety can be guaranteed. Expect more traps.
            <br/>
			<br/>There is on-site security. They are severely understaffed (6) and primarily consist 
			<br/>local hires. On-site security have guard posts on the two roads into the mine and
			<br/>have multiple security camera's set up, watching the grounds and roads. An AR-2 Darter
			<br/>UAV also constantly patrols the perimeter, hopefully to prevent trespassers from entering
			<br/>the site. All feeds can be followed from the main control room. Each guard post has a feed
			<br/>to their own camera's. We've also been given access to Daltgreen's fleet of security vehicles.
			<br/>
			<br/>TASKS:
			<br/> - Disarm all traps/mines/IEDs on the premises
			<br/> - Repel all attacks
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
