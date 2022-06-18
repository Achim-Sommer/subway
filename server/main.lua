if Config.Framework == 'QBcore' then
    QBCore = exports['qb-core']:GetCoreObject()

    local QBCore = exports['qb-core']:GetCoreObject()
    QBCore.Functions.CreateCallback('esx_subway:getMoney', function(source, cb, price)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        local price = math.abs(price) -- simple protection against cheaters
        if xPlayer.PlayerData.money.cash >= price then
        -- if Player.getMoney() >= price then
            xPlayer.Functions.RemoveMoney('cash', price)
            cb(true)
        else
            cb(false)
        end   
    end)  
else
    if Config.Framework == 'ESX' then
        ESX = nil

        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
    
        ESX.RegisterServerCallback('esx_subway:getMoney', function(source, cb, price)
            local xPlayer = ESX.GetPlayerFromId(source)
            local price = math.abs(price) -- simple protection against cheaters
            if xPlayer.getMoney() >= price then
                xPlayer.removeMoney(price)
                cb(true)
            else
                cb(false)
            end
        end)
    end
end