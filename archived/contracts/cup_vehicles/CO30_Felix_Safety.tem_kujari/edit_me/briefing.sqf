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
            <br/>Synixe Contractors, United Nations
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are defenseless against the acts of terrorism ensued by ISAS. Regardless of whether they support us or not, they do not have weapons, and they wish for a better life.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>N/A
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>We have been deployed to establish security over a few key points and operations in the region of Kujari.
            <br/>
            <br/>It is known that an attack by the hands of ISAS could occur at any moment, making this a very time-sensitive operation, as such, we have been deployed to provide an additional level of safety to local operations.
            <br/>
            <br/>There are multiple tasks, and some of them have are ways away from eachother. You will have to either choose, cycle, or split up your team as you seem fit in order to complete the operation in the most succesful manner viable.
            <br/>
            <br/>The town of Barawas has been delivered some supplies by the United Nations, a small group has been stationed there in order to provide security, as this is a very important set of supplies for the villagers' well-being. It has been asked of us to assist in keeping these supplies safe for the local populace.
            <br/>
            <br/>Mandalari has a scheduled delivery of supplies being carried out by the United Nations at 0800. Ensure this is a safe delivery.
            <br/>
            <br/>The town Koube Miamatara have reported repeated harassment and attacks by ISAS, additionally, the town of Mimi has had United Nations personnel deployed due to previous incidents.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
