if(_playerSide == "WEST") then {
	_base_resources = west_base_resources;
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
				
				west_base_resources = _base_resources - _resourceCost;
				playerCredits = playerCredits - _creditCost;
				_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: %2 Resource Cost: %1</t>", _base_resources, _credits];
				hintsilent "you bought your thing look to the left";
			} else {
				hintsilent "There are too many objects on spawn point";
			};
		}}forEach allFortificationArrays;
	};
};