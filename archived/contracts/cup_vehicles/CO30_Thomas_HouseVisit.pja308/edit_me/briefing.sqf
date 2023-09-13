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
            <br/> Kingdom of Kushan
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Hezbollah-e-Kushan: Splinter of the Syrian Hezbollah, although no longer allied. Group usually favors engaging with heavy weapons (mainly surplus M2s), while lacking traditional armored vehicles. Their fighters mainly dress in surplus M81 and MARPAT, and have a universal use of plate carriers. Declared themselves enemies of NATO and Kushan forces during the 2008 security crisis, fighters will shoot contractors on sight. 
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Armed Forces of Kushan
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Civilians are present within the region, this is also true for the town of Gotepe.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>With Kushan Soldiers pushing back Hezbollah-e-Kushan fighters to the southern region of the country during a recent military operation, it was rumored that months ago the fighters brought in an experienced bombmaker from Takistan. 3 months after this rumor surfaced, the number of lethal ambushes against Kushan Forces started with IEDs and other explosives nearly tripled. With the massive uptick in IEDs being used against Kushan Forces, the fighting in region of Gunkizli (among many others in the country) has come to a standstill as Kushan Forces struggled to gain the momentum needed to continue their push.
            <br/>
            <br/>Recent information given to Kushan Army Command, sourced from British Intelligence, cited that the bombmaker (Khalil Yousuf) was present in the region in the town of Goztepe. This town is noted to be heavily defended by Hezbollah-e-Kushan fighters as it is important staging area for their attacks against Kushan Forces, but it is also staggerlingly close to BluFor's area of control. Kushan Forces took the opportunity to eliminate the bombmaker, but their attempts fell short due to their forces being ill-equipped to deal with explosives, keeping them from being able to reach the town while taking major casualties in the process.
            <br/>
            <br/>Instead, Contractors have been hired to find the bombmaker, and bring him back to the Kushan Garrison at the Airfield they (the Contractors) were flown in, dead or alive.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
