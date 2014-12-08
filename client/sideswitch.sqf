_nul = switch (side player) do {
	case west: {
		diag_log format ["%1 is on the %2 team.", player, side player];
		BaseArray = [east_base, guer_base];
	};
		
	case east: {
		diag_log format ["%1 is on the %2 team.", player, side player];
		BaseArray = [west_base, guer_base];
	};
	
	case resistance: {
		diag_log format ["%1 is on the %2 team.", player, side player];
		BaseArray = [west_base, east_base];
	};
};