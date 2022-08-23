if Config.Framework == "ESX" then
    ESX, currentStation, opened = nil, nil, false

    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj)
                ESX = obj
            end)
            Citizen.Wait(1)
        end
    end)
else
    if Config.Framework == "QBcore" then
        local QBCore = exports['qb-core']:GetCoreObject()
        currentStation, opened = nil, false
    end 
end

Citizen.CreateThread(function()
    while true do
        local currentStation = nil
        local playerCoords = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Stations) do
                local distance = #(playerCoords - v.ticketBuy)

                 if distance < 12.0 and not IsPedInAnyVehicle(PlayerPedId(), false)then
	                DrawMarker(Config.MarkerType, v.ticketBuy, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor[1], Config.MarkerColor[2], Config.MarkerColor[3], 100, false, true, 2, false, false, false, false)
                    currentStation = v.stationNumber
                end
            if distance < 1.5 and not opened then
                SetTextComponentFormat('STRING')
			    AddTextComponentString("Drücke ~INPUT_CONTEXT~ um ein ~g~U-Bahn Ticket~s~ zu kaufen")
			    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
                if IsControlJustPressed(0, 38) then
                    OpenStationsMenu(currentStation)
                    currentStation = nil
                end
            end
        end
        if currentStation == nil then
            Citizen.Wait(1000)
        end
        Citizen.Wait(1)
    end
end)

RegisterNUICallback("action", function(data, cb)
	if data.action == "close" then
		CloseStationsMenu()
	elseif data.action == "transport" then
        if data.station ~= currentStation then
            for k, v in pairs(Config.Stations) do
                if v.stationNumber == data.station then
                    if Config.Framework == "ESX" then
                        ESX.TriggerServerCallback("subway:getMoney", function(get)
                            if get then
                                Teleport(v.exitMetro)
                            else
                                ESX.ShowNotification("Du hast genug Geld!")
                            end
                        end, v.price)
                    elseif Config.Framework == "QBcore" then
                            local QBCore = exports['qb-core']:GetCoreObject()
                            QBCore.Functions.TriggerCallback("subway:getMoney", function(get)
                            if get then    
                                Teleport(v.exitMetro)    
                            else    
                                QBCore.Functions.Notify("Du hast genug Geld!")    
                            end    
                        end, v.price)    
                    end             
                end
                CloseStationsMenu()
            end
        end
	end
end)

OpenStationsMenu = function(crntStation)
    opened = true
    SetNuiFocus(true, true)
    SendNUIMessage({action = "open", station = Config.Stations, currentNumber = crntStation})
end

CloseStationsMenu = function()
    opened = false
    SetNuiFocus(false, false)
    SendNUIMessage({action = "close"})
end

Teleport = function(spawnCoords)
    DoScreenFadeOut(1000)
    Citizen.Wait(575)
    SendNUIMessage({action = "enter"})
    local finished = nil
    CreateThread(function()
        local start = GetGameTimer()/1000
        while GetGameTimer()/1000 - start < Config.SubwayTimer do
            Wait(1000)
        end
        finished = true
		SetEntityCoords(PlayerPedId(), spawnCoords)
        DoScreenFadeIn(1000)
        Citizen.Wait(575)
        SendNUIMessage({action = "exit"})
    end)
    while finished == nil or not finished do
        Wait(0)
    end
    return
end

--Create Blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.SubwayLocations) do
		for i = 1, #v.Coords, 1 do
			local blip = AddBlipForCoord(v.Coords[i])
			SetBlipSprite (blip, Config.SubwayBlip.Sprite)
			SetBlipDisplay(blip, Config.SubwayBlip.Display)
			SetBlipScale  (blip, Config.SubwayBlip.Scale)
			SetBlipColour (blip, Config.SubwayBlip.Color)
			SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.SubwayBlip.Title)
            EndTextCommandSetBlipName(blip)
		end
	end
end)