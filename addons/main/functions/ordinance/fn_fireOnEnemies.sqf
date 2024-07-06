/*
    Description:
    Fires ordinance on enemies in a given area.

    Parameter(s):
    Select 0 - (OPTIONAL) OBJECT: Unit calling in the ordinance. This is how we determine the side(s) to target. If nil, the player is used.
    Select 1 - (OPTIONAL) ARRAY: Origin position of the ordinance's radius. If nil, the caller's position is used.
    Select 2 - (OPTIONAL) NUMBER: Radius of the ordinance. If nil, 100 is used.
    Select 3 - (OPTIONAL) STRING: Type of ordinance to fire. If nil, "G_20mm_HE" is used.
    select 4 - (OPTIONAL) NUMBER: Amount of ordinance to fire. If nil, 1 is used.
    select 5 - (OPTIONAL) NUMBER: Delay between ordinance shots. If nil, 0 is used.
    select 6 - (OPTIONAL) NUMBER: Spread of ordinance shots. If nil, 0 is used.

    Returns:
    Nothing.

    Examples:
    // Fire 20mm HE ordinance on enemies 100m around the player.
    [] spawn ODIN_fnc_fireOnEnemies;
    // or...
    [player, getPos player, 100, "G_20mm_HE", 1, 0, 0] spawn ODIN_fnc_fireOnEnemies;

    // Fire 155mm ordinance on enemies 250m around a marker.
    [_someUnit, getMarkerPos "marker1", 250, "Sh_155mm_AMOS", 1, 0, 0] spawn ODIN_fnc_fireOnEnemies;
*/

params ["_caller", "_origin", "_radius", "_ammo", "_amount", "_delay", "_spread"];

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
    _ammo = "B_20mm_Tracer_Red";
};

if (isNil "_amount") then {
    _amount = 1;
};

if (isNil "_delay") then {
    _delay = 0;
};

if (isNil "_spread") then {
    _spread = 0;
};

private _enemySides = _caller call BIS_fnc_enemySides;

private _targets = [];

{
    if (side _x in _enemySides && {alive _x} && {_x distance _origin <= _radius}) then {
        _targets pushBack _x;
    };
} forEach allUnits;

private _targetCount = count _targets;

if (_targetCount > 0) then {
    hint format ["Firing ordinance on %1 enemies.", _targetCount];

    for "_i" from 1 to _amount do {
        {
            [
                _x,
                _ammo,
                _spread,
                1,
                0,
                {},
                0,
                250,
                150,
                []
            ] spawn BIS_fnc_fireSupportVirtual;
            sleep _delay;
        } forEach _targets;
    };
} else {
    hint "No enemies in the area. No ordinance fired.";
};