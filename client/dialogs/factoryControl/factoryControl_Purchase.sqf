#include "factoryControl_Defines.hpp";
disableSerialization;


_playerMoney = playerCredits;
_size = 0;
_price = 0;
_ObjectsInArea = [];


_Dialog = findDisplay FACTORYCONTROL;
_fundsText = _Dialog displayCtrl FUNDSTEXT;
_vehList = _Dialog displayCtrl VEHICLELIST;

_credits = playerCredits;
_base_resources = "";
_airClassType = "";
_tankClassType = "";
_playerSide = str(playerSide);

if(_playerSide == "WEST") then {
	_airClassType = "B_Helipilot_F";
	_tankClassType = "B_crew_F";
	_base_resources = west_base_resources;
	for [{_x=0},{_x<=_size},{_x=_x+1}] do
	{
		_selectedItem = lbCurSel _vehList;
		_vehText = _vehList lbText _selectedItem;
		{if(_vehText == _x select 0) then{
			sleep 1;
			_resourceCost = _x select 2;
			_creditCost = _x select 3;
			if(_creditCost > _credits) exitWith {hintsilent "You do not have enough Credits"};
			if(_resourceCost > _base_resources) exitWith {hintsilent "You do not have enough Resources"};
			if(_resourceCost < 1) exitWith {hintsilent "You cant buy this silly."};
			_ObjectsInArea0 = [(getPos west_veh_shop_spawn1) select 0, (getPos west_veh_shop_spawn1) select 1] nearObjects 3;
			_ObjectsInArea1 = [(getPos west_veh_shop_spawn2) select 0, (getPos west_veh_shop_spawn2) select 1] nearObjects 3;
			_ObjectsInArea2 = [(getPos west_veh_shop_spawn3) select 0, (getPos west_veh_shop_spawn3) select 1] nearObjects 3;
			_ObjectsInArea3 = [(getPos west_veh_shop_spawn4) select 0, (getPos west_veh_shop_spawn4) select 1] nearObjects 3;
			_ObjectsInArea4 = [(getPos west_veh_shop_spawn5) select 0, (getPos west_veh_shop_spawn5) select 1] nearObjects 3;
			
			if (((_x select 1) isKindOf "Tank")&&(typeOf player != _tankClassType)) exitWith {hint "You aren't the required class to operate this vehicle"};
			if (((_x select 1) isKindOf "Air")&&(typeOf player != _airClassType)) exitWith {hint "You aren't the required class to operate this vehicle"};
			
			if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea0 <= 1)) then {
				closeDialog 0;
				_spawnVehicle = createVehicle [(_x select 1),[getPos west_veh_shop_spawn1 select 0, getPos west_veh_shop_spawn1 select 1, 0],[], 0,"CAN_COLLIDE"];
				_spawnVehicle setDir (getDir west_veh_shop_spawn1) + 90;
				clearMagazineCargoGlobal _spawnVehicle;
				clearWeaponCargoGlobal _spawnVehicle;
				sleep 0.5;
				player moveInDriver _spawnVehicle;
				west_base_resources = _base_resources - _resourceCost;
				playerCredits = playerCredits - _creditCost;
				_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
				hintsilent "Vehicle purchase successful";	
			} else {
				if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea1 <= 1)) then {
					closeDialog 0;
					_spawnVehicle = createVehicle [(_x select 1),[getPos west_veh_shop_spawn2 select 0, getPos west_veh_shop_spawn2 select 1, 0],[], 0,"CAN_COLLIDE"];
					_spawnVehicle setDir (getDir west_veh_shop_spawn2) + 90;
					clearMagazineCargoGlobal _spawnVehicle;
					clearWeaponCargoGlobal _spawnVehicle;
					sleep 0.5;
					player moveInDriver _spawnVehicle;
					west_base_resources = _base_resources - _resourceCost;
					playerCredits = playerCredits - _creditCost;
					_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
					hintsilent "Vehicle purchase successful";
				} else {
					if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea2 <= 1)) then {
						closeDialog 0;
						_spawnVehicle = createVehicle [(_x select 1),[getPos west_veh_shop_spawn3 select 0, getPos west_veh_shop_spawn3 select 1, 0],[], 0,"CAN_COLLIDE"];
						_spawnVehicle setDir (getDir west_veh_shop_spawn3) + 90;
						clearMagazineCargoGlobal _spawnVehicle;
						clearWeaponCargoGlobal _spawnVehicle;
						sleep 0.5;
						player moveInDriver _spawnVehicle;
						west_base_resources = _base_resources - _resourceCost;
						playerCredits = playerCredits - _creditCost;
						_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
						hintsilent "Vehicle purchase successful";
					} else {
						if (((_x select 1) isKindOf "Air")&&(count _ObjectsInArea3 <= 2)) then {
							closeDialog 0;
							_spawnVehicle = createVehicle [(_x select 1),[getPos west_veh_shop_spawn4 select 0, getPos west_veh_shop_spawn4 select 1, 0],[], 0,"CAN_COLLIDE"];
							_spawnVehicle setDir (getDir west_veh_shop_spawn4) + 90;
							clearMagazineCargoGlobal _spawnVehicle;
							clearWeaponCargoGlobal _spawnVehicle;
							sleep 0.5;
							player moveInDriver _spawnVehicle;
							west_base_resources = _base_resources - _resourceCost;
							playerCredits = playerCredits - _creditCost;
							_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
							hintsilent "Vehicle purchase successful";
						} else {
							if (((_x select 1) isKindOf "Air")&&(count _ObjectsInArea4 <= 2)) then {
								closeDialog 0;
								_spawnVehicle = createVehicle [(_x select 1),[getPos west_veh_shop_spawn5 select 0, getPos west_veh_shop_spawn5 select 1, 0],[], 0,"CAN_COLLIDE"];
								_spawnVehicle setDir (getDir west_veh_shop_spawn5) + 90;
								clearMagazineCargoGlobal _spawnVehicle;
								clearWeaponCargoGlobal _spawnVehicle;
								sleep 0.5;
								player moveInDriver _spawnVehicle;
								west_base_resources = _base_resources - _resourceCost;
								playerCredits = playerCredits - _creditCost;
								_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
								hintsilent "Vehicle purchase successful";	
							} else {
								hint "There is another object or player blocking the spawn point!";
							};
						};
				
					};
				
				};
			};	
		}}forEach allFactoryVehicles;
	};
};
if(_playerSide == "EAST") then {
	_airClassType = "O_Helipilot_F";
	_tankClassType = "O_crew_F";
	_base_resources = east_base_resources;
	for [{_x=0},{_x<=_size},{_x=_x+1}] do
	{
		_selectedItem = lbCurSel _vehList;
		_vehText = _vehList lbText _selectedItem;
		{if(_vehText == _x select 0) then{
			sleep 1;
			_resourceCost = _x select 2;
			_creditCost = _x select 3;
			if(_creditCost > _credits) exitWith {hintsilent "You do not have enough Credits"};
			if(_resourceCost > _base_resources) exitWith {hintsilent "You do not have enough Resources"};
			if(_resourceCost < 1) exitWith {hintsilent "You cant buy this silly."};
			_ObjectsInArea0 = [(getPos east_veh_shop_spawn1) select 0, (getPos east_veh_shop_spawn1) select 1] nearObjects 3;
			_ObjectsInArea1 = [(getPos east_veh_shop_spawn2) select 0, (getPos east_veh_shop_spawn2) select 1] nearObjects 3;
			_ObjectsInArea2 = [(getPos east_veh_shop_spawn3) select 0, (getPos east_veh_shop_spawn3) select 1] nearObjects 3;
			_ObjectsInArea3 = [(getPos east_veh_shop_spawn4) select 0, (getPos east_veh_shop_spawn4) select 1] nearObjects 3;
			_ObjectsInArea4 = [(getPos east_veh_shop_spawn5) select 0, (getPos east_veh_shop_spawn5) select 1] nearObjects 3;
			if (((_x select 1) isKindOf "Tank")&&(typeOf player != _tankClassType)) exitWith {hint "You aren't the required class to operate this vehicle"};
			if (((_x select 1) isKindOf "Air")&&(typeOf player != _airClassType)) exitWith {hint "You aren't the required class to operate this vehicle"};
			
			if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea0 <= 1)) then {
				closeDialog 0;
				_spawnVehicle = createVehicle [(_x select 1),[getPos east_veh_shop_spawn1 select 0, getPos east_veh_shop_spawn1 select 1, 0],[], 0,"CAN_COLLIDE"];
				_spawnVehicle setDir (getDir east_veh_shop_spawn1) + 90;
				clearMagazineCargoGlobal _spawnVehicle;
				clearWeaponCargoGlobal _spawnVehicle;
				sleep 0.5;
				player moveInDriver _spawnVehicle;
				east_base_resources = _base_resources - _resourceCost;
				playerCredits = playerCredits - _creditCost;
				_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
				hintsilent "Vehicle purchase successful";	
			} else {
				if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea1 <= 1)) then {
					closeDialog 0;
					_spawnVehicle = createVehicle [(_x select 1),[getPos east_veh_shop_spawn2 select 0, getPos east_veh_shop_spawn2 select 1, 0],[], 0,"CAN_COLLIDE"];
					_spawnVehicle setDir (getDir east_veh_shop_spawn2) + 90;
					clearMagazineCargoGlobal _spawnVehicle;
					clearWeaponCargoGlobal _spawnVehicle;
					sleep 0.5;
					player moveInDriver _spawnVehicle;
					east_base_resources = _base_resources - _resourceCost;
					playerCredits = playerCredits - _creditCost;
					_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
					hintsilent "Vehicle purchase successful";
				} else {
					if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea2 <= 1)) then {
						closeDialog 0;
						_spawnVehicle = createVehicle [(_x select 1),[getPos east_veh_shop_spawn3 select 0, getPos east_veh_shop_spawn3 select 1, 0],[], 0,"CAN_COLLIDE"];
						_spawnVehicle setDir (getDir east_veh_shop_spawn3) + 90;
						clearMagazineCargoGlobal _spawnVehicle;
						clearWeaponCargoGlobal _spawnVehicle;
						sleep 0.5;
						player moveInDriver _spawnVehicle;
						east_base_resources = _base_resources - _resourceCost;
						playerCredits = playerCredits - _creditCost;
						_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
						hintsilent "Vehicle purchase successful";
					} else {
						if (((_x select 1) isKindOf "Air")&&(count _ObjectsInArea3 <= 2)) then {
							closeDialog 0;
							_spawnVehicle = createVehicle [(_x select 1),[getPos east_veh_shop_spawn4 select 0, getPos east_veh_shop_spawn4 select 1, 0],[], 0,"CAN_COLLIDE"];
							_spawnVehicle setDir (getDir east_veh_shop_spawn4) + 90;
							clearMagazineCargoGlobal _spawnVehicle;
							clearWeaponCargoGlobal _spawnVehicle;
							sleep 0.5;
							player moveInDriver _spawnVehicle;
							east_base_resources = _base_resources - _resourceCost;
							playerCredits = playerCredits - _creditCost;
							_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
							hintsilent "Vehicle purchase successful";
						} else {
							if (((_x select 1) isKindOf "Air")&&(count _ObjectsInArea4 <= 2)) then {
								closeDialog 0;
								_spawnVehicle = createVehicle [(_x select 1),[getPos east_veh_shop_spawn5 select 0, getPos east_veh_shop_spawn5 select 1, 0],[], 0,"CAN_COLLIDE"];
								_spawnVehicle setDir (getDir east_veh_shop_spawn5) + 90;
								clearMagazineCargoGlobal _spawnVehicle;
								clearWeaponCargoGlobal _spawnVehicle;
								sleep 0.5;
								player moveInDriver _spawnVehicle;
								east_base_resources = _base_resources - _resourceCost;
								playerCredits = playerCredits - _creditCost;
								_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
								hintsilent "Vehicle purchase successful";	
							} else {
								hint "There is another object or player blocking the spawn point!";
							};
						};
				
					};
				
				};
			};	
		}}forEach allFactoryVehicles;
		
	};
};
if(_playerSide == "GUER") then {
	_airClassType = "O_Helipilot_F";
	_tankClassType = "O_crew_F";
	_base_resources = guer_base_resources;
	for [{_x=0},{_x<=_size},{_x=_x+1}] do
	{
		_selectedItem = lbCurSel _vehList;
		_vehText = _vehList lbText _selectedItem;
		{if(_vehText == _x select 0) then{
			sleep 1;
			_resourceCost = _x select 2;
			_creditCost = _x select 3;
			if(_creditCost > _credits) exitWith {hintsilent "You do not have enough Credits"};
			if(_resourceCost > _base_resources) exitWith {hintsilent "You do not have enough Resources"};
			if(_resourceCost < 1) exitWith {hintsilent "You cant buy this silly."};
			_ObjectsInArea0 = [(getPos guer_veh_shop_spawn1) select 0, (getPos guer_veh_shop_spawn1) select 1] nearObjects 3;
			_ObjectsInArea1 = [(getPos guer_veh_shop_spawn2) select 0, (getPos guer_veh_shop_spawn2) select 1] nearObjects 3;
			_ObjectsInArea2 = [(getPos guer_veh_shop_spawn3) select 0, (getPos guer_veh_shop_spawn3) select 1] nearObjects 3;
			_ObjectsInArea3 = [(getPos guer_veh_shop_spawn4) select 0, (getPos guer_veh_shop_spawn4) select 1] nearObjects 3;
			_ObjectsInArea4 = [(getPos guer_veh_shop_spawn5) select 0, (getPos guer_veh_shop_spawn5) select 1] nearObjects 3;
			if (((_x select 1) isKindOf "Tank")&&(typeOf player != _tankClassType)) exitWith {hint "You aren't the required class to operate this vehicle"};
			if (((_x select 1) isKindOf "Air")&&(typeOf player != _airClassType)) exitWith {hint "You aren't the required class to operate this vehicle"};
			
			if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea0 <= 1)) then {
				closeDialog 0;
				_spawnVehicle = createVehicle [(_x select 1),[getPos guer_veh_shop_spawn1 select 0, getPos guer_veh_shop_spawn1 select 1, 0],[], 0,"CAN_COLLIDE"];
				_spawnVehicle setDir (getDir guer_veh_shop_spawn1) + 90;
				clearMagazineCargoGlobal _spawnVehicle;
				clearWeaponCargoGlobal _spawnVehicle;
				sleep 0.5;
				player moveInDriver _spawnVehicle;
				guer_base_resources = _base_resources - _resourceCost;
				playerCredits = playerCredits - _creditCost;
				_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
				hintsilent "Vehicle purchase successful";	
			} else {
				if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea1 <= 1)) then {
					closeDialog 0;
					_spawnVehicle = createVehicle [(_x select 1),[getPos guer_veh_shop_spawn2 select 0, getPos guer_veh_shop_spawn2 select 1, 0],[], 0,"CAN_COLLIDE"];
					_spawnVehicle setDir (getDir guer_veh_shop_spawn2) + 90;
					clearMagazineCargoGlobal _spawnVehicle;
					clearWeaponCargoGlobal _spawnVehicle;
					sleep 0.5;
					player moveInDriver _spawnVehicle;
					guer_base_resources = _base_resources - _resourceCost;
					playerCredits = playerCredits - _creditCost;
					_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
					hintsilent "Vehicle purchase successful";
				} else {
					if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea2 <= 1)) then {
						closeDialog 0;
						_spawnVehicle = createVehicle [(_x select 1),[getPos guer_veh_shop_spawn3 select 0, getPos guer_veh_shop_spawn3 select 1, 0],[], 0,"CAN_COLLIDE"];
						_spawnVehicle setDir (getDir guer_veh_shop_spawn3) + 90;
						clearMagazineCargoGlobal _spawnVehicle;
						clearWeaponCargoGlobal _spawnVehicle;
						sleep 0.5;
						player moveInDriver _spawnVehicle;
						guer_base_resources = _base_resources - _resourceCost;
						playerCredits = playerCredits - _creditCost;
						_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
						hintsilent "Vehicle purchase successful";
					} else {
						if (((_x select 1) isKindOf "Air")&&(count _ObjectsInArea3 <= 2)) then {
							closeDialog 0;
							_spawnVehicle = createVehicle [(_x select 1),[getPos guer_veh_shop_spawn4 select 0, getPos guer_veh_shop_spawn4 select 1, 0],[], 0,"CAN_COLLIDE"];
							_spawnVehicle setDir (getDir guer_veh_shop_spawn4) + 90;
							clearMagazineCargoGlobal _spawnVehicle;
							clearWeaponCargoGlobal _spawnVehicle;
							sleep 0.5;
							player moveInDriver _spawnVehicle;
							guer_base_resources = _base_resources - _resourceCost;
							playerCredits = playerCredits - _creditCost;
							_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
							hintsilent "Vehicle purchase successful";
						} else {
							if (((_x select 1) isKindOf "Air")&&(count _ObjectsInArea4 <= 2)) then {
								closeDialog 0;
								_spawnVehicle = createVehicle [(_x select 1),[getPos guer_veh_shop_spawn5 select 0, getPos guer_veh_shop_spawn5 select 1, 0],[], 0,"CAN_COLLIDE"];
								_spawnVehicle setDir (getDir guer_veh_shop_spawn5) + 90;
								clearMagazineCargoGlobal _spawnVehicle;
								clearWeaponCargoGlobal _spawnVehicle;
								sleep 0.5;
								player moveInDriver _spawnVehicle;
								guer_base_resources = _base_resources - _resourceCost;
								playerCredits = playerCredits - _creditCost;
								_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
								hintsilent "Vehicle purchase successful";	
							} else {
								hint "There is another object or player blocking the spawn point!";
							};
						};
				
					};
				
				};
			};	
		}}forEach allFactoryVehicles;
		
	};
};
/*
for [{_x=0},{_x<=_size},{_x=_x+1}] do
{
	_selectedItem = lbCurSel _vehList;
	_vehText = _vehList lbText _selectedItem;
	{if(_vehText == _x select 0) then{
		_resourceCost = _x select 2;
		_creditCost = _x select 3;
		if(_creditCost > _credits) exitWith {hintsilent "You do not have enough Credits"};
		if(_resourceCost > _base_resources) exitWith {hintsilent "You do not have enough Resources"};
		if(_resourceCost < 1) exitWith {hintsilent "You cant buy this silly."};
		hintsilent "Vehicle purchase successful";
		closeDialog 0;
		_base_resources = _base_resources - _resourceCost;
		playerCredits = playerCredits - _creditCost;
		_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _base_resources, _credits];
		_ObjectsInArea1 = [(getPos west_veh_shop_spawn1) select 0, (getPos west_veh_shop_spawn1) select 1] nearObjects 2;
		_ObjectsInArea2 = [(getPos west_veh_shop_spawn2) select 0, (getPos west_veh_shop_spawn2) select 1] nearObjects 2;
		_ObjectsInArea3 = [(getPos west_veh_shop_spawn3) select 0, (getPos west_veh_shop_spawn3) select 1] nearObjects 2;
		sleep 1;
			if(count _ObjectsInArea1 > 0) then {
				if (count _ObjectsInArea2 > 0) then {
					if (count _ObjectsInArea3 > 0) then {
						hint "Please wait until spawn area is clear.";
					} else {
						_spawnVehicle = createVehicle [(_x select 1),[getPos west_veh_shop_spawn1 select 0, getPos west_veh_shop_spawn1 select 1, 0],[], 0,"CAN_COLLIDE"];
						_spawnVehicle setDir (getDir west_veh_shop_spawn1) + 90;
						clearMagazineCargoGlobal _spawnVehicle;
						clearWeaponCargoGlobal _spawnVehicle;
						sleep 0.5;
						player moveInDriver _spawnVehicle;					
					};
				} else {
					_spawnVehicle = createVehicle [(_x select 1),[getPos west_veh_shop_spawn1 select 0, getPos west_veh_shop_spawn1 select 1, 0],[], 0,"CAN_COLLIDE"];
					_spawnVehicle setDir (getDir west_veh_shop_spawn1) + 90;
					clearMagazineCargoGlobal _spawnVehicle;
					clearWeaponCargoGlobal _spawnVehicle;
					sleep 0.5;
					player moveInDriver _spawnVehicle;	
				};
			} else {
				_spawnVehicle = createVehicle [(_x select 1),[getPos west_veh_shop_spawn1 select 0, getPos west_veh_shop_spawn1 select 1, 0],[], 0,"CAN_COLLIDE"];
				_spawnVehicle setDir (getDir west_veh_shop_spawn1) + 90;
				clearMagazineCargoGlobal _spawnVehicle;
				clearWeaponCargoGlobal _spawnVehicle;
				sleep 0.5;
				player moveInDriver _spawnVehicle;
			};
	} else {
		hint "There is another object or player blocking the spawn point!";
	};
	}}forEach allFactoryVehicles;

};*/