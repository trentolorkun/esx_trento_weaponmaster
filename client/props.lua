ESX = nil
local Weapons = {}
local Loaded = true
local realWeapons = {}
local handgunFlag = 'handguns'
local rifleFlag = 'assault'
local offsetCoords = nil
local weaponCategoryOffsets = {}

function ChatMessage(message)
	TriggerEvent('chat:addMessage', {
		color = { 255, 0, 0},
		multiline = false,
		args = message
	  })

end





Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while not Loaded do
		Citizen.Wait(500)
	end

	while true do

		Citizen.Wait(500)
		local playerPed = PlayerPedId()
		realWeapons = Config.RealWeapons
		weaponCategoryOffsets = Config.WeaponCategoryOffsets
		

		for i=1, #realWeapons, 1 do

			local weaponHash = GetHashKey(realWeapons[i].name)

			if HasPedGotWeapon(playerPed, weaponHash, false) then
				local onPlayer = false

				for weaponName, entity in pairs(Weapons) do
					if weaponName == realWeapons[i].name then
						onPlayer = true
						break
					end
				end

				if not onPlayer and weaponHash ~= GetSelectedPedWeapon(playerPed) then
					SetGear(realWeapons[i].name)
				elseif onPlayer and weaponHash == GetSelectedPedWeapon(playerPed) then
					RemoveGear(realWeapons[i].name)
				end

			end
		end
	end
end)

AddEventHandler('skinchanger:modelLoaded', function()
	SetGears()
	Loaded = true
end)

RegisterNetEvent('esx:removeWeapon')
AddEventHandler('esx:removeWeapon', function(weaponName)
	RemoveGear(weaponName)
end)

-- Remove only one weapon that's on the ped
function RemoveGear(weapon)
	local _Weapons = {}

	for weaponName, entity in pairs(Weapons) do
		if weaponName ~= weapon then
			_Weapons[weaponName] = entity
		else
			ESX.Game.DeleteObject(entity)
		end
	end

	Weapons = _Weapons
end

-- Remove all weapons that are on the ped
function RemoveGears()
	for weaponName, entity in pairs(Weapons) do
		ESX.Game.DeleteObject(entity)
	end
	Weapons = {}
end

-- Get the coords for the specific category 
function GetCoords(cat)

	for i=1, #weaponCategoryOffsets, 1 do
		if weaponCategoryOffsets[i].category == cat then
			return weaponCategoryOffsets[i].bone, weaponCategoryOffsets[i].x, weaponCategoryOffsets[i].y, weaponCategoryOffsets[i].z, weaponCategoryOffsets[i].xRot, weaponCategoryOffsets[i].yRot, weaponCategoryOffsets[i].zRot
		end
	end
	
end

-- Add one weapon on the ped
function SetGear(weapon)
	local bone       = nil
	local boneX      = 0.0
	local boneY      = 0.0
	local boneZ      = 0.0
	local boneXRot   = 0.0
	local boneYRot   = 0.0
	local boneZRot   = 0.0
	local playerPed  = PlayerPedId()
	local model      = nil
	local playerData = ESX.GetPlayerData()

	for i=1, #realWeapons, 1 do
		if realWeapons[i].name == weapon then
			if realWeapons[i].category == 'handguns' then
				offsetCoords = handgunFlag
			elseif realWeapons[i].category == 'machine' or realWeapons[i].category == 'assault' or realWeapons[i].category == 'shotgun' or realWeapons[i].category == 'sniper' or realWeapons[i].category == 'heavy' then
				offsetCoords = rifleFlag
			else
				offsetCoords = realWeapons[i].category
			end
			
			bone, boneX, boneY, boneZ, boneXRot, boneYRot, boneZRot = GetCoords(offsetCoords)
			model      = realWeapons[i].model
		
			break
		
		end	
	end

	ESX.Game.SpawnObject(model, {
		x = x,
		y = y,
		z = z
	}, function(object)
		local boneIndex = GetPedBoneIndex(playerPed, bone)
		local bonePos 	= GetWorldPositionOfEntityBone(playerPed, boneIndex)
		AttachEntityToEntity(object, playerPed, boneIndex, boneX, boneY, boneZ, boneXRot, boneYRot, boneZRot, false, false, false, false, 2, true)
		Weapons[weapon] = object
	end)
