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
            <br/>Synixe Fun Department
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/><font color='#D81717'>ENEMY FORCES:</font>
            <br/>Why would there be enemies? It's just a party
            <br/>AMCLOA: I'd imagine that if there were any they would try to ruin all the fun
            <br/>
            <br/><font color='#1D69F6'>FRIENDLY FORCES:</font>
            <br/>Synixe Contractors, Gendarmerie
            <br/>
            <br/><font color='#993399'>CIVILIAN CONSIDERATIONS:</font>
            <br/>The guests of the party
            <br/>
            <br/><font color='#663300'>TERRAIN CONSIDERATIONS:</font>
            <br/>The governor's estate has light jungle on one side and a field on the other
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>Dearest Contractor,
            <br/>
            <br/>Due to your outstanding service to Tanoa you are hereby cordially invited to a new year's eve party by the great governor of Tanoa. The party will be taking place at the governor's estate and will start at 21:00.
            <br/>
            <br/>We have set you up at the best hotel in Tanoa that has three stars with a great view of the Georgetown bay. Your luggage will be waiting for you there with your clothes. Once you are ready your vehicles will be waiting for you outside the hotel so that you can go to the airort to ride the private helicopters that will take you to the island in which the party is in. You will arrive at the governor's private airfield where you will have vehicles waiting for you.
            <br/>
            <br/>Should you not find a suitable pilot or prefer it this way, there are also private boats waiting for you at the Georgetown docks. From there you can go to the Katkoula docks were you will find vehicles waiting for you in order to be able to get to the estate.
            <br/>
            <br/>The governor has also hired a fireworks connoisseur to prepare a beautiful display for you once you get back to the hotel from the party. You will find the controls for it at the hotel roof. Make sure to look towards the bay in order to see them.
            <br/>
            <br/>He's also pre selected a set of 'sweet tunes' himself which if you wish you can start playing from the laptop in his office.
            <br/>
            <br/>Cordially signed, Deputy Governor of Tanoa.
            <br/>
            <br/>P.S: There's no need to worry about the revolutionaries that have threatened with killing everyone at the party. There is no proof that they exist or that their supreme leader rides around in an armored Hilux with a machine gun. Plus I'm sure that their supreme leader would only show up last if there was an attack because he's a coward.
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
