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
            <br/>D.O.D (Department of Defense)
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Chernarussian Movement of the Red Star
            <br/>Enemies will defend what they've stolen
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>No civilian pressence in the AO
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>The AO has a thick forest
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>A shipment of US weapons that was being transported to a country that's at war with Russia via train was ambushed. Unkown forces derailed the train and handed the weapons off to Chedaki insurgents who have now scattered them across the countryside.
            <br/>
            <br/>The shipment consisted of:
            <br/>-Two AN/MPQ-105 Radars
            <br/>-Two MIM-145 Defender AA batteries
            <br/>-Three UGV stompers, two of them being armed
            <br/>-Two Mini-Spike launchers of the AA variety
            <br/>-Two Mini-Spike launchers of the AT variety
            <br/>-Two XM312 machine guns
            <br/>
            <br/>Contractors are tasked with destroying the weapons so that no traces of US involvement are left
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
