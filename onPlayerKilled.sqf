//Commented out for quicker testing

/*
_RandomPosW = westRespawnArray select floor random count westRespawnArray;
"respawn_west" setMarkerPosLocal getMarkerPos _RandomPosW;

_RandomPosE = EastRespawnArray select floor random count EastRespawnArray;
"respawn_east" setMarkerPosLocal getMarkerPos _RandomPosE;

_RandomPosG = GuerRespawnArray select floor random count GuerRespawnArray;
"respawn_guerrila" setMarkerPosLocal getMarkerPos _RandomPosG;
*/
diag_log "player killed. scripts restarting.";
waitUntil {alive player};
_nul = []execVM "client\sideSwitch.sqf";
_nul = []execVM "client\Arm_Bomb.sqf";
_nul = []execVM "client\Disarm_Bomb.sqf";
_nul = []execVM "client\Load_Bomb.sqf";

The_Bomb setVariable ["R3F_LOG_disabled", false, true];
The_Bomb addEventHandler ["HandleDamage", {false}];
west_base addEventHandler ["HandleDamage", {false}];
east_base addEventHandler ["HandleDamage", {false}];
guer_base addEventHandler ["HandleDamage", {false}];

player addAction [
	"Show Score",
	{
		hint format["West:%1 East:%2 Guer:%3", West_Score, East_Score, Guer_Score];
	},
	nil, 1, True, True, "", ""];