/* ----------------------------------------------------------------------------------------------------
File: vehRespawn.sqf
Author: Iceman77
Modified: AirFell
---------------------------------------------------------------------------------------------------- */
diag_log "BombRespawn script started.";

_veh = The_Bomb;
_deadDelay = 30;
_vehtype = typeOf _veh; 

//if (isDedicated) then {
    While {True} Do {
        sleep 5;
           if (Bomb_Destroyed_Tracker == 1) then {
			_posMrk = getMarkerPos "respawn_bomb";
            The_Bomb = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
            The_Bomb setPos [_posMrk select 0, _posMrk select 1,0];
			
			The_Bomb setVehicleVarName "The_Bomb";
			publicVariable "The_Bomb";
			
			Bomb_Destroyed_Tracker = 0;
			publicVariable "Bomb_Destroyed_Tracker";
			
			diag_log "bomb respawned.";
        };
    };
//};

diag_log "BombRespawn script Ended. ***THIS IS BAD***";