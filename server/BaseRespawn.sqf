/* ----------------------------------------------------------------------------------------------------
File: vehRespawn.sqf
Author: Iceman77
Modified: AirFell
---------------------------------------------------------------------------------------------------- */

diag_log "BaseRespawn script started.";
diag_log format["BaseRespawn script: Bombed Team = %1", Bombed_Team];

//if (isDedicated) then {
	
	while {True} do {
		sleep 5;
	
		_deadDelay = 30;
		
		if (Base_Destroyed_Tracker == 1) then {
			sleep _deadDelay;
			
			_veh = Bombed_Team;
			_vehtype = typeOf _veh;
			
			switch (Bombed_Team) do {
				case "west_base": {
//Custom Side Choosing Script~ AirFell
//					_RandomPosB = bombRespawnArray select floor random count bombRespawnArray;
//					_posMrk = getMarkerPos _RandomPosB;
					_posMrk = getMarkerPos "west_base_respawn";
						
					west_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
					_veh setDir _dir;
					_veh setPos [_posMrk select 0, _posMrk select 1,0];
					_pos = getPos _veh;
					
					if (West_Score >= 1) then {
						West_Score = West_Score - 1;
						publicVariable "West_Score";
					};
					
					west_base setVehicleVarName "west_base";
					publicVariable "west_base";
						
					Base_Destroyed_Tracker = 0;
					publicVariable "Base_Destroyed_Tracker";
						
					diag_log format ["Case West: Base %1 respawned, West Score: %2", Bombed_Team, West_Score];
				};
				case "east_base": {		
//Custom Side Choosing Script~ AirFell
//					_RandomPosB = bombRespawnArray select floor random count bombRespawnArray;
//					_posMrk = getMarkerPos _RandomPosB;
					_posMrk = getMarkerPos "east_base_respawn";
							
					east_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
					_veh setDir _dir;
					_veh setPos [_posMrk select 0, _posMrk select 1,0];
					_pos = getPos _veh;
					
					if (East_Score >= 1) then {
						East_Score = East_Score - 1;
						publicVariable "East_Score";
					};
						
					east_base setVehicleVarName "east_base";
					publicVariable "east_base";
						
					Base_Destroyed_Tracker = 0;
					publicVariable "Base_Destroyed_Tracker";
						
					diag_log format ["Case East: Base %1 respawned, East Score: %2", Bombed_Team, East_Score];
				};
				case "guer_base": {
//Custom Side Choosing Script~ AirFell
//					_RandomPosB = bombRespawnArray select floor random count bombRespawnArray;
//					_posMrk = getMarkerPos _RandomPosB;
					_posMrk = getMarkerPos "guer_base_respawn";
							
					guer_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
					_veh setDir _dir;
					_veh setPos [_posMrk select 0, _posMrk select 1,0];
					_pos = getPos _veh;
					
					if (Guer_Score >= 1) then {
						Guer_Score = Guer_Score - 1;
						publicVariable "Guer_Score";
					};
						
					guer_base setVehicleVarName "guer_base";
					publicVariable "guer_base";
					
					Base_Destroyed_Tracker = 0;
					publicVariable "Base_Destroyed_Tracker";
						
					diag_log format ["Case Guer: Base %1 respawned, Guer Score: %2", Bombed_Team, Guer_Score];
				};
			};
		};
	};
//};

diag_log "BaseRespawn script Ended. ***THIS IS BAD***";