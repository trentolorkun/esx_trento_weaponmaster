ESX = nil
local Weapons = {}
local Loaded = true
local realWeapons = Config.RealWeapons
local attachments = Config.Accesories
local handgunFlag = 'backhandgun'
local rifleFlag = 'assault'
local offsetCoords = nil
local weaponCategoryOffsets = {}
local showPistol = true
local showKnife = true
local holstered  = true
local blocked = false
local PlayerData = {}
local switched = false



RegisterCommand("arma", function(source)
    local ped = PlayerPedId()
    if showPistol and showKnife then
        local _canHide = true
        for i, realweapon in pairs(realWeapons) do
            if HasPedGotWeapon(ped, GetHashKey(realWeapons[i].name), false) then
                if(not realWeapons[i].canHide) then
                    _canHide = false
                end
            end
        end
        if _canHide then
            SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
			SetPedCanSwitchWeapon(ped, false)
            showPistol = false
            showKnife = false 
			RemoveGears()
		else
			ESX.ShowNotification("¿De verdad crees que puedes guardar eso en tu ropa?", 5000, "warning")
        end
    else
        showPistol = true
        showKnife = true
		SetGear()
		SetPedCanSwitchWeapon(ped, true)
    end
end)


RegisterCommand("rskin", function()
	local health = GetEntityHealth(GetPlayerPed(-1))
	local blindage = GetPedArmour(GetPlayerPed(-1))
	Citizen.Wait(math.random(200, 800))
	TriggerEvent('esx_trento_weaponmaster:restoreLoadout')
	Citizen.Wait(300)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
		local isMale = skin.sex == 0
		TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)	
				SetEntityHealth(PlayerPedId(), health)
				SetPedArmour(GetPlayerPed(-1), blindage)
				if health < GetEntityHealth(GetPlayerPed(-1)) then
					SetEntityHealth(GetPlayerPed(-1), health)
				end
				TriggerEvent('esx_trento_weaponmaster:restoreLoadout')
			end)
		end)
	end)
end)




Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while not Loaded do
		Citizen.Wait(500)
	end

	--Citizen.Wait(5000)                         -- PARA PCS PATATAS, MANTENER DESCOMENTADO
	local playerPed = PlayerPedId()
	SetPedCanSwitchWeapon(playerPed, true)
	realWeapons = Config.RealWeapons
	weaponCategoryOffsets = Config.WeaponCategoryOffsets


	while true do
		Citizen.Wait(1500)
		playerPed = PlayerPedId()

		for i=1, #realWeapons, 1 do
			local weaponHash = GetHashKey(realWeapons[i].name)
			local onPlayer = false
			if HasPedGotWeapon(playerPed, weaponHash, false) and showPistol then -- /arma activo y si el arma que estas intentando comprobar lo tienes encima
				for weaponName, entity in pairs(Weapons) do
					if weaponName == realWeapons[i].name then -- tienes encima el arma y dibujada
						onPlayer = true
						break
					end
				end
				if onPlayer == false and weaponHash ~= GetSelectedPedWeapon(playerPed) then -- tienes el arma encima pero no la tienes en la mano 
					if (realWeapons[i].category == 'handguns' and realWeapons[i].category == 'revolver' and realWeapons[i].category == 'bighandgun' and realWeapons[i].category == 'smallmelee') then
						if (showPistol) then
							SetGear(realWeapons[i].name)
						else
							RemoveGear(realWeapons[i].name)
						end
					elseif realWeapons[i].model ~= nil then
						SetGear(realWeapons[i].name)
					end
					-- Si está equipada, quitamos el prop.
				elseif onPlayer and weaponHash == GetSelectedPedWeapon(playerPed) then
					RemoveGear(realWeapons[i].name)
				end
			else
				RemoveGear(realWeapons[i].name)
			end
		end
	end
end)

-- AddEventHandler('skinchanger:modelLoaded', function()
-- 	RemoveGears()
-- 	Loaded = true
-- end)

