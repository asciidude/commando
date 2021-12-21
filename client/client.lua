RegisterCommand(Config.VEHICLE_COMMAND, function(src, args)
    if not args[1] then
        Notify('~r~~h~You must input a vehicle name')
        return
    end

    if ListContains(Config.VEHICLE_RESTRICTED_VEHICLES, args[1]) then
        if not ListContains(Config.VEHICLE_RESTRICTED_ALLOW_GROUPS, GetPlayerGroup(-1)) then
            Notify('~r~~h~' .. args[1]:upper() ..  ' is restricted.')
            return
        end
    end

    -- Check if vehicle exists
    if not IsModelInCdimage(args[1]) or not IsModelAVehicle(args[1]) then
        Notify('~r~~h~' .. args[1]:upper() ..  ' ~s~does not exist.')
        return
    end

    -- Load model
    RequestModel(args[1])

    while not HasModelLoaded(args[1]) do
        Wait(500)
    end

    local pos = GetEntityCoords(PlayerPedId())
    local vehicle = CreateVehicle(args[1], pos.x, pos.y, pos.z, GetEntityHeading(PlayerPedId()), true, false)

    if Config.VEHICLE_REMOVE_INSIDE then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        DeleteEntity(vehicle)
    end

    if Config.VEHICLE_SPAWN_INSIDE then
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end

    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(args[1])

    Notify('~r~~h~' .. args[1]:upper() ..  ' ~s~has been spawned.')
end, Config.VEHICLE_RESTRICTED)

RegisterCommand(Config.DV_COMMAND, function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle == 0 then
        if Config.DV_FAIL then
            Notify('~r~~h~Please enter a vehicle to run this command.')
            return
        end
    end

    DeleteEntity(vehicle)

    if Config.DV_COMPLETION then
        Notify('~r~~h~Your vehicle has been deleted.')
    end
end, Config.DV_RESTRICTED)

RegisterCommand(Config.DV_ALL_COMMAND, function()
    for veh in EnumerateVehicles() do
        if not IsPedAPlayer(GetPedInVehicleSeat(veh, -1)) then
            SetVehicleHasBeenOwnedByPlayer(veh, false)
            SetEntityAsMissionEntity(veh, false, false)
            DeleteVehicle(veh)

            if DoesEntityExist(veh) then
                DeleteVehicle(veh)
            end
        end
    end

    if Config.DV_ALL_COMPLETION then
        Notify('~r~~h~All unoccupied vehicles has been deleted.')
    end
end, Config.DV_ALL_RESTRICTED)

if Config.RM_ALL_AI then
    Citizen.CreateThread(function()
        while true do
            Wait(0) -- Every tick

            SetTrafficDensity(0.0)
            SetPedDensity(0.0)
        end
    end)
end

RegisterCommand(Config.POLICE_LOADOUT_COMMAND, function()
    if Config.POLICE_LOADOUT_RM_ALL_WEAPONS then
        RemoveAllPedWeapons(GetPlayerPed(-1), true)
    end

    GiveWeaponToPlayer('weapon_combatpistol', 100, true)
    GiveWeaponComponent('weapon_combatpistol', 'COMPONENT_AT_PI_FLSH')

    GiveWeaponToPlayer('weapon_flashlight', 100, false)
    GiveWeaponToPlayer('weapon_nightstick', 100, false)
    GiveWeaponToPlayer('weapon_stungun', 100, false)

    GiveWeaponToPlayer('weapon_pumpshotgun', 100, false)
    GiveWeaponComponent('weapon_pumpshotgun', 'COMPONENT_AT_AR_FLSH')

    GiveWeaponToPlayer('weapon_carbinerifle', 100, false)
    GiveWeaponComponent('weapon_carbinerifle', 'COMPONENT_AT_AR_FLSH')

    AddArmourToPed(GetPlayerPed(-1), 100)

    if Config.POLICE_LOADOUT_NOTIFY_COMPLETION then
        Notify('~b~You have equipped the police loadout')
    end
end, POLICE_LOADOUT_RESTRICTED)

