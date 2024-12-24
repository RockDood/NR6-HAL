private ["_logic"];

_logic = (_this select 0);

missionNamespace setVariable ["RydxHQ_ReconCargo",(_logic getvariable "RydxHQ_ReconCargo")];
missionNamespace setVariable ["RydxHQ_SynchroAttack",(_logic getvariable "RydxHQ_SynchroAttack")];
missionNamespace setVariable ["RydxHQ_InfoMarkersID",(_logic getvariable "RydxHQ_InfoMarkersID")];

missionNamespace setVariable ["RydxHQ_Actions",(_logic getvariable "RydxHQ_Actions")];
missionNamespace setVariable ["RydxHQ_ActionsMenu",(_logic getvariable "RydxHQ_ActionsMenu")];
missionNamespace setVariable ["RydxHQ_TaskActions",(_logic getvariable "RydxHQ_TaskActions")];
missionNamespace setVariable ["RydxHQ_SupportActions",(_logic getvariable "RydxHQ_SupportActions")];
missionNamespace setVariable ["RydxHQ_ActionsAceOnly", (_logic getvariable "RydxHQ_ActionsAceOnly")];

missionNamespace setVariable ["RydxHQ_NoRestPlayers",(_logic getvariable "RydxHQ_NoRestPlayers")];
missionNamespace setVariable ["RydxHQ_NoCargoPlayers",(_logic getvariable "RydxHQ_NoCargoPlayers")];

missionNamespace setVariable ["RydxHQ_HQChat",(_logic getvariable "RydxHQ_HQChat")];
missionNamespace setVariable ["RydxHQ_AIChatDensity",(_logic getvariable "RydxHQ_AIChatDensity")];
missionNamespace setVariable ["RydxHQ_GarrisonV2",(_logic getvariable "RydxHQ_GarrisonV2")];
missionNamespace setVariable ["RydxHQ_NEAware",(_logic getvariable "RydxHQ_NEAware")];
missionNamespace setVariable ["RydxHQ_SlingDrop",(_logic getvariable "RydxHQ_SlingDrop")];
missionNamespace setVariable ["RydxHQ_RHQAutoFill",(_logic getvariable "RydxHQ_RHQAutoFill")];

missionNamespace setVariable ["RydxHQ_PathFinding",(_logic getvariable "RydxHQ_PathFinding")];

missionNamespace setVariable ["RydxHQ_MagicHeal",(_logic getvariable "RydxHQ_MagicHeal")];
missionNamespace setVariable ["RydxHQ_MagicRepair",(_logic getvariable "RydxHQ_MagicRepair")];
missionNamespace setVariable ["RydxHQ_MagicRearm",(_logic getvariable "RydxHQ_MagicRearm")];
missionNamespace setVariable ["RydxHQ_MagicRefuel",(_logic getvariable "RydxHQ_MagicRefuel")];