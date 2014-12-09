/* ----------------------------------------------------------------------------------------------------
File: vehRespawn.sqf
Author: Iceman77
Modified: AirFell
---------------------------------------------------------------------------------------------------- */

diag_log "BaseRespawn script started.";


//if (isDedicated) then {
_deadDelay = 30;
	
	while {True} do {
		sleep 5;
		
		if (Base_Destroyed_Tracker == 1) then {
			sleep _deadDelay;
			
			_vehtype = "Land_Cargo_Tower_V1_No1_F";
			
			switch (Bombed_Team) do {
				case west: {
//Custom Side Choosing Script~ AirFell
//					_RandomPosB = bombRespawnArray select floor random count bombRespawnArray;
//					_posMrk = getMarkerPos _RandomPosB;
					_posMrk = getMarkerPos "west_base_respawn";
						
					west_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
					west_base setPos [_posMrk select 0, _posMrk select 1,0];
					
					west_base setVehicleVarName "west_base";
					publicVariable "west_base";
						
					Base_Destroyed_Tracker = 0;
					publicVariable "Base_Destroyed_Tracker";
						
					diag_log format ["Case West: Base %1 respawned", Bombed_Team];
				};
				case east: {		
//Custom Side Choosing Script~ AirFell
//					_RandomPosB = bombRespawnArray select floor random count bombRespawnArray;
//					_posMrk = getMarkerPos _RandomPosB;
					_posMrk = getMarkerPos "east_base_respawn";
							
					east_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
					east_base setPos [_posMrk select 0, _posMrk select 1,0];
						
					east_base setVehicleVarName "east_base";
					publicVariable "east_base";
						
					Base_Destroyed_Tracker = 0;
					publicVariable "Base_Destroyed_Tracker";
						
					diag_log format ["Case East: Base %1 respawned", Bombed_Team];
				};
				case resistance: {
//Custom Side Choosing Script~ AirFell
//					_RandomPosB = bombRespawnArray select floor random count bombRespawnArray;
//					_posMrk = getMarkerPos _RandomPosB;
					_posMrk = getMarkerPos "guer_base_respawn";
							
					guer_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
					guer_base setPos [_posMrk select 0, _posMrk select 1,0];
						
					guer_base setVehicleVarName "guer_base";
					publicVariable "guer_base";
					
					Base_Destroyed_Tracker = 0;
					publicVariable "Base_Destroyed_Tracker";
						
					diag_log format ["Case Guer: Base %1 respawned", Bombed_Team];
				};
			};
		};
	};
//};

diag_log "BaseRespawn script Ended. ***THIS IS BAD***";