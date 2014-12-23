/*********************************************************#
# @@ScriptName: baseConfig.sqf
# @@Author: Sanguine
# @@Create Date: 2013-09-16 20:40:58
#*********************************************************/

// This tracks which bases infostand the player is interacting with
//currentBase = "";

// Array Parameters
// Text name, classname, Resource cost, Credit Cost



/*
//default array layout
nameofArray = compileFinal str
[
    ["", "", 25,25],
	["", "", 25,25],
	["", "", 25,25],
	["", "", 25,25]
];
*/

//VEHICLE ARRAYS
vehicleArray_Light = compileFinal str
[
	["//--------------Light Vehicles---------------//", "", 0,0],
    ["Quadbike","B_Quadbike_01_F", 25,25],
	["Offroad Armed","B_G_Offroad_01_armed_F", 50,50],
	["Ifrit","O_MRAP_02_F", 75,75],
	["Strider","I_MRAP_03_F", 100,100],
	["Hunter","B_MRAP_01_F", 125,125],
	["Hunter HMG","B_MRAP_01_hmg_F", 150,150],
	["Ifrit HMG","O_MRAP_02_hmg_F", 175,175],
	["Strider HMG","I_MRAP_03_hmg_F", 200,200],
	["Hunter GMG","B_MRAP_01_gmg_F", 225,225],
	["Ifrit GMG","O_MRAP_02_gmg_F", 250,250],
	["Strider GMG","I_MRAP_03_gmg_F", 275,275]
];
vehicleArray_Heavy = compileFinal str
[
	["//---------------Heavy Vehicles--------------//", "", 0,0],
    ["AMV-7 Marshall","B_APC_Wheeled_01_cannon_F", 50,50],
	["AFV-4 Gorgon","I_APC_Wheeled_03_cannon_F", 75,75],
	["MSE-3 Marid","O_APC_Wheeled_02_rcws_F", 100,100],
    ["M2A4 Slammer UP","B_MBT_01_TUSK_F", 125,125],
	["IFV-6a Cheetah","B_APC_Tracked_01_AA_F", 150,150],
	["BTR-K Kamysh","O_APC_Tracked_02_cannon_F", 175,175],
	["FV-720 Mora","I_APC_tracked_03_cannon_F", 200,200],
	["MBT-52 Kuma","I_MBT_03_cannon_F", 225,225]
];
vehicleArray_Air = compileFinal str
[
	["//---------------Air Vehicles--------------//", "", 0,0],
    ["MH-9 Hummingbird","B_Heli_Light_01_F", 25,25],
	["Po-30 Orca Unarmed","O_Heli_Light_02_unarmed_F", 50,50],
	["CH-49 Mohawk","I_Heli_Transport_02_F", 75,75],
	["WY-55 Hellcat Unarmed","I_Heli_light_03_unarmed_F", 100,100],
	["AH-9 Pawnee","B_Heli_Light_01_armed_F", 125,125],
	["UH-80 Ghost Hawk","B_Heli_Transport_01_camo_F", 150,150],
	["Po-30 Orca","O_Heli_Light_02_F", 175,175],
	["WY-55 Hellcat","I_Heli_light_03_F", 200,200],
	["AH-99 Blackfoot","B_Heli_Attack_01_F", 225,225],
	["A-164 Wipeout","B_Plane_CAS_01_F", 250,250],
	["Mi-48 Kajman","O_Heli_Attack_02_F", 275,275],
	["To-199 Neophron","O_Plane_CAS_02_F", 300,300],
	["A-143 Buzzard (CAS)","I_Plane_Fighter_03_CAS_F", 325,325],
	["A-143 Buzzard (AA)","I_Plane_Fighter_03_AA_F", 350,350]
];

allFactoryVehicles = (call vehicleArray_Light + call vehicleArray_Heavy + call vehicleArray_Air);

//---------------Cratesss------------------//

crateArray_Basic = compileFinal str
[
    ["//---Basic Weapons---//", "", 0,0],
	["Nato", "Box_NATO_Wps_F", 25,25],
	["East", "Box_East_Wps_F", 25,25],
	["Independent", "Box_IND_Wps_F", 25,25]
];
crateArray_Special = compileFinal str
[
	["//---Special Weapons---//", "", 0,0],
    ["Nato", "Box_NATO_WpsSpecial_F", 25,25],
	["East", "Box_East_WpsSpecial_F", 25,25],
	["Independent", "Box_IND_WpsSpecial_F", 25,25]
];
crateArray_Supplies = compileFinal str
[
    ["//---Supplies---//", "", 0,0],
	["Supplies A", "B_supplyCrate_F", 25,25],
	["Supplies B", "O_supplyCrate_F", 25,25],
	["Supplies C", "I_supplyCrate_F", 25,25]
];
crateArray_Support = compileFinal str
[
    ["//---Support---//", "", 0,0],
	["Support A", "Box_NATO_Support_F", 25,25],
	["Support B", "Box_East_Support_F", 25,25],
	["Support C", "Box_IND_Support_F", 25,25]
];
crateArray_Explosives = compileFinal str
[
    ["//---Explosives---//", "", 0,0],
	["Explosives A", "Box_NATO_AmmoOrd_F", 25,25],
	["Explosives B", "Box_East_AmmoOrd_F", 25,25],
	["Explosives C", "Box_IND_AmmoOrd_F", 25,25]
];
crateArray_Ammo = compileFinal str
[
    ["//---Ammo---//", "", 0,0],
	["Ammo A", "Box_NATO_Ammo_F", 25,25],
	["Ammo B", "Box_East_Ammo_F", 25,25],
	["Ammo C", "Box_IND_Ammo_F", 25,25]
];

allCrateArrays = (call crateArray_Basic + call crateArray_Explosives + call crateArray_Special + call crateArray_Supplies + call crateArray_Support);

//--------------------Fortifications----------------------//

fortificationArray = compileFinal str
[
    ["//---Base Fortifications---//", "", 25,25],
	["HBarrier 1", "Land_HBarrier_1_F", 25,25],
	["HBarrier 3", "Land_HBarrier_3_F", 25,25],
	["HBarrier 5", "Land_HBarrier_5_F", 25,25],
	["HBarrier Big", "Land_HBarrierBig_F", 25,25],
	["HBarrier Tower", "Land_HBarrierTower_F", 25,25],
	["HBarrier Wall-Corner", "HBarrierWall_corner_F", 25,25],
	["HBarrier Corridor", "Land_HBarrierWall_corridor_F", 25,25],
	["HBarrier Wall 4", "Land_HBarrierWall4_F", 25,25],
	["HBarrier wall 6", "Land_HBarrierWall6_F", 25,25],
	["BagFence Short", "Land_BagFence_Short_F", 25,25],
	["BagFence Round", "Land_BagFence_Round_F", 25,25],
	["BagFence Long", "Land_BagFence_Long_F", 25,25],
	["BagFence Corner", "Land_BagFence_Corner_F", 25,25],
	["BagBunker Small", "Land_BagBunker_Small_F", 25,25],
	["BagBunker Large", "Land_BagBunker_Large_F", 25,25]
];

