NR6_Player_Menu = 
[
	["HAL Comm Menu",false],
	["Tasking Options", [2], "#USER:NR6_Tasking_Menu", -5, [["expression", ""]], "1", "1"],
	["Supports Options", [3], "#USER:NR6_Supports_Menu", -5, [["expression", ""]], "1", "1"],
	["Logistics Options", [4], "#USER:NR6_Logistics_Menu", -5, [["expression", ""]], "1", "1"]
];

NR6_Tasking_Menu = 
[
	["Tasking Options",false],
	["Deny Assigned Task", [2], "", -5, [["expression", "[player] remoteExec ['Action1ct',2]"]], "1", "1"],
	["Disable Tasking", [3], "", -5, [["expression", "[player] remoteExec ['Action2ct',2]"]], "1", "1"],
	["Enable Tasking", [4], "", -5, [["expression", "[player] remoteExec ['Action3ct',2]"]], "1", "1"]
];

NR6_Supports_Menu = 
[
	["Supports Options",false],
	["Request Air Support", [2], "", -5, [["expression", "[player] remoteExec ['Action4ct',2]"]], "1", "1"],
	["Request Infantry Support", [3], "", -5, [["expression", "[player] remoteExec ['Action5ct',2]"]], "1", "1"],
	["Request Armored Support", [4], "", -5, [["expression", "[player] remoteExec ['Action6ct',2]"]], "1", "1"],
	["Request Air Transport", [5], "", -5, [["expression", "[player] remoteExec ['Action7ct',2]"]], "1", "1"],
	["Request Ground Transport", [6], "", -5, [["expression", "[player] remoteExec ['ActionGTct',2]"]], "1", "1"],
	["Request Artillery Support", [7], "", -5, [["expression", "[player] spawn ActionArtct"]], "1", "1"]
];

NR6_Logistics_Menu = 
[
	["Logistics Options",false],
	["Request Ammunition Drop", [2], "", -5, [["expression", "[player] remoteExec ['Action8ct',2]"]], "1", "1"],
	["Request Ammunition Truck", [3], "", -5, [["expression", "[player] remoteExec ['Action9ct',2]"]], "1", "1"],
	["Request Fuel Truck", [4], "", -5, [["expression", "[player] remoteExec ['Action10ct',2]"]], "1", "1"],
	["Request Ambulance", [5], "", -5, [["expression", "[player] remoteExec ['Action11ct',2]"]], "1", "1"],
	["Request Aerial Medical Support", [6], "", -5, [["expression", "[player] remoteExec ['Action12ct',2]"]], "1", "1"],
	["Request Repair Support", [7], "", -5, [["expression", "[player] remoteExec ['Action13ct',2]"]], "1", "1"]
];