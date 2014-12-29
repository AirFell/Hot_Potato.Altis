diag_log "Finding random spawn position.";

/*
//This is commented out to test the new spawn marker system. !!!!!Also exists in init.sqf!!!!!
	_RandomPosW = westRespawnArray select floor random count westRespawnArray;
	"respawn_west" setMarkerPosLocal getMarkerPos _RandomPosW;

	_RandomPosE = EastRespawnArray select floor random count EastRespawnArray;
	"respawn_east" setMarkerPosLocal getMarkerPos _RandomPosE;

	_RandomPosG = GuerRespawnArray select floor random count GuerRespawnArray;
	"respawn_guerrila" setMarkerPosLocal getMarkerPos _RandomPosG;
*/
cutText ["","BLACK"];
diag_log "player killed. scripts restarting.";

waitUntil {alive player};
cutText ["","BLACK IN"];
playerCredits = playerCredits * 0.25;
playerCredits = round playerCredits;

_nul = []execVM "client\dead_side_switch.sqf";
_nul = []execVM "client\user_addactions\Arm_Bomb.sqf";
_nul = []execVM "client\user_addactions\Disarm_Bomb.sqf";
_nul = []execVM "client\user_addactions\Load_Bomb.sqf";
//wtf with these? ^^

The_Bomb setVariable ["R3F_LOG_disabled", false, true];
The_Bomb addEventHandler ["HandleDamage", {false}];
west_base addEventHandler ["HandleDamage", {false}];
east_base addEventHandler ["HandleDamage", {false}];
guer_base addEventHandler ["HandleDamage", {false}];




/*

//USE FOR TEST ADDACTIONS
player addAction [
	"TEST ADDACTION",
	{
	},
	nil, 1, True, True, "", ""];
*/