#include "bassPro_Defines.hpp";
disableSerialization;


_playerCredits = playerCredits;
_size = 1;
_price = 0;
_playerSide = str(playerSide);
_credits = playerCredits;
_ObjectsInArea = [];
_base_resources = "";
_markerPos = "";

_Dialog = findDisplay BASSPRO;
_itemlist = _Dialog displayCtrl VEHICLELIST;
_purchase = _Dialog displayCtrl PURCHASEBUTTON;

switch(_this select 0) do 
{
	case 1: 
	{
	_price = 50;
	if(_playerCredits < _price) exitwith {hintSilent "You do not have enough Credits!"};
	playerCredits = _playerCredits - _price;
		_Uitems = uniformItems player;
		_Vitems = vestItems player;
		
		//remove the old uniform, add a new one.
		removeUniform player;
		removeVest player;
		removeHeadgear player;
		sleep 0.1;
		_nul = switch (side player) do {
//MEDIC
			case west: {
				player addUniform "U_B_CombatUniform_mcam_tshirt";
				player addVest "V_PlateCarrierSpec_rgr";
				player addHeadgear "H_HelmetB_light_desert";
			};
				
			case east: {
				player addUniform "U_O_CombatUniform_ocamo";
				player addVest "V_TacVest_khk";
				player addHeadgear "H_HelmetO_ocamo";
			};
		
			case resistance: {
				player addUniform "U_I_CombatUniform_shortsleeve";
				player addVest "V_PlateCarrierIA2_dgtl";
				player addHeadgear "H_HelmetIA";
			};
		};
		
		//put everything back.
		{
			player addItemToUniform _x;
		} foreach _Uitems;
		{
			player addItemToVest _x;
		} foreach _Vitems;
		_purchase buttonSetAction "";
	};
	case 2: 
	{
		_price = 50;
		if(_playerCredits < _price) exitwith {hintSilent "You do not have enough Credits!"};
		playerCredits = _playerCredits - _price;
		_Uitems = uniformItems player;
		_Vitems = vestItems player;
		
		//remove the old uniform, add a new one.
		removeUniform player;
		removeVest player;
		removeHeadgear player;
		sleep 0.1;
		_nul = switch (side player) do {
//ENGINEER
			case west: {
				player addUniform "U_B_CombatUniform_mcam_vest";
				player addVest "V_Chestrig_rgr";
				player addHeadgear "H_HelmetB_desert";//only engy wears this
			};
				
			case east: {
				player addUniform "U_O_CombatUniform_ocamo";
				player addVest "V_HarnessO_brn";//only engy wears this
				player addHeadgear "H_HelmetO_ocamo";
			};
			
			case resistance: {
				player addUniform "U_I_CombatUniform";
				player addVest "V_PlateCarrierIA1_dgtl";//only engy wears this
				player addHeadgear "H_HelmetIA";
			};
		};
		
		//put everything back.
		{
			player addItemToUniform _x;
		} foreach _Uitems;
		{
			player addItemToVest _x;
		} foreach _Vitems;
		_purchase buttonSetAction "";
		
	//addaction for engineer things.
	};
	
	case 3: 
	{
		_price = 150;
		if(_playerCredits < _price) exitwith {hintSilent "You do not have enough Credits!"};
		playerCredits = _playerCredits - _price;
		_Uitems = uniformItems player;
		_Vitems = vestItems player;
		
		//remove the old uniform, add a new one.
		removeUniform player;
		removeVest player;
		removeHeadgear player;
		sleep 0.1;
		_nul = switch (side player) do {
//PILOT
			case west: {
				player addUniform "U_B_HeliPilotCoveralls";
				player addVest "V_TacVest_blk";
				player addHeadgear "H_PilotHelmetHeli_B";
				player additem "NVGoggles";
			};
				
			case east: {
				player addUniform "U_O_PilotCoveralls";
				player addVest "V_TacVest_khk";
				player addHeadgear "H_PilotHelmetHeli_O";
				player additem "NVGoggles_OPFOR";
			};
			
			case resistance: {
				player addUniform "U_I_HeliPilotCoveralls";
				player addVest "V_TacVest_oli";
				player addHeadgear "H_PilotHelmetHeli_I";
				player additem "NVGoggles_INDEP";
			};
		};
		
		//put everything back.
		{
			player addItemToUniform _x;
		} foreach _Uitems;
		{
			player addItemToVest _x;
		} foreach _Vitems;
		_purchase buttonSetAction "";
	};
	case 4: 
	{
		_price = 150;
		if(_playerCredits < _price) exitwith {hintSilent "You do not have enough Credits!"};
		playerCredits = _playerCredits - _price;
		_Uitems = uniformItems player;
		_Vitems = vestItems player;
		
		//remove the old uniform, add a new one.
		removeUniform player;
		removeVest player;
		removeHeadgear player;
		sleep 0.1;
		_nul = switch (side player) do {
//TANK DRIVER
			case west: {
				player addUniform "U_B_CombatUniform_mcam_vest";
				player addVest "V_BandollierB_rgr";
				player addHeadgear "H_HelmetCrew_B";
			};
				
			case east: {
				player addUniform "U_O_SpecopsUniform_ocamo";
				player addVest "V_BandollierB_khk";
				player addHeadgear "H_HelmetCrew_O";
			};
			
			case resistance: {
				player addUniform "U_I_CombatUniform";
				player addVest "V_BandollierB_oli";
				player addHeadgear "H_HelmetCrew_I";
			};
		};
		
		//put everything back.
		{
			player addItemToUniform _x;
		} foreach _Uitems;
		{
			player addItemToVest _x;
		} foreach _Vitems;
		_purchase buttonSetAction "";
	};
	case 5: 
	{
		_price = 200;
		if(_playerCredits < _price) exitwith {hintSilent "You do not have enough Credits!"};
		playerCredits = _playerCredits - _price;
		_Uitems = uniformItems player;
		_Vitems = vestItems player;
		
		//remove the old uniform, add a new one.
		removeUniform player;
		removeVest player;
		removeHeadgear player;
		sleep 0.1;
		_nul = switch (side player) do {
//GHILLIE
			case west: {
				player addUniform "U_B_GhillieSuit";
				player addVest "V_Chestrig_rgr";
			};
				
			case east: {
				player addUniform "U_O_GhillieSuit";
				player addVest "V_Chestrig_khk";
			};
			
			case resistance: {
				player addUniform "U_I_GhillieSuit";
				player addVest "V_Chestrig_oli";
			};
		};
		
		//put everything back.
		{
			player addItemToUniform _x;
		} foreach _Uitems;
		{
			player addItemToVest _x;
		} foreach _Vitems;
		_purchase buttonSetAction "";
	};
	case 6: 
	{
		_price = 100;
		if(_playerCredits < _price) exitwith {hintSilent "You do not have enough Credits!"};
		playerCredits = _playerCredits - _price;
		_Uitems = uniformItems player;
		_Vitems = vestItems player;
		
		//remove the old uniform, add a new one.
		removeUniform player;
		removeVest player;
		removeHeadgear player;
		sleep 0.1;
		_nul = switch (side player) do {
//SPEC OPS
			case west: {
				player addUniform "U_B_CombatUniform_mcam_vest";
				player addVest "V_Chestrig_rgr";
				player addHeadgear "H_Watchcap_camo";
				player additem "NVGoggles";
			};
				
			case east: {
				player addUniform "U_O_CombatUniform_oucamo";
				player addVest "V_HarnessO_gry";
				player addHeadgear "H_HelmetO_oucamo";
				player additem "NVGoggles_OPFOR";
			};
			
			case resistance: {
				player addUniform "U_I_CombatUniform_shortsleeve";
				player addVest "V_Chestrig_oli";
				player addHeadgear "H_MilCap_dgtl";
				player additem "NVGoggles_INDEP";
			};
		};
		
		//put everything back.
		{
			player addItemToUniform _x;
		} foreach _Uitems;
		{
			player addItemToVest _x;
		} foreach _Vitems;
		_purchase buttonSetAction "";
	};
	case 7: 
	{
		_price = 100;
		if(_playerCredits < _price) exitwith {hintSilent "You do not have enough Credits!"};
		playerCredits = _playerCredits - _price;
		_Uitems = uniformItems player;
		_Vitems = vestItems player;
		
		//remove the old uniform, add a new one.
		removeUniform player;
		removeVest player;
		removeHeadgear player;
		sleep 0.1;
		_nul = switch (side player) do {
//OFFICER
			case west: {
				player addUniform "U_B_CombatUniform_mcam";
				player addVest "V_BandollierB_rgr";
				player addHeadgear "H_MilCap_mcamo";
			};
				
			case east: {
				player addUniform "U_O_OfficerUniform_ocamo";
				player addVest "V_BandollierB_khk";
				player addHeadgear "H_Beret_ocamo";
			};
			
			case resistance: {
				player addUniform "U_I_OfficerUniform";
				player addVest "V_BandollierB_oli";
				player addHeadgear "H_MilCap_dgtl";
			};
		};
		_purchase buttonSetAction "";
		
		//put everything back.
		{
			player addItemToUniform _x;
		} foreach _Uitems;
		{
			player addItemToVest _x;
		} foreach _Vitems;
	};
	case 8: 
	{
		_price = 125;
		if(_playerCredits < _price) exitwith {hintSilent "You do not have enough Credits!"};
		playerCredits = _playerCredits - _price;
		_Uitems = uniformItems player;
		_Vitems = vestItems player;
		
		//remove the old uniform, add a new one.
		removeUniform player;
		removeVest player;
		removeHeadgear player;
		sleep 0.1;
		_nul = switch (side player) do {
//SPECIAL 1
			case west: {
				player addUniform "U_BG_Guerilla2_1";
				player addVest "V_TacVest_blk";
				player addHeadgear "H_Bandanna_khk";
			};
				
			case east: {
				player addUniform "U_OG_Guerilla1_1";
				player addVest "V_Chestrig_oli";
				player addHeadgear "H_Shemag_olive";
			};
			
			case resistance: {
				player addUniform "U_IG_leader";
				player addVest "V_Chestrig_blk";
				player addHeadgear "H_Watchcap_blk";
			};
		};
		
		//put everything back.
		{
			player addItemToUniform _x;
		} foreach _Uitems;
		{
			player addItemToVest _x;
		} foreach _Vitems;
		_purchase buttonSetAction "";
	};
	case 9: 
	{
		_price = 125;
		if(_playerCredits < _price) exitwith {hintSilent "You do not have enough Credits!"};
		playerCredits = _playerCredits - _price;
		_Uitems = uniformItems player;
		_Vitems = vestItems player;
		
		//remove the old uniform, add a new one.
		removeUniform player;
		removeVest player;
		removeHeadgear player;
		sleep 0.1;
		_nul = switch (side player) do {
//SPECIAL 2
			case west: {
				player addUniform "U_BG_Guerilla2_3";
				player addVest "V_TacVest_blk";
				player addHeadgear "H_Booniehat_khk_hs";
			};
				
			case east: {
				player addUniform "U_OG_Guerilla1_1";
				player addVest "V_BandollierB_blk";
				player addHeadgear "H_Cap_oli";
			};
			
			case resistance: {
				player addUniform "U_IG_Guerilla3_1";
				player addVest "V_BandollierB_khk";
				player addHeadgear "H_Shemag_olive";
			};
		};
		
		//put everything back.
		{
			player addItemToUniform _x;
		} foreach _Uitems;
		{
			player addItemToVest _x;
		} foreach _Vitems;
		_purchase buttonSetAction "";
	};
	case 10: 
	{
		hintsilent "Checking Purchase";
		closeDialog 0;
		if(_playerSide == "WEST") then { 
			_base_resources = west_base_resources;
			_markerPos = west_inf_depot_mrkr;
		};
		if(_playerSide == "EAST") then { 
			_base_resources = east_base_resources;
			_markerPos = east_inf_depot_mrkr;
		};
		if(_playerSide == "GUER") then { 
			_base_resources = guer_base_resources;
			_markerPos = guer_inf_depot_mrkr;
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
			}}forEach allCrateArrays;
		};
	};
	closeDialog 0;
};