end

-- Add all the weapons in the xPlayer's loadout
-- on the ped
function SetGears()
	local bone       = nil
	local boneX      = 0.0
	local boneY      = 0.0
	local boneZ      = 0.0
	local boneXRot   = 0.0
	local boneYRot   = 0.0
	local boneZRot   = 0.0
	local playerPed  = PlayerPedId()
	local model      = nil
	local playerData = ESX.GetPlayerData()
	local weapon 	 = nil
	
	for i=1, #playerData.loadout, 1 do
		
		for j=1, #realWeapons, 1 do
			if realWeapons[j].name == playerData.loadout[i].name then
				
				if realWeapons[j].category == 'handguns' then
					offsetCoords = handgunFlag
				elseif realWeapons[j].category == 'machine' or realWeapons[j].category == 'assault' or realWeapons[j].category == 'shotgun' or realWeapons[j].category == 'sniper' or realWeapons[j].category == 'heavy' then
					offsetCoords = rifleFlag
				else
					offsetCoords = realWeapons[j].category
				end

				bone, boneX, boneY, boneZ, boneXRot, boneYRot, boneZRot = GetCoords(offsetCoords)
				model   = realWeapons[j].model
				weapon  = realWeapons[j].name 

				break

			end
		end

		local _wait = true

		ESX.Game.SpawnObject(model, {
			x = x,
			y = y,
			z = z
		}, function(object)
			local boneIndex = GetPedBoneIndex(playerPed, bone)
			local bonePos 	= GetWorldPositionOfEntityBone(playerPed, boneIndex)

			AttachEntityToEntity(object, playerPed, boneIndex, boneX, boneY, boneZ, boneXRot, boneYRot, boneZRot, false, false, false, false, 2, true)

			Weapons[weapon] = object
			_wait = false
		end)

		-- wait for async task
		while _wait do
			Citizen.Wait(10)
		end
	end

end


RegisterNetEvent('esx_foras_weapons:executeCommand')
AddEventHandler('esx_foras_weapons:executeCommand', function(args)

	-- Then we start working with all the args we have.
	if args[1] == '' then
		ChatMessage('Puedes seleccionar entre 3 posiciones para la pistola y 2 para las armas largas.')
		ChatMessage('Posiciones de pistola: "handguns", "backhandgun", "leghandgun"')
		ChatMessage('Posiciones de armas largas: "assault", "tacticalrifle"')
	elseif args[1] == 'handguns' then
		handgunFlag = args[1]
		ESX.ShowNotification(("Has cambiado la posición de la pistola a la cadera.")) 
		RemoveGears()
		SetGears()
	elseif args[1] == 'backhandgun' then 
		handgunFlag = args[1]
		ESX.ShowNotification(("Has cambiado la posición de la pistola a la espalda.")) 
		RemoveGears()
		SetGears()
	elseif args[1] == 'leghandgun' then
		handgunFlag = args[1]
		ESX.ShowNotification(("Has cambiado la posición de la pistola a la pierna.")) 
		RemoveGears()
		SetGears()
	elseif args[1] == 'assault' then
		rifleFlag = args[1]
		ESX.ShowNotification(("Has cambiado la posición de las armas largas a la espalda.")) 
		RemoveGears()
		SetGears()
	elseif args[1] == 'tacticalrifle' then
		rifleFlag = args[1]
		ESX.ShowNotification(("Has cambiado la posición de las armas largas al frente.")) 
		RemoveGears()
		SetGears()
	else
		ChatMessage('El valor de posición no ha sido introducido correctamente.')
	end

end)