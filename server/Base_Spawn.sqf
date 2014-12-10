sleep 2;
diag_log "**2** Base_Spawn.sqf loading...";


_vehtype = "Land_Cargo_Tower_V1_No1_F";

//Spawn West Base//
_RandomPos_West_Base = West_Base_Array select floor random count West_Base_Array;
_posMrk = getMarkerPos _RandomPos_West_Base;
//_posMrk = getMarkerPos "west_base_respawn";
						
west_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
west_base setPos [_posMrk select 0, _posMrk select 1,0];
					
west_base setVehicleVarName "west_base";
publicVariable "west_base";
west_base addEventHandler ["HandleDamage", {false}];

west_base_marker = createMarker["west_base_marker", (getPos west_base)];
west_base_marker setMarkerColor "ColorBLUFOR";
west_base_marker setMarkerShape "Icon";
west_base_marker setMarkerType "b_hq";

West_Base_Array = West_Base_Array - [_RandomPos_West_Base];

diag_log format ["_RandomPos_West_Base: %1", _RandomPos_West_Base];
diag_log format ["Updated West_Base_Array: %1", West_Base_Array];
					

//Spawn East Base//					
_RandomPos_East_Base = East_Base_Array select floor random count East_Base_Array;
_posMrk = getMarkerPos _RandomPos_East_Base;
//_posMrk = getMarkerPos "east_base_respawn";
							
east_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
east_base setPos [_posMrk select 0, _posMrk select 1,0];
						
east_base setVehicleVarName "east_base";
publicVariable "east_base";
east_base addEventHandler ["HandleDamage", {false}];

east_base_marker = createMarker["east_base_marker", (getPos east_base)];
east_base_marker setMarkerColor "ColorOPFOR";
east_base_marker setMarkerShape "Icon";
east_base_marker setMarkerType "o_hq";

East_Base_Array = East_Base_Array - [_RandomPos_East_Base];

diag_log format ["_RandomPos_East_Base: %1", _RandomPos_East_Base];
diag_log format ["Updated East_Base_Array: %1", East_Base_Array];
					

//Spawn Guer Base//
_RandomPos_Guer_Base = Guer_Base_Array select floor random count Guer_Base_Array;
_posMrk = getMarkerPos _RandomPos_Guer_Base;
//_posMrk = getMarkerPos "guer_base_respawn";
							
guer_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
guer_base setPos [_posMrk select 0, _posMrk select 1,0];
						
guer_base setVehicleVarName "guer_base";
publicVariable "guer_base";
guer_base addEventHandler ["HandleDamage", {false}];

guer_base_marker = createMarker["guer_base_marker", (getPos guer_base)];
guer_base_marker setMarkerColor "ColorIndependent";
guer_base_marker setMarkerShape "Icon";
guer_base_marker setMarkerType "n_hq";

Guer_Base_Array = Guer_Base_Array - [_RandomPos_Guer_Base];

diag_log format ["_RandomPos_Guer_Base: %1", _RandomPos_Guer_Base];
diag_log format ["Updated Guer_Base_Array: %1", Guer_Base_Array];

diag_log "Base_Spawn.sqf loaded.";