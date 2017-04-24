// by Xeno
//#define __DEBUG__
#define THIS_FILE "initPlayerServer.sqf"
#include "x_setup.sqf"
//diag_log [diag_frameno, diag_ticktime, time, "Executing MPF initPlayerServer.sqf"];
__TRACE_1("","_this")

params ["_pl"];

if (str _pl == "HC_D_UNIT") exitWith {
	d_HC_CLIENT_OBJ_OWNER = owner HC_D_UNIT;
	__TRACE_1("","d_HC_CLIENT_OBJ_OWNER")
};

private _name = name _pl;
private _uid = getPlayerUID _pl;

private _p = d_player_store getVariable _uid;
private _f_c = false;
if (isNil "_p") then {
	_p = [d_AutoKickTime, time, "", 0, str _pl, sideUnknown, _name, 0, [-2, xr_max_lives] select (xr_max_lives != -1), 0, "", [], []];
	d_player_store setVariable [_uid, _p];
	_f_c = true;
	__TRACE_3("Player not found","_uid","_name","_p")
} else {
	__TRACE_1("player store before change","_p")
	if (_name != _p select 6) then {
		[format [localize "STR_DOM_MISSIONSTRING_506", _name, _p select 6], "GLOBAL"] remoteExecCall ["d_fnc_HintChatMsg", [0, -2] select isDedicated];
		diag_log format [localize "STR_DOM_MISSIONSTRING_942", _name, _p select 6, _uid];
	};
	if (time - (_p select 9) > 600) then {
		_p set [8, xr_max_lives];
	};
	_p set [1, time];
	_p set [4, str _pl];
	_p set [6, _name];
	__TRACE_1("player store after change","_p")
};

_p remoteExecCall ["d_fnc_player_stuff", owner _pl];

if (d_database_found) then {
	//private _dbresult = parseSimpleArray ("extdb3" callExtension format ["0:dom:playerGet:%1", _uid]);
	//private _dbresult = parseSimpleArray ("extdb3" callExtension format ["0:dom:playerExists:%1", _uid]);
	private _dbresult = parseSimpleArray ("extdb3" callExtension format ["0:dom:playerGetTS:%1", _uid]);
	//private _dbresult = parseSimpleArray ("extdb3" callExtension format ["0:dom:playerGetPT:%1", _uid]);
	__TRACE_1("","_dbresult")
	if (_dbresult select 0 == 1) then {
		//if !(((_dbresult select 1) select 0) select 0) then {
		if (_dbresult select 1 isEqualTo []) then {
			// create new database entry for UID
			__TRACE("creating new db entry");
			"extdb3" callExtension format ["1:dom:playerInsert:%1:%2", _uid, _name];
		} else {
			__TRACE("adding nums played for player in db");
			"extdb3" callExtension format ["1:dom:numplayedAdd:%1", _uid];
			if (d_set_pl_score_db && {_f_c && {isNil {d_player_store getVariable (_uid + "_scores")}}}) then {
				__TRACE("Adding score");
				#ifdef __DEBUG__
				private _tspp = ((_dbresult select 1) select 0) select 0;
				__TRACE_1("","_tspp")
				__TRACE_1("","score _pl")
				#endif
				d_player_store setVariable [_uid + "_scores", [0, 0, 0, 0, 0, ((_dbresult select 1) select 0) select 0]];
				[_pl, ((_dbresult select 1) select 0) select 0] spawn {
					params ["_pl", "_tsp"];
					sleep 5;
					_pl addScore (_tsp - score _pl);
				};
			};
		};
		_dbresult = parseSimpleArray ("extdb3" callExtension format ["0:dom:playerGet:%1", _uid]);
		__TRACE_1("","_dbresult")
		if (_dbresult select 0 == 1) then { 
			[missionNamespace, ["d_pl_db_mstart", (_dbresult select 1) select 0]] remoteExecCall ["setVariable", _pl];
		};
	};
};

[player] call d_fnc_addceo;

//diag_log [diag_frameno, diag_ticktime, time, "MPF initPlayerServer.sqf processed"];