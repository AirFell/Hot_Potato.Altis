#include "homeDepot_Defines.hpp";
disableSerialization;

playerCredits = 1000;
_credits = playerCredits;

_playerSide = str(playerSide);
_size = 1;
_price = 0;
_ObjectsInArea = [];

_dialog = findDisplay HOMEDEPOT;
_itemlist = _dialog displayCtrl VEHICLELIST;


hintsilent "Checking Purchase";
closeDialog 0;

//Buy
if(_playerSide == "WEST") then {
	for [{_x=0},{_x<=_size},{_x=_x+1}] do
	{
		_selectedItem = lbCurSel _itemlist;
		_itemText = _itemlist lbText _selectedItem;
		{if(_itemText == _x select 0) then{
			sleep 1;
			_ObjectsInArea = [(getPos west_resc_depot_mrkr) select 0, (getPos west_resc_depot_mrkr) select 1] nearObjects 2;
			if(count _ObjectsInArea <= 20) then {
				_price = _x select 2;
				if(_price > (playerCredits)) exitWith {hintsilent "You do not have enough money"};
				_spawn = createVehicle [(_x select 1),getPos west_resc_depot_mrkr,[], 0,"CAN_COLLIDE"];
				_spawn setDir (getDir west_resc_depot_mrkr) + 180;
					clearMagazineCargoGlobal _spawn;
					clearWeaponCargoGlobal _spawn;
				
				west_base_resources = west_base_resources - _resourceCost;
				playerCredits = playerCredits - _creditCost;
				hintsilent "you bought your thing look to the left";
			} else {
				hintsilent "There are too many objects on spawn point";
			};
		}}forEach allFortificationArrays;
	};
};
if(_playerSide == "EAST") then {
	for [{_x=0},{_x<=_size},{_x=_x+1}] do
	{
		_selectedItem = lbCurSel _itemlist;
		_itemText = _itemlist lbText _selectedItem;
		{if(_itemText == _x select 0) then{
			sleep 1;
			_ObjectsInArea = [(getPos east_resc_depot_mrkr) select 0, (getPos east_resc_depot_mrkr) select 1] nearObjects 2;
			if(count _ObjectsInArea <= 20) then {
				_price = _x select 2;
				if(_price > (playerCredits)) exitWith {hintsilent "You do not have enough money"};
				_spawn = createVehicle [(_x select 1),getPos east_resc_depot_mrkr,[], 0,"CAN_COLLIDE"];
				_spawn setDir (getDir east_resc_depot_mrkr) + 180;
					clearMagazineCargoGlobal _spawn;
					clearWeaponCargoGlobal _spawn;				
				east_base_resources = east_base_resources - _resourceCost;
				playerCredits = playerCredits - _creditCost;
				hintsilent "you bought your thing look to the left";
			} else {
				hintsilent "There are too many objects on spawn point";
			};
		}}forEach allFortificationArrays;
	};
};
if(_playerSide == "GUER") then {
	for [{_x=0},{_x<=_size},{_x=_x+1}] do
	{
		_selectedItem = lbCurSel _itemlist;
		_itemText = _itemlist lbText _selectedItem;
		{if(_itemText == _x select 0) then{
			sleep 1;
			_ObjectsInArea = [(getPos guer_resc_depot_mrkr) select 0, (getPos guer_resc_depot_mrkr) select 1] nearObjects 2;
			if(count _ObjectsInArea <= 20) then {
				_price = _x select 2;
				if(_price > (playerCredits)) exitWith {hintsilent "You do not have enough money"};
				_spawn = createVehicle [(_x select 1),getPos guer_resc_depot_mrkr,[], 0,"CAN_COLLIDE"];
				_spawn setDir (getDir guer_resc_depot_mrkr) + 180;
					clearMagazineCargoGlobal _spawn;
					clearWeaponCargoGlobal _spawn;				
				guer_base_resources = guer_base_resources - _resourceCost;
				playerCredits = playerCredits - _creditCost;
				hintsilent "you bought your thing look to the left";
			} else {
				hintsilent "There are too many objects on spawn point";
			};
		}}forEach allFortificationArrays;
	};
};