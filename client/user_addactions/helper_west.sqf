//west_resc_depot_ctrl
addMissionEventHandler ["Draw3D", {
	if (player distance west_resc_depot_ctrl < 75) then {
		_currentDistance = player distance west_resc_depot_ctrl;
		_percent = (_currentDistance - 25) / 50;
		_fadeValue = 1 - _percent;
		drawIcon3D ["\A3\ui_f\data\map\groupicons\selector_selectable_ca.paa", [0.825,0.825,0.825,_fadeValue], [(getPos west_resc_depot_ctrl select 0), (getPos west_resc_depot_ctrl select 1), 1], 1, 1, 0, "Resource Depot", 0.9, 0.035, "puristaLight"];
	};
}];

//west_inf_shop
addMissionEventHandler ["Draw3D", {
	if (player distance west_inf_shop < 75) then {
		_currentDistance = player distance west_inf_shop;
		_percent = (_currentDistance - 25) / 50;
		_fadeValue = 1 - _percent;
		drawIcon3D ["\A3\ui_f\data\map\groupicons\selector_selectable_ca.paa", [0.825,0.825,0.825,_fadeValue], [(getPos west_inf_shop select 0), (getPos west_inf_shop select 1), 1], 1, 1, 0, "Weapons and Gear", 0.9, 0.035, "puristaLight"];
	};
}];

//west_veh_shop
addMissionEventHandler ["Draw3D", {
	if (player distance west_veh_shop < 75) then {
		_currentDistance = player distance west_veh_shop;
		_percent = (_currentDistance - 25) / 50;
		_fadeValue = 1 - _percent;
		drawIcon3D ["\A3\ui_f\data\map\groupicons\selector_selectable_ca.paa", [0.825,0.825,0.825,_fadeValue], [(getPos west_veh_shop select 0), (getPos west_veh_shop select 1), 1], 1, 1, 0, "Vehicle Store", 0.9, 0.035, "puristaLight"];
	};
}];

//west_fort_shop
addMissionEventHandler ["Draw3D", {
	if (player distance west_fort_shop < 75) then {
		_currentDistance = player distance west_fort_shop;
		_percent = (_currentDistance - 25) / 50;
		_fadeValue = 1 - _percent;
		drawIcon3D ["\A3\ui_f\data\map\groupicons\selector_selectable_ca.paa", [0.825,0.825,0.825,_fadeValue], [(getPos west_fort_shop select 0), (getPos west_fort_shop select 1), 1], 1, 1, 0, "Fortifications", 0.9, 0.035, "puristaLight"];
	};
}];