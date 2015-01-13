#include "bassPro_Defines.hpp";
disableSerialization;
	
	playerCredits = 10000;
	west_base_resources = 10000;
	east_base_resources = 10000;
	guer_base_resources = 10000;
	
	
	
_factoryDiag = createdialog "bassPro_Dialog";

_Dialog = findDisplay BASSPRO;
_fundsText = _Dialog displayCtrl FUNDSTEXT;
_button2 = _Dialog displayCtrl BUTTON2;
_button4 = _Dialog displayCtrl BUTTON4;
_button6 = _Dialog displayCtrl BUTTON6;
_button8 = _Dialog displayCtrl BUTTON8;


_resourceCost = 0;
_creditCost = 0;
_credits = playerCredits;
_base_resources = "";
		_playerSide = str(playerSide);
		if(_playerSide == "WEST") then {
			_base_resources = west_base_resources;
		};
		if(_playerSide == "EAST") then {
			_base_resources = east_base_resources;
		};
		if(_playerSide == "GUER") then {
			_base_resources = guer_base_resources;
		};

ctrlShow [VEHICLELIST, false];
ctrlShow [COSTTEXT, false];
ctrlShow [BUTTON1, false];
_button2 buttonSetAction "";
ctrlShow [BUTTON3, false];
_button4 buttonSetAction "";
ctrlShow [BUTTON5, false];
_button6 buttonSetAction "";
ctrlShow [BUTTON7, false];
_button8 buttonSetAction "";
ctrlShow [BUTTON9, false];


if (_base_resources < 1)then{
	_base_resources = 0;
};
if (playerCredits < 1)then{
	_credits = 0;
};

_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Credits: %2 Resources: %1</t>", _base_resources, _credits];




