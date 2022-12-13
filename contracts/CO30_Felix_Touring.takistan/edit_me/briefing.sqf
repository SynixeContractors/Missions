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
            <br/>Takistani Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Takistani Insurgents
            <br/>Insurgents and deserters of the previous government's militia have joined forces in order to establish pressure over the new government, they may be equipped with surplus gear and are highly dangerous.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, British Armed Forces
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>Local Insurgents
            <br/>There is a small group of civilians which have formed their own local force to fight against the arising insurgency. They are supportive of both Synixe and the BAF.
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>Civilians will be present in the area of operations.
            <br/>
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Contractors have been deployed in Takistan to assist in counterinsurgency operations after a recent insurgent leader has been taken out.
            <br/>
            <br/>Despite this, the insurgents have continued to pressure the government and have not given up their cause. As such, Synixe Contractors have been hired to assist in destabilising the insurgency.
            <br/>
            <br/>Synixe has been assigned to recon over the towns of Falar, Garmarud and Bastam, additionally, it is known that the insurgents have taken over a military base at Garmsar. Should any insurgent supporters of the previous leader be found, Synixe is tasked with eliminating them.
            <br/>
            <br/>We have intelligence that the BAF will be carrying an attack in Feruz Abad, against a taken over military base, at 2100. Joining them may make this task easier for us.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
