// [Side, Spawning helipads/objects (Array), Starting aircraft (array), Amount of available Aircraft, Faction, Threshold (0 to 1), Leaders (array), Pool of available aircraft classnames if "custom" faction is chosen (array), Delay time between checks (seconds) ] spawn NR6_fnc_AirReinforcements;

private 
    [
    "_side","_logic","_flight","_Commanders","_coreObj","_SpawnPads","_StartForces","_sidetick","_faction","_CurrentForces","_Pool","_Threshold","_Leaders","_SpawnRGroup","_CTR","_grp", "_GoodPads","_LiveForces","_CLiveForces","_CStartForces","_TickTime","_ExtraArgs"
    ];

_logic = _this select 0;

_Commanders = [];

{
	if ((typeOf _x) == "NR6_HAL_Leader_Module") then {waitUntil {sleep 0.5; (not (isNil (_x getvariable "LeaderType")))}; _Commanders pushback (call compile (_x getvariable "LeaderType"))};
} foreach (synchronizedObjects _logic);

_side = call compile (_logic getVariable "_side");
_SpawnPads =  [_logic];
_StartForces = [];
_coreObj = _logic;
_sidetick = _logic getVariable "_sidetick";
_faction = _logic getVariable "_faction";
_Threshold = _logic getVariable "_Threshold";
_Leaders = _Commanders;
_TickTime = _logic getVariable "_TickTime";
_flight = call compile (_logic getVariable "_flight");
_DontLand = _logic getVariable "_DontLand";

if (_DontLand) then {_DontLand = "; (group _this) setVariable ['AirNoLand',true];"} else {_DontLand = ""};

if (isNil ("_TickTime")) then {_TickTime = 15};

{
    if (_x isKindOf "HeliH") then {_SpawnPads pushback _x};
    if ((_x isKindOf "Air") and not ((crew _x) isequalto [])) then {_StartForces pushback _x};
} forEach (synchronizedObjects _coreObj);

if (_StartForces isequalto []) then {_StartForces = [objNull]};
if (_SpawnPads isequalto []) then {_SpawnPads = [_coreObj]};



_LiveForces = _StartForces;

_CurrentForces = count _LiveForces;

_CStartForces = count _StartForces;


sleep 5;

if (isNil ("RydHQ_Included")) then {RydHQ_Included = []};
if (isNil ("RydHQB_Included")) then {RydHQB_Included = []};
if (isNil ("RydHQC_Included")) then {RydHQC_Included = []};
if (isNil ("RydHQD_Included")) then {RydHQD_Included = []};
if (isNil ("RydHQE_Included")) then {RydHQE_Included = []};
if (isNil ("RydHQF_Included")) then {RydHQF_Included = []};
if (isNil ("RydHQG_Included")) then {RydHQG_Included = []};
if (isNil ("RydHQH_Included")) then {RydHQH_Included = []};

if (isNil ("LeaderHQ")) then {LeaderHQ = objNull};
if (isNil ("LeaderHQB")) then {LeaderHQB = objNull};
if (isNil ("LeaderHQC")) then {LeaderHQC = objNull};
if (isNil ("LeaderHQD")) then {LeaderHQD = objNull};
if (isNil ("LeaderHQE")) then {LeaderHQE = objNull};
if (isNil ("LeaderHQF")) then {LeaderHQF = objNull};
if (isNil ("LeaderHQG")) then {LeaderHQG = objNull};
if (isNil ("LeaderHQH")) then {LeaderHQH = objNull};




if (_faction == "B") then {

    _Pool = 
        [
            "FIR_F16C",
            "FIR_F15C_Blank"
        
        ]
};

if (_faction == "O") then {

    _Pool = 
        [
            "rhs_mig29s_vvsc",
            "RHS_Su25SM_vvsc",
            "Su33_Protatype_PT_2"
        
        ]
};

if (_faction == "I") then {

    _Pool = 
        [
        
        ]
};

if (_faction == "custom") then {

    _Pool = call compile (_logic getvariable "_Pool");
};


while {true} do 

    {

    _GoodPads = [];

    {
        if ((alive _x) or (_x getVariable ["HOT",false])) then {

            _GoodPads pushback _x;
            
        };
    
    } forEach _SpawnPads;

    _CLiveForces = _LiveForces;

    {
        if (!alive _x) then {_LiveForces = (_LiveForces - [_x])}
    } forEach _CLiveForces;

    _CurrentForces = count _LiveForces;


    if ((_CurrentForces) < (_Threshold*_CStartForces)) then 
        {
            _chosenFlight = (selectRandom _flight);

            if ((_sidetick > 0) and not (_GoodPads isequalto [])) then {

                private ["_grp"];

                _grp = [_GoodPads,_side,_Pool,_Leaders,_chosenFlight] call SpawnARGroupA;

                sleep 1;
                
                _sidetick = (_sidetick - _chosenFlight);
                _logic setvariable ["_sidetick",_sidetick];
                {if not ((vehicle _x) in _LiveForces) then {_LiveForces pushback (vehicle _x)}} foreach (units _grp);

                (leader _grp) call compile ((_logic getVariable ["_ExtraArgs",""]) + _DontLand);

                    
            };  
        };

    if (_sidetick <= 0) exitwith {};

    sleep _TickTime;
    };