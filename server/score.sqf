//if (isDedicated) then {
	diag_log "server-score script started.";
	
	if (Bomb_Destroyed_Tracker == 1 && Bomb_Armed_Tracker == 0) then {
		switch (Armed_Team) do {
			case west: {
				West_Score = West_Score + 1;
				publicVariable "West_Score";
				diag_log format["West_Score: %1", West_Score];
			};
				
			case east: {
				East_Score = East_Score + 1;
				publicVariable "East_Score";
				diag_log format["East_Score: %1", East_Score];
			};
			
			case resistance: {
				Guer_Score = Guer_Score + 1;
				publicVariable "Guer_Score";
				diag_log format["Guer_Score: %1", Guer_Score];
			};
		};
	};

	diag_log "server-score script ended.";

//};

/*
NOTE: Score-Loss needs to be tracked by base destroyed. Removed some PV's from this script. Pre-Score script still has bombed-team variables
in it. Leaving there for the time being.
*/