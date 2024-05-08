class CfgPatches
{
	class NR6_Tools
	{
		author="NinjaRider600";
		name="NR6_Tools";
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
			"NinjaRider600"
		};
		weapons[]={};
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class NR6_Tools_MODULES: NO_CATEGORY
	{
		displayName="NR6 Tools";
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

	class NR6_AssetCompiler_Module: Module_F
	{
		scope=2;
		displayName="Asset Compiler";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_AssetCompiler";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=2;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _ArrVar
			{
				displayName="Array Variable";
				description="Assets pool will be stored under this variable if desired. Does not work for Air Reinforcements.";
				typeName="STRING";
				defaultValue = "";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Compiles an assets pool based on synchronized units and groups of units. Works for spawns, reinforcements, sites and air reinforcements.";
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

	class NR6_RHQ_SpecFor_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Spec Ops";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Recon_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Recon";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_FO_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Forward Observers";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Snipers_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Snipers";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_ATInf_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ AT Infantry";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_AAInf_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ AA Infantry";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Inf_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ All Infantry";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_HArmor_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Heavy Armor";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_MArmor_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Medium Armor";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_LArmor_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Light Armor";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_LarmorAT_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Light AT Armor";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Cars_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Soft Vehicles";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Air_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Aircraft";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_NCAir_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Unarmed Aircraft";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_BAir_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Ground Attack Aircraft";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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
	
	class NR6_RHQ_RAir_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Recon Aircraft";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Naval_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Boats";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Static_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Static Weapons";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_StaticAA_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Static AA";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_StaticAT_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Static AT";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Support_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Supports";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Med_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Medical Supports";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Ammo_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Ammo Supports";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Fuel_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Fuel Supports";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Rep_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Repair Supports";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Cargo_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Cargo Vehicles";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_NCCargo_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Unarmed Cargo Vehicles";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Crew_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Crewmembers";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_Art_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Artillery";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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

	class NR6_RHQ_RocketArty_Module: Module_F
	{
		scope=2;
		displayName="HAL RHQ Rocket Artillery";
		author="NinjaRider600";
		vehicleClass="Modules";
		category="NR6_Tools_MODULES";
		function="NR6_fnc_RHQComp";
//		icon = "\NR6_Reinforcements\icons\NR6_REINF_PIN.paa";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=1;
		isDisposable=1;
		is3DEN=0;
		class Arguments: ArgumentsBaseUnits
		{
			class _Counter
			{
				displayName="Remove Mode";
				description="Module will instead remove classes from the RHQ array.";
				typeName="BOOL";
				defaultValue = "False";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description="Adds the synced unit's class to the given RHQ pool.";
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
	class NR6
	{
		class Modules
		{
			class AssetCompiler
			{
				description="AssetCompiler";
				file="\NR6_Tools\AssetCompilerNR6.sqf";
			};

			class RHQComp
			{
				description="RHQComp";
				file="\NR6_Tools\RHQComp.sqf";
			};

		};	
	};
};

