	_nul = switch (side player) do {
		case west: {
			_nul = []execVM "client\user_addactions\helper_west.sqf";
			_nul = []execVM "client\radar_listener_west.sqf";
		};
		case east: {
			_nul = []execVM "client\user_addactions\helper_east.sqf";
			_nul = []execVM "client\radar_listener_east.sqf";
		};
		case resistance: {
			_nul = []execVM "client\user_addactions\helper_guer.sqf";
			_nul = []execVM "client\radar_listener_guer.sqf";
		};
	};