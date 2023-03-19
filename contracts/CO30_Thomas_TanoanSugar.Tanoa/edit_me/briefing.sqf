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
            <br/>Tanoan Sugar Company
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Syndikat - Powerful criminal organization, employs a variety of small arms and RPGs. Access to unarmored and lightly armored vehicles. Expected to attempt to retake the factory if contractors gain control of the area.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Gendarmerie
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are present all across the AO.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>AO is filled with dense jungles.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>With the ongoing election in the Horizon Islands, tensions between multiple political and criminal organizations have been elevated. Taking the opportunity to weaken the government and sieze power, Syndikat has launched a renewed offensive across the Horizon Islands. This has kept the HIL locked in COIN operations, leaving the underequipped Tanoan Gendarmerie to hold off the crimewave on their own.
            <br/>
            <br/>One of Syndikat's base of operations is located at the TSC Sugar Factory in Tanouka, leaving the TSC without their main production facility and giving Syndikat a base close to Georgetown where the majority of Tanoa's Gendarmerie and government have gathered.
            <br/>
            <br/>Contractors have been hired to retake the factory in Tanouka, and protect it against any Syndikat counter-attack until the TSC can convince the government to send Gendarmerie to protect the factory.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
