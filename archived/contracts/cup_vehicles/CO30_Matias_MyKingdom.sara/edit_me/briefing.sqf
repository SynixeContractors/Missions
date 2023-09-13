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
            <br/>Southern Sahrani Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Sahrani Liberation Army
            <br/>Attack contractors on sight. They have a wide array of vehicles both medium and light armored at their disposal.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Royal Army Corps of Sahrani
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>No Civilian pressence in the AO
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Terrain in the AO is mountainous an has some scattered forests.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>A civil war is raging in Sahrani, Loyalists on the south wanting to take over the northern territories from the Ultranationalists that govern it and viceversa.
            <br/>
            <br/>We've been hired by the Southern government (who is on NATO's good graces) to attack the city of Bagango where Juan Ramirez, the prime minister who leads the northern forces, resides. We are to apprehend Ramirez and deliver him to the miltary base in the Paraiso airport.
            <br/>
            <br/>We'll be parachuting into the AO as it's the safest way to infiltrate it. Load up the gear you can't carry into the supply crates and grab a parachute from the box. Once everyone is ready have the Operation Lead speak with the officer in charge to get things moving. Once over the jump area the pilot will yell Jump.
            <br/>
            <br/>The gear in the supply crates will be waiting at a previously specified drop off point. We've also been provided with two vehicle dead drops to make our return trip easier. One of boats near the enemy occupied town of Mercalillo and another one of Land Rovers near Rashidah.
            <br/>
            <br/>DO NOT ATTEMPT TO CROSS THROUGH CORAZOL, it's where the heaviest fighting is going on and heavy enemy troops are most likely surrounding it.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
