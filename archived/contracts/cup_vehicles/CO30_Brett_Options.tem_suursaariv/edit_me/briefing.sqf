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
            <br/>Suursaari Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Local Militia, supporting Stefanos Mastori
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Horizon Islands Legion
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>The island of Suursaari is in chaos. A powerful man named Stefanos Mastori has been running organized crime on the islands for years, and has had a lot of control.
            <br/>
            <br/>However, The Suursaari Government has desperately been trying to get rid of him, and recently made a deal with the Horizon Islands.
            <br/>The Horizon Islands will get a 60 year lease to the isalnd of Säyvö, in exchange for HIL forces being deployed to Suursaari to help the government secure control and capture Mastori.
            <br/>HIL forces have are in the process, but are being met with resistance from local militia.
            <br/>The Horizon Islands Government only approved a deployment of 40 HIL members to the island, so the HIL has hired Synixe Contractors to help them.
            <br/>
            <br/>Mastori has been seen leaving Suurkylä, and is believed to be hiding to the south. The HIL believe he has an extraction team en route, but do not know where they are coming from, or when they will arrive.
            <br/>The HIL have secured all major towns, and have a helicopter with radar and thermal imaging to help them find Mastori.
            <br/>Our task is to move in on foot and find Mastori, and capture him.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
