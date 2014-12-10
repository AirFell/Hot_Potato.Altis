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
	_nul = []execVM "server\Base_Spawn.sqf";
	_nul = []execVM "server\randomMarkerGen.sqf";
	_nul = []execVM "server\Bomb_Spawn.sqf";
	_nul = []execVM "server\Bomb_Marker.sqf";
	_nul = []execVM "server\BombRespawn.sqf";
	_nul = []execVM "server\BaseRespawn.sqf";
	_nul = []execVM "server\Bomb_Countdown_Detonate.sqf";

	diag_log "The server got through all its init files!";
//	_nul = []execVM "server\missions\mission_init.sqf";
} else {

///////////////////////////////////////////////////////////////
///////////////////////Client-side stuff///////////////////////
///////////////////////////////////////////////////////////////
	diag_log "The client is running!";

	_nul = []execVM "client\sideswitch.sqf";
	_nul = []execVM "client\player_markers.sqf";
	_nul = []execVM "client\taginit.sqf";
	_nul = []execVM "client\Arm_Bomb.sqf";
	_nul = []execVM "client\Disarm_Bomb.sqf";
//	_nul = []execVM "onPlayerKilled.sqf";
	_nul = []execVM "client\Load_Bomb.sqf";
	
//	playerCredits = 0;
	
//	"mrkBlue" setMarkerAlphaLocal 0;
//	"mrkRed" setMarkerAlphaLocal 0;
//	"mrkGreen" setMarkerAlphaLocal 0;
//	"mrkMission" setMarkerAlphaLocal 0;
//	"no_Mission" setMarkerAlphaLocal 0;
	"respawn_bomb" setMarkerAlphaLocal 0;

//	call compile preprocessFileLineNumbers "client\baseConfig.sqf";
	
	diag_log "The client got through all its init files!";
};


player addAction [
	"Show Score",
	{
		hint format["West:%1 East:%2 Guer:%3", West_Score, East_Score, Guer_Score];
	},
	nil, 1, True, True, "", ""];