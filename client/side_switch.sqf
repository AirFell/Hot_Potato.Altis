_nul = switch (side player) do {
	case west: {
		_nul = []execVM "client\user_addactions\base_west_addactions.sqf";
	};
		
	case east: {
		_nul = []execVM "client\user_addactions\base_east_addactions.sqf";
	};
	
	case resistance: {
		_nul = []execVM "client\user_addactions\base_guer_addactions.sqf";
	};
};