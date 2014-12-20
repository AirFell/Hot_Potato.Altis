#include "factoryControl_Defines.hpp";
disableSerialization;

playerCredits = 350; 
W_TWR1_Resources = 350;

_factoryDiag = createdialog "factoryControl_Dialog";

_Dialog = findDisplay FACTORYCONTROL;
_fundsText = _Dialog displayCtrl FUNDSTEXT;
_progress1 = _Dialog displayCtrl PROGRESS1;
_progress2 = _Dialog displayCtrl PROGRESS2;
_progress3 = _Dialog displayCtrl PROGRESS3;
_progress4 = _Dialog displayCtrl PROGRESS4;
_cost = _Dialog displayCtrl COSTTEXT;

_resourceCost = 0;
_creditCost = 0;
_credits = playerCredits;
_resources = W_TWR1_Resources;

_progress1 ctrlSetBackgroundColor [.729, .513, .176, 1];
_progress1 ctrlSetStructuredText parseText format["<t size='0.6'>Built</t>"];
_progress2 ctrlSetBackgroundColor [.729, .513, .176, 1];
_progress2 ctrlSetStructuredText parseText format["<t size='0.6'>Tier 1</t>"];
_progress3 ctrlSetBackgroundColor [.729, .513, .176, 1];
_progress3 ctrlSetStructuredText parseText format["<t size='0.6'>Tier 2</t>"];
_progress4 ctrlSetBackgroundColor [.729, .513, .176, 1];
_progress4 ctrlSetStructuredText parseText format["<t size='0.6'>Tier 3</t>"];

if (W_TWR1_Resources < 1)then{
	_resources = 0;
};
if (playerCredits < 1)then{
	_credits = 0;
};

_fundsText ctrlSetStructuredText parseText format["<t size='0.75'>Resources: %1 Credits: %2</t>", _resources, _credits];
_cost ctrlSetStructuredText parseText format["<t size='0.75'>Resource Cost: %1 Credit Cost: %2</t>", _resourceCost, _creditCost];



