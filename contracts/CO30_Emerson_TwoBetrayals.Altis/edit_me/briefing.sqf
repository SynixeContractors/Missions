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
            <br/>Sometime last night, a bomb was brought onto the premises of Daltgreen's train yard at grid 035944. The bomb went unnoticed for most of the day until a Daltgreen employee decided to investigate a suspicious, empty Daltgreen marked vehicle. There, the employee discovered a large bomb sitting in the bed of the truck and Daltgreen immediately contacted us for disposal. Dealing with this threat is our initial tasking.
            <br/>
            <br/>The bomb is situated near important infrastructure (silos/train tracks) and, as such, Daltgreen will not allow us to do controlled detonation on the premises. Any bombs or bomb components must be defused. Any remaining explosive material (including disarmed bombs) will need to be taken offsite and safely disposed of, as they don't want any explosive material falling into the wrong hands. Daltgreen has advised us that the old quarry to the west at grid 020945 would be an ideal location to safely detonate any remaining explosives. If necessary, the Daltgreen truck itself can be driven offsite and destroyed.
            <br/>
            <br/>Security camera footage from the previous night shows the bomb being driven on site in a Daltgreen cargo truck by a Daltgreen employee. Based on the number of the truck and the time of the incident, Daltgreen suspects their employee Theodoros Manetta was the driver. Currently, Daltgreen is unsure of his whereabouts.
            <br/>
            <br/>Daltgreen has tasked us with finding and detaining Theodoros Manetta. We are to search his worker place of residence at grid 044923 for any clues as to his whereabouts or his motives. Daltgreen suspects he is still within the region as he has no contacts outside the company.
            <br/>
            <br/>Once Theodoros Manetta has been apprehended, we are to deliver him to Daltgreen at the train yard. Daltgreen will take over from there.
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Local Insurgents
            <br/>Insurgents are known to attack mining sites, alongside planting explosives and mines in known supply routes. They are known to kidnap personnel and execute VIP representatives.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors
            <br/>NATO
            <br/>United Assistance (UNA)
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>Civilians are present in the region, they may or may not be supportive of our involvement.
            <br/>UNA has one facility in the area.
        "]];

        _player createDiaryRecord ["Diary", ["Employer", "
            <br/>Daltgreen Mining and Exploration Ltd.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
