class CfgPatches {
    class odin_main {
        authors[] = {"zuedev"};
        authorUrl = "https://github.com/zuedev";
        name = "main";
        requiredAddons[] = {};
        requiredVersion = 2.16;
        units[] = {};
        weapons[] = {};
    };
};

class CfgFunctions {
    class ODIN {
        class ordinance {
            file = "\z\ODIN\addons\main\functions\ordinance";
            class fireOnEnemies {};
        };
    };
};