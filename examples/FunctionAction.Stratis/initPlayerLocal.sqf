// This code runs on everyone's computer, so we just use setObjectTexture
controller setObjectTexture [0, "#(rgb,512,512,3)text(0,0,""EtelkaMonospacePro"",0.3,""#ffffffff"",""#000000"",""Ready"")"];

// * Arguments:
// * 0: Object <OBJECT>
// * 1: Title <STRING>
// * 2: On Activation <CODE>
// * 3: Repeatable <BOOL>, default: false
// * 4: Condition <CODE>, default: {true}
// * 5: Icon <STRING>, default: ""

// By default the action is not repeatable, so we don't need to have a condition

[
    controller,
    "Press Enter",
    {
        // _player refers to the player who has activated the action
        [_player, "PutDown"] call ace_common_fnc_doGesture;
        fueltruck setDamage 1;
        // _target refers to the object the action is placed on
        // this code only runs on the comptuer of the player who activated the action
        // so we can use setObjectTextureGlobal to make sure everyone sees the change
        _target setObjectTextureGlobal [0, "#(rgb,512,512,3)text(0,0,""EtelkaMonospacePro"",0.3,""#ffffffff"",""#000000"",""Done"")"];
    }
] call synixe_missions_fnc_action;
