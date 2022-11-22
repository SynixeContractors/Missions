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
            <br/>NATO
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Takistani Militia
            <br/>
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/>
            <br/>
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/> Confirmed by NATO surveilance that their are no civilians in the area. 
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/> Mountains and height differentiation everywhere. Only one road leading to the other side of mountains. 
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>With the fall of Aziz, the Takistani Militia has grown ten fold due to his cult-like followers. Deep in the Takistani Mountains, The militia has just recieved a weapons shipment presumably to arm their new soldiers. The exact location of the shipment is unknown. However, we know the weapons will be inside a Praga V3S REARM or REFUEL Truck. Destroying it or capturing it will surely lower the enemy's morale and have others lose faith in their cause.  
            <br/> 
            <br/> A replica of the truck you are looking for has been parked at your FOB for reference, although their are many duplicates rumoured in the AO. Youll know you found the primary objective due to the sheer amount of weapons and ammunition inside. Furthermore, the truck itself will be guarded by a small team, no larger than 5 or 6. Surveillance shows almost every town to be heavily guarded, along with enemy technicals patrolling the area so plan your routes accordingly. Most importantly, their is one singular road leading in and out of the takistani mountains. With this being the enemy's only way to get supplies in and out, it is sure to be heavily fortified. God speed and Good Luck Gentleman!
            <br/> 
            <br/> Primary Objective: Secure the weapons truck and bring it back to FOB. If unable to, destroy the weapons truck instead. 
            <br/>
            <br/>
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
