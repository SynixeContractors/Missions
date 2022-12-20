# Synixe Contractors - Missions

## First Time Setup

1. Download and install [GitHub Desktop](https://desktop.github.com/)
2. Sign in or create a GitHub account
3. Request access to the Synixe Contractors organization, if you are not already a member
4. Clone the repository
    - `Clone a repository from the Internet...`
    - Select `SynixeContractors/missions`
    - Select Directory
        - Select `Choose` under local path
        - Navigate to your Arma 3 mpmissions folder in my documents
        - Create a new folder `Synixe`
        - `Select Folder`
    - `Clone`

## Create a new mission

1. Open GitHub Desktop
2. Click `Current Repository` and select `SynixeContractors/missions`
3. Click `Branch` and select `main`
4. Click `Fetch origin`

![Fetch Origin](.github/docs/github_01_fetch_origin.png)

5. Click `Pull origin` if available (Same button as `Fetch origin`)
6. Click `Current Branch` and select `New branch`
7. Name the branch `<type>_<author>_<name>`
    - Example: `co30_brett_over_the_hills`
    - Example: `tco30_matías_welcome_to_the_jungle`
    - Example: `spc_arsey_spies`

![New Branch](.github/docs/github_02_branch.png)

8. Open Arma and create a new mission
9. Save the mission under `MPMissions/Synixe/Missions/contracts` (or another folder if you are not creating a contract), **uncheck `Binarize the Sceario File`**
10. Create and test the mission
11. Return to GitHub Desktop, you will see the new mission files in the `Changes` tab

![Commit](.github/docs/github_03_commit_summary.png)

12. Commit the mission
    - Enter a commit message
    - Click `Commit to <branch name>`
    - Click `Publish branch`
    - Click `Create Pull Request`
    - Fill in any details on the website that opens
    - Click `Create pull request`
13. In GitHub desktop, click `Current Branch` and select `main` after your mission has been merged
14. You can safely delete the branch you created one it is merged

## Recommendations

- Use [Visual Studio Code](https://code.visualstudio.com/) to edit the mission files
- Open the `Missions` folder in Visual Studio Code, rather than just your mission.
- Press <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> and type `Show Recoomnded Extensions` to install recommended extensions
