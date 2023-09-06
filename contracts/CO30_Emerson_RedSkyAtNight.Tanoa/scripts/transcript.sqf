params ["_transcript"];

_player = player;

_timeString = [dayTime, "HH:MM"] call BIS_fnc_timeToString;
_transcriptTitle = "Transcript from " + _timeString;

_player createDiaryRecord ["Diary", [_transcriptTitle, _transcript]];