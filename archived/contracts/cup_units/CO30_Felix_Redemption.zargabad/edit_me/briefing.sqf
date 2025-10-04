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
            <br/>United Nations
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Takistani Militia
            <br/>They will engage contractors on sight, and are known to operate in large groups. It is unlikely that they will be using vehicles due to the adverse weather conditions, however, it is known that a large concentration of enemy forces have garrisoned in the city of Zargabad.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>United States Marine Corps
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>n/a
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Zargabad has been deemed a total warzone for months now, meaning that it will be highly unlikely, but not impossible, to run into civilian presence.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Flat arid desert, heavily urbanized center city, battle-torn theater.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Dr. Nikos Manetta's transport helicopter lost contact as he was travelling across Zargabad while he was en route to continuing an important investigation regarding the Takistan conflict. The main area of town has been under dispute for months, turning it into a constant warzone, causing a long lasting and devastating effect on the local populace and infrastructure.
            <br/>
            <br/>Synixe has been contracted to find out what happened and to attempt to find and rescue Dr. Nikos Manetta, additionally, contractors are invited to act both as offensively and/or defensively as necessary in order to complete the task at hand.
            <br/>
            <br/>As of writing this, the weather conditions have severely worsened, and we've had to sacrifice our vehicles to receive help in order to infiltrate the area of operations, giving us a head start into town; sounds like we'll be on foot from here.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
