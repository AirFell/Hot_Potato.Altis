////////////////////////////////////////
////////////Resource Depot//////////////
////////////////////////////////////////
player addAction [
	"Resource Deposit", {
//Make a list of the barrels within the radius of the marker.
	_barrels = nearestObjects [getPos guer_resc_depot_mrkr, ["Land_MetalBarrel_F"], 10];
			
	_payOut = count _barrels * 100;
	_addResources = count _barrels * 100;
//run a loop that goes through each barrel and deletes it.
	if (count _barrels > 0) then {
		{
			deleteVehicle _x;
		} forEach _barrels;
		hint format ["You have been awarded %1 credits. The base has received %2 resources.", _payout, _addResources];
	} else {
		hint "No barrels Found.";
	};
//add our credits and resources to the pool, then put it back in its scope
	playerCredits = playerCredits + _payOut;
	guer_base_resources = guer_base_resources + _addResources;
	publicVariable "guer_base_resources";
				
//reset our local variables back to 0
	_payOut = 0;
	_addResources = 0;
	},
	nil, 1, True, True, "", "(player distance guer_resc_depot_ctrl) < 3"
];
////////////////////////////////////////
////////////Vehicle Store///////////////
////////////////////////////////////////
player addAction [
	"Vehicle Store", {
		createVehicle ["Box_IND_Wps_F", [((getPos player select 0) - 2),((getPos player select 1) - 2), 0], [], 0, "NONE"];
	},
	nil, 1, True, True, "", "(player distance guer_veh_shop) < 3"
];
////////////////////////////////////////
////////////Fortifications//////////////
////////////////////////////////////////
player addAction [
	"Fortification Store", {
		hint "You have accessed this control";
	},
	nil, 1, True, True, "", "(player distance guer_fort_shop) < 3"
];