# Configuring the Template

## VS Code

You will need to have [Visual Studio Code](https://code.visualstudio.com/) installed.
This is a free, open source code editor that is very popular with developers.

## Open Mission Folder

Use `Scenario > Open in VS Code` to open the mission folder in VS Code.

## Editing Files

The template contains two folders, `edit_me` and `do_not_edit`. There are files
in the root of the mission folder that can also be edited, but be sure to leave
the top of the files unchanged, or the mission will not work.

### edit_me/desctiption.ext

This file contains some variables that you can change to configure the mission.
The variables are:

- `OnLoadName`: The name of the mission that will be displayed in the mission
loading screen and in Discord.

- `OnLoadMission`: A single sentence description of the mission that will be
displayed in the mission loading screen and in Discord.

- `author`: Your name.

- `synixe_type`: The type of mission. Check the comment for a list of valid types.

- `synixe_start_time`: The hour of the day that the mission will start. When the
mission is loaded, the time will be set to the correct time before the the start
time, so that the mission will start at the start time. The minutes are always
synched to minutes in real time.

- `synixe_spectator_range`: The range from a spectator screen all players must
be for automatic enbling of spectator mode.

### edit_me/briefing

The `briefing` folder contains files that will be used to generate the mission
briefing. The files are:

- `situation.html`: The situation on the ground. Provides context for the area
of operations.

- `mission.html`: Mission description, why we are there, etc.

- `objectives.html`: The specific objectives of the mission, and restrictions
on how they are to be accomplished.
