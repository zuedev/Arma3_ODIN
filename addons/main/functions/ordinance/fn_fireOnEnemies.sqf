/*
    Description:
    Fires ordinance on enemies in a given area.

    Parameter(s):
    Select 0 - (OPTIONAL) OBJECT: Unit calling in the ordinance. This is how we determine the side(s) to target. If nil, the player is used.
    Select 1 - (OPTIONAL) ARRAY: Origin position of the ordinance's radius. If nil, the caller's position is used.
    Select 2 - (OPTIONAL) NUMBER: Radius of the ordinance. If nil, 100 is used.
    Select 3 - (OPTIONAL) STRING: Type of ordinance to fire. If nil, "Sh_82mm_AMOS" is used.

    Returns:
    Nothing.

    Examples:
    // Fire 82mm ordinance on enemies 100m around the player.
    [] call ODIN_fnc_fireOnEnemies;
    // or...
    [player, getPos player, 100, "Sh_82mm_AMOS"] call ODIN_fnc_fireOnEnemies;

    // Fire 155mm ordinance on enemies 250m around a marker.
    [_someUnit, getMarkerPos "marker1", 250, "Sh_155mm_AMOS"] call ODIN_fnc_fireOnEnemies;
*/

params ["_caller", "_origin", "_radius", "_ammo"];

if (isNil "_caller") then {
    _caller = player;
};

if (isNil "_origin") then {
    _origin = getPos _caller;
};

if (isNil "_radius") then {
    _radius = 100;
};

if (isNil "_ammo") then {
    _ammo = "Sh_82mm_AMOS";
};

private _enemySides = _unit call BIS_fnc_enemySides;

private _targets = [];

{
    if (_x in _enemySides && {alive _x} && {_x distance _origin <= _radius}) then {
        _targets pushBack _x;
    };
} forEach allUnits;

private _targetCount = count _targets;

if (_targetCount > 0) then {
    hint format ["Firing ordinance on %1 enemies.", _targetCount];

    {
        [_x, _ammo, 0, 1, 0] spawn BIS_fnc_fireSupportVirtual;
    } forEach _targets;
} else {
    hint "No enemies in the area. No ordinance fired.";
};