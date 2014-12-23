0 = player addMPEventHandler ["mpkilled", {
		_victim = _this select 0;
		_killer = _this select 1;
		_victim_Side = side _victim;
		_killer_Side = side _killer;
		if (_killer == player && !(_victim_Side == _killer_side)) then {
			playerCredits = playerCredits + 100;
			diag_log format["!!! %1 killed %2 !!!", _killer, _victim];
		};
		if (_killer == player && _victim_Side == _killer_side) then {
			if (playerCredits <= 100) then {
				playerCredits = 0;
			} else {
				playerCredits = playerCredits - 100;
			};
			diag_log format["!!! %1 teamkilled %2 !!!", _killer, _victim];
		};
	}
];






/*
while {true} do {
	sleep 60;
	{_x removeEventHandler ["Killed", 0]} forEach playableUnits;
	{0 = _x addEventHandler ["killed", {
		_victim = _this select 0;
		_killer = _this select 1;
		_victim_Side = side _victim;
		_killer_Side = side _killer;
		if (_killer == player && !(_victim_Side == _killer_side)) then {
			playerCredits = playerCredits + 100;
			diag_log format["!!! %1 killed %2 !!!", _killer, _victim];
		};
		if (_killer == player && _victim_Side == _killer_side) then {
			if (playerCredits <= 100) then {
				playerCredits = 0;
			} else {
				playerCredits = playerCredits - 100;
			};
			diag_log format["!!! %1 teamkilled %2 !!!", _killer, _victim];
		};
	}];} forEach playableUnits;
};
*/