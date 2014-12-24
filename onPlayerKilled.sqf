diag_log "Finding random spawn position.";

_RandomPosW = westRespawnArray select floor random count westRespawnArray;
"respawn_west" setMarkerPosLocal getMarkerPos _RandomPosW;

_RandomPosE = EastRespawnArray select floor random count EastRespawnArray;
"respawn_east" setMarkerPosLocal getMarkerPos _RandomPosE;

_RandomPosG = GuerRespawnArray select floor random count GuerRespawnArray;
"respawn_guerrila" setMarkerPosLocal getMarkerPos _RandomPosG;

diag_log "player killed. scripts restarting.";

waitUntil {alive player};

playerCredits = playerCredits * 0.25;
playerCredits = round playerCredits;

_nul = []execVM "client\side_switch.sqf";
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