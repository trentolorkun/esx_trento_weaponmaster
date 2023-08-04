ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('aimstyle', function(source, args)
	-- First of all, we get all data from the source
    local xPlayer = ESX.GetPlayerFromId(source)
    local _source = source

    TriggerClientEvent('esx_trento_weaponmaster:aim', source, args) 

end, false)

RegisterCommand('tinte', function(source, args)
    --local xPlayer = ESX.GetPlayerFromId(source)
    local _source = source

    TriggerClientEvent('esx_trento_weaponmaster:changetint', source, args)
end, false)


RegisterCommand('paracaidas', function(source, args)
	-- First of all, we get all data from the source
    local _source = source

    TriggerClientEvent('esx_trento_weaponmaster:parachuteTint', source, args) 

end, false)

RegisterCommand('humoparacaidas', function(source, args)
	-- First of all, we get all data from the source
    --local xPlayer = ESX.GetPlayerFromId(source)
    local _source = source
	
    TriggerClientEvent('esx_trento_weaponmaster:parachuteSmokeTint', source, args) 

end, false)

TriggerEvent('esx:getSharedObject', function( obj ) ESX = obj end)
 
ESX.RegisterUsableItem('supressor', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_trento_weaponmaster:use', source, 'supressor')
	--xPlayer.removeInventoryItem('supressor', 1)
end)

ESX.RegisterUsableItem('extendedclip', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_trento_weaponmaster:use', source, 'extendedclip')
	--xPlayer.removeInventoryItem('supressor', 1)
end)
 
ESX.RegisterUsableItem('flashlight', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_trento_weaponmaster:use', source, 'flashlight')
	--xPlayer.removeInventoryItem('flashlight', 1)
end)
 
ESX.RegisterUsableItem('grip', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_trento_weaponmaster:use', source, 'grip')
	--xPlayer.removeInventoryItem('grip', 1)
end)

ESX.RegisterUsableItem('scope', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_trento_weaponmaster:use', source, 'scope')
	--xPlayer.removeInventoryItem('scope', 1)
end)
 
ESX.RegisterUsableItem('weaponskin', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_trento_weaponmaster:use', source, 'weaponskin')
	--xPlayer.removeInventoryItem('weaponskin', 1)
end)

ESX.RegisterUsableItem('tint', function(source)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_trento_weaponmaster:addtint', source, 'tint')
	--xPlayer.removeInventoryItem('tint', 1)
end)


RegisterCommand("atinte", function(source)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_trento_weaponmaster:addtint', _source, 'tint')
end)


RegisterServerEvent('esx_trento_weaponmaster:giveBack')
AddEventHandler('esx_trento_weaponmaster:giveBack', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem(item, 1)
	return
end)

