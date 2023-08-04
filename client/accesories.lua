local ESX = nil
local weapons = {
    [GetHashKey('WEAPON_PISTOL')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE') },
    [GetHashKey('WEAPON_PISTOL50')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE'), extendedclip = GetHashKey('COMPONENT_PISTOL50_CLIP_02') },
    [GetHashKey('WEAPON_COMBATPISTOL')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = 5 },
    [GetHashKey('WEAPON_APPISTOL')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE') },
    [GetHashKey('WEAPON_HEAVYPISTOL')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE') },
    [GetHashKey('WEAPON_VINTAGEPISTOL')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = nil, grip = nil, weaponskin = nil },
    [GetHashKey('WEAPON_SMG')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_SMG_VARMOD_LUXE'), scope= GetHashKey('COMPONENT_AT_SCOPE_MACRO_02') },
    [GetHashKey('WEAPON_MICROSMG')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE'), scope= GetHashKey('COMPONENT_AT_SCOPE_MACRO'), extendedclip = GetHashKey('COMPONENT_MICROSMG_CLIP_02') },
    [GetHashKey('WEAPON_ASSAULTSMG')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = nil },
    [GetHashKey('WEAPON_ASSAULTRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE'), scope= GetHashKey('COMPONENT_AT_SCOPE_MACRO') },
    [GetHashKey('WEAPON_CARBINERIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE'), scope= GetHashKey('COMPONENT_AT_SCOPE_MEDIUM') },
    [GetHashKey('WEAPON_ADVANCEDRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE'), scope= GetHashKey('COMPONENT_AT_SCOPE_SMALL') },
    [GetHashKey('WEAPON_SPECIALCARBINE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), scope= GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'), weaponskin = nil },
    [GetHashKey('WEAPON_BULLPUPRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), scope= GetHashKey('COMPONENT_AT_SCOPE_SMALL'),  weaponskin = nil },
    [GetHashKey('WEAPON_ASSAULTSHOTGUN')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil },
    [GetHashKey('WEAPON_HEAVYSHOTGUN')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil },
    [GetHashKey('WEAPON_BULLPUPSHOTGUN')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil },
    [GetHashKey('WEAPON_PUMPSHOTGUN')] = { supressor = GetHashKey('COMPONENT_AT_SR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = nil },
    [GetHashKey('WEAPON_MARKSMANRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), weaponskin = nil },
    [GetHashKey('WEAPON_SNIPERRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = nil, grip = nil, weaponskin = nil },
    [GetHashKey('WEAPON_COMBATPDW')] = { supressor = nil, flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP'), scope= GetHashKey('COMPONENT_AT_SCOPE_SMALL'), weaponskin = nil },

	--MK2
	[GetHashKey('WEAPON_PISTOL_MK2')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH_02'), grip = nil, weaponskin = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_PISTOL_MK2_CLIP_02'), scope= GetHashKey('COMPONENT_AT_PI_RAIL'), lspdtint = 2},     
	[GetHashKey('WEAPON_SNSPISTOL_MK2')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_PI_FLSH_03'), grip = nil, weaponskin = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_SNSPISTOL_MK2_CLIP_02'), scope= GetHashKey('COMPONENT_AT_PI_RAIL_02'), lspdtint = 2},
	[GetHashKey('WEAPON_REVOLVER_MK2')] = { supressor = nil, flashlight = GetHashKey('COMPONENT_AT_PI_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_REVOLVER_MK2_CLIP_TRACER'), scope= GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2'), lspdtint = 2},
	[GetHashKey('WEAPON_SMG_MK2')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_SMG_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SCOPE_SMALL_SMG_MK2'), lspdtint = 2},
	[GetHashKey('WEAPON_PUMPSHOTGUN_MK2')] = { supressor = GetHashKey('COMPONENT_AT_SR_SUPP_03'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
	[GetHashKey('WEAPON_ASSAULTRIFLE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
	[GetHashKey('WEAPON_CARBINERIFLE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
	[GetHashKey('WEAPON_SPECIALCARBINE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP_02'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
	[GetHashKey('WEAPON_BULLPUPRIFLE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
	[GetHashKey('WEAPON_COMBATMG_MK2')] = { supressor = nil, flashlight = nil, grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO_10'), extendedclip = nil, scope= GetHashKey('COMPONENT_AT_SIGHTS'), lspdtint = 2},
	[GetHashKey('WEAPON_HEAVYSNIPER_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CLIP_02'), scope= GetHashKey('COMPONENT_AT_SCOPE_NV'), lspdtint = 2},
	[GetHashKey('WEAPON_MARKSMANRIFLE_MK2')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'), weaponskin = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO_10'), extendedclip = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CLIP_02'), scope= GetHashKey('COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2'), lspdtint = 2},
	[GetHashKey('WEAPON_CERAMICPISTOL')] = { supressor = GetHashKey('COMPONENT_AT_PI_SUPP'), flashlight = nil, grip = nil, weaponskin = nil, extendedclip = GetHashKey('COMPONENT_VINTAGEPISTOL_CLIP_02'), scope= nil, lspdtint = 2},
	[GetHashKey('WEAPON_COMBATSHOTGUN')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = nil, extendedclip = nil, scope= nil, lspdtint = 2},
	[GetHashKey('WEAPON_COMPACTRIFLE')] = { supressor = nil, flashlight = nil, grip = nil, weaponskin = nil, extendedclip = GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_02'), scope= nil, lspdtint = 2},
	[GetHashKey('WEAPON_MILITARYRIFLE')] = { supressor = GetHashKey('COMPONENT_AT_AR_SUPP'), flashlight = GetHashKey('COMPONENT_AT_AR_FLSH'), grip = nil, weaponskin = nil, extendedclip = GetHashKey('COMPONENT_MILITARYRIFLE_CLIP_02'), scope= GetHashKey('COMPONENT_AT_SCOPE_SMALL'), lspdtint = 2},
	[GetHashKey('WEAPON_COMPACTRIFLE')] = { supressor = nil, flashlight = nil, grip = nil, weaponskin = nil, extendedclip = GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_02'), scope= nil, lspdtint = 2},
}
local tint = 0
 
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

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end
 
-- Use item
RegisterNetEvent('esx_trento_weaponmaster:use')
AddEventHandler('esx_trento_weaponmaster:use', function(type)
	ped = GetPlayerPed(-1)
	
    if weapons[GetSelectedPedWeapon(PlayerPedId())] and weapons[GetSelectedPedWeapon(PlayerPedId())][type] then
        if not HasPedGotWeaponComponent(ped, GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type]) then
			ESX.TriggerServerCallback('esx_trento_weaponmaster:removeItem', function(allowed)
				if (allowed) then
					GiveWeaponComponentToPed(ped, GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
            		ESX.ShowNotification(string.format('%s %s', "Has equipado tu ", type))
				end
			end, type)
        else
			ESX.TriggerServerCallback('esx_trento_weaponmaster:addItem', function(allowed)
				if (allowed) then
					RemoveWeaponComponentFromPed(ped, GetSelectedPedWeapon(PlayerPedId()), weapons[GetSelectedPedWeapon(PlayerPedId())][type])  
            		ESX.ShowNotification(string.format('%s %s', "Has retirado tu ", type))
				end
			end, type) 
        end
    else
        ESX.ShowNotification('Ese accesorio no se puede adherir a tu arma...')
    end
end)


RegisterNetEvent('esx_trento_weaponmaster:parachuteTint')
AddEventHandler('esx_trento_weaponmaster:parachuteTint', function(args)
	--local inventory = ESX.GetPlayerData().inventory

	--local ped = PlayerPedId()
	--local currentWeaponHash = GetSelectedPedWeapon(ped)
	args[1] = tonumber(args[1]) 
    
	if args[1] == nil then 
		ESX.ShowNotification(string.format('%s', "Para seleccionar un color de paracaídas, escribe /paracaidas [índice]. Los colores son: \n" ..
											"0 = Arcoiris \n" .. "1 = Rojo oscuro \n" .. "2 = Costero (blanco, azúl y amarillo) \n" .. "3 = WidowMaker (negro, rojo y blanco)\n" ..
											"4 = Patriota (rojo, blanco y azúl)\n" .. "5 = Azúl \n" .. "6 = Negro \n" .. "7 = Avispa (Negro y amarillo)"))
	else

    	if args[1] < 0 or args[1] > 7 then
        	ESX.ShowNotification(string.format('%s', "El número de tinte no es válido. El color del paracaidas tiene que ir del 0 al 7."))
    	else 
        	tint = args[1]
        	ESX.ShowNotification(string.format('%s', "Ahora se aplicará el tinte seleccionado el paracaídas."))
			SetPedParachuteTintIndex(GetPlayerPed(-1), tint)
    	end
    end
end)

RegisterNetEvent('esx_trento_weaponmaster:parachuteSmokeTint')
AddEventHandler('esx_trento_weaponmaster:parachuteSmokeTint', function(args)
	local inventory = ESX.GetPlayerData().inventory

	local ped = PlayerPedId()
	local currentWeaponHash = GetSelectedPedWeapon(ped)
	if args[1] == nil or args[2] == nil or args[3] == nil then
		ESX.ShowNotification(string.format('%s', "El color introducido no es válido. Tienes que introducir un valor de rojo, verde y azúl, cada uno de 0 a 255."))	
	else
		r = tonumber(args[1]) 
		g = tonumber(args[2])  
		b = tonumber(args[3])

		if r < 0 or r > 255 or g < 0 or g > 255 or b < 0 or b > 255 then
			ESX.ShowNotification(string.format('%s', "El color introducido no es válido. Tienes que introducir un valor de rojo, verde y azúl, cada uno de 0 a 255."))
		else
			ESX.ShowNotification(string.format('%s', "Ahora se aplicará el tinte seleccionado el paracaídas."))
			SetPlayerCanLeaveParachuteSmokeTrail(GetPlayerIndex(), true)
			SetPlayerParachuteSmokeTrailColor(GetPlayerIndex(), r, g, b)
		end
	end
end)

-- *******************************************************************************************************************************************************
--                                                         CAMBIAR LA VARIABLE DEL TINTE
-- *******************************************************************************************************************************************************

RegisterNetEvent('esx_trento_weaponmaster:changetint')
AddEventHandler('esx_trento_weaponmaster:changetint', function(args)
	--local inventory = ESX.GetPlayerData().inventory
	args[1] = tonumber(args[1])
	--local ped = PlayerPedId()
	--local currentWeaponHash = GetSelectedPedWeapon(ped)
    if args[1] < 0 or args[1] > 31 then
        ESX.ShowNotification(string.format('%s', "El número de tinte no es válido. Del 0 al 7 para armas normales y del 0 al 31 para armas MK2."))
    else 
        tint = args[1]
        ESX.ShowNotification(string.format('%s', "Ahora se aplicará el tinte seleccionado para las armas."))
    end
    
end)

-- *******************************************************************************************************************************************************
--                                                               USAR OBJETO
-- *******************************************************************************************************************************************************


-- Add tint 
RegisterNetEvent('esx_trento_weaponmaster:addtint')
AddEventHandler('esx_trento_weaponmaster:addtint', function(type)
    if weapons[GetSelectedPedWeapon(PlayerPedId())] then -- and weapons[GetSelectedPedWeapon(PlayerPedId())][type]
		if tint ~= 0 then
        	if not (GetPedWeaponTintIndex(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId())) == tint) then
        	        ESX.TriggerServerCallback('esx_trento_weaponmaster:removeItem', function(allowed)
        	            if (allowed) then
			    	        SetPedWeaponTintIndex(GetPlayerPed(-1),  GetSelectedPedWeapon(PlayerPedId()), tint)
        	            end
        	        end, type)
				
        	else
				ESX.TriggerServerCallback('esx_trento_weaponmaster:addItem', function(allowed)
					if (allowed) then
						SetPedWeaponTintIndex(GetPlayerPed(-1),  GetSelectedPedWeapon(PlayerPedId()), 0)
					end
				end, type)
        	end
		else
			ESX.ShowNotification("No has seleccionado ningún tinte", 5000, "error")
		end
    else
        ESX.ShowNotification("Ese accesorio no se puede adherir a tu arma", 5000, "error")
	end

end)

--[[
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
end)]]

-- *******************************************************************************************************************************************************
--                                                         REMOVE ALL WEAPONS COMMAND
-- *******************************************************************************************************************************************************



RegisterNetEvent('esx_trento_weaponmaster:bulletproof')
AddEventHandler('esx_trento_weaponmaster:bulletproof', function(type)
	local playerPed = GetPlayerPed(-1)

	loadAnimDict('clothingtie')
    TaskPlayAnim(playerPed, "clothingtie", "try_tie_positive_a", 2.0, 2.0, 5000, 51, 0, false, false, false)
	Citizen.Wait(6500)

	if type == "heavyweight" then 
		AddArmourToPed(playerPed, 100)
		SetPedArmour(playerPed, 100)
		SetPedComponentVariation(playerPed, 9, 124, 2, 2)
		ESX.ShowNotification("Te has equipado un chaleco pesado", 4000, "success")
	elseif type == "normalweight" then
		AddArmourToPed(playerPed, 100)
		SetPedArmour(playerPed, 75) 
		SetPedComponentVariation(playerPed, 9, 19, 9, 2)
		ESX.ShowNotification("Te has equipado un chaleco normal", 4000, "success")
	elseif type == "lightweight" then 
		AddArmourToPed(playerPed, 100)
		SetPedArmour(playerPed, 50)
		SetPedComponentVariation(playerPed, 9, 19, 9, 2)
		ESX.ShowNotification("Te has equipado un chaleco ligero", 4000, "success")
    elseif type == "police" then 
		AddArmourToPed(playerPed, 100)
		SetPedArmour(playerPed, 100)
		ESX.ShowNotification("Te has equipado un chaleco policial", 4000, "success")
	end
end)

RegisterNetEvent('esx_trento_weaponmaster:removeaccesories')
AddEventHandler('esx_trento_weaponmaster:removeaccesories', function(duration)

	local inventory = ESX.GetPlayerData().inventory
	local ped = PlayerPedId()
	local currentWeaponHash = GetSelectedPedWeapon(ped)

    if weapons[currentWeaponHash] then
        for k,v in pairs(weapons) do
            if HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.supressor) then
                TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'supressor')
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.supressor)
			elseif HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.flashlight) then
				TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'flashlight')
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.flashlight)
			elseif HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.grip) then
				TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'grip')
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.grip)
			elseif HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.weaponskin) then
				TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'weaponskin')
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.weaponskin)
			elseif HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.extendedclip) then
				TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'extendedclip')
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.extendedclip)
			elseif HasPedGotWeaponComponent(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.scope) then
				TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'scope')
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId()), v.scope)
			elseif (GetPedWeaponTintIndex(GetPlayerPed(-1), GetSelectedPedWeapon(PlayerPedId())) ~= 0 )then
				TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'tint')
				SetPedWeaponTintIndex(GetPlayerPed(-1),  GetSelectedPedWeapon(PlayerPedId()), 0)
			end
		end
		ESX.ShowNotification("Has retirado los accesorios de tu arma.")
	end
end)

RegisterNetEvent('esx_trento_weaponmaster:remspecificwepacc')
AddEventHandler('esx_trento_weaponmaster:remspecificwepacc', function(weaponHash)

	local inventory = ESX.GetPlayerData().inventory
	local ped = PlayerPedId()
	--local currentWeaponHash = GetSelectedPedWeapon(ped)

    if weapons[weaponHash] then
        for k,v in pairs(weapons) do
            if HasPedGotWeaponComponent(GetPlayerPed(-1), weaponHash, v.supressor) then
                TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'supressor')
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), weaponHash, v.supressor)
			elseif HasPedGotWeaponComponent(GetPlayerPed(-1), weaponHash, v.flashlight) then
				TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'flashlight')
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), weaponHash, v.flashlight)
			elseif HasPedGotWeaponComponent(GetPlayerPed(-1), weaponHash, v.grip) then
				TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'grip')
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), weaponHash, v.grip)
			elseif HasPedGotWeaponComponent(GetPlayerPed(-1), weaponHash, v.weaponskin) then
				TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'weaponskin')
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), weaponHash, v.weaponskin)
			elseif HasPedGotWeaponComponent(GetPlayerPed(-1), weaponHash, v.extendedclip) then
				TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'extendedclip')
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), weaponHash, v.extendedclip)
			elseif HasPedGotWeaponComponent(GetPlayerPed(-1), weaponHash, v.scope) then
				TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'scope')
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), weaponHash, v.scope)
			elseif (GetPedWeaponTintIndex(GetPlayerPed(-1), weaponHash) ~= 0 )then
				TriggerServerEvent('esx_trento_weaponmaster:giveBack', 'tint')
				SetPedWeaponTintIndex(GetPlayerPed(-1),  weaponHash, 0)
			end
		end
		ESX.ShowNotification("Has retirado los accesorios de tu arma.")
	end
