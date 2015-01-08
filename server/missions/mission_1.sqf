diag_log "A mission has started!";
/*
notes:
		need to make some sort of mission ending trigger that will execVM the mission_init again.
*/


//chooses a random marker from the array
_RandomPosM = MissionMarkerArray select floor random count MissionMarkerArray;

_pos = getMarkerPos _RandomPosM;
_newPos = [_pos, 0, 15, 15, 0, 10, 0] call BIS_fnc_findSafePos;
Truck_1 = createVehicle ["C_Van_01_transport_F", _newPos, [], 0, "None"];

diag_log "truck has been created! -Mission 1";

//create a marker to show everyone where the truck is.
_missionMarker = createMarker [format ["Mission_%1", MissionCounter],_pos];
_missionMarker setMarkerShape "ICON";
_missionMarker setMarkerType "mil_dot";
_missionMarker setMarkerText format["Mission %1", MissionCounter];

//sets up some pre-defined consistant variables for the truck's barrels.
_Xstep1 = -0.6;
_Xstep2 = -0.6;
_number = floor(random 6) + 1;
diag_log format ["Truck has spawned %1 barrels!", _number];

//puts a random number of barrels in the truck and positions them accordingly.
while {_number > 0} do {
	if (_number < 4) then {
		_dir = floor(random 360);
		_tPos = [_Xstep1, -1.1, -0.175];
	
		_barrel = createVehicle ["Land_MetalBarrel_F", _tPos, [], 0, "NONE"];
		_barrel attachTo [Truck_1, _tPos];
		_barrel setDir _dir;
		_Xstep1 = _Xstep1 + 0.6;
		_number = _number - 1;
	} else {
		_dir = floor(random 360);
		_tPos = [_Xstep2, -2.5, -0.175];
	
		_barrel = createVehicle ["Land_MetalBarrel_F", _tPos, [], 0, "NONE"];
		_barrel attachTo [Truck_1, _tPos];
		_barrel setDir _dir;
		_Xstep2 = _Xstep2 + 0.6;
		_number = _number - 1;
	};
};

/*
instead of a while{true} loop, do a for step loop, when it runs out, the loop is over, the mission is abandoned,
and a new one execVM's from mission_init.sqf.
Other checks: if player enters the area, or if the car is destroyed. good setup bits are in base_radar_west.sqf and bomb_auto_timer.sqf
*/