RegisterServerEvent('esx_trento_weaponmaster:giveClip')
AddEventHandler('esx_trento_weaponmaster:giveClip', function(count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem('clip', count)
end)


RegisterServerEvent('esx_trento_weaponmaster:giveFuelCharger')
AddEventHandler('esx_trento_weaponmaster:giveFuelCharger', function(count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem('fuelcharger', count)
end)

RegisterCommand('qa', function(source)
    --local xPlayer = ESX.GetPlayerFromId(source)
    local _source = source

    TriggerClientEvent('esx_trento_weaponmaster:removeaccesories', source)
end, false)

ESX.RegisterServerCallback('esx_trento_weaponmaster:haveItem', function(source, cb, item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local hasItem = xPlayer.hasInventoryItem(item)
    if (hasItem ~= false)then
		if (xPlayer.getInventoryItem(item).count > 0) then
			cb(true)
		else
			cb(false)
		end
	end
end)


ESX.RegisterServerCallback('esx_trento_weaponmaster:removeItem', function(source, cb, item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local hasItem = xPlayer.hasInventoryItem(item)
    if (hasItem ~= false)then
		if (xPlayer.getInventoryItem(item).count > 0) then
        	xPlayer.removeInventoryItem(item, 1)
        	cb(true)
		end
    else 
        cb(false)
    end
end)

ESX.RegisterServerCallback('esx_trento_weaponmaster:addItem', function(source, cb, item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    xPlayer.addInventoryItem(item, 1)
    cb(true)
end)




-- ARMAS CUERPO A CUERPO Y MISC

ESX.RegisterUsableItem('WEAPON_KNIFE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_KNIFE', 1) ---- METIDA EN BD ---- 
	xPlayer.addWeapon("WEAPON_KNIFE", 0)
end)

ESX.RegisterUsableItem('WEAPON_KNUCKLE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_KNUCKLE', 1) 
	xPlayer.addWeapon("WEAPON_KNUCKLE", 0)
end)

ESX.RegisterUsableItem('WEAPON_NIGHTSTICK', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_NIGHTSTICK', 1) 
	xPlayer.addWeapon("WEAPON_NIGHTSTICK", 0)
end)

ESX.RegisterUsableItem('WEAPON_HAMMER', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_HAMMER', 1) 
	xPlayer.addWeapon("WEAPON_HAMMER", 0)
end)

ESX.RegisterUsableItem('WEAPON_BAT', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_BAT', 1) 
	xPlayer.addWeapon("WEAPON_BAT", 0)
end)

ESX.RegisterUsableItem('WEAPON_GOLFCLUB', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_GOLFCLUB', 1) 
	xPlayer.addWeapon("WEAPON_GOLFCLUB", 0)
end)

ESX.RegisterUsableItem('WEAPON_CROWBAR', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_CROWBAR', 1) 
	xPlayer.addWeapon("WEAPON_CROWBAR", 0)
end)

ESX.RegisterUsableItem('WEAPON_BOTTLE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_BOTTLE', 1) 
	xPlayer.addWeapon("WEAPON_BOTTLE", 0)
end)

ESX.RegisterUsableItem('WEAPON_DAGGER', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_DAGGER', 1) 
	xPlayer.addWeapon("WEAPON_DAGGER", 0)
end)

ESX.RegisterUsableItem('WEAPON_HATCHET', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_HATCHET', 1) 
	xPlayer.addWeapon("WEAPON_HATCHET", 0)
end)

ESX.RegisterUsableItem('WEAPON_MACHETE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_MACHETE', 1) 
	xPlayer.addWeapon("WEAPON_MACHETE", 0)
end)

ESX.RegisterUsableItem('WEAPON_FLASHLIGHT', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_FLASHLIGHT', 1) 
	xPlayer.addWeapon("WEAPON_FLASHLIGHT", 0)
end)

ESX.RegisterUsableItem('WEAPON_SWITCHBLADE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_SWITCHBLADE', 1) 
	xPlayer.addWeapon("WEAPON_SWITCHBLADE", 0)
end)

ESX.RegisterUsableItem('WEAPON_PROXMINE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_PROXMINE', 1) 
	xPlayer.addWeapon("WEAPON_PROXMINE", 0)
end)

ESX.RegisterUsableItem('WEAPON_BZGAS', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_BZGAS', 1) 
	xPlayer.addWeapon("WEAPON_BZGAS", 0)
end)

ESX.RegisterUsableItem('WEAPON_SMOKEGRENADE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_SMOKEGRENADE', 1) 
	xPlayer.addWeapon("WEAPON_SMOKEGRENADE", 0)
end)

ESX.RegisterUsableItem('WEAPON_MOLOTOV', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_MOLOTOV', 1) 
	xPlayer.addWeapon("WEAPON_MOLOTOV", 0)
end)

ESX.RegisterUsableItem('WEAPON_FIREEXTINGUISHER', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_FIREEXTINGUISHER', 1) 
	xPlayer.addWeapon("WEAPON_FIREEXTINGUISHER", 0)
end)

ESX.RegisterUsableItem('WEAPON_PETROLCAN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_PETROLCAN', 1) 
	xPlayer.addWeapon("WEAPON_PETROLCAN", 0)
end)

ESX.RegisterUsableItem('WEAPON_SNOWBALL', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_SNOWBALL', 1) 
	xPlayer.addWeapon("WEAPON_SNOWBALL", 0)
end)

ESX.RegisterUsableItem('WEAPON_FLARE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_FLARE', 1) 
	xPlayer.addWeapon("WEAPON_FLARE", 0)
end)

ESX.RegisterUsableItem('WEAPON_BALL', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_BALL', 1) 
	xPlayer.addWeapon("WEAPON_BALL", 0)
end)

ESX.RegisterUsableItem('WEAPON_REVOLVER', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_REVOLVER', 1) 
	xPlayer.addWeapon("WEAPON_REVOLVER", 0)
end)

