east_enemy_detected = 0;

while {True} do {
	sleep 15;
	if (east_enemy_detected == 1) then {
		"mrknoRed" setMarkerColorLocal "ColorOrange";
		hint "An enemy player is at your base!";
	} else {
		"mrknoRed" setMarkerColorLocal "ColorEAST";
	};
};