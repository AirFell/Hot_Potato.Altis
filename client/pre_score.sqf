diag_log "pre-score script started.";

Armed_Team = side player;
publicVariable "Armed_Team";
diag_log format["pre-score script: Armed Team = %1", Armed_Team];

_distance1 = player distance EnemyBase1;
_distance2 = player distance EnemyBase2;

if (_distance1 < _distance2) then {
	Bombed_Team = EnemyBase1;
	publicVariable "Bombed_Team";
} else {
	Bombed_Team = EnemyBase2;
	publicVariable "Bombed_Team";
};
diag_log format["pre-score script: Bombed Team = %1", Bombed_Team];


diag_log "pre-score script ended.";