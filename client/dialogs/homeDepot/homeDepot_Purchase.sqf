#include "homeDepot_Defines.hpp";
disableSerialization;

playerCredits = 1000;
_credits = playerCredits;

_playerSide = str(playerSide);
_size = 1;
_price = 0;
_ObjectsInArea = [];
_base_resources = "";

_dialog = findDisplay HOMEDEPOT;
_itemlist = _dialog displayCtrl VEHICLELIST;


hintsilent "Checking Purchase";
closeDialog 0;
if (_playerside == "WEST") then {
	_crate = west_fort_depot_crate;
};

	for [{_x=0},{_x<=_size},{_x=_x+1}] do
	{
		_selectedItem = lbCurSel _itemlist;
		_itemText = _itemlist lbText _selectedItem;
		{if(_itemText == _x select 0) then{
			sleep 1;

			_resourceCost = _x select 2;
			_creditCost = _x select 3;
			if(_creditCost > _credits) exitWith {hintsilent "You do not have enough Credits"};
			if(_resourceCost > _base_resources) exitWith {hintsilent "You do not have enough Resources"};
				nul = [west_fort_depot_crate, [(_x select 1)] ] execVM
				"R3F_LOG\USER_FUNCT\auto_load_in_vehicle.sqf";
				west_base_resources = _base_resources - _resourceCost;
				playerCredits = playerCredits - _creditCost;
				hintsilent "you bought your thing look to the left";
			
		}}forEach allFortificationArrays;
	};

