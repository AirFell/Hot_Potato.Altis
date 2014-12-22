while {True} do {
	sleep 300;
	
	West_Score = West_Score + 100;
	publicVariable "West_Score";

	East_Score = East_Score + 100;
	publicVariable "East_Score";

	Guer_Score = Guer_Score + 100;
	publicVariable "Guer_Score";
};