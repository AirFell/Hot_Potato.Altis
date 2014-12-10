sleep 5;
diag_log "**5** Bomb_Spawn.sqf loading...";

_vehtype = "";
_RandomPos_Bomb = Bomb_Spawn_Array select floor random count Bomb_Spawn_Array;
_posMrk = getMarkerPos _RandomPos_Bomb;
//_posMrk = getMarkerPos "respawn_bomb";
The_Bomb = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
The_Bomb setPos [_posMrk select 0, _posMrk select 1,0];
			
The_Bomb setVehicleVarName "The_Bomb";
publicVariable "The_Bomb";

this setVariable ["R3F_LOG_disabled", false];
			
diag_log "Bomb_Spawn.sqf loaded.";