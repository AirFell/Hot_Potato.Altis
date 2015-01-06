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
_complete_purchase = {
	_success = false;
	
	_resource_price = (_this select 0)select 3;
	_price = (_this select 0) select 2;
	_name  = (_this select 0) select 1;
	
	if((_price < playerCredits)&&(_resource_price < _base_resources )) then {
				west_base_resources = _base_resources - _resource_price;
				playerCredits = playerCredits - _price;
		_success = true;
	};
	
	_success
};
 
/*
 * Spawns the given object in at the west_resc_depot_mrkr.
 * Usage: [ "Misc_Cargo1B_military" ] call _spawn_object;
 * Returns: Reference to the object
 */
_spawn_object = {
	_name = _this select 1;
 
				_spawn = createVehicle [(_x select 1),getPos west_fort_depot_mrkr,[], 0,"CAN_COLLIDE"];
				_spawn setDir (getDir west_fort_depot_mrkr) + 180;
					clearMagazineCargoGlobal _spawn;
					clearWeaponCargoGlobal _spawn;
	
	_spawn
};

	for [{_x=0},{_x<=_size},{_x=_x+1}] do
	{
		_selectedItem = lbCurSel _itemlist;
		_itemText = _itemlist lbText _selectedItem;
		{if(_itemText == _x select 0) then{
		sleep 1;
		_ObjectsInArea = [(getPos west_fort_depot_mrkr) select 0, (getPos west_fort_depot_mrkr) select 1] nearObjects 2;
	
		// Ignore bugs and feathers
		_ignore = [];
		{
			if ( _x isKindOf 'HoneyBee' || _x isKindOf 'DragonFly' || _x isKindOf 'HouseFly' || _x isKindOf 'FxWindPollen1' ) then {
			_ignore = _ignore + [ _x ];
		};
		
		} forEach _ObjectsInArea;
	
		_ObjectsInArea = _ObjectsInArea - _ignore;
		_ObjectsInArea = _ObjectsInArea + ( [(getPos west_fort_depot_mrkr) select 0, (getPos west_fort_depot_mrkr) select 1] nearObjects ['west_fort_depot_crate', 10] );
	

			_resourceCost = _x select 2;
			_creditCost = _x select 3;
			if(_creditCost > _credits) exitWith {hintsilent "You do not have enough Credits"};
			if(_resourceCost > _base_resources) exitWith {hintsilent "You do not have enough Resources"};
			if(count _ObjectsInArea <= 1) then {

	} else {
		_obj = nil;
		{
			if ( ! isNil { _x getVariable "R3F_LOG_objets_charges" } ) exitwith {
				_obj = _x;
			}
		} forEach _ObjectsInArea;
		
		if ( ! isNil { _obj getVariable "R3F_LOG_objets_charges" } ) then {
			if (1<2) then {
				if ( [ _x ] call _complete_purchase ) then {
					_purchase = [ _x select 2 ] call _spawn_object;
					
					_objets_charges = _obj getVariable "R3F_LOG_objets_charges";
					_objets_charges = _objets_charges + [_purchase];
					_obj setVariable ["R3F_LOG_objets_charges", _objets_charges, true];
					
					// Choisir une position dégagée (sphère de 50m de rayon) dans le ciel dans un cube de 9km^3
					private ["_nb_tirage_pos", "_position_attache"];
					_position_attache = [random 3000, random 3000, (10000 + (random 3000))];
					_nb_tirage_pos = 1;
					
					while {(!isNull (nearestObject _position_attache)) && (_nb_tirage_pos < 25)} do
					{
						_position_attache = [random 3000, random 3000, (10000 + (random 3000))];
						_nb_tirage_pos = _nb_tirage_pos + 1;
					};
					
					_purchase attachTo [R3F_LOG_PUBVAR_point_attache, _position_attache];
					
					_obj_name = getText (configFile >> "CfgVehicles" >> (typeOf _obj) >> "displayName");
					hintsilent format["Building bought - Check in %1", _obj_name];
			
		}}forEach allFortificationArrays;
	};

