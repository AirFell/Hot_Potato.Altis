//vehRespawn by Iceman77, Modified by Airfell
//SHK Random Position Generator by Shuko, Modified by Airfell
//"Where's Barry?!?" script by Axek, edited for use in this mission by AirFell
//[R3F] Logistics 3.0 by R3F Projects

enableSaving [false, false];

execVM "R3F_LOG\init.sqf";

if (isDedicated) then {
///////////////////////////////////////////////////////////////
///////////////////////Server-side stuff///////////////////////
///////////////////////////////////////////////////////////////
	diag_log "The server is Running!";
	
	call compile preprocessFile"server\SHK_pos\shk_pos_init.sqf";
	
	Marker_Load_Complete = 0;
	publicVariable "Marker_Load_Complete";
	
	_nul = []execVM "server\GlobalVars.sqf";

	diag_log "The server got through all its init files!";
	
//	_nul = []execVM "server\missions\mission_init.sqf";
} else {

///////////////////////////////////////////////////////////////
///////////////////////Client-side stuff///////////////////////
///////////////////////////////////////////////////////////////

	diag_log "client entering loading loop.";
	_loading = 0;
	while {_loading == 0} do {
		diag_log "loading loop started, or looping.";
		if (Server_Load_Complete == 1) then {
			diag_log "loading loop hit";
			_loading = 1;
		} else {
			_loading = 0;
		};
		sleep 1;
	};
	waitUntil {_loading == 1};
	
	diag_log "The client is running!";
		
	diag_log "Finding random spawn position.";

	_RandomPosW = westRespawnArray select floor random count westRespawnArray;
	"respawn_west" setMarkerPosLocal getMarkerPos _RandomPosW;

	_RandomPosE = EastRespawnArray select floor random count EastRespawnArray;
	"respawn_east" setMarkerPosLocal getMarkerPos _RandomPosE;

	_RandomPosG = GuerRespawnArray select floor random count GuerRespawnArray;
	"respawn_guerrila" setMarkerPosLocal getMarkerPos _RandomPosG;
	
	_nul = []execVM "client\kill_credits.sqf";
	_nul = []execVM "client\player_markers.sqf";
	_nul = []execVM "client\taginit.sqf";
	_nul = []execVM "client\hud\playerHud.sqf";
	_nul = []execVM "client\client_mission_end.sqf";
	_nul = []execVM "client\sideSwitch.sqf";

	forceRespawn player;
	
	playerCredits = 0;


	"mrkBlue" setMarkerAlpha 0;
	"mrkRed" setMarkerAlpha 0;
	"mrkGreen" setMarkerAlpha 0;
	"mrknoBlue" setMarkerAlpha 0;
	"mrknoRed" setMarkerAlpha 0;
	"mrknoGreen" setMarkerAlpha 0;
//	"mrkMission" setMarkerAlpha 0;
//	"no_Mission" setMarkerAlpha 0;
	"respawn_bomb" setMarkerAlpha 0;

//	call compile preprocessFileLineNumbers "client\baseConfig.sqf";


	
	diag_log "The client got through all its init files!";
};