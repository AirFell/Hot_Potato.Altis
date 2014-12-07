player addaction [
	"Arm Bomb",
	{
		diag_log "Siren Started.";
		//how long do we want until the "bomb" goes off?
		for [{_lc = 0},{_lc < 10},{_lc = _lc +1}] do{
			playSound3D ["A3\Sounds_F\sfx\siren.wss", The_Bomb, false, getPos The_Bomb, 5, 1, 500];
			sleep 2;
		};
		_objectsList = nearestObjects [getPos The_Bomb, ["Static","Thing","Strategic","Object"], 75] - [The_Bomb];
		{
			_x setDamage 1;
			deleteVehicle _x;
		}forEach _objectsList;
		_number = random 15;
		_number2 = random 3;
		_bomb1 = "M_Mo_82mm_AT_LG" createVehicle [(getPos The_Bomb select 0),( getPos The_Bomb select 1), 0];
		sleep 2;
		_bomb2 = "HelicopterExploBig" createVehicle [(getPos The_Bomb select 0),( getPos The_Bomb select 1), 0];
		sleep 0.5;
		_bomb3 = "R_60mm_HE" createVehicle [(getPos The_Bomb select 0) - _number,(getPos The_Bomb select 1) + _number, 0];
		sleep 0.25;
		_bomb4 = "Bo_GBU12_LGB_MI10" createVehicle [(getPos The_Bomb select 0) + _number * _number,(getPos The_Bomb select 1) - _number * _number, 0];
		sleep _number2;
		_bomb5 = "M_Mo_82mm_AT_LG" createVehicle [(getPos The_Bomb select 0) - _number * _number,(getPos The_Bomb select 1) + _number * _number, 0];
		sleep _number2;
		_bomb6 = "Bo_Mk82" createVehicle [(getPos The_Bomb select 0) + _number * _number,(getPos The_Bomb select 1) - _number * _number, 0];
		sleep 0.1;
		_bomb7 = "R_60mm_HE" createVehicle [(getPos The_Bomb select 0) - _number,(getPos The_Bomb select 1) + _number, 0];
		sleep 0.25;
		_bomb8 = "Bo_GBU12_LGB_MI10" createVehicle [(getPos The_Bomb select 0) + _number * _number,(getPos The_Bomb select 1) - _number * _number, 0];
		sleep _number2;
		_bomb9 = "M_Mo_82mm_AT_LG" createVehicle [(getPos The_Bomb select 0) - _number * _number,(getPos The_Bomb select 1) + _number * _number, 0];
		sleep _number2;
		_bomb10 = "Bo_Mk82" createVehicle [(getPos The_Bomb select 0) + _number * _number,(getPos The_Bomb select 1) - _number * _number, 0];
		deleteVehicle The_Bomb;
		sleep 30;
		
		diag_log "Objects damaged.";
	},
	nil, 1, True, True, "", "(player distance The_Bomb) < 3"
];