local QBCore = exports['qb-core']:GetCoreObject()
local ItemList = {
   
    ["metalscrap"]  =  10 ,
    ["plastic"]     =  20 ,
    ["copper"]      =  30 ,
    ["iron"]        =  40 ,
    ["aluminum"]    =  50 ,
    ["steel"]       =  60 ,
    ["glass"]       =  70 ,
}

RegisterNetEvent('qb-sellitems:server:sell', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    
    local xItem = Player.Functions.GetItemsByName(ItemList)
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if ItemList[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)

        Player.Functions.AddMoney("cash", price, "sold-resources")
            TriggerClientEvent('QBCore:Notify', src, "You sold your resources for $"..price)
            TriggerEvent("qb-log:server:CreateLog", "sellitems", "resources", "blue", "**"..GetPlayerName(src) .. "** got $"..price.." for selling the resources")
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You have no resources..")
    end

end)

