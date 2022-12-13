//This will create the ACE actions

_hackLaptopOne = [
	"Hack Laptop One", 
	"Hack Laptop One", 
	"", 
	{
	playSound["Alarm", false]; 
	systemChat "Laptop One has been hacked";
	},
	{true},
	{},
	[{duration = 30;}]
	] call ace_interact_menu_fnc_createAction;

_hackLaptopTwo = [
	"Hack Laptop Two", 
	"Hack Laptop Two", 
	"", 
	{
	playSound ["Alarm", false]; 
	systemChat "Laptop Two has been hacked";
	},
	{true},
	{},
	[{duration = 30;}]
	] call ace_interact_menu_fnc_createAction;

_hackLaptopThree = [
	"Hack Laptop Three", 
	"Hack Laptop Three", 
	"", 
	{
	playSound ["Alarm", false]; 
	systemChat "Laptop Three has been hacked";
	},
	{true},
	{},
	[{duration = 30;}]
	] call ace_interact_menu_fnc_createAction;

//This will add the actions to the objects

[lap_1, 0, ["ACE_MainActions"], _hackLaptopOne] call ace_interact_menu_fnc_addActionToObject;
[lap_2, 0, ["ACE_MainActions"], _hackLaptopTwo] call ace_interact_menu_fnc_addActionToObject;
[lap_3, 0, ["ACE_MainActions"], _hackLaptopThree] call ace_interact_menu_fnc_addActionToObject;
