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
            <br/>NATO
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Rebel Organization
            <br/> 
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>Defectors out of the Rebel Organization 
            <br/>
            <br/>
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/> N/A 
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>  
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/> NATO sent out a group of researchers to go find out what was killing animals in the wilderness. They were intercepted by the Rebel Organization on their way out there. NATO lost contact with them at that point. There was one car that made it back. The driver of this car had told them where the ambush site was and the direction the research group was taken.
            <br/> NATO survaliance has told us that the exact building they believe they are in. The building is in the city of Geydam-Tchoukou. The Defectors are in the town of Marwey. They have told us that the Rebel Organization controls everything south of that town.
            <br/> 
            <br/>
            <br/> Primary Objective: Rescue the research group
            <br/>
            <br/> Secondary Objective:
            <br/>
            <br/>
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