end)

RegisterNetEvent('esx_trento_weaponmaster:giveAmmo')
AddEventHandler('esx_trento_weaponmaster:giveAmmo', function(weaponHash)
	if weaponHash == 600439132 then
		return 
	end
		local inventory = ESX.GetPlayerData().inventory
		local ped = PlayerPedId()
		local ammo = GetAmmoInPedWeapon(ped, weaponHash)
		local maxClip = GetWeaponClipSize(weaponHash)
		print(maxClip, ammo, weaponHash)

		if maxClip ~= 0 and weaponHash == 883325847 then 
		TriggerServerEvent('esx_trento_weaponmaster:giveFuelCharger', math.floor(ammo / maxClip))
		elseif maxClip ~= 0 then
		TriggerServerEvent('esx_trento_weaponmaster:giveClip', math.floor(ammo / maxClip))
	end
end)

-- *******************************************************************************************************************************************************
--                                                                 CUANDO EL JUGADOR SPAWNEA
-- *******************************************************************************************************************************************************
-- Parte del código viejo, no la quito aún por miedo. Se utilizaba para que, cuando el jugador hiciese spawn, el número de silenciadores y tal
-- que ha usado se restableciese, lo que permitía que una vez que volviese, funcionase el código, ya que tenía todo desequipado, pero al intentar
-- equipar las cosas, el script volvía a contar
  