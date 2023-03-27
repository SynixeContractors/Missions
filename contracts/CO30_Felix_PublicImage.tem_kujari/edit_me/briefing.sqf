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
            <br/>Jamie Ryan, Kujarian henchmen
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>ISAS
            <br/>The enemy has been known to resort to guerrilla tactics. Their common practises include execution of civilians, interception of humanitarian workers, stealing supplies, and terrorising towns.
            <br/>
            <br/>They will likely be equipped with no more than surplus weaponry, light anti-tank launchers, and technicals. It is known that they may disguise as civilians in order to carry out attacks.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, African Gendarmes
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians are defenseless against the acts of terrorism ensued by ISAS. Regardless of whether they support us or not, they do not have weapons, and they wish for a better life away from violence and famine.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>N/A
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Contractors have been hired to arrest Hasan Okoye, an important figure of the Kujari region - ID by blue suit. He is expected to be arriving via air at Marwey airfield by 1715.
            <br/>
            <br/>We are tasked with arresting Okoye, and ensuring he arrives safely at the main villa of Kyari Kinnai. Once there, he is to be left restrained alongside the two businessmen in suits at the main building, within the second floor.
            <br/>
            <br/>Contractors are not allowed outside of the Area of Operations. Additionally, it has been highly recommended to avoid travelling through the Red Zone, as it is deemed heavily hostile with major enemy presence.
            <br/>
            <br/>Contractors will maintain security at Kyari Kinnai's villa and fend off any possible attacks until contract expiration time.
            <br/>
            <br/>No one except for Gendarmerie personnel is allowed entrance to the premises of the villa. Contractors are to prevent anyone to enter uninvited by any means necessary.
            <br/>
            <br/>Contractors will primarily ensure the villa is safe, and will keep Okoye alive. Secondarily, they shall attempt to keep the two other businessmen alive aswell.
            <br/>
            <br/>Once contract is completed, Okoye shall be brought back to Synixe's FOB.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
