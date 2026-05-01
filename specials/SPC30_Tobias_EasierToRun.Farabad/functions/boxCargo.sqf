// Security Office

        crate_1 addBackpackCargoGlobal ["B_DuffleBag_Black_NoLogo_RF", 4];
        {
            _x addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 20];
            _x addMagazineCargoGlobal ["ACE_20Rnd_762x51_M993_AP_Mag", 6];
            _x addMagazineCargoGlobal ["ACE_200Rnd_556x45_Box_tracer_green", 2];

        } forEach everyBackpack crate_1;

        crate_2 addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 60];
        crate_2 addMagazineCargoGlobal ["ACE_20Rnd_762x51_M993_AP_Mag", 20];
        crate_2 addMagazineCargoGlobal ["ACE_200Rnd_556x45_Box_tracer_green", 10];
        crate_2 addMagazineCargoGlobal ["synixe_armoury_130Rnd_338NM_EPR", 10];
        crate_2 addMagazineCargoGlobal ["JCA_10Rnd_127x99_M107_M8_API_Mag", 10];

        special_1 addWeaponWithAttachmentsCargoGlobal [
                [
                    "MMG_02_black_F", 
                    "ACE_muzzle_mzls_338", 
                    "", 
                    "optic_Arco_AK_blk_F", 
                    ["synixe_armoury_130Rnd_338NM_EPR", 100], 
                    [], 
                    "JCA_bipod_04_black"
                ], 
            1
        ];

        special_1 addMagazineCargoGlobal ["synixe_armoury_130Rnd_338NM_EPR", 10];
        special_1 addBackpackCargoGlobal ["ace_gunbag", 1];

        special_2 addWeaponWithAttachmentsCargoGlobal [
                [
                    "JCA_srifle_M107_black_F", 
                    "", 
                    "", 
                    "JCA_optic_HPPO_RAD_black", 
                    ["JCA_10Rnd_127x99_M107_M8_API_Mag", 100], 
                    [], 
                    "JCA_bipod_M107_black"
                ], 
            1
        ];

        special_2 addMagazineCargoGlobal ["JCA_10Rnd_127x99_M107_M8_API_Mag", 6];
        special_2 addBackpackCargoGlobal ["ace_gunbag", 1];

        launcher_1 addWeaponWithAttachmentsCargoGlobal [
                [
                    "JCA_launch_M72_olive_F", 
                    "", 
                    "", 
                    "", 
                    [], 
                    [], 
                    ""
                ], 
            4
        ];

        launcher_2 addWeaponWithAttachmentsCargoGlobal [
                [
                    "synixe_armoury_launch_NSAM_F", 
                    "", 
                    "", 
                    "", 
                    [], 
                    [], 
                    ""
                ], 
            2
        ];

    // Infirmary

        medical_1 addItemCargo ["ACE_salineIV", 8];
        medical_1 addItemCargo ["ACE_salineIV_250", 8];
        medical_1 addItemCargo ["ACE_salineIV_500", 8];

        medical_2 addItemCargo ["ACE_packingBandage", 100];
        medical_2 addItemCargo ["ACE_quikclot", 100];
        medical_2 addItemCargo ["ACE_elasticBandage", 100];
        medical_2 addItemCargo ["ACE_surgicalKit", 1];
        medical_2 addItemCargo ["ACE_suture", 100];
        medical_2 addItemCargo ["ACE_splint", 10];
        medical_2 addItemCargo ["ACE_tourniquet", 10];
        medical_2 addItemCargo ["ACE_bodyBag", 8];

        medical_3 addItemCargo ["ACE_morphine", 10];
        medical_3 addItemCargo ["ACE_epinephrine", 10];
        medical_3 addItemCargo ["ACE_adenosine", 10];
        medical_3 addItemCargo ["ACE_painkillers", 4];
