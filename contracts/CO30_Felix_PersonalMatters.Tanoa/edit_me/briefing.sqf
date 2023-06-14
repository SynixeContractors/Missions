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
            <br/>Horizon Islands Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Syndikat
            <br/>The local insurgency is present at a few keypoints of the area of operations. They are expected to be equipped with small arms and some technicals and are heavily hostile towards Horizon Islands police and other security forces alike.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Horizon Islands Police
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>N/A
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are present in the island and may or may not be aligned with the insurgent's policies.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Heavy jungle, open fields, and bridge crossings. Use them strategically.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>A tanoan insurgency has been influencing a local movement in one of the islands within the Tanoan province.
            <br/>
            <br/>Government officials, police, and civilians have been reporting sightings of insurgent forces across the island. Synixe has been provided with somewhat reliable geographical information of where these insurgents most commonly operate. There might be anywhere from one to two areas of enemy presence within each one of the areas of influence.
            <br/>
            <br/>The insurgents might have gained some of the local's support, which may cause them to be unsupportive, obstructive, or even harmful towards contractors. The insurgency has been stealing food and weapons and reposessing them for their supporters on the island.
            <br/>
            <br/>Synixe has been contracted to seek out any insurgent forces within the area of operations and either capture or eliminate them.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
