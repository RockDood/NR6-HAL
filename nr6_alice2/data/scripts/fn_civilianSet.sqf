scriptName "\NR6_Alice2\data\scripts\fnc_civilianSet.sqf";
/*
	File: fnc_civilianSet.sqf
	Author: Karel Moricky

	Description:
	Sets basic ALICE 2 values for civilian unit

	Parameter(s):
	_this select 0: Object - Unit
	_this select 1: Object - Town
	_this select 2: Object - House
*/
private ["_grp","_class","_pos","_unit","_movein","_twns","_houses","_pointPos","_pointMarker","_posList","_point","_color","_marker","_spawnpos","_topic","_path","_bikb","_fsm","_markerx","_logic","_debug","_twn","_house","_id","_moves","_allTopics","_globalInit","_localInit","_add"];
_logic = bis_alice_mainscope;
_debug = _logic getvariable "debug";
_movein = false;

_unit = _this select 0;
if (typename _unit == typename "") then {
	_grp = if (count _this > 1) then {(_this select 1) getvariable "ALICE_group"};
	if (isNull _grp) then {
		createcenter civilian;
		_grp = creategroup civilian;
		(_this select 1) setvariable ["ALICE_group",_grp];
	};
	_class = _unit;
	_pos = 	if (count _this > 2) then {position (_this select 2)} else {
		if (count _this > 1) then {position (_this select 1)} else {[1,1,1]};
	};
	_unit = _grp createUnit [_class, _pos, [], 0, "NONE"];
	//_unit allowdamage false;
	_movein = true;
};
_twn = if (count _this > 1) then {_this select 1} else {
	_twns = position _unit nearEntities ["LocationLogicCityCenter",100000]; //--- TODO GITA - NO NEED ARMA 3
	if (count _twns > 0) then{
		_twns select 0;
	} else {debuglog format ["Log: [ALICE] Cannot add %1 - no towns available!",_unit];false};
};
if (typename _twn == "BOOL") exitwith {};
_house = if (count _this > 2) then {_this select 2} else {
	_houses = nearestobjects [position _twn,["bis_alice_emptydoor"],500];
	if (count _houses > 0) then {
		selectRandom _houses;
	} else {
		_houses = nearestobjects [position _twn,["house"],500];
		if (count _houses > 0) then {
			selectRandom _houses;
		} else {debuglog format ["Log: [ALICE] Cannot add %1 - no houses available in %2!",_unit,_twn];false};
	};
};
if (typename _house == "BOOL") exitwith {};
_id = _logic getvariable "id";
[_logic,"id",1] call bis_fnc_variablespaceadd;

sleep 0.01;

//--- Set values
if (_movein && _house isKindOf "house") then {
	_unit setpos (selectRandom ([_house] call BIS_fnc_buildingPositions));
};

/*
if (_movein && _house isKindOf "house") then {
	scopename "moveIn";
	
	_marker = if (_debug) then {_house call BIS_fnc_boundingBoxMarker;} else {""};

	//--- In da house
	_posList = [];
	for "_i" from 0 to 10 do {
		_point = _house selectionposition format ["AIspawnpos_%1",_i];
		if (_point distance [0,0,0] > 0.1) then {
			_posList = _posList + [_point];
			if (_debug) then {
				_pointPos = _house modeltoworld _point;
				_pointMarker = createmarker [format ["X%1",floor random 99999],_pointpos];
				_pointMarker setmarkertype "mil_dot";
				_pointMarker setmarkercolor "colorpink";
			};
		} else {breakto "moveIn"};
	};
	if (_debug) then {
		_color = if (count _posList > 0) then {"colorgreen"} else {"colorred"};
		_marker setmarkercolor _color;
	};

	if (count _posList == 0) then {_posList = [[0,0,0]]};

	_spawnpos = _house modeltoworld (_posList call bis_fnc_selectrandom);
	_unit setposatl _spawnpos;
	_unit setskill (random 1);
	_unit setvelocity [0,0,0];
};
*/

[_unit] join (_twn getvariable "ALICE_group");
_unit forcewalk true;
_unit setbehaviour "safe";
_unit setvariable ["ALICE_id",_id];
_unit setvariable ["ALICE_twn",_twn];
_unit setvariable ["ALICE_home",_house];
_unit setvariable ["ALICE_randomValue",random 1];
_unit setvariable ["ALICE_action",""];
_unit setvariable ["ALICE_action_fsm",-1];
_unit setvariable ["ALICE_type",getnumber(configfile >> "cfgvehicles" >> typeof _unit >> "characterID")];
_moves = gettext(configfile >> "cfgvehicles" >> typeof _unit >> "moves");
_unit setvariable ["ALICE_moves",_moves];
["ADD",_unit,0.1] call BIS_fnc_respect;
_fsm = _unit execfsm "\NR6_Alice2\data\fsms\alice2Formation.fsm";
_unit setvariable ["ALICE_fsm",_fsm];
//if (_id == 33) then {diag_debugFSM _fsm};

