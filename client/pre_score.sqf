diag_log "pre-score script started.";

Armed_Team = side player;
publicVariable "Armed_Team";
diag_log format["pre-score script: Armed Team = %1", Armed_Team];

_distance1 = player distance EnemyBase1;
_distance2 = player distance EnemyBase2;

switch (side player) do {
	case west: {
		if (_distance1 < _distance2) then {
		Bombed_Team = east;
		} else {
		Bombed_Team = resistance;
		};
	};
		
	case east: {
		if (_distance1 < _distance2) then {
		Bombed_Team = west;
		} else {
		Bombed_Team = resistance;
		};
	};
	
	case resistance: {
		if (_distance1 < _distance2) then {
		Bombed_Team = west;
		} else {
		Bombed_Team = east;
		};
	};
};

diag_log format["pre-score script: _Bombed_Base = %1", Bombed_Team];

diag_log "pre-score script ended.";