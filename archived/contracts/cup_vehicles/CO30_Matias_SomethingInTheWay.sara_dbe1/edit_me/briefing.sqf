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
            <br/>Looters
            <br/>They are most likely going to be salvaging the ship and protecting anything they may have stolen.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Some survivors from the wreckage are expected.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>N/A
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Recently a ship that was meant to dock in Corazol has wrecked in the Abra de Boca. The Kingdom of Sahrani has hired Synixe to investigate the wreckage and locate the containers the ship was carrying along with the crew.
            <br/>
            <br/>Should contractors find any of the containers they should tag them with a circle and drop a HI Yellow chemlight. If any survivors are found they should be brought back to the Corazol docks.
            <br/>
            <br/>It is expected that looters will be at the site of the wreckage and they may have already ran off with some of the containers.
            <br/>
            <br/>Contractors have been provided with diving equipment in order to properly investigate the wreckage as well as underwater rifles just in case.
        "]];

        _player createDiaryRecord ["Diary", ["Ship Log", "
            <br/>CARGO
            <br/>-Three medium sized red containers
            <br/>-Three medium sized cyan containers
            <br/>-Two small orange containers
            <br/>
            <br/>CREW
            <br/>-Sotiris Manetta
            <br/>-Nikolaos Isofidou
            <br/>-Kostis Athanasiadis
            <br/>-Gregor Savalas
            <br/>-Evangelos Vidales
            <br/>-Vega Petridis
            <br/>-Sotiris Savalas
            <br/>-Angelos Cosmos
            <br/>-Dimitiros Roumpesi
            <br/>
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
