fnc_phaseAlpha = {
    [] spawn {

        private _guns = [mlrs_1, mlrs_2, spg_1, spg_2, spg_3, spg_4];
        private _targets = [
            "target_1",
            "target_2",
            "target_3",
            "target_4"
        ];

        {
            private _tgt = _x;

            sleep 10;

            {
                [[_x], _tgt, 100, 4, [5, 15]] call nibs_fnc_artilleryBarrage;
            } forEach _guns;

            { _x setVehicleAmmo 1; } forEach _guns;

            sleep 30;

        } forEach _targets;
    };
};

fnc_phaseBravo = {
    [] spawn {

        private _guns = [mlrs_1, mlrs_2, spg_1, spg_2, spg_3, spg_4];
        private _targets = [
            "target_5",
            "target_6",
            "target_7",
            "target_8",
            "target_9",
            "target_10"
        ];

        {
            private _tgt = _x;

            sleep 10;

            {
                [[_x], _tgt, 100, 4, [5, 15]] call nibs_fnc_artilleryBarrage;
            } forEach _guns;

            { _x setVehicleAmmo 1; } forEach _guns;

            sleep 30;

        } forEach _targets;
    };
};

fnc_phaseCharlie = {
    [] spawn {

        private _guns = [mlrs_1, mlrs_2, spg_1, spg_2, spg_3, spg_4];
        private _targets = [
            "target_11",
            "target_12",
            "target_13",
            "target_14",
            "target_15",
            "target_16",
            "target_17"
        ];

        {
            private _tgt = _x;

            sleep 10;

            {
                [[_x], _tgt, 100, 4, [5, 15]] call nibs_fnc_artilleryBarrage;
            } forEach _guns;

            { _x setVehicleAmmo 1; } forEach _guns;

            sleep 30;

        } forEach _targets;
    };
};

fnc_phaseDelta = {
    [] spawn {

        private _guns = [mlrs_1, mlrs_2, spg_1, spg_2, spg_3, spg_4];
        private _targets = [
            "target_18",
            "target_19",
            "target_20",
            "target_21",
            "target_22",
            "target_23",
            "target_24"
        ];

        {
            private _tgt = _x;

            sleep 10;

            {
                [[_x], _tgt, 100, 4, [5, 15]] call nibs_fnc_artilleryBarrage;
            } forEach _guns;

            { _x setVehicleAmmo 1; } forEach _guns;

            sleep 30;

        } forEach _targets;
    };
};

fnc_phaseEcho = {
    [] spawn {

        private _guns = [mlrs_1, mlrs_2, spg_1, spg_2, spg_3, spg_4];
        private _targets = [
            "target_25",
            "target_26",
            "target_27",
            "target_28",
            "target_29"
        ];

        {
            private _tgt = _x;

            sleep 10;

            {
                [[_x], _tgt, 100, 4, [5, 15]] call nibs_fnc_artilleryBarrage;
            } forEach _guns;

            { _x setVehicleAmmo 1; } forEach _guns;

            sleep 30;

        } forEach _targets;
    };
};

fnc_phaseFoxtrot = {
    [] spawn {

        private _guns = [mlrs_1, mlrs_2, spg_1, spg_2, spg_3, spg_4];
        private _targets = [
            "target_30",
            "target_31",
            "target_32",
            "target_33"
        ];

        {
            private _tgt = _x;

            sleep 10;

            {
                [[_x], _tgt, 100, 4, [5, 15]] call nibs_fnc_artilleryBarrage;
            } forEach _guns;

            { _x setVehicleAmmo 1; } forEach _guns;

            sleep 30;

        } forEach _targets;
    };
};

