/*
base addons with unique ID's:

Option 1:
Create a sqf that runs after the genaric create base sqf. This is side biased and deletes the old objects,
then re-builds them based off of the point of the new tower.

cons: slower, more sqf's to handle.
pros: easier to set up, easier to modify/access

Infostands (Resource Deposit Control, Vehicle Shop, Infantry Gear/Weapons, Fortification Store): "Land_InfoStand_V2_F"
vehicle spawn points-
	3 vehicle bays: "Land_Flush_Light_green_F"
	2 heli pads: "Land_Flush_Light_yellow_F"
resource deposit marker: "Land_JumpTarget_F"
*/

/*
pre-build copy-pasta
_objectName = createVehicle [type, position, [], 0, "CAN_COLLIDE"];

_objectName = createVehicle [type, _pos, [], 0, "CAN_COLLIDE"];
_objectName setPos [(_pos select 0) +/- _X, (_pos select 1) +/- _X,0];
						
_objectName setVehicleVarName "_objectName";
publicVariable "_objectName";
_objectName addEventHandler ["HandleDamage", {false}];
*/