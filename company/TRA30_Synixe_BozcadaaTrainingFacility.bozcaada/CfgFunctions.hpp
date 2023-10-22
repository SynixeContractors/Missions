class CfgFunctions {
    class ADDON {
        tag = QUOTE(ADDON);
        class functions {
            file = "functions";
            class layerToggle;
        };
    };
    class DOUBLES(ADDON,certs) {
        class functions {
            file = "functions\certs";
            class canStart;
            class canStartEXT;
            class canStartPFH;
        };
    };
    class DOUBLES(ADDON,grenades) {
        class functions {
            file = "functions\grenades";
            class init;
            class instructions;
        };
    };
};