RegisterNetEvent('esx_trento_weaponmaster:restoreLoadout')
AddEventHandler('esx_trento_weaponmaster:restoreLoadout', function()
	RemoveGears()
	Loaded = true
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
	local isPolice = nil

	if (PlayerData.job) then
		isPolice = (PlayerData.job.name == 'police')
	end

	for i=1, #realWeapons, 1 do
		if realWeapons[i].name == weapon then
			if realWeapons[i].category == 'handguns' or realWeapons[i].category == 'revolver' then
				if isPolice and not switched then 
					offsetCoords = "handguns"
					handgunFlag = "handguns"
				else
					offsetCoords = handgunFlag
				end
			elseif realWeapons[i].category == 'machine' or realWeapons[i].category == 'assault' or realWeapons[i].category == 'shotgun' or realWeapons[i].category == 'sniper' or realWeapons[i].category == 'heavy' then
				offsetCoords = rifleFlag
			else
				offsetCoords = realWeapons[i].category
			end
			

			bone, boneX, boneY, boneZ, boneXRot, boneYRot, boneZRot = GetCoords(offsetCoords)
			model      = realWeapons[i].model
			/*for k, v in pairs(attachments[weapon]) do
				if (HasPedGotWeaponComponent(player, weapon, attachments[weapon][k]) == 1) then

				end
			end*/

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
	local playerPed  = PlayerPedId()
	
		
	for j=1, #realWeapons, 1 do
		if HasPedGotWeapon(playerPed, GetHashKey(realWeapons[j].name), false) then		
			SetGear(realWeapons[j].name)
		end
	end
end





RegisterCommand('holster', function(source, args)
	if args[1] == nil then
		OpenHolsterMenu()
	elseif args[1] == 'handguns' or args[1] == 'waisthandgun' then
		handgunFlag = args[1]
		ESX.ShowNotification(("Has cambiado la posición de la pistola a la cadera.")) 
	elseif args[1] == 'backhandgun' then 
		handgunFlag = args[1]
		ESX.ShowNotification(("Has cambiado la posición de la pistola a la espalda.")) 
	elseif args[1] == 'leghandgun' or args[1] == 'hiphandgun' or args[1] == 'handguns2' then
		handgunFlag = args[1]
		ESX.ShowNotification(("Has cambiado la posición de la pistola a la pierna.")) 
	elseif args[1] == 'chesthandgun' then
		handgunFlag = args[1]
		ESX.ShowNotification(("Has cambiado la posición de la pistola en el pecho.")) 
	elseif args[1] == 'boxers' then
		handgunFlag = args[1]
		ESX.ShowNotification(("Has cambiado la posición de la pistola a los calzoncillos.")) 
	elseif args[1] == 'assault' then
		rifleFlag = args[1]
		ESX.ShowNotification(("Has cambiado la posición de las armas largas a la espalda.")) 
	elseif args[1] == 'tacticalrifle' then
		rifleFlag = args[1]
		ESX.ShowNotification(("Has cambiado la posición de las armas largas al frente.")) 
	end
	RemoveGears()
	switched = true
end)


function OpenHolsterMenu()
	local elements = {}
	table.insert(elements, {label = "Posición de Pistolas", menu = 'pistolas'})
	table.insert(elements, {label = "Posición de Rifles y SMG", menu = 'rifles'})
	table.insert(elements, {label = "Tintes de Armas", menu = 'tint'})

	ESX.UI.Menu.Open('default',GetCurrentResourceName(),"holster",
	{ 
		title = "Menú de Personalización de Armas", 
		align = "bottom-right", 
		elements = elements 
	}, function(data_interact, menu_interact)
		local item = data_interact.current.menu
		if data_interact.current.menu == "pistolas" then
			OpenPistolsMenu()
		elseif data_interact.current.menu == "rifles" then
			OpenRiflesMenu()
		end
		ESX.TriggerServerCallback("esx_trento_weaponmaster:haveItem", function(hasItem, item)
		if hasItem then 
			if data_interact.current.menu == "tint" then
				OpenTintsSelectorMenu()
			end
		else
			ESX.ShowNotification("No tienes ningún tinte encima", 5000, "error")
		end
	end, item)
	end, function(data_interact, menu_interact) 
		menu_interact.close() 
	end)
end

function OpenTintsSelectorMenu()
	local elements = {}
	table.insert(elements, {label = "Armas Normales", menu = 'ArmaNormal'})
	table.insert(elements, {label = "Armas Mk2", menu = 'ArmaMk2'})
	table.insert(elements, {label = "Poner/Quitar Tinte", menu = 'ApplyTint'})

	ESX.UI.Menu.Open('default',GetCurrentResourceName(),"tintsselector",
	{ 
		title = "Menú de Tintes para Armas", 
		align = "bottom-right", 
		elements = elements 
	}, function(data_interact, menu_interact)
		if data_interact.current.menu == "ArmaNormal" then
			OpenTintsNormalMenu()
		elseif data_interact.current.menu == "ArmaMk2" then
			OpenTintsmk2Menu()
		elseif data_interact.current.menu == "ApplyTint" then
			ExecuteCommand("atinte")
		end
	end, function(data_interact, menu_interact)
		OpenHolsterMenu()
		menu_interact.close() 
	end)
end

function OpenPistolsMenu()
	local elements = {}
	table.insert(elements, {label = "Pistola delante", command = 'boxers'})
	table.insert(elements, {label = "Pistola detrás", command = 'backhandgun'})
	table.insert(elements, {label = "Cartuchera cintura", command = 'waisthandgun'})
	table.insert(elements, {label = "Cartuchera normal", command = 'handguns'})
	table.insert(elements, {label = "Cartuchera pecho", command = 'chesthandgun'})
	table.insert(elements, {label = "Cartuchera muslo", command = 'hiphandgun'})
	table.insert(elements, {label = "Cartuchera pierna", command = 'leghandgun'})
	table.insert(elements, {label = "Cartuchera pierna separada", command = 'handguns2'})
	

		ESX.UI.Menu.Open('default',GetCurrentResourceName(),"pistols",
		{ 
			title = "Menú de Posición para Pistolas", 
			align = "bottom-right", 
			elements = elements 
		}, function(data_interact, menu_interact)
			if data_interact.current.command ~= nil then
				ExecuteCommand("holster " .. data_interact.current.command)
			end
		end, function(data_interact, menu_interact)
		OpenHolsterMenu()
		menu_interact.close() 
	end)
end


function OpenRiflesMenu()
	local elements = {}
	table.insert(elements, {label = "Rifle pecho", command = 'tacticalrifle'})
	table.insert(elements, {label = "Rifle espalda", command = 'assault'})

		ESX.UI.Menu.Open('default',GetCurrentResourceName(),"rifles",
		{ 
			title = "Menú de Posición para Rifles", 
			align = "bottom-right", 
			elements = elements 
		}, function(data_interact, menu_interact)
			if data_interact.current.command ~= nil then
				ExecuteCommand("holster " .. data_interact.current.command)
			end
		end, function(data_interact, menu_interact)
		OpenHolsterMenu()
		menu_interact.close() 
	end)
end

function OpenTintsNormalMenu()
	local elements = {}
	--table.insert(elements, {label = "Sin tinte", command = '0'})
	table.insert(elements, {label = "Verde militar", command = '1'})
	--table.insert(elements, {label = "Oro", command = '2'})
	--table.insert(elements, {label = "Rosa", command = '3'})
	table.insert(elements, {label = "Desierto", command = '4'})
	table.insert(elements, {label = "Azúl", command = '5'})
	table.insert(elements, {label = "Naranja y negro", command = '6'})
	table.insert(elements, {label = "Platino", command = '7'})

		ESX.UI.Menu.Open('default',GetCurrentResourceName(),"tintsnormal",
		{ 
			title = "Menú de Tintes para Armas Normales", 
			align = "bottom-right", 
			elements = elements 
		}, function(data_interact, menu_interact)
			if data_interact.current.command ~= nil then
				ExecuteCommand("tinte " .. data_interact.current.command)
				Citizen.Wait(400)
				ExecuteCommand("atinte")
			end
		end, function(data_interact, menu_interact)
		OpenTintsSelectorMenu()
		menu_interact.close() 
	end)
end



function OpenTintsmk2Menu()
	local elements = {}
	--table.insert(elements, {label = "Sin tinte", command = '0'})
	table.insert(elements, {label = "Gris clásico", command = '1'})
	table.insert(elements, {label = "Blanco y negro", command = '2'})
	--table.insert(elements, {label = "Blanco clásico", command = '3'})
	table.insert(elements, {label = "Beige clásico", command = '4'})
	table.insert(elements, {label = "Verde clásico", command = '5'})
	table.insert(elements, {label = "Azúl clásico", command = '6'})
	table.insert(elements, {label = "Marrón desierto", command = '7'})
	table.insert(elements, {label = "Marrón y negro", command = '8'})
	--table.insert(elements, {label = "Carmesí", command = '9'})
	--table.insert(elements, {label = "Azúl chillón", command = '10'})
	--table.insert(elements, {label = "Amarillo chillón", command = '11'})
	--table.insert(elements, {label = "Naranja chillón", command = '12'})
	--table.insert(elements, {label = "Rosa eléctrico", command = '13'})
	--table.insert(elements, {label = "Morado y amarillo", command = '14'})
	--table.insert(elements, {label = "Naranja pálido", command = '15'})
	--table.insert(elements, {label = "Verde y morado", command = '16'})
	--table.insert(elements, {label = "Negro detalles rojos", command = '17'})
	--table.insert(elements, {label = "Negro detalles verdes", command = '18'})
	--table.insert(elements, {label = "Negro detalles celestes", command = '19'})
	--table.insert(elements, {label = "Negro detalles amarillos", command = '20'})
	--table.insert(elements, {label = "Blanco detalles rojos", command = '21'})
	--table.insert(elements, {label = "Blanco detalles azules", command = '22'})
	--table.insert(elements, {label = "Oro metálico", command = '23'})
	--table.insert(elements, {label = "Platino metálico", command = '24'})
	table.insert(elements, {label = "Gris metálico y lila", command = '25'})
	--table.insert(elements, {label = "Morado metálico y lima", command = '26'})
	--table.insert(elements, {label = "Rojo metálico", command = '27'})
	--table.insert(elements, {label = "Verde metálico", command = '28'})
	--table.insert(elements, {label = "Azúl metálico", command = '29'})
	--table.insert(elements, {label = "Blanco metálico y aguamarina", command = '30'})
	--table.insert(elements, {label = "Rojo metálico y amarillo", command = '31'})

		ESX.UI.Menu.Open('default',GetCurrentResourceName(),"tintsmk2",
		{ 
			title = "Menú de Tintes para Armas Mk2", 
			align = "bottom-right", 
			elements = elements 
		}, function(data_interact, menu_interact)
			if data_interact.current.command ~= nil then
				ExecuteCommand("tinte " .. data_interact.current.command)
				Citizen.Wait(400)
				ExecuteCommand("atinte")
			end
		end, function(data_interact, menu_interact)
		OpenTintsSelectorMenu()
		menu_interact.close() 
	end)
end




-- ###########################################################################################
-- ANIMACIONES DE ARMAS
-- ###########################################################################################
function loadAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Citizen.Wait(100)
	end
end

function CheckWeapon(ped, newWeap)
	if IsEntityDead(ped) then
		blocked = false
			return false
		else
			for i = 1, #realWeapons do
				if GetHashKey(realWeapons[i].name) == GetSelectedPedWeapon(ped) then
					return true
				end
			end
		return false
	end
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
	if job.name == 'police' then
		handgunFlag = 'handguns'
	end
	RemoveGears()
	Wait(2000)
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job)
    PlayerData.job2 = job
