/*
 * Author: Mike, Jonpas
 * Only Laptop, Rugged Laptop & PC Set - Screen are actively supported.
 * Has a laptop generate an intel download after an ACE interaction.
 * Will update in increments of 10% until 100. Refresh rate of the download is worked out as downloadTime / 10
 * Texture source is shown on the object via Attributes > Object Specific > Texture #X
 * Can use getVariable on the laptop to check if download is complete with "mission_downloadIntel_complete"
 *
 * Call from init.sqf
 *
 * Arguments:
 * 0: Laptop <OBJECT>
 * 1: Texture Source <NUMBER>
 * 2: Filesize <NUMBER>
 * 3: Download Time <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Laptop, 0, 100, 60] call MFUNC(downloadIntel)
 */

params ["_object", "_textureSource", "_fileSize", "_downloadTime", ["_host", "localhost"], ["_user", "root"]];

#define WEEKDAYS ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
#define MONTHS ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

// Initial setup - Players (ACE Action for download start)
if (hasInterface) then {
    private _action = [
        "mission_downloadIntel",
        "Hack and Upload Data",
        "a3\ui_f\data\igui\rsctitles\rscegprogress\downloadicon_ca.paa",
        {_target setVariable ["mission_downloadIntel_active", true, true]},
        {!(_target getVariable ["mission_downloadIntel_active", false])}
    ] call ace_interact_menu_fnc_createAction;

    [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};

// Initial setup - Server
if (isServer) then {
    private _fnc_randomLastLoginDate = {
        private _date = date;
        private _dateNumber = dateToNumber _date;
        _dateNumber = _dateNumber - ((1 / 365 / 24) * random 23);
        _date = numberToDate [_date select 0, _dateNumber];

        _date params ["_year", "_month", "_day", "_hours", "_minutes"];
        _hours = [_hours, 2] call CBA_fnc_formatNumber;
        _minutes = [_minutes, 2] call CBA_fnc_formatNumber;

        private _seconds = [floor random 59, 2] call CBA_fnc_formatNumber;
        private _weekDay = WEEKDAYS select ([_date] call CBA_fnc_weekDay);
        private _month = MONTHS select (_month - 1);

        [_weekDay, _month, _day, _hours, _minutes, _seconds]
    };
    (call _fnc_randomLastLoginDate) params ["_weekDay", "_month", "_day", "_hours", "_minutes", "_seconds"];

    private _terminalLogin = format [" %1 login: ", _user];
    private _terminalPrepare = [
        [
            format ["%1 %2", _terminalLogin, _host],
            " Password:"
        ], [
            format [" Last Login: %1 %2 %3 %4:%5:%6 on ttyl", _weekDay, _month, _day, _hours, _minutes, _seconds],
            " $" // replaced with next
        ], [
            " $ sysinfo",
            format ["%1@%2", _user, _host],
            "    -----------",
            "    OS: Arch Linux x86_64",
            "    Kernel: 6.4.8-arch1-1",
            "    Shell: zsh 5.9",
            "    Terminal: /dev/pts/0",
            "    CPU: AMD Ryzen 5 8000G (8) @ 3.6GHz",
            "    Memory: 649MiB / 2147MiB",
            " $" // replaced with next
        ], [
            // download and execute shell script from synixe.contractors
            " $ curl -sSf https://cdn.synixe.contractors/ztu.sh | sh",
            " " // replaced with next
        ], [
            "                              ",
            "                *             ",
            "              &&&&            ",
            "           /&&&&&&            ",
            "         &&&&&&&              ",
            "        &&&&&%%%%             ",
            "        &&&%%%%%%%%&&&        ",
            "                 &&&&&&       ",
            "              &&&&&&&         ",
            "            &&&&&&&           ",
            "            &&&&              ",
            "             &      ",
            "",
            "Preparing Zero Trust Security Upload..",
            "Injecting Zero Trust Security Protocol..",
            ""
        ]
    ];

    private _texture = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","%1")', _terminalLogin];
    _object setObjectTextureGlobal [_textureSource, _texture];
    _object setVariable ["mission_downloadIntel_active", false, true];
    _object setVariable ["mission_downloadIntel_stage", -1];
    _object setVariable ["mission_downloadIntel_prepareStage", 0];

    [{
        params ["_args", "_handle"];
        _args params ["_lastTime", "_terminal", "_object", "_fileSize", "_textureSource", "_downloadTime", "_terminalPrepare"];

        // Exit if download hasn't yet started
        if !(_object getVariable ["mission_downloadIntel_active", false]) exitWith {};

        private _stage = _object getVariable ["mission_downloadIntel_stage", -1];

        // Prepare
        if (_stage < 0) exitWith {
            // 2s tick rate
            if (_lastTime + 1 > CBA_missionTime) exitWith {};
            _args set [0, CBA_missionTime];

            private _prepareStage = _object getVariable ["mission_downloadIntel_prepareStage", 0];

            _terminal deleteAt (count _terminal - 1);
            _terminal append (_terminalPrepare select _prepareStage);

            private _texture = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","%1")', _terminal joinString "\n"];
            _object setObjectTextureGlobal [_textureSource, _texture];
            _object setVariable ["mission_downloadIntel_prepareStage", _prepareStage + 1];

            if (_prepareStage + 1 >= count _terminalPrepare) then {
                _object setVariable ["mission_downloadIntel_stage", _stage + 1];
            };
        };

        // Follow wanted download (tick) rate from here
        if (_lastTime + 5 > CBA_missionTime) exitWith {};
        _args set [0, CBA_missionTime];

        // Download
        private _downloaded = _fileSize * (_stage / _downloadTime);
        private _progressBar = "[          ]";
        for "_i" from 1 to floor (_stage / _downloadTime * 10) do {
            _progressBar = _progressBar splitString "";
            _progressBar set [_i, "="];
            _progressBar = _progressBar joinString "";
        };

        private _progressString = format ["     %1GB / %2GB  %3 (%4%5)\n", _downloaded toFixed 2, _fileSize, _progressBar, (_stage / _downloadTime * 100) toFixed 2, "%"];
        _terminal set [-1, _progressString];
        _texture = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","%1")', _terminal joinString "\n"];
        _object setObjectTextureGlobal [_textureSource, _texture];
        _object setVariable ["mission_downloadIntel_stage", _stage + 5];

        // Finish
        if (_stage >= _downloadTime) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
            ["ocap_customEvent", ["generalEvent", "Intel was downloaded!"]] call CBA_fnc_serverEvent;

            private _terminalFinal = [
                "     Completed",
                "     Wiping...",
                "     Device wiped"
            ];
            _terminal append _terminalFinal;
            _texture = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","%1")', _terminal joinString "\n"];
            _object setObjectTextureGlobal [_textureSource, _texture];
            _object setVariable ["mission_downloadIntel_complete", true, true];
        };

    }, 0.1, [CBA_missionTime, [], _object, _fileSize, _textureSource, _downloadTime, _terminalPrepare]] call CBA_fnc_addPerFrameHandler;
};
