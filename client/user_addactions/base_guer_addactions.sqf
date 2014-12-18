////////////////////////////////////////
////////////Resource Depot//////////////
////////////////////////////////////////
player addAction [
	"Resource Deposit", {
		hint "You have accessed this control";
	},
	nil, 1, True, True, "", "(player distance guer_resc_depot_ctrl) < 3"
];
////////////////////////////////////////
////////////Infantry Store//////////////
////////////////////////////////////////
player addAction [
	"Weapon/Gear Store", {
		hint "You have accessed this control";
	},
	nil, 1, True, True, "", "(player distance guer_inf_shop) < 3"
];
////////////////////////////////////////
////////////Vehicle Store///////////////
////////////////////////////////////////
player addAction [
	"Vehicle Store", {
		hint "You have accessed this control";
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