//--- Add conversation topics


sleep 0.01;

//--- Storing variables
//[_twn,"ALICE_populationCountDef",1] call bis_fnc_variablespaceadd;
_add = [_twn,"ALICE_population",[_unit]] call bis_fnc_variablespaceadd;
//debuglog str ["Log::::::::::::",_unit,typeof _unit,count _add];

//--- Event Handlers
_unit addeventhandler ["hit",{_this call BIS_ALICE2_fnc_civilianHit}];
_unit addeventhandler ["killed",{_this call BIS_ALICE2_fnc_civilianKilled}];

//--- Custom init
_globalInit = _logic getvariable "ALICE_civilianinit";
_localInit = _twn getvariable "ALICE_civilianinit";
if !(isnil "_globalInit") then {{_unit call _x} foreach _globalInit};
if !(isnil "_localInit") then {{_unit call _x} foreach _localInit};










//--- Reacting to danger
/*
	0 - DCEnemyDetected - the first enemy detected
	1 - DCFire - fire visible
	2 - DCHit - vehicle hit
	3 - DCEnemyNear - enemy very close to me
	4 - DCExplosion, - explosion detected
	5 - DCDeadBodyGroup - dead soldier from my group found
	6 - DCDeadBody - other dead soldier found
	7 - DCScream - hit soldier screaming
*/
[_unit,"BIS_dangerHandler",[{scriptname 'ALICE: dangerHandler';
	_unit = _this select 0;
	_danger = _this select 1;
	_twn = _unit getvariable "alice_twn";
	_dangerCoef = 0.03;

//debuglog str ["Log:::::::::::::::::::DEAD",["DCEnemyDetected","DCFire","DCHit","DCEnemyNear","DCExplosion","DCDeadBodyGroup","DCDeadBody","DCScream"] select _danger];

	//--- Clear & Present Danger
	if (_danger >= 0) then {
		_newstatus = [_twn,"ALICE_threat",(1 + _danger)*_dangerCoef] call bis_fnc_variablespaceadd;
	};

	if (random 1 > 0.02) then {
		if (_danger >= 1 ) then {
//			_screams = bis_alice_mainscope getVariable "ALICE_screams";
			[_unit] execfsm "\NR6_Alice2\data\actions\combat_hideOut.fsm";
//			_ran = floor random count _screams;
//			_selectId = _ran - (_ran % 2);
//			_topic = "ALICE_" + (_screams select _selectId);
//			_sentences = _screams select (_selectId + 1);
//			_sentenceId = _sentences call bis_fnc_selectrandom;
			//_sentenceId = format ["ALICE_Scream_0%1",ceil random 8];
			//_topic = "ALICE_BIS";
//			_unit kbtell [_unit,_topic,_sentenceId];
		};
	};
}]] call bis_fnc_variablespaceadd;

//--- Behold the mighty debug mode!
_marker = "";
if (_debug) then {
	_marker = createmarker [format ["BIS_alice_civ_%1",_id],position _unit];
	_marker setmarkertypelocal "dot";
	_marker setmarkercolor "colorwhite";
	_marker setmarkersizelocal [.6,.6];
	_marker setmarkertextlocal str(_id);
	_unit setvariable ["ALICE_marker",_marker];

	_markerx = createmarker [format ["BIS_alice_civ_%1_w",_id],position _unit];
	_markerx setmarkertypelocal "mil_destroy";
	_markerx setmarkerdirlocal 45;
	_markerx setmarkersizelocal [0.3,0.3];
	_markerx setmarkertext (str _id);
	_markerx setmarkercolor "colorwhite";

	[_unit,_marker,_markerx] spawn {
		private ["_color","_twn","_threat","_ed","_unit","_marker","_markerx"];
                _unit = _this select 0;
		_marker = _this select 1;
		_markerx = _this select 2;
		while {alive _unit} do {
			_twn = _unit getvariable "ALICE_twn";
			_threat = _twn getvariable "ALICE_threat";
			_color = "colorwhite";
			if (_threat >= 0) then {_color = "color" + (_twn getvariable "ALICE_status")};
			if (_twn == _unit) then {_color = "coloryellow"};
			_marker setmarkercolor _color;
			_marker setmarkerpos position vehicle _unit;
			_ed = (expecteddestination _unit) select 0;
			_markerx setmarkerpos _ed;
			sleep 0.1;
		};
		_marker setmarkertype "mil_dot";
		_marker setmarkercolor "colorbrown";
		if (isnull _unit) then {deletemarker _marker};
		deletemarker _markerx;
	};
};

true;