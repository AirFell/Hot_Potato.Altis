diag_log "**?** Server_Mission_End Listener loaded.";

_end_mission_loop = 0;
	
while {_end_mission_loop == 0} do {
	sleep 5;
	if (West_Score == 5) then {
		"end1" call BIS_fnc_endMission;
		diag_log "Mission has ended.";
		_end_mission_loop = 1;
	} else {
		if (East_Score == 5) then {
			"end2" call BIS_fnc_endMission;
			diag_log "Mission has ended.";
			_end_mission_loop = 1;
		} else {
			if (Guer_Score == 5) then {
				"end3" call BIS_fnc_endMission;
				diag_log "Mission has ended.";
				_end_mission_loop = 1;
			};
		};
	};
};