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
            <br/>Government of Africa
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>ISAS
            <br/>The enemy has been known to resort to guerrilla tactics. Their common practises include execution of civilians, interception of humanitarian workers, stealing supplies, and terrorising towns.
            <br/>
            <br/>They will likely be equipped with no more than surplus weaponry, light anti-tank launchers, and technicals.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, United Nations
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are defenseless against the acts of terrorism ensued by ISAS. Regardless of whether they support us or not, they do not have weapons, and they wish for a better life.
            <br/>
            <br/>Contractors have been recommended to stick to roads where applicable, in order to avoid disturbing the locals.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>N/A
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>The United Nations has been carrying out humanitarian operations in the region of Kujari.
            <br/>
            <br/>Last week, a team was sent out on a supply run in an attempt to provide locals with water (2x Water Bottle Stacks), as ISAS had caused a siege in unsupporting villages.
            <br/>
            <br/>We have been tasked with finding this team, and recovering the supplies they were carrying.
            <br/>
            <br/>The United Nations team was headed to Mandalari, Kabaridi, and Lawan Aridi.
            <br/>
            <br/>We imagine these could be potential locations of their whereabouts. Additionally, suspicious movements have been reported around Gajaji Mastafa, Kawiya Maloumdi, and Mourimadi.
            <br/>
            <br/>Find the missing United Nations squad and recover their supplies. Be careful out there.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
