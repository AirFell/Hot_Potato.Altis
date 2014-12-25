/*
while {True} do {
	sleep 15;
	{
		if (side _x == "WEST") then {
			_enemy_Detected = 1;
		} else {
			_enemy_Detected = 0;
		};
	} foreach (getPos west_base) nearEntities ["Man", 250];
	if (_enemy_Detected == 1) then {
		"mrknoBlue" setMarkerColor "ColorOrange";
	} else {
		"mrknoBlue" setMarkerColor "ColorBLUFOR";
	};
};
*/
while {True} do {
	sleep 15;
	{
		if (_x distance west_base < 250 && side _x != west) then {
			west_enemy_Detected = 1;
		} else {
			west_enemy_Detected = 0;
		};
	} foreach allunits;
	if (west_enemy_Detected == 1) then {
		"mrknoBlue" setMarkerColor "ColorOrange";
	} else {
		"mrknoBlue" setMarkerColor "ColorBLUFOR";
	};
};