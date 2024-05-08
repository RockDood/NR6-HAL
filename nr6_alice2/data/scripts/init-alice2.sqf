//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: (AEF)Wolffy.au [CTB]
// Created: 20110315
// Modified: 20110926
// Contact: http://dev-heaven.net/projects/mip
// Purpose: Setup ambient civilian module
///////////////////////////////////////////////////////////////////
if(!isServer) exitWith{};

[] spawn {

waitUntil{!isNil "BIS_fnc_init"};
waitUntil{!isNil "BIS_alice_mainscope"};

// Override default BIS_ALICE2_fnc_civilianSet function with MIP patch
// - Fixed issues with units spawning on roofs in Chernarus
// - Fixed some typos
// - Added bis_alice_emptydoor code for A2 building compatibility
// - Reduced default AI skill for less CPU
// - Changed unit speed to LIMITED
BIS_ALICE2_fnc_civilianSet = compile preprocessFileLineNumbers "\NR6_Alice2\data\scripts\fn_civilianSet.sqf";

// See http://community.bistudio.com/wiki/Ambient_Civilians
//BIS_alice_mainscope setVariable ["debug", true, true];

// list of places where civilians will be spawned. Can be location logic (created by BIS_fnc_locations), array in format [center,distance] or trigger. 
// BIS_alice_mainscope setVariable ["townlist",[bis_loc_acityc_mogilevka,[position this,3000],trigger1]]; 

// distance of player(s) to town logic (in metres) in which system is starting to spawn civilians. 
// BIS_alice_mainscope setVariable ["spawnDistance", 400]; 

// distance of player(s) to town logic (in metres) in which system is starting to spawn civilian traffic. 
// BIS_alice_mainscope setVariable ["trafficDistance", 500]; 

// Changing civilian rarity numbers (e.g. to have villagers spawned in cities, or to disable spawning of given class completely with unusual number like 10). Default rarity numbers are set in config under rarityUrban value (in range from 0/village to 1/city) 
// BIS_alice_mainscope setVariable ["vehicleRarity",["Citizen1",10,"Worker2",0.8]]; 

// formula on which basis system calculates number of civilians for locations. %1 is number of buildings with door (memory points called "AIDoor1", "AIDoor2", ...) in 500 metres from location. 
// BIS_alice_mainscope setVariable ["civilianCount","round (4 * (sqrt %1))"]; 
/*
switch toLower(worldName) do {		
        case "chernarus": {
                BIS_alice_mainscope setvariable ["trafficDistance",1000];
                BIS_alice_mainscope setvariable ["spawnDistance",700];
                BIS_alice_mainscope setVariable ["townsFaction",["CIV","CIV_RU"]];
                [] spawn compile preprocessFileLineNumbers "ca\modules_e\alice2\data\scripts\ALICE2_houseEffects.sqf";
        };
        case "eden": {
                BIS_alice_mainscope setvariable ["trafficDistance",700];
                BIS_alice_mainscope setvariable ["spawnDistance",350];
                BIS_alice_mainscope setVariable ["townsFaction",["CIV","CIV_RU"]];
                [] spawn compile preprocessFileLineNumbers "ca\modules_e\alice2\data\scripts\ALICE2_houseEffects.sqf";
        };
        case "fallujah": {
                BIS_alice_mainscope setvariable ["trafficDistance",600, true];
                BIS_alice_mainscope setvariable ["spawnDistance",250, true];
                BIS_alice_mainscope setVariable ["townsFaction",["BIS_TK_CIV","BIS_CIV_special"], true];
        };
        case "isladuala": {
                BIS_alice_mainscope setvariable ["trafficDistance",1000];
                BIS_alice_mainscope setvariable ["spawnDistance",700];
                BIS_alice_mainscope setVariable ["civilianCount","round (5 * (sqrt %1))"]; 
                [] spawn compile preprocessFileLineNumbers "ca\modules_e\alice2\data\scripts\ALICE2_houseEffects.sqf";
        };
        case "takistan": {
                BIS_alice_mainscope setvariable ["trafficDistance",1000];
                BIS_alice_mainscope setvariable ["spawnDistance",700];
                // Add some rare english speaking civilians to the mix
                BIS_alice_mainscope setVariable ["townsFaction",["BIS_TK_CIV","BIS_CIV_special"]];
        };
        case "torabora": {
                BIS_alice_mainscope setvariable ["trafficDistance",1500, true];
                BIS_alice_mainscope setvariable ["spawnDistance",600, true];
                BIS_alice_mainscope setVariable ["townsFaction",["BIS_TK_CIV","BIS_CIV_special"],true];
        };
        case "utes": {
                BIS_alice_mainscope setvariable ["trafficDistance",650];
                BIS_alice_mainscope setvariable ["spawnDistance",500];
                BIS_alice_mainscope setVariable ["townsFaction",["CIV","CIV_RU"]];
                [] spawn compile preprocessFileLineNumbers "ca\modules_e\alice2\data\scripts\ALICE2_houseEffects.sqf";
        };
        case "zargabad": {
                BIS_alice_mainscope setvariable ["trafficDistance",750];
                BIS_alice_mainscope setvariable ["spawnDistance",600];
                // Add some rare english speaking civilians to the mix
                BIS_alice_mainscope setVariable ["townsFaction",["BIS_TK_CIV","BIS_CIV_special"],true];  
                //[BIS_alice_mainscope, "civilianRarity",["CIV_EuroWoman01_EP1", 5, "CIV_EuroWoman02_EP1", 5, "Dr_Annie_Baker_EP1", 10, "Rita_Ensler_EP1", 10, "CIV_EuroMan01_EP1", 5, "CIV_EuroMan02_EP1", 5, "Haris_Press_EP1", 10, "Dr_Hladik_EP1", 10, "Citizen2_EP1", 5, "Citizen3_EP1", 5, "Profiteer2_EP1", 5, "Functionary1_EP1", 5, "Functionary2_EP1", 3]] call BIS_fnc_variableSpaceAdd;
        };
};
*/
// list of action categories from CfgCivilianActions 
// BIS_alice_mainscope setVariable ["civilianActions",["BIS"]];

// Artificial coeficient to set how much will be town's respect decreased once some civilian is hit or killed.
// The higher the number is, the more is respect towards killer's faction decreased. 
// BIS_alice_mainscope setVariable ["respectModifyCoef",0.15]; 
//BIS_alice_mainscope setvariable ["respectModifyCoef", 0.7, true]; 

// Value which is removed from town threat every 5 seconds (until threat reaches 0) 
// BIS_alice_mainscope setVariable ["threatDecay",0.07 ];
//BIS_alice_mainscope setvariable ["threatDecay", 0.00005, true];

// array of codes which is executed upon every civilian unit created. 
// [BIS_alice_mainscope,"ALICE_civilianinit",[{_this addweapon "Mk_48"}]] call bis_fnc_variablespaceadd; 
// Dumb down civilian units to use less CPU (see http://creobellum.org/node/175)
[BIS_alice_mainscope,"ALICE_civilianinit",[
        {_this setSkill 0},
        {
                {_this disableAI _x} count ["AUTOTARGET","TARGET"]
        },
        {removeAllWeapons _this},
        {removeAllItems _this},
        {
/*=		if (random 1 > 0.1) then {
			_this setSkill 0.2;
			{_this enableAI _x} count ["AUTOTARGET","TARGET"];
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
			_this addMagazine "HandGrenade_Stone";
//			if(!("Throw" in weapons _this)) then {_this addWeapon "Throw";};
		};*/
        }

]] call BIS_fnc_variableSpaceAdd;

};