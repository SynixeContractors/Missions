if (!isServer) exitWith {};

/////////////////////////////////////////
// Blackbox's reforestation script //
// v1.3                                         //
////////////////////////////////////////

// [this,radius,forestType,treeCount,density,bushCount,["clearmarker_0","clearmarker_1",etc..]] execVM "boxForest.sqf";

// Forest types;
// 1 = Tanoa Deciduous
// 2 = Tanoa Coniferous
// 3 = Tanoa Jungle
// 4 = Altis Arid
// 5 = Altis Pine
// 6 = Takistan Desert
// 7 = Takistan Forest
// 8 = Chernarus Deciduous
// 9 = Chernarus Coniferous

// Example
// [this,250,5,750,5,1500,["clearmarker_0"]] execVM "boxForest.sqf";

_obj = _this select 0;
_radius = _this select 1;
_type = _this select 2;
_treeCount = _this select 3;
_density = _this select 4; // Doesn't really do anything right now ¯\_(ツ)_/¯
_bushCount = _this select 5;
_clearMarkers = _this select 6;

_objPos = getpos _obj;

// Comment out items you do not want to use!
// Lower the height of rocks if they are too large!

_forestDict = [ // Predefine forest types, their respective tree and bush classnames, and the height at which to spawn the models
	[ // Tanoa Deciduous
		[
			["a3\vegetation_f_exp\tree\t_ficus_medium_f.p3d",15], // Large deciduous
			["a3\vegetation_f_exp\tree\t_leucaena_f.p3d",10], // Small deciduous
			// ["a3\vegetation_f_exp\tree\t_cocosnucifera3s_tall_f.p3d",13], // Palm tree
			["a3\vegetation_f_exp\tree\t_ficus_small_f.p3d",10], // Small deciduous
			// ["a3\vegetation_f_exp\tree\t_cocosnucifera2s_small_f.p3d",12], // Palm tree
			// ["a3\vegetation_f_exp\tree\t_cocosnucifera3s_bend_f.p3d",11], // Palm tree (sloped)
			["a3\vegetation_f_exp\tree\t_agathis_wide_f.p3d",12], // Large coniferous
			["a3\vegetation_f_exp\tree\t_albizia_f.p3d",3], // Medium deciduous
			["a3\vegetation_f_exp\tree\t_agathis_tall_f.p3d",17] // Large coniferous
		],
		[
			["a3\vegetation_f_exp\shrub\b_calochlaena_f.p3d",6], // Leafy fern
			["a3\vegetation_f_exp\shrub\b_cestrum_f.p3d",6], // Also leafy fern
			["a3\vegetation_f_exp\shrub\b_leucaena_f.p3d",6.5], // Strandy shrub
			// ["a3\vegetation_f_exp\shrub\b_colored_red_f.p3d",6], // Red shrub
			// ["a3\vegetation_f_exp\shrub\b_gardenia_dec_01_f.p3d",5.8], // Flowery shrub
			["a3\vegetation_f_exp\shrub\b_gardenia_f.p3d",6], // Leafy fern
			// ["a3\vegetation_f_exp\shrub\b_gardenia_dec_02_f.p3d",5.8], // Flowery shrub
			["a3\vegetation_f_exp\shrub\b_colored_yellow_f.p3d",6], // Leafy fern
			["a3\vegetation_f_exp\shrub\b_pipermeth_f.p3d",5] // Leafy fern
		] 
	],
	[ // Tanoa Coniferous
		[
			["a3\vegetation_f_exp\tree\t_agathis_wide_f.p3d",12],
			["a3\vegetation_f_exp\tree\t_agathis_tall_f.p3d",17],
			["a3\vegetation_f_exp\tree\t_ficus_small_f.p3d",10],
			["a3\vegetation_f_exp\tree\t_ficus_medium_f.p3d",15],
			["a3\vegetation_f_exp\tree\t_albizia_f.p3d",3],
			["a3\vegetation_f_exp\tree\t_leucaena_f.p3d",10]
			// ["a3\vegetation_f_exp\tree\t_rhizophora_f.p3d",8], // Mangrove
			// ["a3\vegetation_f_exp\tree\t_cocosnucifera3s_tall_f.p3d",15] // Palm tree
		],
		[
			["a3\vegetation_f_exp\shrub\b_pipermeth_f.p3d",5],
			["a3\vegetation_f_exp\shrub\b_leucaena_f.p3d",6.5],
			// ["a3\vegetation_f_exp\shrub\b_colored_red_f.p3d",6],
			["a3\vegetation_f_exp\shrub\b_colored_yellow_f.p3d",6],
			// ["a3\vegetation_f_exp\shrub\b_gardenia_dec_01_f.p3d",5.8],
			// ["a3\vegetation_f_exp\shrub\b_gardenia_dec_02_f.p3d",5.8],
			["a3\vegetation_f_exp\shrub\b_gardenia_f.p3d",6],
			// ["a3\vegetation_f_exp\shrub\b_rhizophora_f.p3d",5], // Mangrove
			["a3\vegetation_f_exp\shrub\b_calochlaena_f.p3d",6],
			["a3\vegetation_f_exp\shrub\b_cestrum_f.p3d",6]
		]
	],
	[ // Tanoa Jungle
		[
			["a3\vegetation_f_exp\tree\t_cyathea_f.p3d",8], // Thin leafy
			["a3\vegetation_f_exp\tree\t_palaquium_f.p3d",14], // Tall jungle
			["a3\vegetation_f_exp\tree\t_inocarpus_f.p3d",15], // Large tall jungle
			["a3\vegetation_f_exp\tree\t_ficus_big_f.p3d",24], // Very tall jungle
			["a3\vegetation_f_exp\tree\t_ficus_medium_f.p3d",15],
			["a3\vegetation_f_exp\tree\t_ficus_small_f.p3d",10],
			// ["a3\vegetation_f_exp\tree\t_cocosnucifera3s_tall_f.p3d",15], // Palm tree
			["a3\vegetation_f_exp\tree\t_leucaena_f.p3d",10]
		],
		[
			["a3\vegetation_f_exp\shrub\b_cestrum_f.p3d",6], 
			["a3\vegetation_f_exp\shrub\b_leucaena_f.p3d",6.5],
			["a3\vegetation_f_exp\shrub\b_calochlaena_f.p3d",6],
			["a3\vegetation_f_exp\shrub\b_cycas_f.p3d",6] // Short bush
		]
	],
	[ // Altis Arid
		[
			["a3\plants_f\tree\t_ficusb1s_f.p3d",7.6],
			["a3\plants_f\tree\t_fraxinusav2s_f.p3d",16.5],
			["a3\plants_f\tree\t_ficusb2s_f.p3d",9],
			["a3\plants_f\tree\t_oleae2s_f.p3d",10],
			["a3\plants_f\tree\t_oleae1s_f.p3d",9],
			["a3\plants_f\tree\t_populusn3s_f.p3d",20],
			["a3\plants_f\tree\t_broussonetiap1s_f.p3d",8],
			["a3\plants_f\tree\t_poplar2f_dead_f.p3d",12]
		],
		[
			["a3\plants_f\bush\b_neriumo2d_f.p3d",6],
			["a3\plants_f\bush\b_ficusc2d_f.p3d",6.5],
			["a3\plants_f\bush\b_ficusc1s_f.p3d",6.5],
			["a3\plants_f\bush\b_ficusc2s_f.p3d",6.5],
			["a3\plants_f\bush\b_arundod2s_f.p3d",6.5], // Elephant grass small
			["a3\plants_f\bush\b_arundod3s_f.p3d",8] // Elephant grass large
		]
	],
	[ // Altis Pine
		[
			["a3\plants_f\tree\t_pinuss2s_f.p3d",12],
			["a3\plants_f\tree\t_pinuss2s_b_f.p3d",13],
			["a3\plants_f\tree\t_pinuss1s_f.p3d",8],
			["a3\plants_f\tree\t_ficusb1s_f.p3d",7.6],
			["a3\plants_f\tree\t_ficusb2s_f.p3d",9],
			["a3\plants_f\tree\t_oleae2s_f.p3d",10],
			["a3\plants_f\tree\t_pinusp3s_f.p3d",10]
		],
		[
			["a3\plants_f\bush\b_ficusc1s_f.p3d",6.5],
			["a3\plants_f\bush\b_neriumo2d_f.p3d",6],
			["a3\plants_f\bush\b_ficusc2d_f.p3d",6.5],
			["a3\plants_f\bush\b_ficusc2s_f.p3d",6.5]
		]
	],
	[ // Takistan Desert
		[ // Plants
			["ca\plants_e\bush\b_pinusm1s_ep1.p3d",6], // Bush
			["ca\plants_e\bush\b_pistacial1s_ep1.p3d",6], // Bush
			["ca\plants_e\bush\b_amygdalusn1s_ep1.p3d",5.4] // Bush
		],
		[ // Rocks
			["ca\rocks_e\r_tk_boulder_02_ep1.p3d",-1.5],
			["ca\rocks_e\r_tk_boulder_03_ep1.p3d",-4.5],
			["ca\rocks_e\r_tk_boulder_01_ep1.p3d",-1],
			["ca\rocks_e\r_tk_rock_03_ep1.p3d",-15],
			["ca\rocks_e\r_tk_rock_01_ep1.p3d",-7]
		]
	],
	[ // Takistan Forest
		[ // Plants
			["ca\plants_e\tree\t_pinuse2s_ep1.p3d",11.6], // Pine Tree
			["ca\plants_e\tree\t_pinuss3s_ep1.p3d", 13.8], // Taller Pine Tree
			["ca\plants_e2\tree\t_juniperusc2s_ep1.p3d", 6.5] // Juniperus Tree
			//["ca\plants_e\misc\misc_trunk_water_ep1.p3d",11] // Broken tree
		],
		[ // Rocks
			["ca\rocks_e\r_tk_boulder_02_ep1.p3d",-1.5],
			["ca\rocks_e\r_tk_boulder_03_ep1.p3d",-4.5],
			["ca\rocks_e\r_tk_boulder_01_ep1.p3d",-1],
			["ca\rocks_e\r_tk_rock_03_ep1.p3d",-15],
			["ca\rocks_e\r_tk_rock_01_ep1.p3d",-7]
		]
	],
	[ // Chernarus Deciduous
		[ // Trees
			["ca\plants2\tree\t_fagus2w.p3d",8.5], // Short Beech Tree
			["ca\plants2\tree\t_fagus2s.p3d",13], // Medium Beech Tree
			["ca\plants2\tree\t_fagus2f.p3d",17], // Tall Beech Tree
			["ca\plants2\tree\t_quercus2f.p3d",16.2] // Oak Tree
		],
		[ // Bushes
			["ca\plants2\bush\b_betulahumilis.p3d",6], // Betula Humilis Bush
			["ca\plants2\bush\b_salix2s.p3d",6], // Salix Bush
			["ca\plants2\bush\b_corylus.p3d",8] // Corylus Bush
		]
	],
	[ // Chernarus Coniferous
		[ // Trees
			["ca\plants_e2\tree\t_picea2s.p3d",12.5], // Medium Spruce Tree
			["ca\plants_e2\tree\t_picea3f.p3d",16] // Tall Spruce Tree
		],
		[ // Smaller Tree
			["ca\plants2\tree\t_picea1s.p3d",6.5] // Short Spruce Tree
		]
	]
];

