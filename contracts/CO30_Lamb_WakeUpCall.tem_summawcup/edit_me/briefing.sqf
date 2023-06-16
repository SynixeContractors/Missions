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
            <br/>United States Department of Defense
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Red Star
            <br/>Supplied with gear from Russia, they have been launching assaults on local forces and causing general chaos. They are decently armed and make heavy use of technicals.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Red Star has been growing, with many individual cells now moving to cooperate in future terrorist operations.
            <br/>
            <br/>One such cooperation has been found in a relatively abandoned part of the countryside, with a rather built up outpost.
            <br/>
            <br/>Synixe will be supplied with weapons and vehicles often found in Red Star hands. These weapons and vehicles are to be openly used in the assault of the Red Star outpost, in order to convince the occupants that that they are under attack by a fellow cell.
            <br/>
            <br/>The assault will take place early in the morning to better add to the confusion. This will hopefully sow distrust amongst the cells, and delay them from working together again. 
            <br/>            
            <br/>The main objective is to destroy the outpost's resources and to leave no trace that an outside party took part in the conflict.             
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
