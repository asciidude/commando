function ListContains(list, x)
	for _, v in pairs(list) do
        if v == null then return false end
		if v == x then return true end
	end
	return false
end

function SetTrafficDensity(density)
    SetParkedVehicleDensityMultiplierThisFrame(density)
    SetVehicleDensityMultiplierThisFrame(density)
    SetRandomVehicleDensityMultiplierThisFrame(density)
    SetParkedVehicleDensityMultiplierThisFrame(density)
end

function SetPedDensity(density)
    SetPedDensityMultiplierThisFrame(density)
    SetScenarioPedDensityMultiplierThisFrame(density)
end

function Notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true,false)
end

function GiveWeaponToPlayer(hash, ammo, forceHolster)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(hash), ammo, false, forceHolster)
end

function GiveWeaponComponent(weapon, comp)
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(weapon), false) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(weapon), GetHashKey(comp))
    end
end

function RemoveWeapon(hash)
    RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey(hash))
end

function GetKeyPress(key, callback)
    Citizen.CreateThread(function()
        while true do
            Wait(0)
            if IsControlJustReleased(1, key) then
                callback()
            end
        end
    end)
end