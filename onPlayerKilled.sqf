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