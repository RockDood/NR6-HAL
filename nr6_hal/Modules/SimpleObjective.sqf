private ["_logic","_Commanders","_Leader","_prefix","_objName","_prefixT"];

_logic = (_this select 0);
_Commanders = [];

_objName = _logic getvariable "_ObjName";
if not (_objName isEqualTo "") then {_logic setvariable ["ObjName",_objName]};

{
	if ((typeOf _x) == "NR6_HAL_Leader_Module") then {_Commanders pushback _x};
} foreach (synchronizedObjects _logic);

{
	_Leader = (_x getvariable "LeaderType");

	if (_Leader == "LeaderHQ") then {_prefix = "RydHQ_"; _prefixT = "SetTakenA"};
	if (_Leader == "LeaderHQB") then {_prefix = "RydHQB_"; _prefixT = "SetTakenB"};
	if (_Leader == "LeaderHQC") then {_prefix = "RydHQC_"; _prefixT = "SetTakenC"};
	if (_Leader == "LeaderHQD") then {_prefix = "RydHQD_"; _prefixT = "SetTakenD"};
	if (_Leader == "LeaderHQE") then {_prefix = "RydHQE_"; _prefixT = "SetTakenE"};
	if (_Leader == "LeaderHQF") then {_prefix = "RydHQF_"; _prefixT = "SetTakenF"};
	if (_Leader == "LeaderHQG") then {_prefix = "RydHQG_"; _prefixT = "SetTakenG"};
	if (_Leader == "LeaderHQH") then {_prefix = "RydHQH_"; _prefixT = "SetTakenH"};

	waitUntil {sleep 0.5; (not (isNil _Leader))};
	
	_Leader = call compile _Leader;

	if (call compile ("isNil " + "'" + _prefix + "SimpleObjs" + "'")) then {
	
		call compile (_prefix + "SimpleObjs" + " = " + "[]");
		
	};

	_logic call compile (_prefix + "SimpleObjs" + " pushback " + "_this");
	
	if ((_logic getvariable "RydHQ_TakenLeader") isEqualTo (_x getvariable "LeaderType")) then  {
		(group _Leader) setvariable ["RydHQ_Taken",((group _Leader) getvariable ["RydHQ_Taken",[]]) + [_logic]];
		_logic setVariable [_prefixT,true];
	};

} foreach _Commanders;
