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
            <br/>United States Government
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Takistani Army
            <br/>The Takistani Army is expected to engage any western forces on sight.
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors
            <br/>
            <br/><font color='#139120'>INDEPENDENT FORCES:</font>
            <br/>Takistani Local Militia
            <br/>Takistan has many tribal militias that do not align with either the Takistani army nor western forces. Mostly confined to mountain camps, they will defend themselves if they feel threatened.
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>There are many civilians going about their day within the greater Takistan region. However, there should be limited amounts of civilians in the town of Nur due to it being taken over by the Takistani army.
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>Mostly bare mountains with sparse vegetation and rocks.
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>After the assassination of a high ranking Takistani general in January of 2030, US-Takistani relations began to severly degrade. In the following months, resentment grew among Takistan against the United States and other 'terrorist' nations allied with them.
            <br/>
            <br/>Looking to gain intel on the brewing Takistani army, the US decided to deploy one of its new stealth drones in the region.
            <br/>
            <br/>At some point along the drone's flight path, it suffered an unknown malfunction and contact was lost. It is highly unlikely that Takistani forces brought it down, due to their outdated equipment. Based on the flight path and last known position, the US believes the drone crashed somewhere near the Takistani border village of Nur.
            <br/>
            <br/>Since the United States is to have no official presence in Takistan, we have been contracted to secure the crash site. Since it will be impossible to recover the drone in a timely manner, we have been ordered to destroy it. Secondarily, we are to recover any sensitive data the Takistani Army may have extracted (electronics/docuemnts).
            <br/>
            <br/>Based on what recon the drone gathered before it was lost, the Takistan Army has only just entered the AO, with the majority of forces concentrated near the town of Rasman and the nearby airfield. A couple of Takistani fortifications were spotted in the town of Nur, however their presence has surely only increased since the crash.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
