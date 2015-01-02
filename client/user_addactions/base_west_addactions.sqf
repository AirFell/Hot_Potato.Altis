////////////////////////////////////////
////////////Resource Depot//////////////
////////////////////////////////////////
player addAction [
	"Resource Deposit", {
//Make a list of the barrels within the radius of the marker.
	_barrels = nearestObjects [getPos west_resc_depot_mrkr, ["Land_MetalBarrel_F"], 10];
			
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
	west_base_resources = west_base_resources + _addResources;
	publicVariable "west_base_resources";
				
//reset our local variables back to 0
	_payOut = 0;
	_addResources = 0;
	},
	nil, 1, True, True, "", "(player distance west_resc_depot_ctrl) < 3"
];
////////////////////////////////////////
////////////Infantry Store//////////////
////////////////////////////////////////
player addAction [
	"Weapon/Gear Store", {
		createVehicle ["Box_NATO_Wps_F", (getPos west_inf_depot_mrkr), [], 0, "NONE"];
	},
	nil, 1, True, True, "", "(player distance west_inf_shop) < 3"
];
////////////////////////////////////////
////////////Auto Zone///////////////
////////////////////////////////////////
player addAction [
	"Auto Zone", 
		"client\dialogs\autoZone\autoZone_Load.sqf", 
	nil, 1, True, True, "", "(player distance west_veh_shop) < 3"
];

////////////////////////////////////////
////////////Fortifications//////////////
////////////////////////////////////////
player addAction [
	"Home Depot", 
		"client\dialogs\homeDepot\homeDepot_Load.sqf", 
	nil, 1, True, True, "", "(player distance west_fort_shop) < 3"
];

////////////////////////////////////////
////////////Vehicle Repair//////////////
////////////////////////////////////////
/*
player addAction [
	"Repair and Rearm Vehicle", {
		_veh = (vehicle player);
		hint format ["Please wait %1 seconds for repair and rearm.",10];
		sleep 10;
		_veh setFuel 1;
		_veh setDamage 0;
		_veh setVehicleAmmo 1;
	}, 
	nil, 1, True, True, "", "driver vehicle == player && vehicle player != player"
];
*/
// ( && ((player distance west_veh_shop_spawn1) < 10 || (player distance west_veh_shop_spawn2) < 10 || (player distance west_veh_shop_spawn3) < 10 || (player distance west_veh_shop_spawn4) < 10 || (player distance west_veh_shop_spawn5) < 10)) < 3