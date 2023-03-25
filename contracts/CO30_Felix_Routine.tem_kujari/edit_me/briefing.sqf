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
            <br/>They will likely be equipped no more than surplus weaponry, light anti-tank launchers, and technicals.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, United Nations, African Gendarmes
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are defenseless against the acts of terrorism ensued by ISAS. Regardless of whether they support us or not, they do not have weapons, and they wish for a better life.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>N/A
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Contractors have been hired to maintain the peace and security in the town of Marwey.
            <br/>
            <br/>It is known that ISAS has been attacking local villages, both by stealing supplies, killing and kidnapping villagers, and by carrying out suicide bomb attacks.
            <br/>
            <br/>You have been tasked with patrolling the main area of the town of Marwey, keeping it's mosque and market areas safe from any dangers until meeting your contract's duration.
            <br/>
            <br/>Keep your eyes open, check on suspicious activity, maintain security, and restore the peace.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
