//[position of site, radius of site,  number of groups, chance for patrol,,minimum building size, side, array of available groups for guard to spawn (can be a config path or array), controlled HAL leaders] call NR6_Sites;

//Ex: [(getPos this),100,4,0.2,1,west,[['rhsusf_army_ocp_teamleader', 'rhsusf_army_ocp_grenadier','rhsusf_army_ocp_autorifleman','rhsusf_army_ocp_rifleman'],['rhsusf_army_ocp_grenadier', 'rhsusf_army_ocp_rifleman']], [LeaderHQ,LeaderHQB]] call NR6_fnc_Sites; 

private 
    [
    "_grp","_logic","_Commanders","_SpawnPos","_SpawnRadius","_Pool","_GrpQuantity","_Leaders","_i","_Side","_SpawnRGroup","_PatrolPercent","_MinBuilding"
    ];

_logic = _this select 0;

_Commanders = [];

{
	if ((typeOf _x) == "NR6_HAL_Leader_Module") then {waitUntil {sleep 0.5; (not (isNil (_x getvariable "LeaderType")))}; _Commanders pushback (call compile (_x getvariable "LeaderType"))};
} foreach (synchronizedObjects _logic);

_SpawnPos = getpos _logic;
_SpawnRadius = _logic getvariable "_SpawnRadius";
_GrpQuantity = _logic getvariable "_GrpQuantity";
_PatrolPercent = _logic getvariable "_PatrolPercent";
_MinBuilding = _logic getvariable "_MinBuilding";
_Side = call compile (_logic getVariable "_side");
_Pool = call compile (_logic getvariable "_Pool");
_Leaders = _Commanders;


if (isNil ("LeaderHQ")) then {LeaderHQ = objNull};
if (isNil ("LeaderHQB")) then {LeaderHQB = objNull};
if (isNil ("LeaderHQC")) then {LeaderHQC = objNull};
if (isNil ("LeaderHQD")) then {LeaderHQD = objNull};
if (isNil ("LeaderHQE")) then {LeaderHQE = objNull};
if (isNil ("LeaderHQF")) then {LeaderHQF = objNull};
if (isNil ("LeaderHQG")) then {LeaderHQG = objNull};
if (isNil ("LeaderHQH")) then {LeaderHQH = objNull};

if (isNil ("RydHQ_ExcludedG")) then {RydHQ_ExcludedG = []};
if (isNil ("RydHQB_ExcludedG")) then {RydHQB_ExcludedG = []};
if (isNil ("RydHQC_ExcludedG")) then {RydHQC_ExcludedG = []};
if (isNil ("RydHQD_ExcludedG")) then {RydHQD_ExcludedG = []};
if (isNil ("RydHQE_ExcludedG")) then {RydHQE_ExcludedG = []};
if (isNil ("RydHQF_ExcludedG")) then {RydHQF_ExcludedG = []};
if (isNil ("RydHQG_ExcludedG")) then {RydHQG_ExcludedG = []};
if (isNil ("RydHQH_ExcludedG")) then {RydHQH_ExcludedG = []};

for "_x" from 1 to _GrpQuantity do
{
  [_SpawnPos,_SpawnRadius,_Side,_Pool,_SpawnRadius,_MinBuilding,_PatrolPercent,_Leaders] call SpawnRGroupS;
};