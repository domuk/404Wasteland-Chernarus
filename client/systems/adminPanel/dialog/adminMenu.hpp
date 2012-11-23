class AdminMenu
{
	name=Menu;
	idd=-1;
	movingEnable=1;
	controlsBackground[]={AdminMenu_background};
	objects[]={};
	controls[]={AdminMenu_playerName, AdminMenu_options, AdminMenu_activate};

	class AdminMenu_playerName:w_RscText
	{
		idc=13390;
		text="Menu";
		x=0.35;
		y=0.14;
		w=0.088;
		h=0.035;
	};

	class AdminMenu_options:w_Rsclist
	{
		idc=2119;
		x=0.35;
		y=0.21;
		w=0.31;
		h=0.49;
	};

	class AdminMenu_activate:w_RscButton
	{
		idc=-1;
		text="Select";
		action="[player] execVM ""client\systems\adminPanel\adminSelect.sqf"";";
		x=0.40;
		y=0.74;
		w=0.22;
		h=0.071;
	};

	class AdminMenu_background:w_RscBackground
	{
		idc=-1;
		x=0.28;
		y=0.10;
		w=0.42;
		h=0.74;
	};
};