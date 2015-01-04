#include "autoZone_Defines.hpp";
disableSerialization;

_size = 0;
_price = 0;
_ObjectsInArea = [];

_Dialog = findDisplay AUTOZONE;
_fundsText = _Dialog displayCtrl FUNDSTEXT;
_vehList = _Dialog displayCtrl VEHICLELIST;

_credits = playerCredits;
_base_resources = "";
_airClassType = "";
_tankClassType = "";

switch (side player) do {
	case west: {
		_airClassType = "B_Helipilot_F";
		_tankClassType = "B_crew_F";
		_base_resources = west_base_resources;
		_spawn_dir = (getDir west_veh_shop_spawn1) + 180;
/*
		_spawn1 = [getPos west_veh_shop_spawn1 select 0, getPos west_veh_shop_spawn1 select 1, 0];
		_spawn2 = [getPos west_veh_shop_spawn2 select 0, getPos west_veh_shop_spawn2 select 1, 0];
		_spawn3 = [getPos west_veh_shop_spawn3 select 0, getPos west_veh_shop_spawn3 select 1, 0];
		_spawn4 = [getPos west_veh_shop_spawn4 select 0, getPos west_veh_shop_spawn4 select 1, 0];
		_spawn5 = [getPos west_veh_shop_spawn5 select 0, getPos west_veh_shop_spawn5 select 1, 0];
*/
		_spawn1 = getPos west_veh_shop_spawn1;
		_spawn2 = getPos west_veh_shop_spawn2;
		_spawn3 = getPos west_veh_shop_spawn3;
		_spawn4 = getPos west_veh_shop_spawn4;
		_spawn5 = getPos west_veh_shop_spawn5;
	};
	case east: {
		_airClassType = "O_Helipilot_F";
		_tankClassType = "O_crew_F";
		_base_resources = east_base_resources;
		_spawn_dir = (getDir east_veh_shop_spawn1) + 180;
		_spawn1 = [getPos east_veh_shop_spawn1 select 0, getPos east_veh_shop_spawn1 select 1, 0];
		_spawn2 = [getPos east_veh_shop_spawn2 select 0, getPos east_veh_shop_spawn2 select 1, 0];
		_spawn3 = [getPos east_veh_shop_spawn3 select 0, getPos east_veh_shop_spawn3 select 1, 0];
		_spawn4 = [getPos east_veh_shop_spawn4 select 0, getPos east_veh_shop_spawn4 select 1, 0];
		_spawn5 = [getPos east_veh_shop_spawn5 select 0, getPos east_veh_shop_spawn5 select 1, 0];
	};
	case resistance: {
		_airClassType = "O_Helipilot_F";
		_tankClassType = "O_crew_F";
		_base_resources = guer_base_resources;
		_spawn_dir = (getDir guer_veh_shop_spawn1) + 180;
		_spawn1 = [getPos guer_veh_shop_spawn1 select 0, getPos guer_veh_shop_spawn1 select 1, 0];
		_spawn2 = [getPos guer_veh_shop_spawn2 select 0, getPos guer_veh_shop_spawn2 select 1, 0];
		_spawn3 = [getPos guer_veh_shop_spawn3 select 0, getPos guer_veh_shop_spawn3 select 1, 0];
		_spawn4 = [getPos guer_veh_shop_spawn4 select 0, getPos guer_veh_shop_spawn4 select 1, 0];
		_spawn5 = [getPos guer_veh_shop_spawn5 select 0, getPos guer_veh_shop_spawn5 select 1, 0];
	};
};

_ObjectsInArea0 = _spawn1 nearObjects 3;
_ObjectsInArea1 = _spawn2 nearObjects 3;
_ObjectsInArea2 = _spawn3 nearObjects 3;
_ObjectsInArea3 = _spawn4 nearObjects 3;
_ObjectsInArea4 = _spawn5 nearObjects 3;

