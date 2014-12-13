/* ----------------------------------------------------------------------------------------------------
File: vehRespawn.sqf
Author: Iceman77
Modified: AirFell
    
Description:
Respawn destroyed and abandoned vehicles
    
Parameter(s):
_this select 0: vehicle 
_this select 1: abandoned delay in minute(s) - Required
_this select 2: destroyed delay in minute(s) - Required

How to use - Vehicle Init Line: 
_nul = [this, 2, 1] execVM "vehrespawn.sqf"; << 2 minute abandoned delay, 1 minute destroyed delay.
---------------------------------------------------------------------------------------------------- */

private "_veh";

_veh = _this select 0;
_abandonDelay = (_this select 1) * 60;
_deadDelay = (_this select 2) * 60;
_dir = getDir _veh; 
_pos = westRespawnArray select floor random count westRespawnArray; 
_vehtype = typeOf _veh; 

if (isServer) then {
    While {True} Do {
        sleep 1;
        if ((alive _veh) && {canMove _veh} && {{alive _x} count crew _veh == 0}) then {
            _abandoned = true;

                for "_i" from 0 to _abandonDelay do {  
                    if (({alive _x} count (crew _veh) > 0) || (!alive _veh) || (!canMove _veh)) exitWith {_abandoned = false;};
                    sleep 1;  
                };
             
            if ((_abandoned) && {_veh distance _pos > 100}) then {
                deleteVehicle _veh;
                sleep 1;
				
				//Custom Side Choosing Script~ AirFell
				_RandomPosW = westRespawnArray select floor random count westRespawnArray;
				_posMrk = getMarkerPos _RandomPosW;
				
                _veh = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
                _veh setDir _dir;
                _veh setPos [_posMrk select 0, _posMrk select 1,0];
				_pos = getPos _veh;
//				"respawn_veh_west" setMarkerPos getPos _veh;
				_veh setVariable ["R3F_LOG_disabled", false, true];
            };
        };

        if ((!alive _veh) || (!canMove _veh)) then {
            _dead = true;

                for "_i" from 0 to _deadDelay do {  
                    if (({alive _x} count (crew _veh) > 0) || (canMove _veh)) exitWith {_dead = false;};
                    sleep 1;  
                };
             
            if (_dead) then {
                deleteVehicle _veh;
                sleep 1;
				
				//Custom Side Choosing Script~ AirFell
				_RandomPosW = westRespawnArray select floor random count westRespawnArray;
				_posMrk = getMarkerPos _RandomPosW;
				
                _veh = createVehicle [_vehtype, _posMrk, [], 0, "CAN_COLLIDE"];
                _veh setDir _dir;
                _veh setPos [_posMrk select 0, _posMrk select 1,0];
				_pos = getPos _veh;
//				"respawn_veh_west" setMarkerPos getPos _veh;
				_veh setVariable ["R3F_LOG_disabled", false, true];
            };
        };
    };
};  