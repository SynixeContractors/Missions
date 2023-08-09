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
            <br/>Central Intelligence Agency (CIA)
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Local insurgents
            <br/>Attack any forces on sight
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, CIA recovery team
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>Livonian Defense Force
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are expected outside of the quarantined area.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Terrain in the AO is covered by forests and can be mountainous in certain parts.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Recently during a private research endeavor a chemical detector started going off when approaching an area in the South Western corner of the AO. Upon further investigation it was revealed that the measurements from the detector allign with those of chemical weapons.
            <br/>
            <br/>The CIA has gotten wind of this and has hired Synixe to venture into the area where the signals were detected and recover any and all causes of these signals. Once they are recovered they are to be taken to a drop off site where a CIA helicopter is awaiting to get them off the country.
            <br/>
            <br/>CIA has gotten in contact with the neighboring LDF and has had them quarantine the area, so no civilians are expected in the location where the signals are coming from. They've also managed to provide us with Chemical Detectors which are not as strong as the ones that were first used to detect the signals, but should still go off when within 100 meters of the source. They've also given us gas masks, they don't think there should be any risk of contractors dying from these sources so the decision to wear them is up to the contractor.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
