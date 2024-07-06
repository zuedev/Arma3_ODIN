/*
 * Returns the positions of all units on the given side.
 *
 * Arguments:
 * 0: SIDE - Side to get positions of
 * 1: ARRAY - Origin of radius to search for units
 * 2: NUMBER - Radius to search for units
 *
 * Returns:
 * ARRAY - Positions of all units on the given side
 *
 * Example:
 * [west, player, 100] call ODIN_fnc_getSidePositions;
 */

params ["_side", "_origin", "_radius"];

_units = allUnits select {side _x == _side && _x distance _origin <= _radius};

_positions = [];

{
	_positions pushBack (getPos _x);
} forEach _units;

_positions;