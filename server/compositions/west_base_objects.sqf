/*
Object ID's:

Controls for addactions:
west_veh_shop
west_inf_shop
west_fort_shop
west_resc_depot_ctrl

Resource Deposit Area:
west_resc_depot_mrkr

Spawn Points:
ground vehicle:
west_veh_shop_spawn1
west_veh_shop_spawn2
west_veh_shop_spawn3
helicopter:
west_veh_shop_spawn4
west_veh_shop_spawn5
*/

/*
pre-build copy-pasta

_pos = getPos _x;
_objectName = createVehicle [type, _pos, [], 0, "CAN_COLLIDE"];
_objectName setPos [(_pos select 0) +/- _X, (_pos select 1) +/- _X,0];
_objectName setDir 0;
						
_objectName setVehicleVarName "_objectName";
publicVariable "_objectName";
_objectName addEventHandler ["HandleDamage", {false}];
*/

_pos = getPos west_base;
_mkr_pos = [(_pos select 0) - 30, (_pos select 1) - 30, 2.5];

//In-Base Respawn marker
respawn_west2 = createMarker["respawn_west2", _mkr_pos];

//Vehicle Shop
west_veh_shop = createVehicle ["Land_InfoStand_V2_F", _pos, [], 0, "CAN_COLLIDE"];
west_veh_shop setPos [(_pos select 0) + 30, (_pos select 1) + 10, 0];
west_veh_shop setDir 90;
						
west_veh_shop setVehicleVarName "west_veh_shop";
publicVariable "west_veh_shop";
west_veh_shop addEventHandler ["HandleDamage", {false}];

//Vehicle Spawns: Ground

//spawn1
west_veh_shop_spawn1 = createVehicle ["Land_Flush_Light_green_F", _pos, [], 0, "CAN_COLLIDE"];
west_veh_shop_spawn1 setPos [(_pos select 0) + 35, (_pos select 1) + 20, 0];
						
west_veh_shop_spawn1 setVehicleVarName "west_veh_shop_spawn1";
publicVariable "west_veh_shop_spawn1";
west_veh_shop_spawn1 addEventHandler ["HandleDamage", {false}];

//spawn2
west_veh_shop_spawn2 = createVehicle ["Land_Flush_Light_green_F", _pos, [], 0, "CAN_COLLIDE"];
west_veh_shop_spawn2 setPos [(_pos select 0) + 35, (_pos select 1) + 27.5, 0];
						
west_veh_shop_spawn2 setVehicleVarName "west_veh_shop_spawn2";
publicVariable "west_veh_shop_spawn2";
west_veh_shop_spawn2 addEventHandler ["HandleDamage", {false}];

//spawn3
west_veh_shop_spawn3 = createVehicle ["Land_Flush_Light_green_F", _pos, [], 0, "CAN_COLLIDE"];
west_veh_shop_spawn3 setPos [(_pos select 0) + 35, (_pos select 1) + 35.5, 0];
						
west_veh_shop_spawn3 setVehicleVarName "west_veh_shop_spawn3";
publicVariable "west_veh_shop_spawn3";
west_veh_shop_spawn3 addEventHandler ["HandleDamage", {false}];

//Vehicle Spawns: Helis

//spawn4
west_veh_shop_spawn4 = createVehicle ["Land_Flush_Light_yellow_F", _pos, [], 0, "CAN_COLLIDE"];
west_veh_shop_spawn4 setPos [(_pos select 0) + 30, (_pos select 1) - 8, 0];
						
west_veh_shop_spawn4 setVehicleVarName "west_veh_shop_spawn4";
publicVariable "west_veh_shop_spawn4";
west_veh_shop_spawn4 addEventHandler ["HandleDamage", {false}];

//spawn5
west_veh_shop_spawn5 = createVehicle ["Land_Flush_Light_yellow_F", _pos, [], 0, "CAN_COLLIDE"];
west_veh_shop_spawn5 setPos [(_pos select 0) + 30, (_pos select 1) - 30, 0];
						
west_veh_shop_spawn5 setVehicleVarName "west_veh_shop_spawn5";
publicVariable "west_veh_shop_spawn5";
west_veh_shop_spawn5 addEventHandler ["HandleDamage", {false}];

//Infantry Shop
west_inf_shop = createVehicle ["Land_InfoStand_V2_F", _pos, [], 0, "CAN_COLLIDE"];
west_inf_shop setPos [(_pos select 0) - 23, (_pos select 1) - 22, 0];
west_inf_shop setDir -90;
						
west_inf_shop setVehicleVarName "west_inf_shop";
publicVariable "west_inf_shop";
west_inf_shop addEventHandler ["HandleDamage", {false}];

//Fortification Store
west_fort_shop = createVehicle ["Land_InfoStand_V2_F", _pos, [], 0, "CAN_COLLIDE"];
west_fort_shop setPos [(_pos select 0) - 8, (_pos select 1) + 3.5, 0];
west_fort_shop setDir 90;
						
west_fort_shop setVehicleVarName "west_fort_shop";
publicVariable "west_fort_shop";
west_fort_shop addEventHandler ["HandleDamage", {false}];

//Resource Deposit Control
west_resc_depot_ctrl = createVehicle ["Land_InfoStand_V2_F", _pos, [], 0, "CAN_COLLIDE"];
west_resc_depot_ctrl setPos [(_pos select 0) - 28, (_pos select 1) + 27, 0];
west_resc_depot_ctrl setDir 0;
						
west_resc_depot_ctrl setVehicleVarName "west_resc_depot_ctrl";
publicVariable "west_resc_depot_ctrl";
west_resc_depot_ctrl addEventHandler ["HandleDamage", {false}];

//Resource Deposit Point
west_resc_depot_mrkr = createVehicle ["Land_JumpTarget_F", _pos, [], 0, "CAN_COLLIDE"];
west_resc_depot_mrkr setPos [(_pos select 0) - 23, (_pos select 1) + 32, 0];
west_resc_depot_mrkr setDir 0;
						
west_resc_depot_mrkr setVehicleVarName "west_resc_depot_mrkr";
publicVariable "west_resc_depot_mrkr";
west_resc_depot_mrkr addEventHandler ["HandleDamage", {false}];