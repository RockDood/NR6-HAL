private ["_logic","_Commanders"];

_logic = (_this select 0);
_Commanders = [];

{
	if ((typeOf _x) == "NR6_HAL_BBLeader_Objective_Module") then {_Commanders pushback _x};
} foreach (synchronizedObjects _logic);

_Leader = (_logic getvariable "Owned");

if (_Leader == "A") then {_logic setvariable ["AreaTakenA",true]};
if (_Leader == "B") then {_logic setvariable ["AreaTakenB",true]};