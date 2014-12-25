guer_enemy_Detected = 0;

while {True} do {
	{
		if (_x distance guer_base < 250 && side _x != resistance) then {
			guer_enemy_Detected = 1;
			publicVariable "guer_enemy_Detected";
			
			_RandomPosG = GuerRespawnArray select floor random count GuerRespawnArray;
			"respawn_guerrila" setMarkerPos getMarkerPos _RandomPosG;
			
		} else {
			if (guer_enemy_Detected == 1) then {
				guer_enemy_Detected = 0;
				publicVariable "guer_enemy_Detected";
				
				_pos = getPos guer_base;
				_mkr_pos = [(_pos select 0) - 30, (_pos select 1) - 30, 2.5];
				"respawn_guerrila" setMarkerPos _mkr_pos;
			};
		};
	} foreach allunits;
	sleep 15;
};