ESX.RegisterUsableItem('WEAPON_POOLCUE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_POOLCUE', 1) 
	xPlayer.addWeapon("WEAPON_POOLCUE", 0)
end)

ESX.RegisterUsableItem('WEAPON_PIPEWRENCH', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_PIPEWRENCH', 1) 
	xPlayer.addWeapon("WEAPON_PIPEWRENCH", 0)
end)

ESX.RegisterUsableItem('WEAPON_SWITCHBLADE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_SWITCHBLADE', 1) 
	xPlayer.addWeapon("WEAPON_SWITCHBLADE", 0)
end)

ESX.RegisterUsableItem('WEAPON_SWITCHBLADE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_SWITCHBLADE', 1) 
	xPlayer.addWeapon("WEAPON_SWITCHBLADE", 0)
end)


--- PISTOLAS

ESX.RegisterUsableItem('WEAPON_COMBATPISTOL', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_COMBATPISTOL', 1) ---- METIDA EN BD ----
	xPlayer.addWeapon("WEAPON_COMBATPISTOL", 0)
end)
ESX.RegisterUsableItem('WEAPON_VINTAGEPISTOL', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_VINTAGEPISTOL', 1) ---- METIDA EN BD ----
	xPlayer.addWeapon("WEAPON_VINTAGEPISTOL", 0)
end)
ESX.RegisterUsableItem('WEAPON_HEAVYPISTOL', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_HEAVYPISTOL', 1) ---- METIDA EN BD ----
	xPlayer.addWeapon("WEAPON_HEAVYPISTOL", 0)
end)

ESX.RegisterUsableItem('WEAPON_PISTOL_MK2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_PISTOL_MK2', 1) ---- METIDA EN BD ----
	xPlayer.addWeapon("WEAPON_PISTOL_MK2", 0)
end)

ESX.RegisterUsableItem('WEAPON_PISTOL', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_PISTOL', 1) 
	xPlayer.addWeapon("WEAPON_PISTOL", 0)
end)

ESX.RegisterUsableItem('WEAPON_PISTOL50', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_PISTOL50', 1) 
	xPlayer.addWeapon("WEAPON_PISTOL50", 0)
end)


ESX.RegisterUsableItem('WEAPON_STUNGUN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_STUNGUN', 1) 
	xPlayer.addWeapon("WEAPON_STUNGUN", 0)
end)

ESX.RegisterUsableItem('WEAPON_FLAREGUN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_FLAREGUN', 1) 
	xPlayer.addWeapon("WEAPON_FLAREGUN", 0)
end)

ESX.RegisterUsableItem('WEAPON_MARKSMANPISTOL', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_MARKSMANPISTOL', 1) 
	xPlayer.addWeapon("WEAPON_MARKSMANPISTOL", 0)
end)

ESX.RegisterUsableItem('WEAPON_MACHINEPISTOL', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_MACHINEPISTOL', 1) 
	xPlayer.addWeapon("WEAPON_MACHINEPISTOL", 0)
end)

ESX.RegisterUsableItem('WEAPON_SNSPISTOL_MK2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_SNSPISTOL_MK2', 1) 
	xPlayer.addWeapon("WEAPON_SNSPISTOL_MK2", 0)
end)

ESX.RegisterUsableItem('WEAPON_REVOLVER_MK2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_REVOLVER_MK2', 1) 
	xPlayer.addWeapon("WEAPON_REVOLVER_MK2", 0)
end)

ESX.RegisterUsableItem('WEAPON_DOUBLEACTION', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_DOUBLEACTION', 1) 
	xPlayer.addWeapon("WEAPON_DOUBLEACTION", 0)
end)

ESX.RegisterUsableItem('WEAPON_CERAMICPISTOL', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_CERAMICPISTOL', 1) 
	xPlayer.addWeapon("WEAPON_CERAMICPISTOL", 0)
end)

--- SUBFUSILES / ESCOPETAS / FUSILES 
 
ESX.RegisterUsableItem('WEAPON_MICROSMG', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_MICROSMG', 1) 
	xPlayer.addWeapon("WEAPON_MICROSMG", 0)
end)

ESX.RegisterUsableItem('WEAPON_MINISMG', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_MINISMG', 1) 
	xPlayer.addWeapon("WEAPON_MINISMG", 0)
end)

