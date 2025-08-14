# A New Mission

## Update your local repository

The first step before starting a new mission is to make sure your
local repository is up to date.

<video width="99%" loop muted markdown="1" controls>
    <source src="../videos/gh_fetch_pull.webm" type="video/webm" markdown="1">
</video>

1. Open GitHub Desktop.
2. Select the `Missions` repository.
3. Select the `main` branch.
4. Click the "Fetch origin" button if it is available.
5. Click the "Pull origin" button if it is available.

## Create a new branch

Each mission must have its own branch. This allows you to work on
multiple missions at the same time without having to worry about conflicts.

Each branch is named after the mission. See [Mission Typess](./mission-types.md)
for more information on mission types.

```txt
{Type}{Players}_{Author}_{Name}

CO30_Brett_ThroughThePassage
SCO30_Felix_WhisperingWinds
TRA30_Arsey_ParajumpScenario
SPC12_Matias_6v6CTF
```

<video width="99%" loop muted markdown="1" controls>
    <source src="../videos/gh_create_branch.webm" type="video/webm" markdown="1">
</video>

1. Open GitHub Desktop.
2. Select the `Missions` repository.
3. Select the `main` branch.
4. Ensure there are 0 changes.
5. Click the "Current branch" button.
6. Click "New branch".
7. Enter a name for your branch.
8. Click "Create branch".

## Editor

Open the Arma 3 editor on your map of choice. The first thing you should do
is save the mission. The name of the mission should match the name of the branch.

Save the mission under the correct folder, depending on the mission type.

Always uncheck "Binarize the Scenario File" when saving the mission.

<video width="99%" loop muted markdown="1" controls>
    <source src="../videos/arma3_new_mission.webm" type="video/webm" markdown="1">
</video>

1. Open the Arma 3 editor.
2. Select the map you want to use.
3. Click "OK".
4. Click "Save As".
5. Select the correct folder.
6. Enter the name of the mission.
7. Uncheck "Binarize the Scenario File".
8. Click "Save".

## Mission Template

The mission template is a starting point for all missions. It contains everything
needed to create a Synixe Contractors mission.

It can be downloaded from [GitHub](https://github.com/SynixeContractors/MissionTemplate/releases/latest).

<video width="99%" loop muted markdown="1" controls>
    <source src="../videos/arma3_add_template.webm" type="video/webm" markdown="1">
</video>

1. Click "Scenario > Open Scenario Folder".
2. Find the mission template.
3. Copy the template folder into the mission folder.
4. Reopen the mission.
