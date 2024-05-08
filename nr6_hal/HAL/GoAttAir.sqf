_SCRname = "GoAttAir";

_i = "";

_unitG = _this select 0;
_Trg = _this select 1;
_HQ = _this select 2;
_request = false;
if ((count _this) > 3) then {_request = _this select 3};

_PosObj1 = getPosATL _Trg;
_unitvar = str (_unitG);

_UL = leader _unitG;

_PosLand = _unitG getvariable ("START" + _unitvar); 
if (isNil ("_PosLand")) then {_unitG setVariable [("START" + _unitvar),(position (vehicle (leader _unitG)))]};

[_unitG] call RYD_WPdel;

_unitG setVariable [("Deployed" + (str _unitG)),false];_unitG setVariable [("Capt" + (str _unitG)),false];

_nothing = true;

_dX = (_PosObj1 select 0) - ((getPosATL (leader _HQ)) select 0);
_dY = (_PosObj1 select 1) - ((getPosATL (leader _HQ)) select 1);

_angle = _dX atan2 _dY;

_distance = (leader _HQ) distance _PosObj1;
_distance2 = 0;

_dXc = _distance2 * (cos _angle);
_dYc = _distance2 * (sin _angle);

_dXb = _distance * (sin _angle);
_dYb = _distance * (cos _angle);

_posX = ((getPosATL (leader _HQ)) select 0) + _dXb;
_posY = ((getPosATL (leader _HQ)) select 1) + _dYb;

if (_request) then {
	_posX = (_PosObj1 select 0) + (random 300) - 150;
	_posY = (_PosObj1 select 1) + (random 300) - 150;
};

[_unitG,[_posX,_posY,0],"HQ_ord_attackAir",_HQ] call RYD_OrderPause;

if ((isPlayer (leader _unitG)) and (RydxHQ_GPauseActive)) then {hintC "New orders from HQ!";setAccTime 1};

_UL = leader _unitG;
 
if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdConf,"OrdConf"] call RYD_AIChatter}};

if (_HQ getVariable ["RydHQ_Debug",false]) then 
	{
	_signum = _HQ getVariable ["RydHQ_CodeSign","X"];
	_i = [[_posX,_posY],_unitG,"markAttack","ColorRed","ICON","waypoint","CAS " + (groupId _unitG) + " " + _signum," - CAS",[0.5,0.5]] call RYD_Mark
	};

_task = [(leader _unitG),["Provide close air support and neutralize hostile targets.", "Provide Close Air Support", ""],[_posX,_posY],"destroy"] call RYD_AddTask;

_wp = [_unitG,[_posX,_posY],"SAD","COMBAT","RED","NORMAL",["true", "deletewaypoint [(group this), 0]"],true,0.001] call RYD_WPadd;

_lasT = ObjNull;


if ((_unitG in (_HQ getVariable ["RydHQ_BAirG",[]])) and not (_request)) then 
	{
	_eSide = side _unitG;
	_wp waypointAttachVehicle _Trg;

	_tgt = "LaserTargetW";
	if (_eSide == east) then {_tgt = "LaserTargetE"};
	if (_eSide == resistance) then {_tgt = "LaserTargetC"};

	_tPos = getPosATL _Trg;
	//_tX = (_tPos select 0) + (random 60) - 30;
	//_tY = (_tPos select 1) + (random 60) - 30;

	_tX = (_tPos select 0);
	_tY = (_tPos select 1);

	_lasT = createVehicle [_tgt, _Trg, [], 0, "CAN_COLLIDE"];

	_lasT attachTo [_Trg];

	_code =
		{
		_Trg = _this select 0;
		_lasT = _this select 1;
		_unitG = _this select 2;

		_VL = vehicle (leader _unitG);
		_ct = 0;

		while {(not (isNull _Trg) and (((side _unitG) knowsAbout _Trg) > 0) and {not (isNull _lasT) and {not (isNull _VL) and {(_ct < 100)}}})} do
			{
			if not (alive _Trg) exitWith {};
			if (((getpos (vehicle _Trg)) select 2) > 10) exitWith {};
			if not (alive _VL) exitWith {};
			if (({alive _x} count (units _unitG)) < 1) exitWith {};
			_isBusy = _unitG getVariable [("Busy" + (str _unitG)),false];
			if not (_isBusy) exitWith {};

		//	_tPos = getPosATL _Trg;
		//	_tX = (_tPos select 0) + (random 60) - 30;
		//	_tY = (_tPos select 1) + (random 60) - 30;

		//	_lasT setPos [_tX,_tY,0];

			sleep 15;
			_ct = _ct + 1
			};

		deleteVehicle _lasT
		};
		
	[[_Trg,_lasT,_unitG],_code] call RYD_Spawn
	};


