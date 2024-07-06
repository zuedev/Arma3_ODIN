/*
 * Drops a 155mm HE shell at a target location
 *
 * Arguments:
 * 0: ARRAY - Position to drop the shell at
 *
 * Returns:
 * Nothing
 *
 * Example:
 * [position player] call ODIN_fnc_155mm_HE;
 */

params ["_pos"];

[_pos, "Sh_155mm_AMOS", 0, 1, 0] spawn BIS_fnc_fireSupportVirtual;
