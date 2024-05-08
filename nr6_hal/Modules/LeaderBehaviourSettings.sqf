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

	_Leader = call compile _Leader;

	_logic call compile (_prefix + "Smoke" + " = " + str (_logic getvariable "RydHQ_Smoke"));
	_logic call compile (_prefix + "Flare" + " = " + str (_logic getvariable "RydHQ_Flare"));
	_logic call compile (_prefix + "GarrVehAb" + " = " + str (_logic getvariable "RydHQ_GarrVehAb"));
	_logic call compile (_prefix + "IdleOrd" + " = " + str (_logic getvariable "RydHQ_IdleOrd"));
	_logic call compile (_prefix + "Flee" + " = " + str (_logic getvariable "RydHQ_Flee"));
	_logic call compile (_prefix + "Surr" + " = " + str (_logic getvariable "RydHQ_Surr"));
	_logic call compile (_prefix + "Muu" + " = " + str (_logic getvariable "RydHQ_Muu"));
	_logic call compile (_prefix + "Rush" + " = " + str (_logic getvariable "RydHQ_Rush"));
	_logic call compile (_prefix + "Withdraw" + " = " + str (_logic getvariable "RydHQ_Withdraw"));
	_logic call compile (_prefix + "AirDist" + " = " + str (_logic getvariable "RydHQ_AirDist"));
	_logic call compile (_prefix + "DynForm" + " = " + str (_logic getvariable "RydHQ_DynForm"));
	_logic call compile (_prefix + "DefRange" + " = " + str (_logic getvariable "RydHQ_DefRange"));
	_logic call compile (_prefix + "GarrRange" + " = " + str (_logic getvariable "RydHQ_GarrRange"));
	_logic call compile (_prefix + "AttInfDistance" + " = " + str (_logic getvariable "RydHQ_AttInfDistance"));
	_logic call compile (_prefix + "AttArmDistance" + " = " + str (_logic getvariable "RydHQ_AttArmDistance"));
	_logic call compile (_prefix + "AttSnpDistance" + " = " + str (_logic getvariable "RydHQ_AttSnpDistance"));
	_logic call compile (_prefix + "CaptureDistance" + " = " + str (_logic getvariable "RydHQ_CaptureDistance"));
	_logic call compile (_prefix + "FlankDistance" + " = " + str (_logic getvariable "RydHQ_FlankDistance"));
	_logic call compile (_prefix + "AttSFDistance" + " = " + str (_logic getvariable "RydHQ_AttSFDistance"));
	_logic call compile (_prefix + "ReconDistance" + " = " + str (_logic getvariable "RydHQ_ReconDistance"));
	_logic call compile (_prefix + "UAVAlt" + " = " + str (_logic getvariable "RydHQ_UAVAlt"));
	_logic call compile (_prefix + "Combining" + " = " + str (_logic getvariable "RydHQ_Combining"));

} foreach _Commanders;