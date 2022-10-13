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
 * <font color='#FF0000'>TEXT HERE</font color>
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
            <br/>Greek government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Altis Armed Forces (AAF)
            <br/>They will protect the area around the objectives and possibly reinforce them
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors, CTRG
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>N/A
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font color>
            <br/>Terrain around the AO is mostly flat. Solar towers near the port provide a nice vantage point.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Recently tensions have risen between Greece and Altis due to land disputes. The Greek government has reason to believed that the Altian government has been developing a WMD in the island of Stratis and that it has recently been brought over to Altis.
            <br/>
            <br/>Contractors have been hired by the greek government to infiltrate the port on which it is believed that the weapon was unloaded and find any proof that the weapon was there. Should they find proof they are to move in on a research facility which is believed to be housing the weapon and destroy it. Communications at the facility have been sabotaged by a greek operative but they failed to do so at the port, so if contractors are detected while infiltrating said port it is expected that reinforcements will be called on the facility.
            <br/>
            <br/>Once the objectives are completed contractors are to meet with a CTRG team that is waiting to extract them out of the country. In order to not leave any trace of our pressence contractors have been provided with civilian vehicles and must retrieve any gear that is used during the operation.
            <br/>
            <br/>Contractors have been provided with an SDV and wetsuits in order to covertly infiltrate the port. This SDV needs to be destroyed before contractors leave the area as it would be tangible proof of Greek involvenment.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
