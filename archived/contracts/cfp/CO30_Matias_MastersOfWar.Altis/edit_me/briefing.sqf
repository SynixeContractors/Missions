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
            <br/>Estarko LLC
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Freedom and Independence Army (FIA)
            <br/>The FIA will fight tooth and nail to keep Estarko in custody, as for the ION contractors, they will most likely be executed at any point
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>ION Services helicopter crew
            <br/>ION Services contractors
            <br/>

            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>N/A

            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>N/A
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Three hours ago an ION services convoy carrying Estarko LLC CEO Antonio Estarko to a weapons demonstration in the Melanera Bay was attacked.
            <br/>The perpetrators of the attack are a group of rouge FIA guerrillas who are unhappy with the way things worked out with NATO and the AAF.
            <br/>This FIA group has taken Estarko hostage and are demanding weapons and money from the company in exchange for his freedom.
            <br/>The company is having none of it and has hired Synixe to rescue Estarko and bring him to a helicopter waiting for him back at the F.O.B. If possible they also want
            <br/>us to recover the stolen weapons and bring them back to the F.O.B.
            <br/>
            <br/>On the side ION Services has asked us to recover the dead bodies of their contractors and any weaponry belonging to them 
            <br/>and if any of their people were to be alive rescue them and bring them back to the F.O.B. ION has provided us with an AR-2 darter to scout out the AO in advance.
            <br/>

        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
