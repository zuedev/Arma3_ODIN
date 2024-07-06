/*
    Description:
    Hints "pong" to the player along with the current time.

    Parameters:
	None.

    Returns:
	Nothing.

    Examples:
	[] call ODIN_fnc_ping;
*/

_time = time;

hint format ["Pong! %1", _time];