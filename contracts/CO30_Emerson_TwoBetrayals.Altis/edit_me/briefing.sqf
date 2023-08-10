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
        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>For the greater part of a year, FIA forces on Altis have been skirmishing with the AAF in the absence of NATO's presence. Since the NATO pull out, various NATO states have been trying to gather intel on the conflict.
            <br/>
            <br/>For some time, the British government had an informant on the island named FirstName LastName. FirstName LastName defected from the AAF and joined the FIA 8 months ago. For approxiamately 6 months, he had been in contact with the British government, providing periodic updates on the situation.
            <br/>
            <br/>A vital asset for both the British and the FIA, FirstName LastName has apparently decided to defect back to the AAF, trading his knowledge for protection.
            <br/>
            <br/>The FIA have determined that FirstName LastName is being held in northwestern Altis. While the FIA are not sure of FirstName LastName's exact whereabouts, the AAF occupy both Oreokastro and the nearby castle. As such, the FIA are preparing an assault on the two locations.
            <br/>
            <br/>The British government has contracted us to assist in this planned assault. They have already coordinated with the FIA and locals to insert us on to the island.
            <br/>
            <br/>Contractors will move to grid XXXXXX to meet the local FIA section leader and get debriefed on the planned assault. When ready, contractors will use the laptop to signal the beginning of the assault. If contractors take too long, the FIA will not wait and will commence the attack by 0530. 
            <br/>
            <br/>Contractors will assist in the assaults, searcing for FirstName LastName. However, the FIA has made it clear that if they find FirstName LastName, they plan on executing him for treason. Secretly, the British government wants us to capture him alive and extract him. As such, it is vital that contractors reach him before the FIA does.
            <br/>
            <br/>When contractors find and secure FirstName LastName, they are to immediately exfiltrate. Contractors have no obligation to help the FIA once the target is secure.
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>AAF
            <br/>The AAF occupy the entire island. Based on the recent flashpoint, AAF is expected for fire at any FIA or NATO aligned forces on sight.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors
            <br/>FIA
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>While civilians are still present on Altis, civilian presence in the AO should be practically nonexistent.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Low mountain ranges, patches of forest, and moderate morning fog.
        "]];

        _player createDiaryRecord ["Diary", ["Employer", "
            <br/>British Government
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
