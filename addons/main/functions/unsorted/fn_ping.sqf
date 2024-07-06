/*
 * Hints "pong" to the player along with the current time.
 *
 * Arguments:
 * None
 *
 * Returns:
 * Nothing
 *
 * Example:
 * [] call ODIN_fnc_ping;
 */

_time = time;

hint format ["Pong! %1", _time];