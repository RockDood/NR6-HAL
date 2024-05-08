private ["_logic","_Commanders","_Leader","_prefix"];

_logic = (_this select 0);
_Commanders = [];

{
	if ((typeOf _x) == "NR6_HAL_Leader_Module") then {_Commanders pushback _x};
} foreach (synchronizedObjects _logic);

{
	_Leader = (_x getvariable "LeaderType");

	if (_Leader == "LeaderHQ") then {_prefix = "RydHQ_"};
	if (_Leader == "LeaderHQB") then {_prefix = "RydHQB_"};
	if (_Leader == "LeaderHQC") then {_prefix = "RydHQC_"};
	if (_Leader == "LeaderHQD") then {_prefix = "RydHQD_"};
	if (_Leader == "LeaderHQE") then {_prefix = "RydHQE_"};
	if (_Leader == "LeaderHQF") then {_prefix = "RydHQF_"};
	if (_Leader == "LeaderHQG") then {_prefix = "RydHQG_"};
	if (_Leader == "LeaderHQH") then {_prefix = "RydHQH_"};

	waitUntil {sleep 0.5; (not (isNil _Leader))};
	_Leader = call compile _Leader;

	if (call compile ("isNil " + "'" + _prefix + "NoCargo" + "'")) then {
	
		call compile (_prefix + "NoCargo" + " = " + "[]");
		
	};

	{
		if not (_x isKindOf "Logic") then {
			_x call compile (_prefix + "NoCargo" + " pushback " + "(group _this)");
		} else {
			_x setVariable ["_ExtraArgs",(_logic getVariable ["_ExtraArgs",""]) + "; " + _prefix + "NoCargo" + " pushback " + "(group _this)"];
		};

	} foreach (synchronizedObjects _logic);

} foreach _Commanders;