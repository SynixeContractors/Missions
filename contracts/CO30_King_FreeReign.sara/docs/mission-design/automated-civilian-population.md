# Automated civilian population

## Utilizing GRAD CIVS

GRAD CIVS is a useful addon that brings a functionality to make the ambience of
a virtual world more lively by populating it with civilians.

If you would like to enable it on your mission, you can go to
`Settings > Addon Options > Mission` and then make sure you tick on the
checkbox to `Enable GRAD_CIVS`.

## GRAD CIVS Presets

To use these presets, go into `Settings > Addon Options > Mission`, and then
click the dropdown menu and find GRAD CIVS.

If you want to define the pedestrians you'd like to be spawned, paste the code
in the `Unit classes to use for spawning civilians` field.

If you want to define the vehicles you'd like the pedestrians to use, paste the
code in the `Vehicles that civilians may drive (class names)` field.

Here are some presets we've made in the past for some of our missions, feel
free to use them in yours!

~~~admonish collapsible=true title="ALTIS preset"
ALTIS (Pedestrians)

```sqf
C_man_polo_1_F, C_man_polo_2_F, C_man_polo_3_F, C_man_polo_4_F, C_man_polo_5_F,
C_man_polo_6_F, C_man_polo_1_F_afro, C_man_polo_5_F_afro
```

ALTIS (Vehicles)

```sqf
C_Hatchback_01_F, C_SUV_01_F, C_Van_01_transport_F, C_Van_01_box_F, C_Offroad_01_F
```
~~~

~~~admonish collapsible=true title="AFRICAN preset"
AFRICAN (Pedestrians)

```sqf
C_man_polo_1_F_afro, C_man_polo_2_F_afro, C_man_polo_3_F_afro, C_man_polo_4_F_afro,
C_man_polo_5_F_afro, C_man_polo_6_F_afro, C_Man_casual_6_F_afro, C_Man_casual_5_F_afro,
C_Man_casual_4_F_afro
```

AFRICAN (Vehicles)

```sqf
C_Quadbike_01_F, C_Offroad_02_unarmed_F, C_Van_01_transport_F, C_Van_01_box_F, C_Tractor_01_F
```
~~~

~~~admonish collapsible=true title="CHERNARUS (CUP) preset"
CHERNARUS (Pedestrians, CUP)

```sqf
CUP_C_C_Bully_03, CUP_C_C_Bully_02, CUP_C_C_Citizen_01, CUP_C_C_Citizen_03,
CUP_C_C_Profiteer_02, CUP_C_C_Racketeer_01, CUP_C_C_Rocker_03, CUP_C_C_Villager_03,
CUP_C_C_Villager_04, CUP_C_C_Woodlander_03
```

CHERNARUS (Vehicles, CUP)

```sqf
CUP_C_Lada_CIV, CUP_C_SUV_CIV, CUP_C_Volha_CR_CIV, CUP_C_Skoda_CR_CIV
```
~~~

~~~admonish collapsible=true title="LIVONIA preset"
LIVONIA (Pedestrians)

```sqf
C_Man_casual_2_F_euro, C_Man_casual_3_F_euro, C_Man_casual_6_v2_F_euro, C_Man_casual_7_F_euro,
C_Man_casual_8_F_euro, C_Man_formal_1_F_euro, C_Man_formal_4_F_euro, C_scientist_01_informal_F,
C_Man_2_enoch_F, C_Man_3_enoch_F, C_Man_1_enoch_F, C_Farmer_01_enoch_F
```

LIVONIA (Vehicles)

```sqf
C_Truck_02_covered_F, C_Truck_02_fuel_F, C_Offroad_01_F, C_Offroad_01_covered_F,
C_SUV_01_F, C_Van_01_transport_F, C_Van_01_box_F, C_Van_02_vehicle_F, C_Van_02_service_F,
C_Van_02_transport_F
```
~~~

~~~admonish collapsible=true title="TAKISTAN (CUP) preset"
TAKISTAN (Pedestrians, CUP)

```sqf
CUP_C_TK_Man_06_Coat, CUP_C_TK_Man_06_Jack, CUP_C_TK_Man_06_Waist, CUP_C_TK_Man_05_Coat,
CUP_C_TK_Man_05_Jack, CUP_C_TK_Man_05_Waist, CUP_C_TK_Man_08, CUP_C_TK_Man_08_Jack,
CUP_C_TK_Man_08_Waist, CUP_C_TK_Man_07, CUP_C_TK_Man_07_Coat, CUP_C_TK_Man_07_Waist,
CUP_C_TK_Man_04, CUP_C_TK_Man_04_Jack, CUP_C_TK_Man_04_Waist, CUP_C_TK_Man_02,
CUP_C_TK_Man_02_Jack, CUP_C_TK_Man_02_Waist, CUP_C_TK_Man_01_Waist, CUP_C_TK_Man_01_Coat,
CUP_C_TK_Man_01_Jack, CUP_C_TK_Man_03_Coat, CUP_C_TK_Man_03_Jack, CUP_C_TK_Man_03_Waist
```

TAKISTAN (Vehicles, CUP)

```sqf
CUP_C_Volha_Blue_TKCIV, CUP_C_Volha_Gray_TKCIV, CUP_C_S1203_CIV, CUP_C_Volha_Limo_TKCIV,
CUP_O_Hilux_unarmed_TK_CIV, CUP_O_Hilux_unarmed_TK_CIV_Tan, CUP_C_UAZ_Unarmed_TK_CIV,
CUP_C_LR_Transport_CTK, CUP_O_Hilux_unarmed_TK_CIV_White, CUP_C_UAZ_Open_TK_CIV,
CUP_C_Ural_Civ_01, CUP_C_Lada_GreenTK_CIV, CUP_C_Octavia_CIV, CUP_C_Pickup_unarmed_CIV,
CUP_C_Golf4_black_Civ, CUP_C_Golf4_white_Civ, CUP_C_Golf4_yellow_Civ
```
~~~
