if (isServer) then {
    [] spawn {
        while {true} do {

            private _guns = [
                arty_1, arty_2, arty_3, arty_4, arty_5,
                arty_6, arty_7, arty_8, arty_9
            ] select { !isNull _x && {alive _x} };

            private _targets = [
                "target_1","target_2","target_3","target_4","target_5","target_6",
                "target_7","target_8","target_9","target_10","target_11","target_12",
                "target_13","target_14","target_15","target_16","target_17","target_18",
                "target_19","target_20","target_21","target_22","target_23","target_24",
                "target_25","target_26","target_27","target_28","target_29","target_30",
                "target_31","target_32","target_33"
            ];

            if (_guns isEqualTo []) exitWith {};

            [
                _guns,
                _targets,
                600,
                12,
                [1,3]
            ] call nibs_fnc_artilleryBarrage;

            sleep (540 + random 120);
        };
    };
};
