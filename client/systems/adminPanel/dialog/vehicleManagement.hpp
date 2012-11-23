class VehicleManagement
{
    name=SpawnMenu;
    idd=-1;
    movingEnable=1;
    controlsBackground[]={SpawnMenu_background};
    objects[]={};
    controls[]={SpawnMenu_playerName, SpawnMenu_options, SpawnMenu_activate1, SpawnMenu_activate2,SpawnMenu_1,SpawnMenu_2,SpawnMenu_3,SpawnMenu_4,SpawnMenu_5,SpawnMenu_6};

    class SpawnMenu_playerName:w_RscText
    {
        idc=-1;
        text="Vehicle Management";
        x=0.02;
        y=0.14;
        w=2.50;
        h=0.03;
    };
    class SpawnMenu_1:w_RscText
    {
        idc=38761;
        text="Object: ";
        x=0.02;
        y=0.75;
        w=0.50;
        h=0.04;
    };
    class SpawnMenu_2:w_RscText
    {
        idc=38762;
        text="Type: ";
        x=0.02;
        y=0.79;
        w=0.50;
        h=0.04;
    };
    class SpawnMenu_3:w_RscText
    {
        idc=38763;
        text="Weapons: ";
        x=0.02;
        y=0.83;
        w=0.50;
        h=0.04;
    };
    class SpawnMenu_4:w_RscText
    {
        idc=38764;
        text="Speed: ";
        x=0.02;
        y=0.87;
        w=0.50;
        h=0.04;
    };
    class SpawnMenu_5:w_RscText
    {
        idc=38765;
        text="Users: ";
        x=0.02;
        y=0.91;
        w=0.50;
        h=0.04;
    };
    class SpawnMenu_6:w_RscText
    {
        idc=38766;
        text="Damage: ";
        x=0.02;
        y=0.95;
        w=0.50;
        h=0.04;
    };

    class SpawnMenu_options:w_Rsclist
    {
        idc=13372;
        onLBSelChanged="[1,_this select 1] execVM ""client\systems\adminPanel\importvalues.sqf"";";
        x=0.02;
        y=0.21;
        w=0.72;
        h=0.49;
    };

    class SpawnMenu_activate1:RscButton
    {
        idc=-1;
        text="Delete";
        action="[1] execVM ""client\systems\adminPanel\deleteVehicle.sqf"";";
        x=0.02;
        y=1.00;
        w=0.15;
        h=0.07;
    };
    class SpawnMenu_activate2:RscButton
    {
        idc=-1;
        text="Announce";
        action="[1] execVM ""client\systems\adminPanel\deleteVehicle.sqf"";";
        x=0.18;
        y=1.00;
        w=0.15;
        h=0.07;
    };

    class SpawnMenu_background:w_RscBackground
    {
        idc=-1;
        x=0.00;
        y=0.10;
        w=0.76;
        h=1.00;
    };
};