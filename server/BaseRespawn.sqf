/* ----------------------------------------------------------------------------------------------------
File: vehRespawn.sqf
Author: Iceman77
Modified: AirFell
---------------------------------------------------------------------------------------------------- */

diag_log "BaseRespawn.sqf loaded.";
	
		if (Base_Destroyed_Tracker == 1) then {
		
			_vehtype = "Land_Cargo_Tower_V1_No1_F";
			
			switch (Bombed_Team) do {
				case west: {
				
					west_base setVehicleVarName "";
					publicVariable "west_base";
					sleep 5;
					
					_RandomPos_West_Base = West_Base_Array select floor random count West_Base_Array;
					_posMrk = getMarkerPos _RandomPos_West_Base;
//					_posMrk = getMarkerPos "west_base_respawn";
						
					west_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
					west_base setPos [_posMrk select 0, _posMrk select 1,0];
					
					west_base setVehicleVarName "west_base";
					publicVariable "west_base";
					west_base addEventHandler ["HandleDamage", {false}];
						
					
					"west_base_marker" setMarkerPos getPos west_base;
					"mrkBlue" setMarkerPos getMarkerPos "west_base_marker";
					"mrknoBlue" setMarkerPos getMarkerPos "west_base_marker";
					
					{
						deleteMarker _x;
					} foreach westRespawnArray;
					westRespawnArray = [];
					publicVariable "westRespawnArray";
					
					_nul = []execVM "server\randomMarkerGen.sqf";
					
					Base_Destroyed_Tracker = 0;
					publicVariable "Base_Destroyed_Tracker";
						
					diag_log format ["Case West: Base %1 respawned", Bombed_Team];

					West_Base_Array = West_Base_Array - [_RandomPos_West_Base];

					diag_log format ["_RandomPos_West_Base: %1", _RandomPos_West_Base];
					diag_log format ["Updated West_Base_Array: %1", West_Base_Array];
				};
				case east: {
				
					east_base setVehicleVarName "";
					publicVariable "east_base";
					sleep 15;
					
					_RandomPos_East_Base = East_Base_Array select floor random count East_Base_Array;
					_posMrk = getMarkerPos _RandomPos_East_Base;
//					_posMrk = getMarkerPos "east_base_respawn";
							
					east_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
					east_base setPos [_posMrk select 0, _posMrk select 1,0];
						
					east_base setVehicleVarName "east_base";
					publicVariable "east_base";
					east_base addEventHandler ["HandleDamage", {false}];
					
					"east_base_marker" setMarkerPos getPos east_base;
					sleep 1;
					"mrkRed" setMarkerPos getMarkerPos "east_base_marker";
					"mrknoRed" setMarkerPos getMarkerPos "east_base_marker";
					
					{
						deleteMarker _x;
					} foreach eastRespawnArray;
					eastRespawnArray = [];
					publicVariable "eastRespawnArray";
					
					_nul = []execVM "server\randomMarkerGen.sqf";
						
					Base_Destroyed_Tracker = 0;
					publicVariable "Base_Destroyed_Tracker";
						
					diag_log format ["Case East: Base %1 respawned", Bombed_Team];

					East_Base_Array = East_Base_Array - [_RandomPos_East_Base];

					diag_log format ["_RandomPos_East_Base: %1", _RandomPos_East_Base];
					diag_log format ["Updated East_Base_Array: %1", East_Base_Array];
				};
				case resistance: {
				
					guer_base setVehicleVarName "";
					publicVariable "guer_base";
					sleep 15;
					
					_RandomPos_Guer_Base = Guer_Base_Array select floor random count Guer_Base_Array;
					_posMrk = getMarkerPos _RandomPos_Guer_Base;
//					_posMrk = getMarkerPos "guer_base_respawn";
							
					guer_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
					guer_base setPos [_posMrk select 0, _posMrk select 1,0];
						
					guer_base setVehicleVarName "guer_base";
					publicVariable "guer_base";
					guer_base addEventHandler ["HandleDamage", {false}];
					
					"guer_base_marker" setMarkerPos getPos guer_base;
					sleep 1;
					"mrkGreen" setMarkerPos getMarkerPos "guer_base_marker";
					"mrknoGreen" setMarkerPos getMarkerPos "guer_base_marker";
					
					{
						deleteMarker _x;
					} foreach guerRespawnArray;
					guerRespawnArray = [];
					publicVariable "guerRespawnArray";
					
					_nul = []execVM "server\randomMarkerGen.sqf";
						
					Base_Destroyed_Tracker = 0;
					publicVariable "Base_Destroyed_Tracker";
						
					diag_log format ["Case Guer: Base %1 respawned", Bombed_Team];

					Guer_Base_Array = Guer_Base_Array - [_RandomPos_Guer_Base];

					diag_log format ["_RandomPos_Guer_Base: %1", _RandomPos_Guer_Base];
					diag_log format ["Updated Guer_Base_Array: %1", Guer_Base_Array];
				};
			};
		};

diag_log "BaseRespawn script Ended.";