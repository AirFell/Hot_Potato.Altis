/*SHK_pos Script by Shuko, edited for use by AirFell

having issues with this script, needs to turn "mil_dot" into "empty" but the script fails when named "empty"

Note::: respawn markers _blank-3 are reserved for bases/barracks ONLY.

Server/Client build may vary from this. This script should be somewhere in the realm of ifsever, then client should find variable
via global/public or a direct call. Not sure exactly how it works, need to read stuff.

Next TODO: Make arrays add each marker to them to be called from the respawn(Interem spawnSystem\onTrig2.sqf) script. Then: Write respawn script, build dialog.
*/


//////////////////////////////////////////////////////
//////////////West Respawn Function/Loop//////////////
//////////////////////////////////////////////////////
_markerLoopCounterWest = 4;
westRespawnArray = [];

fnc_createMarkerWest = {
  private ["_pos","_m"];
  _pos = _this select 0;
  _m = createMarker [format["marker_west%1", _markerLoopCounterWest],_pos];
  _m setmarkerColor (_this select 1);
  _m setMarkerShape "Icon";
  _m setMarkerType "empty";
  //format["%1", _m] setMarkerText format["west%1", _markerLoopCounterWest];
};

for "_i" from 0 to 50 do {
	_p = ["mrkBlue",0,[], 100] call SHK_pos;
	[_p,"ColorBlack"] call fnc_createMarkerWest;
	westRespawnArray = westRespawnArray + [format["marker_west%1", _markerLoopCounterWest]];
	_markerLoopCounterWest = _markerLoopCounterWest + 1;
};

publicVariable "westRespawnArray";

//////////////////////////////////////////////////////
//////////////East Respawn Function/Loop//////////////
//////////////////////////////////////////////////////
_markerLoopCounterEast = 4;
eastRespawnArray = [];

fnc_createMarkerEast = {
  private ["_pos","_m"];
  _pos = _this select 0;
  _m = createMarker [format["marker_east%1", _markerLoopCounterEast],_pos];
  _m setmarkerColor (_this select 1);
  _m setMarkerShape "Icon";
  _m setMarkerType "empty";
  //format["%1", _m] setMarkerText format["east%1", _markerLoopCounterEast];
};

for "_i" from 0 to 50 do {
    _p = ["mrkRed",0,[], 100] call SHK_pos;
    [_p,"ColorBlack"] call fnc_createMarkerEast;
	eastRespawnArray = eastRespawnArray + [format["marker_east%1", _markerLoopCounterEast]];
	_markerLoopCounterEast = _markerLoopCounterEast + 1;
	};

publicVariable "EastRespawnArray";

//////////////////////////////////////////////////////
//////////////Guer Respawn Function/Loop//////////////
//////////////////////////////////////////////////////
_markerLoopCounterGuer = 4;
guerRespawnArray = [];

fnc_createMarkerGuer = {
  private ["_pos","_m"];
  _pos = _this select 0;
  _m = createMarker [format["marker_guerrila%1", _markerLoopCounterGuer],_pos];
  _m setmarkerColor (_this select 1);
  _m setMarkerShape "Icon";
  _m setMarkerType "empty";
  //format["%1", _m] setMarkerText format["Indep%1", _markerLoopCounterGuer];
};

for "_i" from 0 to 50 do {
    _p = ["mrkGreen",0,[], 100] call SHK_pos;
    [_p,"ColorBlack"] call fnc_createMarkerGuer;
	guerRespawnArray = guerRespawnArray + [format["marker_guerrila%1", _markerLoopCounterGuer]];
	_markerLoopCounterGuer = _markerLoopCounterGuer + 1;
};

publicVariable "GuerRespawnArray";

//////////////////////////////////////////////////////
//////////////Mission Mark Function/Loop//////////////
//////////////////////////////////////////////////////
_markerLoopCounterMission = 1;
MissionMarkerArray = [];

fnc_createMarkerMission = {
  private ["_pos","_m"];
  _pos = _this select 0;
  _m = createMarker [format["marker_Mission%1", _markerLoopCounterMission],_pos];
  _m setmarkerColor (_this select 1);
  _m setMarkerShape "Icon";
  _m setMarkerType "empty";
  //format["%1", _m] setMarkerText format["Mission%1", _markerLoopCounterMission];
};

for "_i" from 0 to 50 do {
    _p = ["mrkMission",0,["no_mission","mrkBlue","mrkRed","mrkGreen"], 100] call SHK_pos;
    [_p,"ColorBlack"] call fnc_createMarkerMission;
	MissionMarkerArray = MissionMarkerArray + [format["marker_Mission%1", _markerLoopCounterMission]];
	_markerLoopCounterMission = _markerLoopCounterMission + 1;
};