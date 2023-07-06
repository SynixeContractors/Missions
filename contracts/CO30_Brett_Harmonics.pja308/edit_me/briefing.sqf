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
            <br/>Gunzkili National Police
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Militia & Terrorist Cell
            <br/>Disrupt communications and operations
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Gunzkili National Police
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>Local Police
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians may be present outside of cities, although the rural areas are unsafe and civilians are unlikely to stray far from major centers.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Very flat, swamps.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>A terror cell has been deploying jammers for military radio, cellphones, and Wifi devices throughout the region in an attempt to disrupt the National Police Counter-Terrorism Unit's ability to receive civilian reports and respond.
            <br/>
            <br/>We have been tasked with tracking down nefarious devices causing interference.
            <br/>It is recommended to have EOD on this mission.
            <br/>We have aquired Spectrum Devices that can detect a wide range of frequencies, and help determine their location.
            <br/>
            <br/>A list of common frequencies ranges has been provided.
            <br/>
            <br/>Note: Contact DLC is required to use the Spectrum Device.
            <br/>
            <br/>Primary Objectives:
            <br/>- 2x Area of reported Cellphone jamming (Purple)
            <br/>- 1x Area of reported Wifi / Bluetooth jamming (Yellow)
            <br/>- Unknown count of military radio jammers
            <br/>
            <br/>Second Objectives:
            <br/>- Engage any threats encountered near civilian locations
        "]];

        _player createDiaryRecord ["Diary", ["Frequencies", "
            <br/>Radio Communications (Military, Amateur Long Range): 20MHz - 100Mhz
            <br/>Radio Communications (Commercial): 200MHz - 500MHz
            <br/>
            <br/>Cellphone (4G): 600MHz - 2.2GHz
            <br/>Cellphone (4G LTE): 1.7GHz - 2.1GHz
            <br/>Cellphone (5G): 24GHz - 54GHz
            <br/>
            <br/>Wifi 4: 2.2GHz - 2.6GHz
            <br/>Wifi 5: 4.8GHz - 5.3GHz
            <br/>Wifi 6: 5.8GHz - 6.2GHz
            <br/>
            <br/>AM Radio (Long-wave): 140kHz - 283kHz
            <br/>AM Radio (Medium-wave): 540kHz - 1600kHz
            <br/>AM Radio (Short-wave): 1.6MHz - 30MHz
            <br/>
            <br/>FM Radio (Low): 88MHz - 108MHz
            <br/>FM Radio (High): 108MHz - 136MHz
            <br/>
            <br/>TV (Low): 54MHz - 88MHz
            <br/>TV (High): 174MHz - 216MHz
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
