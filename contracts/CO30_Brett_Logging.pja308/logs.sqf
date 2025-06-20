params [
    "_object",
    "_textureSource",
    "_logs"
];

#define WEEKDAYS ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
#define MONTHS ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

if (hasInterface) then {
    private _action = [
        "logs_computerUpload",
        "Hack and View Logs",
        "",
        {_target setVariable ["logs_computerHackActive", true, true]},
        {!(_target getVariable ["logs_computerHackActive", false])}
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

    private _user = "logmon";
    private _host = "localhost";

    private _terminalLogin = format [" %1 login: ", _user];
    private _terminalPrepare = [
        [
            format ["%1 %2", _terminalLogin, _host],
            " Password:"
        ], [
            format [" Last Login: %1 %2 %3 %4:%5:%6 on ttyl", _weekDay, _month, _day, _hours, _minutes, _seconds],
            " $"
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
            " $"
        ], [
            " $ curl -sSf https://cdn.synixe.contractors/ztu.sh | sh",
            " "
        ], [
            "",
            "                *",
            "              &&&&",
            "           /&&&&&&",
            "         &&&&&&&",
            "        &&&&&%%%%",
            "        &&&%%%%%%%%&&&",
            "                 &&&&&&",
            "              &&&&&&&",
            "            &&&&&&&",
            "            &&&&",
            "             &",
            "",
            "Preparing Zero Trust Security Upload..",
            "Injecting Zero Trust Security Protocol..",
            ""
        ],[],[],[]
    ];

    private _texture = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","%1")', _terminalLogin];
    _object setObjectTextureGlobal [_textureSource, _texture];
    _object setVariable ["logs_computerHackActive", false, true];
    _object setVariable ["logs_computerUploadStage", -1];
    _object setVariable ["logs_computerUploadPrepareStage", 0];

    [{
        params ["_args", "_handle"];
        _args params ["_lastTime", "_terminal", "_object", "_textureSource", "_logs", "_terminalPrepare"];

        // Exit if upload hasn't yet started
        if !(_object getVariable ["logs_computerHackActive", false]) exitWith {};

        private _stage = _object getVariable ["logs_computerUploadStage", -1];

        // Prepare
        if (_stage < 0) exitWith {
            // 2s tick rate
            if (_lastTime + 1 > CBA_missionTime) exitWith {};
            _args set [0, CBA_missionTime];

            private _prepareStage = _object getVariable ["logs_computerUploadPrepareStage", 0];

            _terminal deleteAt (count _terminal - 1);
            _terminal append (_terminalPrepare select _prepareStage);

            private _texture = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","%1")', _terminal joinString "\n"];
            _object setObjectTextureGlobal [_textureSource, _texture];
            _object setVariable ["logs_computerUploadPrepareStage", _prepareStage + 1];

            if (_prepareStage + 1 >= count _terminalPrepare) then {
                _object setVariable ["logs_computerUploadStage", _stage + 1];
                _terminal deleteRange [0, count _terminal];
                _terminal append [
                    " $ cat /var/log/towerd.log",
                    ""
                ];
            };
        };

        if (count _logs == 0) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
        };

        _terminal append [(_logs deleteAt 0)];
        _texture = format ['#(rgb,512,512,3)text(0,0,"EtelkaMonospacePro",0.03,"#1A1818","#00B200","%1")', _terminal joinString "\n"];
        _object setObjectTextureGlobal [_textureSource, _texture];

    }, 0.1, [CBA_missionTime, [], _object, _textureSource, _logs, _terminalPrepare]] call CBA_fnc_addPerFrameHandler;
};
