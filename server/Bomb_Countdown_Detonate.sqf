if (isServer) then {
    While {True} Do {
        sleep 5;
        if (Bomb_Armed_Tracker == 1) then {
			diag_log "Siren Started.";
//how long do we want until the "bomb" goes off?
			for [{_lc = 0},{_lc < 30},{_lc = _lc +1}] do {
				if (Bomb_Armed_Tracker == 1) then {
					playSound3D ["A3\Sounds_F\sfx\siren.wss", The_Bomb, false, getPos The_Bomb, 5, 1, 500];
					sleep 2;
				} else {
					diag_log "Siren Stopped.";
				};
			};
		
//one last check to make sure the bomb wasn't disarmed during the siren countdown
			if (Bomb_Armed_Tracker == 1) then {		
//get objects and delete them.
				_objectsList = nearestObjects [getPos The_Bomb, ["Static","Thing","Strategic","Object"], 75] - [The_Bomb];
				{
					_x setDamage 1;
					deleteVehicle _x;
				}forEach _objectsList;
			
//then cometh the explosions.
				_bomb1 = "M_Mo_82mm_AT_LG" createVehicle [(getPos The_Bomb select 0),( getPos The_Bomb select 1), 0];
				sleep 3;
				_bomb2 = "HelicopterExploBig" createVehicle [(getPos The_Bomb select 0),( getPos The_Bomb select 1), 0];
				sleep 0.5;
				_number = random 15;
				_bomb3 = "R_60mm_HE" createVehicle [(getPos The_Bomb select 0) + _number,(getPos The_Bomb select 1), 0];
				sleep 0.25;
				_number = random 20;
				_number2 = random 2;
				_bomb4 = "Bo_GBU12_LGB_MI10" createVehicle [(getPos The_Bomb select 0) - _number,(getPos The_Bomb select 1), 0];
				sleep _number2;
				_number = random 15;
				_number2 = random 2;
				_bomb5 = "M_Mo_82mm_AT_LG" createVehicle [(getPos The_Bomb select 0),(getPos The_Bomb select 1) + _number, 0];
				sleep _number2;
				_number = random 25;
				_number2 = random 2;
				_bomb6 = "Bo_Mk82" createVehicle [(getPos The_Bomb select 0),(getPos The_Bomb select 1) - _number, 0];
				sleep 0.1;
				_number = random 15;
				_number2 = random 2;
				_bomb7 = "R_60mm_HE" createVehicle [(getPos The_Bomb select 0) + _number,(getPos The_Bomb select 1) + _number, 0];
				sleep 0.25;
				_number = random 25;
				_number2 = random 2;
				_bomb8 = "Bo_GBU12_LGB_MI10" createVehicle [(getPos The_Bomb select 0) - _number,(getPos The_Bomb select 1) - _number, 0];
				sleep _number2;
				_number = random 15;
				_number2 = random 10;
				_bomb9 = "M_Mo_82mm_AT_LG" createVehicle [(getPos The_Bomb select 0) - _number,(getPos The_Bomb select 1) + _number, 0];
				sleep _number2;
				_number = random 20;
				_bomb10 = "Bo_Mk82" createVehicle [(getPos The_Bomb select 0) + _number,(getPos The_Bomb select 1) - _number, 0];
				deleteVehicle The_Bomb;
				sleep 30;
						
				_distanceCheck = 0;
						
				diag_log "Objects damaged.";
						
				Bomb_Destroyed_Tracker = 1;
				publicVariable "Bomb_Destroyed_Tracker";
						
				Bomb_Armed_Tracker = 0;
				publicVariable "Bomb_Armed_Tracker";
			};
        };
    };
};