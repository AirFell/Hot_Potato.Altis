//execVM'd by server\GlobalVars.sqf

while {True} do {
	sleep 60;
	
	west_base_resources = west_base_resources + (100 * (West_Score + 1));
	publicVariable "west_base_resources";

	east_base_resources = east_base_resources + (100 * (East_Score + 1));
	publicVariable "east_base_resources";

	guer_base_resources = guer_base_resources + (100 * (Guer_Score + 1));
	publicVariable "guer_base_resources";
};