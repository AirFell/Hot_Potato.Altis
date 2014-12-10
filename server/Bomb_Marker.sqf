diag_log "**4** loading bomb marker...";
sleep 15;

bomb_marker = createMarker["bomb_marker", (getPos The_Bomb)];
bomb_marker setMarkerColor "ColorYellow";
bomb_marker setMarkerShape "Icon";
bomb_marker setMarkerType "KIA";
sleep 5;

diag_log "bomb marker loaded.";

while {True} do {
	sleep 30;
	
	if (isNull The_Bomb) then {
		bomb_marker setMarkerColor "ColorGrey";
	} else {
		"bomb_marker" setMarkerPos getPos The_Bomb;
	};
	
	if (Bomb_Armed_Tracker == 1) then {
		bomb_marker setMarkerColor "ColorOrange";
	} else {
		bomb_marker setMarkerColor "ColorYellow";
	};
	
	if (Bomb_Destroyed_Tracker == 1) then {
		bomb_marker setMarkerColor "ColorGrey";
	} else {
		bomb_marker setMarkerColor "ColorYellow";
	};
};