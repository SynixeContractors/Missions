tv setObjectTexture [0,"audio\news.ogv"]; 
with uiNamespace do {
    1100 cutRsc ["RscMissionScreen","PLAIN"];
    private _scr = BIS_RscMissionScreen displayCtrl 1100;
    _scr ctrlSetPosition [-10,-10,0,0];
    _scr ctrlSetText "audio\news.ogv";
    _scr ctrlAddEventHandler ["VideoStopped", {
        (uiNamespace getVariable "BIS_RscMissionScreen") closeDisplay 1;
        missionNamespace setVariable ["news", false];
    }];
    _scr ctrlCommit 0;
};
playSound3D [getMissionPath "audio\news.ogg", tv, true, getPosASL tv,4,1,20];
missionNamespace setVariable ["news", true];
