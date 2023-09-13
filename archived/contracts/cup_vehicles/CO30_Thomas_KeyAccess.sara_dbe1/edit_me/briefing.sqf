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
            <br/>Kingdom of Sahrani
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Sahrani Revolutionary Army
            <br/>Modernized remnants of the SLA that control most of the northern island of Sahrani. Utilize older generation Soviet and Russian Armor, while much of their infantry use updated equipment.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Northern Sahrani Monarchists
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>N/A
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>All civilians have been evactuated from Obregan as soon as the fighting escalated when the NSM starting controlling cities.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Obregan is flat, but surrounded by mountainous terrain to the west.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>After the failure of the 2029 COIN operations in Northern Sahrani, the remnants of the SLA (now the SRA) fell under united leadership, leading to the eventual fall of Corozal and Bagango in 2032. Under the threat of SRA forces bringing the fight into South Sahrani, the Kingdom of Sahrani agreed to sign a ceasefire and later a peace accord, bringing the island into a tense situation.
            <br/>
            <br/>As RACS forces pulled out of the northern island, paramilitary fighters (known now as the North Sahrani Monarchists) took up arms against the SRA, both sides receiving equipment and training from their respective sponsors.
            <br/>
            <br/>After years of fighting, the Northern Sahrani Conflict has finally reached it's flash point, NSM forces had successfully captured Corazol and most of the towns to east. With easy access to support from the RACS, NSM forces set their sights on Bagango, and the eventual recapture of the entire island.
            <br/>
            <br/>Refusing to break the peace accord so early, the Kingdom of Sahrani has hired Contractors to assist the NSM in capturing the town of Obregan so that an assault force can move through and attempt to capture Bagango.
            <br/>
        "]];

        _player createDiaryRecord ["Diary", ["Operation Plan", "
            <br/>- Contractors will move to OP Santana before 0530 in preparation to assault Obregan.
            <br/>
            <br/>- At 0530, Aideko and Butoni will open with artillery fire on the town of Obregan, which will take an estimated 5 minutes to complete. At that time, Espinazo 1 will move to their dismount point, before the bridge into Obregan, and Unidad 2 will assault the town of Mercalillo to lock down any possible reinforcements reaching Obregan.
            <br/>
            <br/>- Both the contractors and Espinazo 1 are to begin their assault once the artillery ceases.
            <br/>
            <br/>- Once Obregan is under control, all remaining forces in Obregan are to begin taking measures to clear the road for Unidad 1, and eliminate any QRF trying to retake the town.
            <br/>
            <br/>- Once Mercalillo is under control, Unidad 2 will halt at the northern part of the town, and await Unidad 1 to clear Phaseline Fender.
            <br/>
            <br/>- At 0700, Unidad 1 will move towards Obregan, either to move through or capture the town in the event that Contractors and Espinazo 1 fail their tasking.
            <br/>
            <br/>- Once Unidad 1 has passed Phaseline Fender, both teams will proceed with the assault on Bagango. However, once Unidad 1 reaches Obregan, Contractors are relieved of duty and can return to their original position.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
