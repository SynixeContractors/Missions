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
            <br/>International Criminal Police Organization (INTERPOL)
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Wagner Group operatives
            <br/>Chernarussian Movement of the Red Star (ChDKZ or Chedaki)
            <br/>The enemies will defend themselves from any threat.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors
            <br/>


            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>There is no civilian presence in the area. Everyone fled the area once the ChDKZ started to get ready for war.

            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font color>
            <br/>The Area of Operations is composed of a combination of forests and open fields.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>In 2017 in eastern Syria a group of six Wagner Group contractors beat and tortured to death a Syrian army deserter who was unarmed and dehydrated.
            <br/>They recorded the heinous act and uploaded it online, which eventually led to INTERPOL putting out a red notice on the six of them.
            <br/>The six soldier unit nicknamed the Valkyries had gone dark, until recently when they were spotted in the Chernarussian countryside training Chedaki soldiers.
            <br/>We have therefore been asked by INTERPOL to carry out the red notice, if possible apprehend the Valkyries but it is expected that they will not surrender
            so INTERPOL will also accept their dead bodies if the situation arises.
            <br/>
            <br/>The members of the Valkyries are as follow:
            <br/>
            <br/>-Semyon Gusakov, a pilot.
            <br/>
            <br/>-Yuri Naryshkin, a combat engineer.
            <br/>
            <br/>-Aleksei Yeltsin, a marksman
            <br/>
            <br/>-Oleg Pashinin, a tactical driver and tank commander
            <br/>
            <br/>-Roman Gorbunov, a team coordinator and FTL
            <br/>
            <br/>-Ilya Turchinsky, an EOD/Demolitions specialist
            <br/>
            <br/>
            <br/>We have been provided with a UAV to scout out the field, as well as an ATV in case it is seen fit to send out a sharpshooter team.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
