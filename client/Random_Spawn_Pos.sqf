diag_log "Finding random spawn position.";

_RandomPosW = westRespawnArray select floor random count westRespawnArray;
_RandomPosE = EastRespawnArray select floor random count EastRespawnArray;
_RandomPosG = GuerRespawnArray select floor random count GuerRespawnArray;

switch (side player) do {
	case west: {
		"respawn_west" setMarkerPosLocal getMarkerPos _RandomPosW;
	};
	case east: {
		"respawn_east" setMarkerPosLocal getMarkerPos _RandomPosE;
	};
	case resistance: {
		"respawn_guerrila" setMarkerPosLocal getMarkerPos _RandomPosG;
	};
};