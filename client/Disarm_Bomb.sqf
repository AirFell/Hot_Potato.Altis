player addaction [
	"Disarm Bomb",{
		diag_log "Disarming script started.";
			if (vehicle player == player) then {
				_stringEscapePercent = "%";	
				_totalDuration = 10; //duration of arming sequence
				_lockDuration = _totalDuration;
				_iteration = 1;
				_disarmingComplete = 0;

				diag_log "Arming animation started.";
				player switchMove "AinvPknlMstpSlayWrflDnon_medic";
				while {_lockDuration > 1} do {
					if (alive player) then {// If the player dies, end loop.
						if(player distance The_Bomb < 3) then { // If the player moves away, end loop.
							if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the placement.
								player switchMove "AinvPknlMstpSlayWrflDnon_medic";
							};
							_iteration = _iteration + 1;
							_lockDuration = _lockDuration - 1;
							_iterationPercentage = floor (_iteration / _totalDuration * 100);
								
							2 cutText [format["Disarming Bomb %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
							sleep 1;
								
							if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that place has completed.
								sleep 1;
								2 cutText ["", "PLAIN DOWN", 1];
							};
							_disarmingComplete = 1;
						} else {
							_lockDuration = 0;
							sleep 1;
							2 cutText ["", "PLAIN DOWN", 1];
							_disarmingComplete = 0;
							hint "You must be closer to the bomb!";
						};
					} else {
						_lockDuration = 0;
						sleep 1;
						2 cutText ["", "PLAIN DOWN", 1];
						_disarmingComplete = 0;
						diag_log "Player died while disarming the bomb.";
					};
				};
						
				if (_disarmingComplete == 1) then {
					Bomb_Armed_Tracker = 0;
					publicVariable "Bomb_Armed_Tracker";
					hint "Bomb Disarmed!";
				} else {
					sleep 2;
					hint "Disarming Incomplete.";
					diag_log "Disarming was cancelled.";
				};
			} else{
				diag_log "Player attempted to disarm bomb from within vehicle.";
				hint "You can't disarm the bomb from inside a vehicle.";
			};
	},
	nil, 1, True, True, "", "Bomb_Armed_Tracker == 1 && (player distance The_Bomb) < 3 && (player distance FriendlyBase) < 30"
];