end)

function loadAnimDict2(dict)
	while ( not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end

Citizen.CreateThread(function()
	loadAnimDict("rcmjosh4")
    loadAnimDict("reaction@intimidation@cop@unarmed")
    loadAnimDict("reaction@intimidation@1h")
	loadAnimDict2("combat@combat_reactions@pistol_1h_gang")
	loadAnimDict2("combat@combat_reactions@pistol_1h_hillbilly")
	loadAnimDict2("reaction@male_stand@big_variations@d")
	local rot = 0
	local wepCat
	local lastWep

	Citizen.Wait(0)
	PlayerData = ESX.GetPlayerData()

	while (true) do
		local ped = PlayerPedId()
		Citizen.Wait(50)
		
		rot = GetEntityHeading(ped)
		if not IsPedInAnyVehicle(ped, true) then
			if (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
				wepCat = GetWeapontypeGroup(GetSelectedPedWeapon(ped))
				if CheckWeapon(ped) then -- CHECK WEAPON COMPRUEBA SI TIENE UN ARMA DEL CONFIG ENCIMA
					if(wepCat == 416676503 or wepCat == 690389602) then
						if holstered then
							if handgunFlag == 'backhandgun' then
								blocked   = true
								SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
								TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = false
								lastWep = GetSelectedPedWeapon(ped)
							elseif handgunFlag == 'boxers' then
								blocked   = true
								SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
								TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = false
								lastWep = GetSelectedPedWeapon(ped)
							elseif handgunFlag == 'chesthandgun' then
								blocked   = true
								SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
								TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = false
								lastWep = GetSelectedPedWeapon(ped)
							elseif handgunFlag == 'leghandgun' then
								blocked   = true
								SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
								TaskPlayAnimAdvanced(ped, "reaction@male_stand@big_variations@d", "react_big_variations_m", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = false
								lastWep = GetSelectedPedWeapon(ped)
							else
								blocked   = true
								SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
								SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
								TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = false
								lastWep = GetSelectedPedWeapon(ped)
							end
						else
							blocked = false
						end
					else
						if holstered then
							if rifleFlag == 'tacticalrifle' then
								blocked   = true
								SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
								TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_hillbilly", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = false
								lastWep = GetSelectedPedWeapon(ped)
							else 
								blocked   = true
								SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
								TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = false
								lastWep = GetSelectedPedWeapon(ped)
							end
						else
							blocked = false
						end
					end
				else
					if (GetWeapontypeGroup(lastWep) == 416676503 or GetWeapontypeGroup(lastWep) == 690389602) then
						if not holstered then
							if handgunFlag == 'backhandgun' then
								TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "outro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0) -- Change 50 to 30 if you want to stand still when holstering weapon
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = true
							elseif handgunFlag == 'boxers' then
								TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0) -- Change 50 to 30 if you want to stand still when holstering weapon
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = true
							elseif handgunFlag == 'leghandgun' then
								TaskPlayAnimAdvanced(ped, "reaction@male_stand@big_variations@d", "react_big_variations_m", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0) -- Change 50 to 30 if you want to stand still when holstering weapon
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = true
							elseif handgunFlag == 'chesthandgun' then
								TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0)
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = true
							else
								TaskPlayAnimAdvanced(ped, "reaction@intimidation@cop@unarmed", "outro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0) -- Change 50 to 30 if you want to stand still when holstering weapon
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = true
							end
						end
					else 
						if not holstered then
							if rifleFlag == 'tacticalrifle' then
								TaskPlayAnimAdvanced(ped, "combat@combat_reactions@pistol_1h_gang", "0", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0) -- Change 50 to 30 if you want to stand still when holstering weapon
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = true
							else
								TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "outro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.125, 0, 0) -- Change 50 to 30 if you want to stand still when holstering weapon
								Citizen.Wait(700)
								ClearPedTasks(ped)
								holstered = true
							end
						end
					end
				end
			elseif (GetVehiclePedIsTryingToEnter (ped) == 0) then
				holstered = false
			else
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
			end
		else
			holstered = true
		end
	end
end)