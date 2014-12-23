waituntil {client_respawn_counter == 1};
{_x addEventHandler ["killed", {hint format ["%1 has been killed by %2", _this select 0, _this select 1];}];} forEach allunits;

/*
while {true} do {
	sleep 29;
	{_x removeEventHandler ["Killed", 0]} forEach allunits;
	sleep 1;
	{0 = _x addEventHandler ["killed", {_null = _this execVM "client\kill_credits.sqf";}];} forEach allunits;
};
*/

//0 = this addEventHandler ["killed", {hint format ["%1 has been killed by %2", _this select 0, _this select 1];}];