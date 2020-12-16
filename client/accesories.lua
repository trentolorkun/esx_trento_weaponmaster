local ESX = nil
local weapons = {
    [GetHashKey('WEAPON_PISTOL')] = { supressor = GetHashKey('component_at_pi_supp_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE') },
    [GetHashKey('WEAPON_PISTOL50')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE') },
    [GetHashKey('WEAPON_COMBATPISTOL')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = nil },
    [GetHashKey('WEAPON_APPISTOL')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE') },
    [GetHashKey('WEAPON_HEAVYPISTOL')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE') },
    [GetHashKey('WEAPON_VINTAGEPISTOL')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = nil, grip = nil, weaponskin = nil },
    [GetHashKey('WEAPON_SMG')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_SMG_VARMOD_LUXE') },
    [GetHashKey('WEAPON_MICROSMG')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE') },
    [GetHashKey('WEAPON_ASSAULTSMG')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = nil },
    [GetHashKey('WEAPON_ASSAULTRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE') },
    [GetHashKey('WEAPON_CARBINERIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE') },
    [GetHashKey('WEAPON_ADVANCEDRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE') },
    [GetHashKey('WEAPON_SPECIALCARBINE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil },
    [GetHashKey('WEAPON_BULLPUPRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil },
    [GetHashKey('WEAPON_ASSAULTSHOTGUN')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil },
    [GetHashKey('WEAPON_HEAVYSHOTGUN')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil },
    [GetHashKey('WEAPON_BULLPUPSHOTGUN')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil },
    [GetHashKey('WEAPON_PUMPSHOTGUN')] = { supressor = GetHashKey('COMPONENT_AT_SR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = nil },
    [GetHashKey('WEAPON_MARKSMANRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil },
    [GetHashKey('WEAPON_SNIPERRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = nil, grip = nil, weaponskin = nil },
    [GetHashKey('WEAPON_COMBATPDW')] = { supressor = nil, flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil }
}
 
-- ESX
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)
 
-- ESX, playerloaded
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)
 
-- Use item
RegisterNetEvent('esx_trento_weaponmaster:use')
AddEventHandler('esx_trento_weaponmaster:use', function( type )
    if weapons[GetSelectedPedWeapon(PlayerPedId())] and weapons[GetSelectedPedWeapon(PlayerPedId())][type] then
        if not HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type]) then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
            ESX.ShowNotification(string.format('%s %s', "Has equipado tu ", type))
        else
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
            ESX.ShowNotification(string.format('%s %s', "Has retirado tu ", type))
        end
    else
        ESX.ShowNotification(string.format('%s %s %s', 'Ese accesorio no se puede adherir a tu arma...'))
    end
end)

-- Add tint 
RegisterNetEvent('esx_trento_weaponmaster:addtint')
AddEventHandler('esx_trento_weaponmaster:use', function(type)
    local inventory = ESX.GetPlayerData().inventory
	local lspdtint = 0
		for i=1, #inventory, 1 do
		  if inventory[i].name == 'lspdtint' then
			lspdtint = inventory[i].count
		  end
		end
		
local ped = PlayerPedId()
local currentWeaponHash = GetSelectedPedWeapon(ped)

		if usedSight < lspdtint then
			if currentWeaponHash == GetHashKey("WEAPON_SMG") then
				SetPedWeaponTintIndex(GetPlayerPed(-1),  GetHashKey("WEAPON_SMG"), 5)	
		  		ESX.ShowNotification(("Acabas de equipar el camuflaje de la LSPD. Reequípala al volver a la ciudad.")) 
				usedLSPDTint = usedLSPDTint + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
				SetPedWeaponTintIndex(GetPlayerPed(-1),  GetHashKey("WEAPON_COMBATPDW"), 5)  
				ESX.ShowNotification(("Acabas de equipar el camuflaje de la LSPD. Reequípala al volver a la ciudad.")) 
				usedLSPDTint = usedLSPDTint + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
				SetPedWeaponTintIndex(GetPlayerPed(-1),  GetHashKey("WEAPON_CARBINERIFLE"), 5)  
		  		ESX.ShowNotification(("Acabas de equipar el camuflaje de la LSPD. Reequípala al volver a la ciudad.")) 
				usedLSPDTint = usedLSPDTint + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
				SetPedWeaponTintIndex(GetPlayerPed(-1),  GetHashKey("WEAPON_SNIPERRIFLE"), 5)  
		  		ESX.ShowNotification(("Acabas de equipar el camuflaje de la LSPD. Reequípala al volver a la ciudad.")) 
				usedLSPDTint = usedLSPDTint + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
				SetPedWeaponTintIndex(GetPlayerPed(-1),  GetHashKey("WEAPON_SPECIALCARBINE"), 5) 
				ESX.ShowNotification(("Acabas de equipar el camuflaje de la LSPD. Reequípala al volver a la ciudad.")) 
				usedLSPDTint = usedLSPDTint + 1
			
			elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
				SetPedWeaponTintIndex(GetPlayerPed(-1),  GetHashKey("WEAPON_PUMPSHOTGUN"), 5)  
				ESX.ShowNotification(("Acabas de equipar el camuflaje de la LSPD. Reequípala al volver a la ciudad.")) 
				usedLSPDTint = usedLSPDTint + 1
			
			elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
				SetPedWeaponTintIndex(GetPlayerPed(-1),  GetHashKey("WEAPON_COMBATPISTOL"), 5) 
				ESX.ShowNotification(("Acabas de equipar el camuflaje de la LSPD. Reequípala al volver a la ciudad.")) 
				usedLSPDTint = usedLSPDTint + 1

		  	else 
		  		ESX.ShowNotification(("No tienes ningún arma en mano, o el arma que tienes no puede llevar este tipo de accesorio."))
			end
		else
			ESX.ShowNotification(("Ya has usado todos los camuflajes de la LSPD de tu inventario."))
		end

end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(0, 172) then
			if weapons[GetSelectedPedWeapon(PlayerPedId())] then
				for k,v in pairs(weapons) do
					if GetSelectedPedWeapon(PlayerPedId()) == k then
						if HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.supressor) then
							TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'supressor')
							ESX.ShowNotification("Has retirado el silenciador de tu arma.")
							RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.supressor)
						elseif HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.flashlight) then
							TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'flashlight')
							ESX.ShowNotification("Has retirado la linterna de tu arma.")
							RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.flashlight)
						elseif HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.weaponskin) then
							TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'weaponskin')
							ESX.ShowNotification("Has retirado la apariencia personalizada de tu arma.")
							RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.weaponskin)
						elseif HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.grip) then
							TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'grip')
							ESX.ShowNotification("Has retirado la empuñadura de tu arma.")
							RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.grip)
                        end
					end
				end
			end
		end
	end
end)