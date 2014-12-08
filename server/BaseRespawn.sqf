/* ----------------------------------------------------------------------------------------------------
File: vehRespawn.sqf
Author: Iceman77
Modified: AirFell
    
Description:
Respawn destroyed and abandoned vehicles

How to use - base Init Line: 
side options: w, e, g
_nul = [this, side] execVM "server\BaseRespawn.sqf"; << 2 minute abandoned delay, 1 minute destroyed delay.
---------------------------------------------------------------------------------------------------- */

private "_veh";
_veh = _this select 0;
_side = _this select 1;
_deadDelay = 30;
_dir = getDir _veh; 
_pos = getPos _veh; 
_vehtype = typeOf _veh; 

_nul = switch (_side) do {
	case "west": {
		if (isServer) then {
			While {True} Do {
				sleep 1;
				if (!alive _veh) then {
					sleep _deadDelay;
				
					//Custom Side Choosing Script~ AirFell
//					_RandomPosB = bombRespawnArray select floor random count bombRespawnArray;
//					_posMrk = getMarkerPos _RandomPosB;
					_posMrk = getMarkerPos "west_base_respawn";
				
					west_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
					_veh setDir _dir;
					_veh setPos [_posMrk select 0, _posMrk select 1,0];
					_pos = getPos _veh;
					west_base setVehicleVarName "west_base";
					publicVariable "west_base";
				};
			};
		};
	};
		
	case "east": {
		if (isServer) then {
			While {True} Do {
				sleep 1;
				if (!alive _veh) then {
					sleep _deadDelay;
				
					//Custom Side Choosing Script~ AirFell
//					_RandomPosB = bombRespawnArray select floor random count bombRespawnArray;
//					_posMrk = getMarkerPos _RandomPosB;
					_posMrk = getMarkerPos "east_base_respawn";
				
					east_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
					_veh setDir _dir;
					_veh setPos [_posMrk select 0, _posMrk select 1,0];
					_pos = getPos _veh;
					The_Bomb setVehicleVarName "east_base";
					publicVariable "east_base";
				};
			};
		};
	};
	
	case "guer": {
		if (isServer) then {
			While {True} Do {
				sleep 1;
				if (!alive _veh) then {
					sleep _deadDelay;
				
					//Custom Side Choosing Script~ AirFell
//					_RandomPosB = bombRespawnArray select floor random count bombRespawnArray;
//					_posMrk = getMarkerPos _RandomPosB;
					_posMrk = getMarkerPos "guer_base_respawn";
				
					guer_base = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
					_veh setDir _dir;
					_veh setPos [_posMrk select 0, _posMrk select 1,0];
					_pos = getPos _veh;
					guer_base setVehicleVarName "guer_base";
					publicVariable "guer_base";
				};
			};
		};
	};
};
 