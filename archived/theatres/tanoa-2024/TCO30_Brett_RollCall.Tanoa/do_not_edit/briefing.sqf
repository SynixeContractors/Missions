#include "..\do_not_edit\script_component.hpp"

private _titles = [
    "Situation",
    "Mission",
    "Objectives"
];
_titles append _this;
reverse _titles;

private _fnc_createRecord = {
    params ["_title"];
    private _file = (toLower _title) regexReplace [" ", "_"];
    private _path = format ["edit_me\briefing\%1.html", _file];
    if (fileExists _path) then {
        private _contents = loadFile _path;
        player createDiaryRecord ["Diary", [_title, _contents regexReplace ["\n", "<br/>"]]];
    } else {
        diag_log format ["No %1 found for briefing", _path];
    };
};

{
    [_x] call _fnc_createRecord;
} forEach _titles; 
