private ["_logic","_Commanders","_Leader","_prefix","_area","_trig"];

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
	
	_logic call compile (_prefix + "Front" + " = " + str (_logic getvariable "RydHQ_Front"));

	if (_Leader == "LeaderHQ") then {_prefix = "A"};
	if (_Leader == "LeaderHQB") then {_prefix = "B"};
	if (_Leader == "LeaderHQC") then {_prefix = "C"};
	if (_Leader == "LeaderHQD") then {_prefix = "D"};
	if (_Leader == "LeaderHQE") then {_prefix = "E"};
	if (_Leader == "LeaderHQF") then {_prefix = "F"};
	if (_Leader == "LeaderHQG") then {_prefix = "G"};
	if (_Leader == "LeaderHQH") then {_prefix = "H"};

	_area = _logic getvariable ["objectArea",[0,0,0,true,0]];

	_trig = createTrigger ["EmptyDetector",getpos _logic];
	_trig setTriggerArea [_area select 0,_area select 1, _area select 2, _area select 3];

	_trig call compile ("HET_F" + _prefix + " = _this");


} foreach _Commanders;