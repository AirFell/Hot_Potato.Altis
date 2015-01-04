_nul = switch (side player) do {
	case west: {
		"mrkBlue" setMarkerAlphaLocal 0;
		"mrkRed" setMarkerAlphaLocal 0;
		"mrkGreen" setMarkerAlphaLocal 0;
		"mrknoBlue" setMarkerAlphaLocal 0.5;
		"mrknoRed" setMarkerAlphaLocal 0;
		"mrknoGreen" setMarkerAlphaLocal 0;
		"mrkMission" setMarkerAlphaLocal 0;
		"respawn_bomb" setMarkerAlphaLocal 0;
		_nul = []execVM "client\user_addactions\base_west_addactions.sqf";
	};
		
	case east: {
		"mrkBlue" setMarkerAlphaLocal 0;
		"mrkRed" setMarkerAlphaLocal 0;
		"mrkGreen" setMarkerAlphaLocal 0;
		"mrknoBlue" setMarkerAlphaLocal 0;
		"mrknoRed" setMarkerAlphaLocal 0.5;
		"mrknoGreen" setMarkerAlphaLocal 0;
		"mrkMission" setMarkerAlphaLocal 0;
		"respawn_bomb" setMarkerAlphaLocal 0;
		_nul = []execVM "client\user_addactions\base_east_addactions.sqf";
	};
	
	case resistance: {
		"mrkBlue" setMarkerAlphaLocal 0;
		"mrkRed" setMarkerAlphaLocal 0;
		"mrkGreen" setMarkerAlphaLocal 0;
		"mrknoBlue" setMarkerAlphaLocal 0;
		"mrknoRed" setMarkerAlphaLocal 0;
		"mrknoGreen" setMarkerAlphaLocal 0.5;
		"mrkMission" setMarkerAlphaLocal 0;
		"respawn_bomb" setMarkerAlphaLocal 0;
		_nul = []execVM "client\user_addactions\base_guer_addactions.sqf";
	};
};