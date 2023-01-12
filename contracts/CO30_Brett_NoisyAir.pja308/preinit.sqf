diag_log "Mission Pre Init";

mission_sources = createHashMap;

mission_delay = compile preprocessFileLineNumbers "initDelay.sqf";
