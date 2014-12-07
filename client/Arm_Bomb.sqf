player addaction [
	"Arm Bomb",
	{
		diag_log "Arming script started.";
		
		
		_distanceCheck = 0;

		{
			if ((The_Bomb distance _x) < 10) then {
				_distanceCheck = _distanceCheck + 1;
			};
		} forEach BaseArray;
		
		if (_distanceCheck == 1) then {
			if (vehicle player == player) then {
				_stringEscapePercent = "%";	
				_totalDuration = 10; //duration of arming sequence
				_lockDuration = _totalDuration;
				_iteration = 0;

				diag_log "Arming animation started.";
				player switchMove "AinvPknlMstpSlayWrflDnon_medic";
				for "_iteration" from 1 to _lockDuration do {
    
					if (!(alive player)) exitWith {// If the player dies, revert state.
						hint "You died while arming the bomb";
					};	
					
					if(player distance The_Bomb > 3) exitWith { // If the player dies, revert state.
						hint "You must be closer to the enemy base!";

					};                  
                                                        	    
					if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the placement.
						player switchMove "AinvPknlMstpSlayWrflDnon_medic";
					};
    	    
					_lockDuration = _lockDuration - 1;
					_iterationPercentage = floor (_iteration / _totalDuration * 100);
					    
					2 cutText [format["Arming Bomb %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
					sleep 1;
					    
					if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that place has completed.
						sleep 1;
						2 cutText ["", "PLAIN DOWN", 1];
					};
				};
		
				diag_log "Siren Started.";
				//how long do we want until the "bomb" goes off?
				for [{_lc = 0},{_lc < 10},{_lc = _lc +1}] do{
					playSound3D ["A3\Sounds_F\sfx\siren.wss", The_Bomb, false, getPos The_Bomb, 5, 1, 500];
					sleep 2;
				};
		
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
		
				diag_log "Objects damaged.";
			} else{
				diag_log "Player attempted to arm bomb from within vehicle.";
				hint "You can't arm the bomb from inside a vehicle.";
			};
		} else {
			diag_log "Player attempted to arm bomb too far from enemy base.";
			hint "You can't arm the bomb here!";
		};
	},
	nil, 1, True, True, "", "(player distance The_Bomb) < 3"
];