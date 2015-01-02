diag_log "Bomb_auto_timer.sqf script started.";

//_autocount = X is the time it takes to count down.
for [{_autocount = 3}, {_autocount > 0}, {_autocount = _autocount - 1}] do {
	_d_check = 0;
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
					HUD_Bomb_Status = "Bomb Status: ARMED";
					publicVariable "HUD_Bomb_Status";
					_closest = objNull;
					_closestdist = 100000;
					{
					  if (_x distance The_Bomb < _closestdist) then {
						_closest = _x;
						_closestdist = _x distance The_Bomb;
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
						diag_log "Bomb_auto_timer.sqf found the bomb to be destroyed. -Level 3";
						_autocount = 0;
					} else {
						diag_log "Bomb_auto_timer.sqf found the bomb to be disarmed. -Level 3";
						{
							if (The_Bomb distance _x >= 101) then {
								_d_check = _d_check + 1;
							};
						} foreach Base_Array;
						if (_d_check == 3) then {
							diag_log "The_Bomb was disarmed away from a base. 5 min added to timer. -Level 3";
							_autocount = _autocount + 5;
							sleep 60;
						};
					};
				};
			} else {
				HUD_Bomb_Status = format ["Bomb Status: %1 Minutes", _autocount];
				publicVariable "HUD_Bomb_Status";
				sleep 60;
			};
		} else {
			waitUntil {Bomb_Armed_Tracker == 0};
			if (Bomb_Destroyed_Tracker == 1) then {
				diag_log "Bomb_auto_timer.sqf found the bomb to be destroyed. -Level 2";
				_autocount = 0;
			} else {
				diag_log "Bomb_auto_timer.sqf found the bomb to be disarmed. -Level 2";
				{
					if (The_Bomb distance _x >= 101) then {
						_d_check = _d_check + 1;
					};
				} foreach Base_Array;
				if (_d_check == 3) then {
					diag_log "The_Bomb was disarmed away from a base. 5 min added to timer. -Level 2";
					_autocount = _autocount + 5;
					sleep 60;
				};
			};
		};
	} else {
		diag_log "Bomb_auto_timer.sqf found the bomb to be destroyed. -Level 1";
		_autocount = 0;
	};
};

diag_log "Bomb_auto_timer.sqf for-loop ended.";