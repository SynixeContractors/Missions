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
            <br/>United Assistance Mission in Argana (UNMA)
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Sefrwai Freedom and Independence Army (SFIA)
            <br/>AMCLOA: Stop us from saving the informant
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, UNA forces
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>There are other civilians awaiting execution
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Sefrou-Ramal is mostly flat desert except for some sand dunes
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Yesterday in the middle of the night Abdul Hamadi was abducted from his home. Hamadi has been an informant for the UNA ever since they first arrived in the region, and the SFIA want him dead for giving up the location of several of their encapments. He is now awaiting execution, due to happen tomorrow morning.
            <br/>
            <br/>The UNA has hired Synixe to save Hamadi from the SFIA base in which he is being held. Once Hamadi is brought back to base there is a helicopter with a crew in it waiting for him to be loaded in so that he can be taken out of the region.
            <br/>
            <br/>We have been tasked with rescuing Hamadi and only Hamadi. We may free any other civilians being held and we may take them back if we want to but we are not being paid to save them. THE EXTRACTION IS ONLY FOR HAMADI.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
