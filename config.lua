--[[
    SUFFIX MEANINGS:
        RESTRICTED: Restrict the command to certain ACE groups
        COMMAND: The command inputted to run the command

    DONT WANT A COMMAND?:
        You don't have to have one! Just make it restricted and don't
        assign it to any group, it will be rendered useless!
]]--

Config = {}

Config = {
    -- [[ Vehicle Spawner ]] --
    VEHICLE_RESTRICTED = false,
    -- The vehicles that are restricted to players that aren't in allowed groups, must be lowercase
    VEHICLE_RESTRICTED_VEHICLES = {
        'lazer',
        'jet'
    },
    VEHICLE_RESTRICTED_ALLOW_GROUPS = {0,1,2,3}, -- The group IDs allowed to use restricted vehicles
    VEHICLE_SPAWN_INSIDE = true, -- Spawn the player inside the vehicle
    VEHICLE_REMOVE_INSIDE = true, -- Remove the vehicle the player is in
    VEHICLE_COMMAND = 'vehicle',

    -- [[ Delete Vehicle ]] --
    DV_RESTRICTED = false,
    DV_FAIL = true, -- Notify the user the DV command failed to run
    DV_COMPLETION = true, -- Notify the user the DV command successfully ran
    DV_COMMAND = 'dv',

    -- [[ Delete All Vehicles ]] --
    DV_ALL_RESTRICTED = false,
    DV_ALL_COMPLETION = true, -- Notify the user dvall has been completed
    DV_ALL_COMMAND = 'dvall',

    -- [[ Remove all AI | Sometimes you will see some AI ]] --
    RM_ALL_AI = true, -- Remove all AI from the game
    RM_ALL_AI_TRAFFIC = true, -- Remove all traffic AI from the game, RM_ALL_AI must be true
    RM_ALL_AI_PED = true, -- Remove all ped AI from the game, RM_ALL_AI must be true

    -- [[ Police Loadout ]] --
    POLICE_LOADOUT_RESTRICTED = false,
    POLICE_LOADOUT_NOTIFY_COMPLETION = true, -- Notify when the police loadout has been equipped
    POLICE_LOADOUT_RM_ALL_WEAPONS = true, -- Remove all weapons when equipping loadout
    POLICE_LOADOUT_COMMAND = 'loadout',

    -- [[ OOC Default Chat ]] --
    -- This will make it to where every message sent (if not using a command) will be cancelled
    -- And the returned message will be in OOC. Conviniently you can edit what it says.
    OOC_CHAT_DEFAULT = true,
    OOC_CHAT_PREFIX = '^7[^1OOC^7]' -- https://forum.cfx.re/t/chat-formatting-colors-bold-underline/67641
}