local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx_trento_weaponmaster:aim')
AddEventHandler('esx_trento_weaponmaster:aim', function(type)
    local style = type[1]

    if style == "default" or style == nil then
        SetWeaponAnimationOverride(PlayerPedId(), GetHashKey('Default'))
        ESX.ShowNotification('Se ha cambiado el estilo de apuntado al por defecto')
    elseif style == "gang" then
        SetWeaponAnimationOverride(PlayerPedId(), GetHashKey("Gang1H"))
        ESX.ShowNotification('Se ha cambiado el estilo de apuntado a '.. style)
    elseif style == "hillbilly" then
        SetWeaponAnimationOverride(PlayerPedId(), GetHashKey('Hillbilly'))
        ESX.ShowNotification('Se ha cambiado el estilo de apuntado a '.. style)
    elseif style == "freemode" then
        SetWeaponAnimationOverride(PlayerPedId(), GetHashKey('MP_F_Freemode'))  
        ESX.ShowNotification('Se ha cambiado el estilo de apuntado a '.. style)              
    end
end)