ESX.RegisterUsableItem('WEAPON_SMG', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_SMG', 1) 
	xPlayer.addWeapon("WEAPON_SMG", 0)
end)

ESX.RegisterUsableItem('WEAPON_SMG_MK2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_SMG_MK2', 1) 
	xPlayer.addWeapon("WEAPON_SMG_MK2", 0)
end)

ESX.RegisterUsableItem('WEAPON_ASSAULTSMG', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_ASSAULTSMG', 1) 
	xPlayer.addWeapon("WEAPON_ASSAULTSMG", 0)
end)

ESX.RegisterUsableItem('WEAPON_GUSENBERG', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_GUSENBERG', 1) 
	xPlayer.addWeapon("WEAPON_GUSENBERG", 0)
end)

ESX.RegisterUsableItem('WEAPON_COMBATPDW', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_COMBATPDW', 1) 
	xPlayer.addWeapon("WEAPON_COMBATPDW", 0)
end)

ESX.RegisterUsableItem('WEAPON_PUMPSHOTGUN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_PUMPSHOTGUN', 1) 
	xPlayer.addWeapon("WEAPON_PUMPSHOTGUN", 0)
end)

ESX.RegisterUsableItem('WEAPON_SWEEPERSHOTGUN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_SWEEPERSHOTGUN', 1) 
	xPlayer.addWeapon("WEAPON_SWEEPERSHOTGUN", 0)
end)

ESX.RegisterUsableItem('WEAPON_SAWNOFFSHOTGUN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_SAWNOFFSHOTGUN', 1) 
	xPlayer.addWeapon("WEAPON_SAWNOFFSHOTGUN", 0)
end)

ESX.RegisterUsableItem('WEAPON_BULLPUPSHOTGUN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_BULLPUPSHOTGUN', 1) 
	xPlayer.addWeapon("WEAPON_BULLPUPSHOTGUN", 0)
end)

ESX.RegisterUsableItem('WEAPON_ASSAULTSHOTGUN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_ASSAULTSHOTGUN', 1) 
	xPlayer.addWeapon("WEAPON_ASSAULTSHOTGUN", 0)
end)

ESX.RegisterUsableItem('WEAPON_MUSKET', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_MUSKET', 1) 
	xPlayer.addWeapon("WEAPON_MUSKET", 0)
end)

ESX.RegisterUsableItem('WEAPON_HEAVYSHOTGUN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_HEAVYSHOTGUN', 1) 
	xPlayer.addWeapon("WEAPON_HEAVYSHOTGUN", 0)
end)

ESX.RegisterUsableItem('WEAPON_DBSHOTGUN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_DBSHOTGUN', 1) 
	xPlayer.addWeapon("WEAPON_DBSHOTGUN", 0)
end)

ESX.RegisterUsableItem('WEAPON_PUMPSHOTGUN_MK2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_PUMPSHOTGUN_MK2', 1) 
	xPlayer.addWeapon("WEAPON_PUMPSHOTGUN_MK2", 0)
end)

ESX.RegisterUsableItem('WEAPON_MG', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_MG', 1) 
	xPlayer.addWeapon("WEAPON_MG", 0)
end)

ESX.RegisterUsableItem('WEAPON_COMBATMG', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_COMBATMG', 1) 
	xPlayer.addWeapon("WEAPON_COMBATMG", 0)
end)

ESX.RegisterUsableItem('WEAPON_COMBATMG_MK2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_COMBATMG_MK2', 1) 
	xPlayer.addWeapon("WEAPON_COMBATMG_MK2", 0)
end)

ESX.RegisterUsableItem('WEAPON_ASSAULTRIFLE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_ASSAULTRIFLE', 1) 
	xPlayer.addWeapon("WEAPON_ASSAULTRIFLE", 0)
end)

ESX.RegisterUsableItem('WEAPON_ASSAULTRIFLE_MK2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_ASSAULTRIFLE_MK2', 1) 
	xPlayer.addWeapon("WEAPON_ASSAULTRIFLE_MK2", 0)
end)

ESX.RegisterUsableItem('WEAPON_CARBINERIFLE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_CARBINERIFLE', 1) 
	xPlayer.addWeapon("WEAPON_CARBINERIFLE", 0)
end)

