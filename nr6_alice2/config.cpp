class CfgPatches
{
	class NR6_ALICE2
	{
		author="NinjaRider600";
		name="NR6_ALICE2";
		units[]=
		{

		};
		requiredVersion=4.02;
		requiredAddons[]=
		{

		};
		version="4.02";
		authors[]=
		{
			"NinjaRider600",
			"BIS"
		};
		weapons[]={};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class NR6_Civ_MODULES: NO_CATEGORY
	{
		displayName="NR6 Civilians";
	};
};

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits;
		class ModuleDescription;
		class AttributeValues;
		
	};

//General Modules

	class NR6_ALICE2_Module: Module_F
	{
		scope=2;
		displayName="ALICE 2 (OA PORT)";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Civ_MODULES";
		function="NR6_fnc_alice2";
//		icon = "\NR6_Sites\icons\NR6_SITE_PIN.paa";
		functionPriority=3;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class spawnDistance
			{
				displayName="Spawn Radius";
				description="Radius around a player within which civilians will be spawned.";
				typeName="NUMBER";
				defaultValue = "750";
			};

			class trafficDistance
			{
				displayName="Traffic Spawn Radius";
				description="Radius around a player within which civilian traffic will be spawned.";
				typeName="NUMBER";
				defaultValue = "1500";
			};

			class civilianCount
			{
				displayName="Civilians Per House";
				description="Number of civilians spawned in a town per building.";
				typeName="NUMBER";
				defaultValue = "0.2";
			};
			class townsFaction
			{
				displayName="Factions";
				description="Array of the factions of the spawned civilians.";
				typeName="ARRAY";
				defaultValue = "[""CIV_F""]";
			};
			class manClasses
			{
				displayName="Custom Civilian Classes";
				description="Filter array for allowing only certain civilian classes to spawn. The faction of the classes must still match the previous setting.";
				typeName="ARRAY";
				defaultValue = "[]";
			};
			class vehClasses
			{
				displayName="Custom Vehicle Classes";
				description="Filter array for allowing only certain vehicle classes to spawn. The faction of the classes must still match the previous setting.";
				typeName="ARRAY";
				defaultValue = "[]";
			};
			class townlist
			{
				displayName="Town Array";
				description="Array of custom objects that will serve as town centers for spawing civilians at only certain areas.";
				typeName="ARRAY";
				defaultValue = "[]";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Spawns a site which adds populated patrols and troops in buildings. Synchronize to HAL commander module to include troops under commander's control.";
			sync[]=
			{
				"LocationArea_F"
			};
			class LocationArea_F
			{
				position=0;
				optional=0;
				duplicate=1;
				synced[]=
				{
					"Anything"
				};
			};
		};
	};
};


class CfgFunctions
{
	class BIS_ALICE2
	{
		class Default
		{
			class civilianSet
	 		{
				description = "Adds civilian unit to ALICE2 system.";
				file = "\NR6_Alice2\data\scripts\fn_civilianSet.sqf";
			};
			class civilianHit
	 		{
				description = "Decrease respect when ALICE2 civilian is hit (and commit cleanup when he dies).";
				file = "\NR6_Alice2\data\scripts\fn_civilianHit.sqf";
			};
			class civilianKilled
	 		{
				description = "Cleanup when civilian is killed.";
				file = "\NR6_Alice2\data\scripts\fn_civilianKilled.sqf";
			};
		};
	};

	class NR6
	{
		class Modules
		{
			class alice2
			{
				description="alice2";
				file="\NR6_Alice2\data\scripts\main.sqf";
			};
		};	
	};
};

