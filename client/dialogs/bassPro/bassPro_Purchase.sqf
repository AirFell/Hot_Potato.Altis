#include "bassPro_Defines.hpp";
disableSerialization;


_playerMoney = playerCredits;
_size = 0;
_price = 0;
_ObjectsInArea = [];


_Dialog = findDisplay FACTORYCONTROL;
_fundsText = _Dialog displayCtrl FUNDSTEXT;
_vehList = _Dialog displayCtrl VEHICLELIST;

_credits = playerCredits;
_resources = W_TWR1_Resources;





for [{_x=0},{_x<=_size},{_x=_x+1}] do
{
	_selectedItem = lbCurSel _vehList;
	_vehText = _vehList lbText _selectedItem;
	{if(_vehText == _x select 0) then{
		sleep 1;
		_resourceCost = _x select 2;
		_creditCost = _x select 3;
		if(_creditCost > _credits) exitWith {hintsilent "You do not have enough Credits"};
		if(_resourceCost > _resources) exitWith {hintsilent "You do not have enough Resources"};
		if(_resourceCost < 1) exitWith {hintsilent "You cant buy this silly."};
		_ObjectsInArea0 = [(getPos W_TWR1_Factory_Helipad) select 0, (getPos W_TWR1_Factory_Helipad) select 1] nearObjects 3;
		_ObjectsInArea1 = [(getPos W_TWR1_Factory_Spawn1) select 0, (getPos W_TWR1_Factory_Spawn1) select 1] nearObjects 3;
		_ObjectsInArea2 = [(getPos W_TWR1_Factory_Spawn2) select 0, (getPos W_TWR1_Factory_Spawn2) select 1] nearObjects 3;
		_ObjectsInArea3 = [(getPos W_TWR1_Factory_Spawn3) select 0, (getPos W_TWR1_Factory_Spawn3) select 1] nearObjects 3;
		_airClassType = "";
		_tankClassType = "";
		_playerSide = str(playerSide);
		if(_playerSide == "WEST") then {
		_airClassType = "B_Helipilot_F";
		_tankClassType = "B_crew_F";
		};
		if(_playerSide == "EAST") then {
		_airClassType = "O_Helipilot_F";
		_tankClassType = "O_crew_F";
		};
		if(_playerSide == "GUER") then {
		_airClassType = "I_Helipilot_F";
		_tankClassType = "I_crew_F";
		};
		if (((_x select 1) isKindOf "Tank")&&(typeOf player != _tankClassType)) exitWith {hint "You aren't the required class to operate this vehicle"};
		if (((_x select 1) isKindOf "Air")&&(typeOf player != _airClassType)) exitWith {hint "You aren't the required class to operate this vehicle"};
		if (((_x select 1) isKindOf "Air")&&(count _ObjectsInArea0 <= 1)) then {
				closeDialog 0;
				_spawnVehicle = createVehicle [(_x select 1),[getPos W_TWR1_Factory_Helipad select 0, getPos W_TWR1_Factory_Helipad select 1, 0],[], 0,"CAN_COLLIDE"];
				_spawnVehicle setDir (getDir W_TWR1_Factory_Helipad) + 90;
				clearMagazineCargoGlobal _spawnVehicle;
				clearWeaponCargoGlobal _spawnVehicle;
				sleep 0.5;
				player moveInDriver _spawnVehicle;
				W_TWR1_Resources = W_TWR1_Resources - _resourceCost;
				playerCredits = playerCredits - _creditCost;
				_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _resources, _credits];
				hintsilent "Vehicle purchase successful";	
		} else {
			if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea1 <= 1)) then {
				closeDialog 0;
				_spawnVehicle = createVehicle [(_x select 1),[getPos W_TWR1_Factory_Spawn1 select 0, getPos W_TWR1_Factory_Spawn1 select 1, 0],[], 0,"CAN_COLLIDE"];
				_spawnVehicle setDir (getDir W_TWR1_Factory_Spawn1) + 90;
				clearMagazineCargoGlobal _spawnVehicle;
				clearWeaponCargoGlobal _spawnVehicle;
				sleep 0.5;
				player moveInDriver _spawnVehicle;
				W_TWR1_Resources = W_TWR1_Resources - _resourceCost;
				playerCredits = playerCredits - _creditCost;
				_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _resources, _credits];
				hintsilent "Vehicle purchase successful";
			} else {
				if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea2 <= 1)) then {
					closeDialog 0;
					_spawnVehicle = createVehicle [(_x select 1),[getPos W_TWR1_Factory_Spawn2 select 0, getPos W_TWR1_Factory_Spawn2 select 1, 0],[], 0,"CAN_COLLIDE"];
					_spawnVehicle setDir (getDir W_TWR1_Factory_Spawn2) + 90;
					clearMagazineCargoGlobal _spawnVehicle;
					clearWeaponCargoGlobal _spawnVehicle;
					sleep 0.5;
					player moveInDriver _spawnVehicle;
					W_TWR1_Resources = W_TWR1_Resources - _resourceCost;
					playerCredits = playerCredits - _creditCost;
					_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _resources, _credits];
					hintsilent "Vehicle purchase successful";
				} else {
					if (((_x select 1) isKindOf "Land")&&(count _ObjectsInArea3 <= 1)) then {
						closeDialog 0;
						_spawnVehicle = createVehicle [(_x select 1),[getPos W_TWR1_Factory_Spawn3 select 0, getPos W_TWR1_Factory_Spawn3 select 1, 0],[], 0,"CAN_COLLIDE"];
						_spawnVehicle setDir (getDir W_TWR1_Factory_Spawn3) + 90;
						clearMagazineCargoGlobal _spawnVehicle;
						clearWeaponCargoGlobal _spawnVehicle;
						sleep 0.5;
						player moveInDriver _spawnVehicle;
						W_TWR1_Resources = W_TWR1_Resources - _resourceCost;
						playerCredits = playerCredits - _creditCost;
						_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _resources, _credits];
						hintsilent "Vehicle purchase successful";
					} else {
						hint "There is another object or player blocking the spawn point!";
					};
			
				};
			
			};
		};	
	}}forEach allFactoryVehicles;
	
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
		if(_resourceCost > _resources) exitWith {hintsilent "You do not have enough Resources"};
		if(_resourceCost < 1) exitWith {hintsilent "You cant buy this silly."};
		hintsilent "Vehicle purchase successful";
		closeDialog 0;
		W_TWR1_Resources = W_TWR1_Resources - _resourceCost;
		playerCredits = playerCredits - _creditCost;
		_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _resources, _credits];
		_ObjectsInArea1 = [(getPos W_TWR1_Factory_Spawn1) select 0, (getPos W_TWR1_Factory_Spawn1) select 1] nearObjects 2;
		_ObjectsInArea2 = [(getPos W_TWR1_Factory_Spawn2) select 0, (getPos W_TWR1_Factory_Spawn2) select 1] nearObjects 2;
		_ObjectsInArea3 = [(getPos W_TWR1_Factory_Spawn3) select 0, (getPos W_TWR1_Factory_Spawn3) select 1] nearObjects 2;
		sleep 1;
			if(count _ObjectsInArea1 > 0) then {
				if (count _ObjectsInArea2 > 0) then {
					if (count _ObjectsInArea3 > 0) then {
						hint "Please wait until spawn area is clear.";
					} else {
						_spawnVehicle = createVehicle [(_x select 1),[getPos W_TWR1_Factory_Spawn1 select 0, getPos W_TWR1_Factory_Spawn1 select 1, 0],[], 0,"CAN_COLLIDE"];
						_spawnVehicle setDir (getDir W_TWR1_Factory_Spawn1) + 90;
						clearMagazineCargoGlobal _spawnVehicle;
						clearWeaponCargoGlobal _spawnVehicle;
						sleep 0.5;
						player moveInDriver _spawnVehicle;					
					};
				} else {
					_spawnVehicle = createVehicle [(_x select 1),[getPos W_TWR1_Factory_Spawn1 select 0, getPos W_TWR1_Factory_Spawn1 select 1, 0],[], 0,"CAN_COLLIDE"];
					_spawnVehicle setDir (getDir W_TWR1_Factory_Spawn1) + 90;
					clearMagazineCargoGlobal _spawnVehicle;
					clearWeaponCargoGlobal _spawnVehicle;
					sleep 0.5;
					player moveInDriver _spawnVehicle;	
				};
			} else {
				_spawnVehicle = createVehicle [(_x select 1),[getPos W_TWR1_Factory_Spawn1 select 0, getPos W_TWR1_Factory_Spawn1 select 1, 0],[], 0,"CAN_COLLIDE"];
				_spawnVehicle setDir (getDir W_TWR1_Factory_Spawn1) + 90;
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