diag_log "Bomb_auto_timer.sqf script started.";

for [{_autocount = 30}, {_autocount > 0}, {_autocount = _autocount - 1}] do {
	if (Bomb_Destroyed_Tracker == 0) then {
		if (Bomb_Armed_Tracker == 0) then {
			if (_autocount <= 1) then {
				if (_autocount <= 0) then {
					diag_log "Bomb_auto_timer.sqf found _autocount less than or equal to 0.";
				} else {
					Bomb_Armed_Tracker = 1;
					publicVariable "Bomb_Armed_Tracker";
					The_Bomb setVariable ["R3F_LOG_disabled", true, true];
					diag_log "Auto-Timer Armed bomb.";
					HUD_Bomb_Status = "Bomb Status: ARMED, detonation imminent.";
					publicVariable "HUD_Bomb_Status";
					_closest = objNull;
					_closestdist = 100000;
					{
					  if (_x distance _pos < _closestdist) then {
						_closest = _x;
						_closestdist = _x distance _pos;
					  };
					} forEach [west_base, east_base, guer_base];
					Bombed_Team = switch _closest do {
					  case west_base: {west};
					  case east_base: {east};
					  case guer_base: {resistance};
					};
					publicVariable "Bombed_team";
					waitUntil {Bomb_Armed_Tracker == 0};
					if (Bomb_Destroyed_Tracker == 1) then {
						diag_log "Bomb_auto_timer.sqf found the bomb to be destroyed."
						_autocount = 0;
					} else {
						diag_log "Bomb_auto_timer.sqf found the bomb to be disarmed.";
						{
							if (The_Bomb distance _x >= 100) then {
								diag_log "The_Bomb was disarmed away from a base. 5 min added to timer.";
								_autocount = _autocount + 5;
								sleep 60;
							};
						} foreach Base_Array;
					};
				};
			} else {
				HUD_Bomb_Status = format ["Bomb Status: %1 Minutes until detonation.", _autocount];
				publicVariable "HUD_Bomb_Status";
				sleep 60;
			};
		} else {
			waitUntil {Bomb_Armed_Tracker == 0};
			if (Bomb_Destroyed_Tracker == 1) then {
				diag_log "Bomb_auto_timer.sqf found the bomb to be destroyed."
				_autocount = 0;
			} else {
				diag_log "Bomb_auto_timer.sqf found the bomb to be disarmed.";
				{
					if (The_Bomb distance _x >= 100) then {
						diag_log "The_Bomb was disarmed away from a base. 5 min added to timer.";
						_autocount = _autocount + 5;
						sleep 60;
					};
				} foreach Base_Array;
			};
		};
	} else {
		diag_log "Bomb_auto_timer.sqf found the bomb to be destroyed."
		_autocount = 0;
	};
};

diag_log "Bomb_auto_timer.sqf for-loop ended.";