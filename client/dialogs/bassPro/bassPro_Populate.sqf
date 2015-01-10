/*******
Sanguine
*******/

#include "bassPro_Defines.hpp";
disableSerialization;

//Grab control of display elements
_Dialog = findDisplay BASSPRO;
_button1 = _Dialog displayCtrl BUTTON1;
_button2 = _Dialog displayCtrl BUTTON2;
_button3 = _Dialog displayCtrl BUTTON3;
_button4 = _Dialog displayCtrl BUTTON4;
_button5 = _Dialog displayCtrl BUTTON5;
_button6 = _Dialog displayCtrl BUTTON6;
_button7 = _Dialog displayCtrl BUTTON7;
_button8 = _Dialog displayCtrl BUTTON8;
_button9 = _Dialog displayCtrl BUTTON9;
_picture = _Dialog displayCtrl MAINPICTURE;
_costText = _Dialog displayCtrl COSTTEXT;






switch(_this select 0) do 
{
	case 9: 
	{	
		ctrlShow [VEHICLELIST, false];
		ctrlShow [MAINPICTURE, true];
		_picture ctrlSetText "client\icons\classMenu_Main.paa";
		ctrlShow [BUTTON1, true];
		_button1 ctrlSetText "Medic";
		_button1 buttonSetAction "[11] execVM 'client\dialogs\bassPro\bassPro_Populate.sqf'";
		ctrlShow [BUTTON2, true];
		_button2 ctrlSetText "Engineer";
		_button2 buttonSetAction "[12] execVM 'client\dialogs\bassPro\bassPro_Populate.sqf'";
		ctrlShow [BUTTON3, true];
		_button3 ctrlSetText "Pilot";
		_button3 buttonSetAction "[13] execVM 'client\dialogs\bassPro\bassPro_Populate.sqf'";
		ctrlShow [BUTTON4, true];
		_button4 ctrlSetText "TankOPS";
		_button4 buttonSetAction "[14] execVM 'client\dialogs\bassPro\bassPro_Populate.sqf'";
		ctrlShow [BUTTON5, true];
		_button5 ctrlSetText "Sniper";
		_button5 buttonSetAction "[15] execVM 'client\dialogs\bassPro\bassPro_Populate.sqf'";
		ctrlShow [BUTTON6, true];
		_button6 ctrlSetText "Recon";
		_button6 buttonSetAction "[16] execVM 'client\dialogs\bassPro\bassPro_Populate.sqf'";
		ctrlShow [BUTTON7, true];
		_button7 ctrlSetText "Officer";
		_button7 buttonSetAction "[16] execVM 'client\dialogs\bassPro\bassPro_Populate.sqf'";
		ctrlShow [BUTTON8, true];
		_button8 ctrlSetText "PMC 1";
		_button8 buttonSetAction "[17] execVM 'client\dialogs\bassPro\bassPro_Populate.sqf'";
		ctrlShow [BUTTON9, true];
		_button9 ctrlSetText "PMC 2";
		_button9 buttonSetAction "[18] execVM 'client\dialogs\bassPro\bassPro_Populate.sqf'";
		
	};
	case 10: 
	{
		//_build buttonSetAction "[""BaseCTRL"", ""FactBuild""]execVM ""client\dialogs\W_TWR1_dialog_functions.sqf""";
		//_upgrade buttonSetAction "[""BaseCTRL"", ""FactUpgrade""]execVM ""client\dialogs\W_TWR1_dialog_functions.sqf""";
		//_depotDescription ctrlSetStructuredText parseText "<t size='1'>This is where the factory description bullshit goes!</t>";
		ctrlShow [MAINPICTURE, false];
		ctrlShow [VEHICLELIST, true];
		ctrlShow [PURCHASEBUTTON, false];
		ctrlShow [BUTTON1, false];
		_button2 ctrlSetText "";
		_button2 buttonSetAction "";
		ctrlShow [BUTTON3, false];
		_button4 ctrlSetText "";
		_button4 buttonSetAction "";
		ctrlShow [BUTTON5, false];
		_button6 ctrlSetText "";
		_button6 buttonSetAction "";
		ctrlShow [BUTTON7, false];
		_button8 ctrlSetText "";
		_button8 buttonSetAction "";
		ctrlShow [BUTTON9, false];
	};
	case 11: 
	{
		_picture ctrlSetText "client\icons\classMenu_Recon.paa";
		ctrlShow [PURCHASEBUTTON, true];
		ctrlShow [COSTTEXT, true];
		_costText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: 125 Resource Cost:125</t>"];
	};
	case 12: 
	{
		_picture ctrlSetText "client\icons\classMenu_Recon.paa";
		ctrlShow [PURCHASEBUTTON, true];
		ctrlShow [COSTTEXT, true];
		_costText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: 150 Resource Cost:150</t>"];
	};	
	case 13: 
	{
		_picture ctrlSetText "client\icons\classMenu_Recon.paa";
		ctrlShow [PURCHASEBUTTON, true];
		ctrlShow [COSTTEXT, true];
		_costText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: 150 Resource Cost:150</t>"];
	};
	case 14: 
	{
		_picture ctrlSetText "client\icons\classMenu_Recon.paa";
		ctrlShow [PURCHASEBUTTON, true];
		ctrlShow [COSTTEXT, true];
		_costText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: 150 Resource Cost:125</t>"];
	};
	case 15: 
	{
		_picture ctrlSetText "client\icons\classMenu_Recon.paa";
		ctrlShow [PURCHASEBUTTON, true];
		ctrlShow [COSTTEXT, true];
		_costText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: 175 Resource Cost:150</t>"];
	};
	case 16: 
	{
		_picture ctrlSetText "client\icons\classMenu_Recon.paa";
		ctrlShow [PURCHASEBUTTON, true];
		ctrlShow [COSTTEXT, true];
		_costText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: 150 Resource Cost:175</t>"];
	};
	case 17: 
	{
		_picture ctrlSetText "client\icons\classMenu_Recon.paa";
		ctrlShow [PURCHASEBUTTON, true];
		ctrlShow [COSTTEXT, true];
		_costText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: 200 Resource Cost:150</t>"];
	};
	case 18: 
	{
		_picture ctrlSetText "client\icons\classMenu_Recon.paa";
		ctrlShow [PURCHASEBUTTON, true];
		ctrlShow [COSTTEXT, true];
		_costText ctrlSetStructuredText parseText format["<t size='0.75'>Credit Cost: 125 Resource Cost:150</t>"];
	};
};
/*
#include "bassPro_Defines.hpp";
disableSerialization;
private ["_switch", "_dialog", "_vehlisttext", "_vehlist", "_vehArray", "_vehClass", "_vehPicture", "_vehlistIndex"];
_switch = _this select 0;

// Grab access to the controls
_dialog = findDisplay BASSPRO;
//_vehlisttext = _dialog displayCtrl vehshop_veh_TEXT;
_vehlist = _dialog displayCtrl VEHICLELIST;


lbClear _vehlist;
_vehlist lbSetCurSel -1;

_vehArray = switch (_switch) do 
{
	case 0: { call lightArray_Tier1 +call lightArray_Tier2 +call lightArray_Tier3 };
	case 1: { call heavyArray_Tier2 +call heavyArray_Tier3};
	case 2: { call airArray_Tier1 +call airArray_Tier2 +call airArray_Tier3};
	case 3: { hint "Im not implemented cause im lazy!"};
	default { [] };
};


// Populate the vehicle shop list
{
	_vehClass = _x select 1;
	
	if (1<2) then
	{
		_vehCfg = configFile >> "CfgVehicles" >> _vehClass;
		
		if (2>1) then
		{
			_vehPicture = getText (configFile >> "CfgVehicles" >> _vehClass >> "picture");
			_vehlistIndex = _vehlist lbAdd format ["%1", _x select 0];
			_vehlist lbSetPicture [_vehlistIndex, _vehPicture];
			_vehlist lbSetData [_vehlistIndex, _vehClass];
		};
	};
} forEach _vehArray;
*/