ESX.RegisterUsableItem('WEAPON_CARBINERIFLE_MK2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_CARBINERIFLE_MK2', 1) 
	xPlayer.addWeapon("WEAPON_CARBINERIFLE_MK2", 0)
end)

ESX.RegisterUsableItem('WEAPON_ADVANCEDRIFLE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_ADVANCEDRIFLE', 1) 
	xPlayer.addWeapon("WEAPON_ADVANCEDRIFLE", 0)
end)

ESX.RegisterUsableItem('WEAPON_SPECIALCARBINE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_SPECIALCARBINE', 1) 
	xPlayer.addWeapon("WEAPON_SPECIALCARBINE", 0)
end)

ESX.RegisterUsableItem('WEAPON_BULLPUPRIFLE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_BULLPUPRIFLE', 1) 
	xPlayer.addWeapon("WEAPON_BULLPUPRIFLE", 0)
end)

ESX.RegisterUsableItem('WEAPON_COMPACTRIFLE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_COMPACTRIFLE', 1) 
	xPlayer.addWeapon("WEAPON_COMPACTRIFLE", 0)
end)

ESX.RegisterUsableItem('WEAPON_ASSAULTSHOTGUN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_ASSAULTSHOTGUN', 1) 
	xPlayer.addWeapon("WEAPON_ASSAULTSHOTGUN", 0)
end)

ESX.RegisterUsableItem('WEAPON_SNIPERRIFLE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_SNIPERRIFLE', 1) 
	xPlayer.addWeapon("WEAPON_SNIPERRIFLE", 0)
end)

ESX.RegisterUsableItem('WEAPON_HEAVYSNIPER', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_HEAVYSNIPER', 1) 
	xPlayer.addWeapon("WEAPON_HEAVYSNIPER", 0)
end)

ESX.RegisterUsableItem('WEAPON_HEAVYSNIPER_MK2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_HEAVYSNIPER_MK2', 1) 
	xPlayer.addWeapon("WEAPON_HEAVYSNIPER_MK2", 0)
end)

ESX.RegisterUsableItem('WEAPON_MARKSMANRIFLE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_MARKSMANRIFLE', 1) 
	xPlayer.addWeapon("WEAPON_MARKSMANRIFLE", 0)
end)

ESX.RegisterUsableItem('WEAPON_SPECIALCARBINE_MK2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_SPECIALCARBINE_MK2', 1) 
	xPlayer.addWeapon("WEAPON_SPECIALCARBINE_MK2", 0)
end)

ESX.RegisterUsableItem('WEAPON_BULLPUPRIFLE_MK2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_BULLPUPRIFLE_MK2', 1) 
	xPlayer.addWeapon("WEAPON_BULLPUPRIFLE_MK2", 0)
end)

ESX.RegisterUsableItem('WEAPON_MARKSMANRIFLE_MK2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_MARKSMANRIFLE_MK2', 1) 
	xPlayer.addWeapon("WEAPON_MARKSMANRIFLE_MK2", 0)
end)


------------ OTROS -------------

ESX.RegisterUsableItem('GADGET_PARACHUTE', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('GADGET_PARACHUTE', 1) 
	TriggerClientEvent('esx:showNotification', source, "Te has puesto el paracaidas, recuerda tirar de la anilla")
	xPlayer.addWeapon("GADGET_PARACHUTE", 1)
end)

ESX.RegisterUsableItem('WEAPON_PETROLCAN', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('WEAPON_PETROLCAN', 1) 
	xPlayer.addWeapon("WEAPON_PETROLCAN", 1)
end)


ESX.RegisterUsableItem('chalecopesado', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent("esx_trento_weaponmaster:bulletproof", source, "heavyweight")
	xPlayer.removeInventoryItem("chalecopesado", 1)
end)

ESX.RegisterUsableItem('chaleconormal', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent("esx_trento_weaponmaster:bulletproof", source, "normalweight")
	xPlayer.removeInventoryItem("chaleconormal", 1)
end)

ESX.RegisterUsableItem('chalecoligero', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent("esx_trento_weaponmaster:bulletproof", source, "lightweight")
	xPlayer.removeInventoryItem("chalecoligero", 1)
end)

ESX.RegisterUsableItem('chalecopolicial', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent("esx_trento_weaponmaster:bulletproof", source, "police")
	xPlayer.removeInventoryItem("chalecopolicial", 1)
end)


------------------------ FIN -------------------------