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
            <br/>Director boards of several companies.
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Unknown
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors, Theseus Inc
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>Aside from the pressence of the VIPs, civilian pressence is expected in towns
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font color>
            <br/>Terrain in the AO is hilly and covered by forests
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Two hours ago a helicopter carrying several businessmen and CEOs from different companies crashed while flying over Altis. It is unknown what caused the crashed but it is assumed that it was due to fowl weather conditions.
            <br/>
            <br/>Synixe has been hired by the boards of the companies to which the men belong to act as a rescue force. We are tasked with finding the wreck and brigning any survivors back to our F.O.B. Theseus Inc was hired to provide bodyguards for the passengers and they have also asked us to bring their people back.
            <br/>
            <br/>Should any of the VIPs die we must retrieve their bodies and bring them back to our F.O.B as well.
            <br/>
            <br/>We have been provided with the passenger log of the helicopter in order to properly identify everyone.
        "]];

        _player createDiaryRecord ["Diary", ["Passenger Log", "
            <br/>Helicopter crew
            <br/>-Geoff Smith
            <br/>-Tyler Price
            <br/>
            <br/>Theseus bodyguards
            <br/>-Philippe Larose
            <br/>-Gary Rufford
            <br/>-Kelly Rowe
            <br/>
            <br/>Civilian passengers
            <br/>-Anthis Athanasiadis
            <br/>-Alexandros Savalas
            <br/>-Thamos Zenon
            <br/>-Giorgos Ioannou
            <br/>-Mimis Karmanlis
        "]];

    };

    // CIVILIAN briefing
    case civilian: {

    };
};
