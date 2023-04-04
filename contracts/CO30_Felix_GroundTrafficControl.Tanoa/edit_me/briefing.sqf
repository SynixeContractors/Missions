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
            <br/>Winston Ba, from the Inner Circle organization.
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Not specified in the contract.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Gendarmerie, Inner Circle
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians will be present in the region, and a few will be arriving at the airport's arrivals.
            <br/>
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Contractors have been hired to arrest a controversial figure in Tanoa, known as Markos Savala.
            <br/>
            <br/>Officially, contractors will be holding security at the Aeroport de Tanoa to arrest any 'suspicious arrivals'. However, this is a cover disguise for the unofficial operation.
            <br/>
            <br/>Unofficially, we have been contracted to arrest Markos Savala. He will be arriving in one of the flights arriving at Aeroport de Tanoa. He can be identified by his formal dress code, as he will be wearing a suit, and any further personal identification methods.
            <br/>
            <br/>Contractors will hold and maintain security at the Aeroport de Tanoa, keeping its premises safe. Weapons should be kept lowered and on safety unless a direct threat is spotted. Contractors are NOT allowed to enter the hangars, runways, nor disturb air traffic nor the airport's inner operations. They are to avoid disturbing civilians and gendarmerie, and must not, under any circumstances, disclose their actual intent nearby Gendarmie personnel.
            <br/>
            <br/>Once Markos Savala is identified, contractors will promptly arrest him, and escort him to 081097 Keypad 9 by the local church, where he will be handed off to the Inner Circle organization.
            <br/>
            <br/>Contractors are not to approach the Inner Circle without having arrested Markos Savala.
            <br/>
            <br/>Markos Savala will be handed off to the Inner Circle's representative, Winston Ba, who can be identified by his red beret, once Markos Savala has been handed off, contract is complete.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
