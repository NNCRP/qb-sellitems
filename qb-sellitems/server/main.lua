local QBCore = exports['qb-core']:GetCoreObject()
local Scraplist = {
   
    ["metalscrap"]  =  10 ,
    ["plastic"]     =  20 ,
    ["copper"]      =  30 ,
    ["iron"]        =  40 ,
    ["aluminum"]    =  50 ,
    ["steel"]       =  60 ,
    ["glass"]       =  70 ,
}

local Druglist = {

    ["weed_white-widow"]    = 100,
    ["weed_skunk"]          = 100,
    ["weed_purple-haze"]    = 100,
    ["weed_og-kush"]        = 100,
    ["weed_amnesia"]        = 100,
    ["weed_ak47"]           = 100,
    ["cokebaggy"]           = 1000,

}

RegisterNetEvent('qb-sellitems:server:sellscrap', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    
    local xItem = Player.Functions.GetItemsByName(Scraplist)
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if Scraplist[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Scraplist[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)

        Player.Functions.AddMoney("cash", price, "sold-resources")
            TriggerClientEvent('QBCore:Notify', src, "You sold your resources for $"..price)
            TriggerEvent("qb-log:server:CreateLog", "sellscrap", "resources", "blue", "**"..GetPlayerName(src) .. "** got $"..price.." for selling the resources")
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You have no resources..")
    end

end)

RegisterNetEvent('qb-sellitems:server:selldrugs', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    
    local xItem = Player.Functions.GetItemsByName(Druglist)
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if Druglist[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Druglist[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)

        Player.Functions.AddMoney("cash", price, "sold-resources")
            TriggerClientEvent('QBCore:Notify', src, "You sold your Drugs for $"..price)
            TriggerEvent("qb-log:server:CreateLog", "selldrugs", "resources", "blue", "**"..GetPlayerName(src) .. "** got $"..price.." for selling the resources")
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You have no resources..")
    end

end)

