west_enemy_detected = 0;

while {True} do {
	sleep 15;
	if (west_enemy_detected == 1) then {
		"mrknoBlue" setMarkerColorLocal "ColorOrange";
		hint "An enemy player is at your base!";
	} else {
		"mrknoBlue" setMarkerColorLocal "ColorWEST";
	};
};