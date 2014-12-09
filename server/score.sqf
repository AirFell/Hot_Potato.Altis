diag_log format["Bombed_Team: %1, east_base: %2", Bombed_Team, east_base];
if (isDedicated) then {

	diag_log "server-score script started.";
	diag_log format["Bombed_Team: %1, east_base: %2", Bombed_Team, east_base];
	
	if (Bomb_Destroyed_Tracker == 1 && Bomb_Armed_Tracker == 0) then {
		switch (Armed_Team) do {
			case west: {
				West_Score = West_Score + 1;
				publicVariable "West_Score";
				diag_log format["West_Score: %1", West_Score];
				
				diag_log format["Bombed_Team: %1, east_base: %2", Bombed_Team, east_base];
				if (Bombed_Team == east_base) then {
					if (East_score == 0) then {
					publicVariable "East_Score";
					diag_log "East Score already equals 0.";
					diag_log format["East_Score: %1", East_Score];
					} else {
					East_Score = East_Score - 1;
					publicVariable "East_Score";
					diag_log format["East_Score: %1", East_Score];
					};
				} else {
					Guer_Score = Guer_Score - 1;
					publicVariable "Guer_Score";
					diag_log format["Guer_Score: %1", Guer_Score];
				};
			};
				
			case east: {
				East_Score = East_Score + 1;
				publicVariable "East_Score";
			};
			
			case resistance: {
				Guer_Score = Guer_Score + 1;
				publicVariable "Guer_Score";
			};
		};
	};

	diag_log "server-score script ended.";

};