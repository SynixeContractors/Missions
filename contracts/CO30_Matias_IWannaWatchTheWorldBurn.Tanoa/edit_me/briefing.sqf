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
            <br/>Tanoan government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Unkown
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>Probable civilians in the infrastructure that is to be retaken
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font color>
            <br/>Tanoa is characterized by it's thick jungles
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>12 hours ago contact was lost with several pieces of key infrastructure in Tanoa. Due to how sudden the loss of contact was the Tanoan government expects the worst so they have hired Synixe to investigate and retake the pieces of infrastructure.
            <br/>
            <br/>The pieces of infrastructure with which contact has been lost are as follow:
            <br/>-Comms Alpha. A communications outpost near Mont Tanoa which handles mostly the military communications of the islands.
            <br/>-Diesel Power Plant. A power plant which provides most of the energy needed by the islands.
            <br/>-Fuel Depot. A fuel depot that mainly stores fuel for military use.
            <br/>-GSM station.A Global System for Mobile communication station that provides cellular signal for the islands.
            <br/>-Railway depot. A railway depot that houses the main trains used for the transport of supplies around the island.
            <br/>-SS Fortuna. A cargo ship that was scheduled to moore in the Blue Pearl industrial port. It is unkown what the cargo in the ship was.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
