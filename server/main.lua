ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('holster', function(source, args)
	-- First of all, we get all data from the source
    local xPlayer = ESX.GetPlayerFromId(source)
    local _source = source

    TriggerClientEvent('esx_foras_weapons:executeCommand', source, args) 

end, false)

TriggerEvent('esx:getSharedObject', function( obj ) ESX = obj end)
 
ESX.RegisterUsableItem('supressor', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_forasteros_easyweapon:use', source, 'supressor')
	xPlayer.removeInventoryItem('supressor', 1)
end)
 
ESX.RegisterUsableItem('flashlight', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_forasteros_easyweapon:use', source, 'flashlight')
	xPlayer.removeInventoryItem('flashlight', 1)
end)
 
ESX.RegisterUsableItem('grip', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_forasteros_easyweapon:use', source, 'grip')
	xPlayer.removeInventoryItem('grip', 1)
end)
 
ESX.RegisterUsableItem('weaponskin', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_forasteros_easyweapon:use', source, 'weaponskin')
	xPlayer.removeInventoryItem('weaponskin', 1)
end)

ESX.RegisterUsableItem('lspdtint', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_forasteros_easyweapon:addtint', source, 'lspdtint')
	xPlayer.removeInventoryItem('lspdtint', 1)
end)

RegisterServerEvent('esx_forasteros_easyweapon:giveBack')
AddEventHandler('esx_forasteros_easyweapon:giveBack', function(source, item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem(item, 1)
end)