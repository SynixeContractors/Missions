params ["_driver", "_current"];

private _locations = [
    ["Belfort", ferry_driver_belfort, ferry_dest_belfort, ferry_car_belfort],
    ["Leqa", ferry_driver_leqa, ferry_dest_leqa, ferry_car_leqa],
    ["Georgetown", ferry_driver_georgetown, ferry_dest_georgetown, false],
    ["La Rochelle", ferry_driver_rochelle, ferry_dest_rochelle, ferry_car_rochelle],
    ["Ipota", ferry_driver_ipota, ferry_dest_ipota, ferry_car_ipota]
];

private _costs = [
    ["Belfort", "Leqa", 250],
    ["Leqa", "Belfort", 250],
    ["Belfort", "Georgetown", 500],
    ["Georgetown", "Belfort", 500],
    ["Leqa", "Georgetown", 500],
    ["Georgetown", "Leqa", 500],
    ["Georgetown", "La Rochelle", 1000],
    ["La Rochelle", "Georgetown", 1000],
    ["La Rochelle", "Leqa", 1250],
    ["Leqa", "La Rochelle", 1250],
    ["Belfort", "La Rochelle", 1000],
    ["La Rochelle", "Belfort", 1000],
    ["La Rochelle", "Ipota", 500],
    ["Ipota", "La Rochelle", 500],
    ["Ipota", "Georgetown", 1500],
    ["Georgetown", "Ipota", 1500]
];