_forestType = _forestDict select (_type - 1);
_forestTrees = _forestType select 0;
_forestBushes = _forestType select 1;
_forestArray = [];

for "_i" from 1 to _treeCount do { // Spawn trees up to max tree count
	_randomTree = selectRandom _forestTrees; // Select random tree
	_treePath = _randomTree select 0;
	_treeHeight = _randomTree select 1;
	_treeX = (_objPos select 0) + ((random (_radius * 2)) - _radius); // Begin pos selection
	_treeY = (_objPos select 1) + ((random (_radius * 2)) - _radius);
	_treeZ = getTerrainHeightASL [_treeX,_treeY];
	_treeZ = (_treeZ + _treeHeight) - 5;
	_treePos = [_treeX,_treeY,_treeZ];
	_isSafe = !(_treePos isFlatEmpty [-1, -1, -1, -1, 0, false] isEqualTo []); // Decide if pos is safe
	_isRoad = isOnRoad _treePos;
	_isShore = !(_treePos isFlatEmpty  [-1, -1, -1, -1, 0, true] isEqualTo []);
	if (_isSafe && !_isRoad && !_isShore) then { // Spawn tree
		_tree = createSimpleObject [_treePath, _treePos];
		_tree setDir (random 360);
		_forestArray pushBack _tree;
	};
};

