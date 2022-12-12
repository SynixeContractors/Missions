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

_player createDiaryRecord ["Diary", ["Game Rules", "
            <br/>1- Infiltrating forces are not allowed to enter the defender spawn
            <br/>2- Defenders should have at least three times the amount of infiltrators
            <br/>3- Infiltrators are allowed a maximum of 6 respawns
            <br/>4- Game ends once infiltrators have no more respawns, all the infrastructure is destroyed or two hours have passed since the infiltrators left their base.
            <br/>5- Infrastructure will have a set of points attached to them. The more valuable it is the more points it awards. Defenders start with all of the points and for every piece of infrastructure that is destroyed infiltrators take those points for themselves.
            <br/>6- Winner is whoever has the most points by the game's end. If it's a tie the defenders win by default.
            <br/>7- Everything of importance in the infrastructre has to be destroyed for it to count.
            <br/>
            <br/>Main idea is that infiltrators have the technological advantage, while defenders have strength in numbers and vehicles. Infiltrators don't have any medical capabilities aside from first aid.
            <br/>The infiltrators will have the ability to set the time from their base
        "]];

switch (side _player) do {
    // BLUFOR briefing
    case west: {
        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Alright men, listen up
            <br/>
            <br/>Synixe has gone on a vacation to the Maldives and they have hired Theseus to protect their training facility in Malden
            <br/>You have been provided with a vast vehicle pool and several weapons which you can find in the arsenal we've provided.
            <br/>
            <br/>You must protect all of the infrastructre that is marked on your map whatever the cost may be. Good luck.
            <br/>
            <br/>Rory Guldentops, Theseus Inc. president
        "]];
        
    };

    // OPFOR briefing
    case east: {
        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Synixe has been a thorn on our side for too long,
            <br/>
            <br/>You must infiltrate their island and turn it to ashes.
            <br/>We have provided you with vehicles and an arsenal for you to use as you see fit. There is also a drone on standy at the island of Moray for you to use.
            <br/>
            <br/>Destroy as much of their infrastructre as you can.
            <br/>
            <br/>CDR Xu Haifeng
        "]];

    };

    // RESISTANCE/INDEPENDENT briefing -- THIS IS THE BRIEFING YOU WANT TO EDIT FOR YOUR MISSION!
    case resistance: {

    };

    // CIVILIAN briefing
    case civilian: {

    };
};
