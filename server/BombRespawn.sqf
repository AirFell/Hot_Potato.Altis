/* ----------------------------------------------------------------------------------------------------
File: vehRespawn.sqf
Author: Iceman77
Modified: AirFell
---------------------------------------------------------------------------------------------------- */
sleep 7;
diag_log "**7** BombRespawn.sqf script loaded.";

_veh = The_Bomb;
_deadDelay = 30;
_vehtype = typeOf _veh; 

//if (isDedicated) then {
    While {True} Do {
        sleep 5;
           if (Bomb_Destroyed_Tracker == 1) then {
		   _RandomPos_Bomb = Bomb_Spawn_Array select floor random count Bomb_Spawn_Array;
			_posMrk = getMarkerPos _RandomPos_Bomb;
//			_posMrk = getMarkerPos "respawn_bomb";
            The_Bomb = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
            The_Bomb setPos [_posMrk select 0, _posMrk select 1,0];
			
			The_Bomb setVehicleVarName "The_Bomb";
			publicVariable "The_Bomb";
			
			Bomb_Destroyed_Tracker = 0;
			publicVariable "Bomb_Destroyed_Tracker";
			
			this setVariable ["R3F_LOG_disabled", false];
			
			diag_log "bomb respawned.";
        };
    };
//};

diag_log "BombRespawn script Ended. ***THIS IS BAD***";