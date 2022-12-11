# Mission Template

## Mission Name Template

Missions should be named in the format:

```
{Type}{Players}_{Author}_{Name}.{MapName}
```

Mission Types
| Mission Type | TAG |
|--------------|-----|
| Contract     | CO  |
| Subcontract  | SCO |
| Training     | TRA |
| Special      | SPC |

Examples

`CO30_Brett_ThroughThePassage.Tem_Kujari`
`SCO30_Felix_WhisperingWinds.Woodland_ACR`
`TRA30_Arsey_ParajumpScenario.Chernarus_Winter`
`SPC12_Brett_6v6CTF.Shapur_BAF`

## File Setup

1. Create a new mission in the Eden Editor in it's entirety.
2. Save the mission.
3. Open the mission folder. `Scenario > Open Scenario Folder`
4. Copy all the files from `/mission` into your mission folder, which should only contain `mission.sqm`.
Normally, your mission will be saved to `Documents/Arma 3 - Other Profiles/YOURPROFILENAME/mpmissions` (you should save them there in Eden, or export them to Multiplayer then they'll show up there.)

## Editor Setup

### Setup the Players

1. Place the player group found in `Compositions > Independent > Synixe Contractors > Base Components > Players`
2. Highlight all units in the group.
3. Right click on one of the units, select `Attributes`
4. Navigate down to the `Object: Control` section
5. Check `Playable`
6. Set the Role Description to `Contractor`

### Setup Base

You are able to use any base you want. In the future a few templates will be provided.

1. Build the Base.
2. Add at least 1 spectator screen, found in `Objects > Props > Synixe Contractors > Electronics > Spectator Screen`
3. Place an empty marker at the location you want players to respawn, found under `Markers > Icons > System > Empty`
4. Open the attributes of the marker.
5. Set the Variable Name to `respawn`

### Setup Shops

As per the PMC system, you'll need to set up shops for players to manage their inventories.

1. Build the Base.
2. Add three shop objects of any kind, prefferably some kind of crate or box.
3. Right click on one of the units, select `Attributes`
4. Change the `VariableName` to `shop_1`, `shop_2` and `shop_3` for each one of them.

## File Setup

It is recommended to use VSCode with the `SQF Language` extension installed to edit the files, but any text editor will work.

### Mission Details

**Only edit files found in the `edit_me` folder, and the `cba_settings.sqf` file, unless you know what you are doing.**

1. Open the `description.ext`
2. Set the `OnLoadName` to the name of your mission
3. Set the `OnLoadMission` to a short description of your mission
4. Replace `YOUR NAME` in `author` with your name in Synixe Contractors
5. Set the `synixe_type` variable to the correct id
6. Set the `synixe_start_time` to the time you want the mission to be at when the mission starts. See below for more information.
7. Edit the `briefing.sqf` file with the details of your mission. The can be a replicate of the mission brief. There are instructions in `briefing.sqf` for adding links and images to your briefing.
8. Edit `cba_settings.sqf` if required.

#### cba_settings.sqf

For the majority of missions this file can remain untouched. If your mission will not be using the persistent gear system, be sure to disable it in this file.


#### synixe_start_time

This variable stores the time as `{hour,minute}`. This is the time the mission will be at when our mission time starts.

If the mission is loaded up 45 minutes before our start time and your mission is set to start at `{15,00}`, the mission will be set at `{14,15}` so that the correct time is reached when we start the mission.
