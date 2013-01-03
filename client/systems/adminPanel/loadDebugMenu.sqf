//	@file Version: 1.0
//	@file Name: loadDebugMenu.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define debugMenu_option 50003
disableSerialization;

private ["_start","_panelOptions","_debugSelect","_displayDebug"];

_start = createDialog "DebugMenu";

_displayDebug = uiNamespace getVariable "DebugMenu";
_debugSelect = _displayDebug displayCtrl debugMenu_option;

_panelOptions = ["Access Gun Store",
				"Access General Store",
				"Access Respawn Dialog",
				"Access Proving Grounds",
                "Restart Function",
                "Test Function"
];

{
	_debugSelect lbAdd _x;
} forEach _panelOptions;