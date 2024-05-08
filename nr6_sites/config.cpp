class CfgPatches
{
	class NR6_Sites
	{
		author="NinjaRider600";
		name="NR6_Sites";
		units[]=
		{

		};
		requiredVersion=4.02;
		requiredAddons[]=
		{
			"cba_modules"
		};
		version="4.02";
		authors[]=
		{
			"NinjaRider600"
		};
		weapons[]={};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class NR6_Site_MODULES: NO_CATEGORY
	{
		displayName="NR6 Sites";
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

	class NR6_Site_Module: Module_F
	{
		scope=2;
		displayName="Site";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Site_MODULES";
		function="NR6_fnc_site";
		icon = "\NR6_Sites\icons\NR6_SITE_PIN.paa";
		functionPriority=3;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _side
			{
				displayName="Side";
				description="Selects the side of spawned forces.";
				class values
				{
					class west
					{
						name="BLUFOR";
						value="west";
						default=1;
					};
					class east
					{
						name="OPFOR";
						value="east";
					};
					class resistance
					{
						name="INDEPENDENT";
						value="resistance";
					};
					class civilian
					{
						name="CIVILIAN";
						value="civilian";
					};
				};
			};

			class _GrpQuantity
			{
				displayName="Number Of Groups";
				description="Number of groups to spawn for the site.";
				typeName="NUMBER";
				defaultValue = "3";
			};

			class _SpawnRadius
			{
				displayName="Spawn Radius";
				description="Radius of site and maximum distance for spawning and for patrols.";
				typeName="NUMBER";
				defaultValue = "150";
			};

			class _PatrolPercent
			{
				displayName="Chance Of Partol";
				description="Chance that a unit spawned will patrol instead of holding in a building.";
				typeName="NUMBER";
				defaultValue = "0.5";
			};
			class _MinBuilding
			{
				displayName="Min Building Size";
				description="How many AI positions must a building have in its configuration for it to be considered as a 'garrisonable' building.";
				typeName="NUMBER";
				defaultValue = "1";
			};
			class _Pool
			{
				displayName="Pool";
				description="Array containing the pool of groups from which the script will spawn. Example: [['rhsusf_army_ocp_teamleader', 'rhsusf_army_ocp_grenadier', 'rhsusf_army_ocp_autorifleman','rhsusf_army_ocp_rifleman'], ['rhsusf_army_ocp_grenadier', 'rhsusf_army_ocp_rifleman']]";
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
/*
	class NR6_CampSpawner_Module: Module_F
	{
		scope=2;
		displayName="Camp Spawner";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Site_MODULES";
		function="NR6_fnc_camp";
		icon = "\NR6_Sites\icons\NR6_SITE_PIN.paa";
		functionPriority=3;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _side
			{
				displayName="Troops Side";
				description="Selects the side of spawned troops.";
				class values
				{
					class west
					{
						name="BLUFOR";
						value="west";
						default=1;
					};
					class east
					{
						name="OPFOR";
						value="east";
					};
					class resistance
					{
						name="INDEPENDENT";
						value="resistance";
					};
					class civilian
					{
						name="CIVILIAN";
						value="civilian";
					};
				};
			};

			class _campside
			{
				displayName="Buildings Side";
				description="Selects the type of spawned structures.";
				class values
				{
					class west
					{
						name="BLUFOR";
						value="west";
						default=1;
					};
					class east
					{
						name="OPFOR";
						value="east";
					};
					class resistance
					{
						name="INDEPENDENT";
						value="resistance";
					};
				};
			};

			class _type
			{
				displayName="Camp Type";
				description="Selects the type of camp that will be spawned.";
				class values
				{
					class campsite
					{
						name="Campsite";
						value="campsite";
						default=1;
					};
					class comms
					{
						name="Comms";
						value="comms";
					};
					class fhq
					{
						name="Field HQ";
						value="FHQ";
					};
					class fuel
					{
						name="Fuel dept";
						value="fueld";
					};
					class heliport
					{
						name="Heliport";
						value="heli";
					};
					class HQ
					{
						name="HQ";
						value="HQ";
					};
					class medical
					{
						name="Medical";
						value="medical";
					};
					class outpost
					{
						name="Outpost";
						value="outpost";
					};
					class supplies
					{
						name="Supplies";
						value="supplies";
					};
					class support
					{
						name="Support";
						value="support";
					};
					class random
					{
						name="RANDOM";
						value="random";
					};
				};
			};

			class _climate
			{
				displayName="Climate";
				description="Selects the building type.";
				class values
				{
					class temperate
					{
						name="Temperate";
						value="temperate";
						default=1;
					};
					class desert
					{
						name="Desert";
						value="desert";
					};
					class pacific
					{
						name="Pacific";
						value="pacific";
					};
					class woodland
					{
						name="Woodland";
						value="woodland";
					};
				};
			};

			class _Campsize
			{
				displayName="Composition Size";
				description="Selects the size of camps.";
				class values
				{
					class large
					{
						name="Large";
						value="large";
					};
					class medium
					{
						name="Medium";
						value="medium";
						default=1;
					};
					class small
					{
						name="Small";
						value="small";
					};
				};
			};

			class _militarytype
			{
				displayName="Military Type";
				description="Selects the building faction type.";
				class values
				{
					class military
					{
						name="Military";
						value="mil";
						default=1;
					};
					class guerrilla
					{
						name="Guerrilla";
						value="guer";
					};
				};
			};

			class _usecup
			{
				displayName="Use CUP compositions";
				description="Selects the composition type.";
				class values
				{
					class nocup
					{
						name="Only use standard ZEC";
						value="nocup";
						default=1;
					};
					class yescup
					{
						name="Only use CUP ZEC";
						value="yescup";
					};
					class bothcup
					{
						name="Use both standard and CUP ZEC";
						value="both";
					};
				};
			};

			class _CampSpawnRadius
			{
				displayName="Camp Spawn Radius";
				description="Module will attempt to spawn camps randomly within this radius from the module.";
				typeName="NUMBER";
				defaultValue = "1500";
			};

			class _CampNumber
			{
				displayName="Camp Quantity";
				description="Number of camps to spawn.";
				typeName="NUMBER";
				defaultValue = "2";
			};

			class _GrpQuantity
			{
				displayName="Number Of Groups";
				description="Number of groups to spawn for each site.";
				typeName="NUMBER";
				defaultValue = "3";
			};

			class _SpawnRadius
			{
				displayName="Troops Spawn Radius";
				description="Size of each site and maximum distance for spawning troops and for patrols from site center.";
				typeName="NUMBER";
				defaultValue = "150";
			};

			class _PatrolPercent
			{
				displayName="Chance Of Partol";
				description="Chance that a unit spawned will patrol instead of holding in a building.";
				typeName="NUMBER";
				defaultValue = "0.5";
			};
			class _MinBuilding
			{
				displayName="Min Building Size";
				description="How many AI positions must a building have in its configuration for it to be considered as a 'garrisonable' building.";
				typeName="NUMBER";
				defaultValue = "1";
			};
			class _Pool
			{
				displayName="Pool";
				description="Array containing the pool of groups from which the script will spawn. Example: [['rhsusf_army_ocp_teamleader', 'rhsusf_army_ocp_grenadier', 'rhsusf_army_ocp_autorifleman','rhsusf_army_ocp_rifleman'], ['rhsusf_army_ocp_grenadier', 'rhsusf_army_ocp_rifleman']]";
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
	};*/
};


class CfgFunctions
{
	class NR6
	{
		class Modules
		{
			class site
			{
				description="Site";
				file="\NR6_Sites\SiteGroupNR6.sqf";
			};

			class camp
			{
				description="Camp";
				file="\NR6_Sites\CampSpawnNR6.sqf";
			};

			class sitei
			{
				description="Site init";
				file="\NR6_Sites\SInitNR6.sqf";
				preinit=1;
			};

			class CBA_Defend
			{
				description="Sites Defend from CBA";
				file="\NR6_Sites\fnc_taskDefend.sqf";
			};
		};	
	};
};

