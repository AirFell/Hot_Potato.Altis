diag_log "GlobalVars.sqf loading...";

Error_pos = [10808.3,10582.9];
publicVariable "Error_pos";

////////////////////////////////////
///////Bomb Tracker PV's////////////
////////////////////////////////////

Base_Destroyed_Tracker = 0;
publicVariable "Base_Destroyed_Tracker";

Bomb_Destroyed_Tracker = 0;
publicVariable "Bomb_Destroyed_Tracker";

Bomb_Armed_Tracker = 0;
publicVariable "Bomb_Armed_Tracker";


////////////////////////////////////
///////	/////Base Values////////////
////////////////////////////////////

//current scores temporary.

West_Score = 1;
publicVariable "West_Score";

East_Score = 1;
publicVariable "East_Score";

Guer_Score = 1;
publicVariable "Guer_Score";

////////////////////////////////////
////////////pre-score///////////////
////////////////////////////////////
Armed_Team = "";
publicVariable "Armed_Team";

Bombed_Team = "";
publicVariable "Bombed_Team";

diag_log "GlobalVars.sqf loaded.";