if not (_request) then {_unitG setVariable ["RydHQ_WaitingTarget",_this select 1]};
_cause = [_unitG,6,true,0,120,[],false] call RYD_Wait;
_timer = _cause select 0;
_alive = _cause select 1;

if not (_alive) exitwith 
	{
	if ((_HQ getVariable ["RydHQ_Debug",false]) or (isPlayer (leader _unitG))) then {deleteMarker ("markAttack" + str (_unitG))};
	if not (isNull _lasT) then {deleteVehicle _lasT};
	_unitG setVariable [("Busy" + (str _unitG)),false];
	if not (_request) then {[_Trg,"AirAttacked"] call RYD_VarReductor}
	};

if (_timer > 120) then {deleteWaypoint _wp};

if not (_task isEqualTo taskNull) then
	{
	
	[_task,(leader _unitG),["Return to base.", "Return To Base", ""],_Posland,"ASSIGNED",0,false,true] call BIS_fnc_SetTask;
	
	};

if ((_HQ getVariable ["RydHQ_Debug",false]) or (isPlayer (leader _unitG))) then {_i setMarkerColor "ColorBlue"};
if (_unitG in (_HQ getVariable ["RydHQ_BAirG",[]])) then {deleteVehicle _lasT};

_rrr = (_unitG getVariable ["Ryd_RRR",false]);

_radd = "";
if (_rrr) then {_radd = "; {(vehicle _x) setFuel 1; (vehicle _x) setVehicleAmmo 1; (vehicle _x) setDamage 0;} foreach (units (group this))"};

_wp = [_unitG,_Posland,"MOVE","SAFE","GREEN","NORMAL",["true", "if not ((group this) getVariable ['AirNoLand',false]) then {{(vehicle _x) land 'LAND'} foreach (units (group this))}; deletewaypoint [(group this), 0]" + _radd],true,0.001] call RYD_WPadd;

_cause = [_unitG,6,true,0,24,[],false] call RYD_Wait;
_timer = _cause select 0;
_alive = _cause select 1;

if not (_alive) exitwith 
	{
	if ((_HQ getVariable ["RydHQ_Debug",false]) or (isPlayer (leader _unitG))) then {deleteMarker ("markAttack" + str (_unitG))};
	_unitG setVariable [("Busy" + (str _unitG)),false];
	if not (_request) then {[_Trg,"AirAttacked"] call RYD_VarReductor}
	};
if (_timer > 24) then {deleteWaypoint _wp};

sleep 30;

if (not (_task isEqualTo taskNull) and not (alive _Trg)) then {[_task,"SUCCEEDED",true] call BIS_fnc_taskSetState};

if ((_HQ getVariable ["RydHQ_Debug",false]) or (isPlayer (leader _unitG))) then {deleteMarker ("markAttack" + str (_unitG))};

_attAv = _HQ getVariable ["RydHQ_AttackAv",[]];
_attAv pushBack _unitG;
_HQ setVariable ["RydHQ_AttackAv",_attAv];
 
_unitG setVariable [("Busy" + (str _unitG)),false];

if not (_request) then {[_Trg,"AirAttacked"] call RYD_VarReductor};

_UL = leader _unitG;if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdEnd,"OrdEnd"] call RYD_AIChatter}};