#include "..\do_not_edit\script_component.hpp"

params ["_extraTitles"];

private _titles = [
    "Employer",
    "Situation",
    "Mission",
    "Restrictions",
    "Objectives"
];
_titles append _extraTitles;
reverse _titles;

private _fnc_createRecord = {
    params ["_title"];
    private _file = format ["edit_me\briefing\%1.html", toLower _title];
    if (fileExists _file) then {
        private _contents = loadFile _file;
        player createDiaryRecord ["Diary", [_title, _contents regexReplace ["\n", "<br/>"]]];
    } else {
        diag_log format ["No %1.html found in briefing folder", toLower _title];
    };
};

{
    [_x] call _fnc_createRecord;
} forEach _titles; 
