guer_enemy_detected = 0;

while {True} do {
	sleep 15;
	if (guer_enemy_detected == 1) then {
		"mrknoGreen" setMarkerColorLocal "ColorOrange";
		hint "An enemy player is at your base!";
	} else {
		"mrknoGreen" setMarkerColorLocal "ColorGUER";
	};
};