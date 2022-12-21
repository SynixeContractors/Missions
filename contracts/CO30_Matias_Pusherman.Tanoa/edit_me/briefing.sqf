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
            <br/>Horizon Islands Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Cartel forces
            <br/>They will protect their valuables and might escape in order to save them
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilian pressence in the town of Tavu
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Tanoa is characterized by it's jungle terrain
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>The Horizon Islands government has hired Synixe to sabotage a cartel that has recently moved into the town of Tavu and an airfield.
            <br/>The cartel is using the Tavu docks to bring in valuables by boat which they then load up into a plane and helicopter in the airfield in order to transport them.
            <br/>
            <br/>The government wants Synixe to destroy everything key to the operation in both the town and the airfield.
            <br/>Town:
            <br/>-RHIBs
            <br/>-Vans
            <br/>-Wooden crates filled with cargo
            <br/>
            <br/>Airfield:
            <br/>-C-130
            <br/>-CH-49 Mohawk
            <br/>-Fuel truck
            <br/>-ATC tower
            <br/>
            <br/>The government has also provided us with recon pictures that their government took of both of the objectives.

        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
