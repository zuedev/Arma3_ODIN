/*
    Description:
    Returns the positions of all units on the given side.

    Parameters:
    Select 0 - SIDE: Side to get positions of.
	Select 1 - (OPTIONAL) ARRAY: Origin of radius to search for units. Default is player.
	Select 2 - (OPTIONAL) NUMBER: Radius to search for units. If not provided, all units on the side across the map will be returned.

    Returns:
	ARRAY - Positions of all units on the given side

    Examples:
	[west, player, 100] call ODIN_fnc_getSidePositions;
*/

params ["_side", "_origin", "_radius"];

if (isNil "_origin") then {
	_origin = player;
};

if (isNil "_radius") then {
	_radius = "Infinity";
};

if (_radius == "Infinity") then {
	_units = allUnits;
} else {
	_units = _origin nearEntities [[], _radius];
};

_positions = [];

{
	if (side _x == _side) then {
		_positions pushBack (getPos _x);
	};
} forEach _units;

_positions;