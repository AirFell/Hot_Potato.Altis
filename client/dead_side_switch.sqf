_nul = switch (side player) do {
	case west: {
		"mrkBlue" setMarkerAlpha 0;
		"mrkRed" setMarkerAlpha 0;
		"mrkGreen" setMarkerAlpha 0;
//		"mrknoBlue" setMarkerAlpha 0;
		"mrknoRed" setMarkerAlpha 0;
		"mrknoGreen" setMarkerAlpha 0;
		"mrkMission" setMarkerAlpha 0;
		"respawn_bomb" setMarkerAlpha 0;
		_nul = []execVM "client\user_addactions\base_west_addactions.sqf";
	};
		
	case east: {
		"mrkBlue" setMarkerAlpha 0;
		"mrkRed" setMarkerAlpha 0;
		"mrkGreen" setMarkerAlpha 0;
		"mrknoBlue" setMarkerAlpha 0;
//		"mrknoRed" setMarkerAlpha 0;
		"mrknoGreen" setMarkerAlpha 0;
		"mrkMission" setMarkerAlpha 0;
		"respawn_bomb" setMarkerAlpha 0;
		_nul = []execVM "client\user_addactions\base_east_addactions.sqf";
	};
	
	case resistance: {
		"mrkBlue" setMarkerAlpha 0;
		"mrkRed" setMarkerAlpha 0;
		"mrkGreen" setMarkerAlpha 0;
		"mrknoBlue" setMarkerAlpha 0;
		"mrknoRed" setMarkerAlpha 0;
//		"mrknoGreen" setMarkerAlpha 0;
		"mrkMission" setMarkerAlpha 0;
		"respawn_bomb" setMarkerAlpha 0;
		_nul = []execVM "client\user_addactions\base_guer_addactions.sqf";
	};
};