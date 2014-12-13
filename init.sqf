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
	_nul = []execVM "server\GlobalVars.sqf";
	/*
	_nul = []execVM "server\Base_Spawn.sqf";
	_nul = []execVM "server\randomMarkerGen.sqf";
	_nul = []execVM "server\Bomb_Spawn.sqf";
	_nul = []execVM "server\Bomb_Marker.sqf";
	_nul = []execVM "server\BombRespawn.sqf";
	_nul = []execVM "server\Bomb_Countdown_Detonate.sqf";
	*/

	diag_log "The server got through all its init files!";
//	_nul = []execVM "server\missions\mission_init.sqf";
} else {

///////////////////////////////////////////////////////////////
///////////////////////Client-side stuff///////////////////////
///////////////////////////////////////////////////////////////

	waitUntil {Server_Load_Complete == 1};
	diag_log "The client is running!";

	_nul = []execVM "client\player_markers.sqf";
	_nul = []execVM "client\taginit.sqf";
	_nul = [] execVM "client\hud\playerHud.sqf";
	_nul = []execVM "client\Random_Spawn_Pos.sqf";
	
	forceRespawn player;
	
	

	
	playerCredits = 0;
	
//	"mrkBlue" setMarkerAlphaLocal 0;
//	"mrkRed" setMarkerAlphaLocal 0;
//	"mrkGreen" setMarkerAlphaLocal 0;
//	"mrknoBlue" setMarkerAlphaLocal 0;
//	"mrknoRed" setMarkerAlphaLocal 0;
//	"mrknoGreen" setMarkerAlphaLocal 0;
//	"mrkMission" setMarkerAlphaLocal 0;
//	"no_Mission" setMarkerAlphaLocal 0;
	"respawn_bomb" setMarkerAlphaLocal 0;

//	call compile preprocessFileLineNumbers "client\baseConfig.sqf";
	
	diag_log "The client got through all its init files!";
};