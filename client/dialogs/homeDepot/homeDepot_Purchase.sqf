#include "homeDepot_Defines.hpp";
disableSerialization;

_playerSide = str(playerSide);
_credits = playerCredits;
_size = 1;
_price = 0;
_ObjectsInArea = [];
_base_resources = "";
_markerPos = "";
_dialog = findDisplay HOMEDEPOT;
_itemlist = _dialog displayCtrl VEHICLELIST;


hintsilent "Checking Purchase";
closeDialog 0;
if(_playerSide == "WEST") then { 
_base_resources = west_base_resources;
_markerPos = west_fort_depot_mrkr;
};
if(_playerSide == "EAST") then { 
_base_resources = east_base_resources;
_markerPos = east_fort_depot_mrkr;
};
if(_playerSide == "GUER") then { 
_base_resources = guer_base_resources;
_markerPos = guer_fort_depot_mrkr;
};

//Buy

	for [{_x=0},{_x<=_size},{_x=_x+1}] do
	{
		_selectedItem = lbCurSel _itemlist;
		_itemText = _itemlist lbText _selectedItem;
		{if(_itemText == _x select 0) then{
			sleep 1;
			_ObjectsInArea = [(getPos _markerPos) select 0, (getPos _markerPos) select 1] nearObjects 2;
			if(count _ObjectsInArea <= 20) then {
			_resourceCost = _x select 2;
			_creditCost = _x select 3;
			if(_creditCost > _credits) exitWith {hintsilent "You do not have enough Credits"};
			if(_resourceCost > _base_resources) exitWith {hintsilent "You do not have enough Resources"};
				_spawn = createVehicle [(_x select 1),getPos _markerPos,[], 0,"CAN_COLLIDE"];
				_spawn setDir (getDir _markerPos) + 180;
					clearMagazineCargoGlobal _spawn;
					clearWeaponCargoGlobal _spawn;
				playerCredits = playerCredits - _creditCost;
				if(_playerSide == "WEST") then { 
				west_base_resources = west_base_resources - _resourceCost;
				};
				if(_playerSide == "EAST") then { 
				east_base_resources = east_base_resources - _resourceCost;
				};
				if(_playerSide == "GUER") then { 
				guer_base_resources = guer_base_resources - _resourceCost;
				};
				hintsilent "you bought your thing look to the left";
			} else {
				hintsilent "There are too many objects on spawn point";
			};
		}}forEach allFortificationArrays;
	};

