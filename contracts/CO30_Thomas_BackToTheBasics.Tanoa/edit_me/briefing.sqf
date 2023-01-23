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
            <br/>IDAP and the Tanoan Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Syndikat
            <br/>AMLCOA: Although made up mostly of amateur bandits, will ambush contractors using explosives and heavy weapons.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Gendarmerie
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>N/A
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians present in every populated area
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Most of the surface area of Tanoa is taken up by jungles, exception being in cities, towns, villages, and roads.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Because of a recent famine, Syndikat has been overtly attacking government officials and Gendarmerie, trying to gain power on Tanoa. These attacks spread to IDAP convoys and workers once the NGO started their work on the island, trying to bring food, water, and medical aid to the populace.
            <br/>
            <br/>In a last bid to control the IDAP supplies coming to the island, Syndikat decided to lock down the two airports on the main Tanoan Island using multiple AA emplacements, which is where both IDAP and the Tanoan Government decided to hire Contractors to clear the AA threat to the southern Tanoan Airport and protect and deliver IDAP supplies to 3 locations: The IDAP Base Camp, and two Aid Stations in Georgetown and Tanouka.
            <br/>
            <br/>The supplies that contractors have been hired to protect consist of food, water, medical, and equipment boxes. While the food and water will need to be delivered to each IDAP location specified, the medical supplies and equipment will only need to be delivered to the IDAP Base Camp. However, while the food and water boxes were able to be safely delivered to the Saint-George Airport, the helicopter that was dropping the medical supplies and equipment was forced to make an emergency landing at the Bala Airstrip after taking heavy fire from Syndikat forces.
            <br/>
            <br/>As for the AA sites, the Gendarmerie have narrowed the locations of each confirmed AA site to the corresponding areas on the map (Red Circles). There should be no AA expected outside these areas.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
