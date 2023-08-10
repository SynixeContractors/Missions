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
        _player createDiaryRecord ["Diary", ["Transcript", "
            <br/>Ah, I'm glad you could make it, my new friends! I am thankful you were able to arrive safely to our beautiful island that we call home.
            <br/>
            <br/>Now let us go over the plan to strike the A A F and bring justice to that traitor. 
            <br/>
            <br/>The A A F are currently occupying Oreokastro and the nearby castle. While we do not know exactly where that traitor is, he must be in the area since we have not spotted any vehicles leaving for quite some time.
            <br/>
            <br/>We must act quickly if we are to bring him to justice. He has no doubt already warned the A A F, so they will be prepared for an attack. But we cannot let this opportunity pass us.
            <br/>
            <br/>Already, many of our brothers lie in wait, ready to strike at the A A F. I will mark their positions on your map. When we give the signal with this laptop, they will begin the assault.
            <br/>
            <br/>There are two A A F outposts nearby, one to the southeast and one to the northeast. I will mark them on your map. Surely, they will send reinforcements after we attack. However, I do not have enough men to prevent this. We will deal with them when the time comes.
            <br/>
            <br/>Sound good my friends? Alright then, give the signal on the laptop when you are ready. We will not let this act of treason go unpunished!
        "]];
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