for [{_x=0},{_x<=_size},{_x=_x+1}] do {
	_selectedItem = lbCurSel _vehList;
	_vehText = _vehList lbText _selectedItem;
	{
		if(_vehText == _x select 0) then{
			sleep 1;
			_resourceCost = _x select 2;
			_creditCost = _x select 3;
			if(_creditCost <= _credits) then {
				if(_resourceCost <= _base_resources) then {
					if (((_x select 1) isKindOf "Tank")&&(typeOf player == _tankClassType)) then {
						if (((_x select 1) isKindOf "Air")&&(typeOf player == _airClassType)) then {
							if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea0 <= 1)) then {
								closeDialog 0;
								_spawnVehicle = createVehicle [(_x select 1),_spawn1,[], 0,"CAN_COLLIDE"];
								_spawnVehicle setDir _spawn_dir;
								clearMagazineCargoGlobal _spawnVehicle;
								clearWeaponCargoGlobal _spawnVehicle;
								sleep 0.5;
								player moveInDriver _spawnVehicle;
								west_base_resources = _base_resources - _resourceCost;
								playerCredits = playerCredits - _creditCost;
								_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: %2 Resource Cost: %1</t>", _base_resources, _credits];
								hintsilent "Vehicle purchase successful";	
							} else {
								if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea1 <= 1)) then {
									closeDialog 0;
									_spawnVehicle = createVehicle [(_x select 1),_spawn2,[], 0,"CAN_COLLIDE"];
									_spawnVehicle setDir _spawn_dir;
									clearMagazineCargoGlobal _spawnVehicle;
									clearWeaponCargoGlobal _spawnVehicle;
									sleep 0.5;
									player moveInDriver _spawnVehicle;
									switch (side player) do {
										case west: {
											west_base_resources = _base_resources - _resourceCost;
											publicVariable "west_base_resources";
										};
										case east: {
											east_base_resources = _base_resources - _resourceCost;
											publicVariable "east_base_resources";
										};
										case resistance: {
											guer_base_resources = _base_resources - _resourceCost;
											publicVariable "guer_base_resources";
										};
									};
									playerCredits = playerCredits - _creditCost;
									_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: %2 Resource Cost: %1</t>", _base_resources, _credits];
									hintsilent "Vehicle purchase successful";
								} else {
									if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea2 <= 1)) then {
										closeDialog 0;
										_spawnVehicle = createVehicle [(_x select 1),_spawn3,[], 0,"CAN_COLLIDE"];
										_spawnVehicle setDir _spawn_dir;
										clearMagazineCargoGlobal _spawnVehicle;
										clearWeaponCargoGlobal _spawnVehicle;
										sleep 0.5;
										player moveInDriver _spawnVehicle;
										switch (side player) do {
											case west: {
												west_base_resources = _base_resources - _resourceCost;
												publicVariable "west_base_resources";
											};
											case east: {
												east_base_resources = _base_resources - _resourceCost;
												publicVariable "east_base_resources";
											};
											case resistance: {
												guer_base_resources = _base_resources - _resourceCost;
												publicVariable "guer_base_resources";
											};
										};
										playerCredits = playerCredits - _creditCost;
										_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: %2 Resource Cost: %1</t>", _base_resources, _credits];
										hintsilent "Vehicle purchase successful";
									} else {
										if (((_x select 1) isKindOf "Air")&&(count _ObjectsInArea3 <= 2)) then {
											closeDialog 0;
											_spawnVehicle = createVehicle [(_x select 1),_spawn4,[], 0,"CAN_COLLIDE"];
											_spawnVehicle setDir _spawn_dir;
											clearMagazineCargoGlobal _spawnVehicle;
											clearWeaponCargoGlobal _spawnVehicle;
											sleep 0.5;
											player moveInDriver _spawnVehicle;
											switch (side player) do {
												case west: {
													west_base_resources = _base_resources - _resourceCost;
													publicVariable "west_base_resources";
												};
												case east: {
													east_base_resources = _base_resources - _resourceCost;
													publicVariable "east_base_resources";
												};
												case resistance: {
													guer_base_resources = _base_resources - _resourceCost;
													publicVariable "guer_base_resources";
												};
											};
											playerCredits = playerCredits - _creditCost;
											_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: %2 Resource Cost: %1</t>", _base_resources, _credits];
											hintsilent "Vehicle purchase successful";
										} else {
											if (((_x select 1) isKindOf "Air")&&(count _ObjectsInArea4 <= 2)) then {
												closeDialog 0;
												_spawnVehicle = createVehicle [(_x select 1),_spawn5,[], 0,"CAN_COLLIDE"];
												_spawnVehicle setDir _spawn_dir;
												clearMagazineCargoGlobal _spawnVehicle;
												clearWeaponCargoGlobal _spawnVehicle;
												sleep 0.5;
												player moveInDriver _spawnVehicle;
												switch (side player) do {
													case west: {
														west_base_resources = _base_resources - _resourceCost;
														publicVariable "west_base_resources";
													};
													case east: {
														east_base_resources = _base_resources - _resourceCost;
														publicVariable "east_base_resources";
													};
													case resistance: {
														guer_base_resources = _base_resources - _resourceCost;
														publicVariable "guer_base_resources";
													};
												};
												playerCredits = playerCredits - _creditCost;
												_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: %2 Resource Cost: %1</t>", _base_resources, _credits];
												hintsilent "Vehicle purchase successful";	
											} else {
												hint "There is another object or player blocking the spawn point!";
											};
										};			
									};
								};
							};
						} else {
							hint "You must be a pilot to purchase this vehicle.";
						};
					} else {
						hint "You must be a tank driver to purchase this vehicle.";
					};
				} else {
					hint "The base does not have enough Resources";
				};
			} else {
				hint "You do not have enough Credits";
			};
		} else {
			diag_log "!!!!!Vehicle text didn't meet any objects in the array. WTF?!!!!!";
		};
	}forEach allFactoryVehicles;
};