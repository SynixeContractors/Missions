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
            <br/>Astra, International Space Agency
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font color>
            <br/>Looters
            <br/>AMLCOA: Hostile. Looters are likely to engage anyone they don't know on sight.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font color>
            <br/>Synixe Contractors
            <br/>Astra Private Security 
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font color>
            <br/>N/A
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font color>
            <br/>Any civilians in this lawless area are either aligned with the looters or being held against their will. Any civilian with a bit of sense would have already fled the immediate region.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font color>
            <br/>Low mountains and forests cover the region.
        "]];

        _player createDiaryRecord ["Diary", ["HAZARDS", "
            <br/>Astra's helicopter was carrying research samples that exhibit a biohazard that is not well understood. It is more than likely that the containers housing the samples have been compromised, making them unsafe to handle or even approach. If one were to be exposed to the samples without the proper CBRN gear, they may suffer great bodily harm or even death with little to no warning. Although the samples are weak, they can still cause harmful effects up to 30 meters and can even penetrate some materials.
            <br/>
            <br/>Without being properly contained, these samples will decay and become useless. Unfortunately, Astra was unable to scan the samples before transporting them in their helicopter. As such, Astra has contracted us to locate and scan these samples on the ground before the opportunity is lost.
            <br/>
            <br/>We've been provided two chemical detectors which can detect a biohazard presence up to 100 meters away. We've also been provided two full sets of CBRN gear. Both CBRN clothing and a respirator are needed to protect you. Lastly, we've been provided an ED-1E drone to scan the samples. The drone is fragile and keeping it functioning is vital to completing the contract.
            <br/>
            <br/>The drone will make an audible beep only when it has successfully scanned a sample.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Contract Name: Probing
            <br/>Location: Chernarus
            <br/>Local Time: 0000
            <br/>Local Weather: Foggy night, clear sky
            <br/>
            <br/>Misson:
            <br/>Synixe Contractors have been tasked by Astra to locate and scan three important research samples that were presumably lost in the area around Petrovka, Chernarus.
            <br/>
            <br/>Just a short time ago, Astra lost contact with a helicopter that was carrying three important research samples that had been obtained from another part of South Zagoria. The helicopter was on a flight path that took it over northern Chernarus.
            <br/>
            <br/>Recently, Chernarus has had an outbreak of rioting, looting, and violence. A significant portion of Chernarus' rural north has devolved into anarchy and chaos. The helicopter's flight path would have taken it over Petrovka, which is currently in lawless territory controlled by loosely organized Looters.
            <br/>
            <br/>The research samples that Astra acquired are a significant biohazard. Please refer to the HAZARDS briefing for additional information.
            <br/>
            <br/>Astra has provided us the minimum necessary equipment to safely locate and scan the samples. Most importantly, Astra has supplied us with an ED-1E drone which we will have to use to scan the research samples. The drone is a vital piece of equipment, as it contains the sampling laser necessary to gather any useful data on the research samples. Please refer to the HAZARDS briefing for more info on equipment.
            <br/>
            <br/>Astra has used a local point of contact to insert us as close to Petrovka as possible, though we will have to start our scan of the region on foot.
            <br/>
            <br/>Additionally, Astra has also requested that we attempt to recover any of the missing helicopter crew or Astra security, if possible. Locating and scanning the research samples remains the primary objective, however.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