for "_i" from 1 to _bushCount do { // Spawn bushes up to max bushes count
	_randomTree = selectRandom _forestBushes; // Select random bush
	_treePath = _randomTree select 0;
	_treeHeight = _randomTree select 1;
	if (_type == 6 || _type == 7) then {
		_rockRandom = (random 2) - 1;
		_treeHeight = _treeHeight - _rockRandom;
	};
	_treeX = (_objPos select 0) + ((random (_radius * 2)) - _radius); // Begin pos selection
	_treeY = (_objPos select 1) + ((random (_radius * 2)) - _radius);
	_treeZ = getTerrainHeightASL [_treeX,_treeY];
	_treeZ = (_treeZ + _treeHeight) - 5;
	_treePos = [_treeX,_treeY,_treeZ];
	_isSafe = !(_treePos isFlatEmpty [-1, -1, -1, -1, 0, false] isEqualTo []); // Decide if pos is safe
	_isRoad = isOnRoad _treePos;
	_isShore = !(_treePos isFlatEmpty  [-1, -1, -1, -1, 0, true] isEqualTo []);
	if (_isSafe && !_isRoad && !_isShore) then {
		_tree = createSimpleObject [_treePath, _treePos]; // Spawn bush
		_tree setDir (random 360);
		_forestArray pushBack _tree;
	};
};

if (count _clearMarkers > 0) then { // Clear forest inside of clear markers
	{
		_marker = _x;
		{
			if (_x inArea _marker) then {
				deleteVehicle _x
			};
		} forEach _forestArray;
		
	} forEach _clearMarkers;
};