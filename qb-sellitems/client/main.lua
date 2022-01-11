local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local scraplocation = vector3(-97.06, -1013.48, 27.28) 
local sl = scraplocation --short version to make it easier (sl.x = x value of the vector3 and so on) 

local druglocation = vector3(136.71, -1180.01, 29.79)
local dl = druglocation


CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)

            local dist = #(PlayerPos - vector3(sl.x, sl.y, sl.z)) 
            if dist < 10 then
                InRange = true
                DrawMarker(2,sl.x, sl.y, sl.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
                if dist < 1 then

                    DrawText3Ds(sl.x, sl.y, sl.z, '~g~E~w~ - Sell resources') 
                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('qb-sellitems:server:sellscrap')
                    end
                end
            end

        if not InRange then
            Wait(5000)
        end
        Wait(5)
    end
end)

CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)

            local dist = #(PlayerPos - vector3(dl.x, dl.y, dl.z)) 
            if dist < 10 then
                InRange = true
                DrawMarker(2,dl.x, dl.y, dl.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
                if dist < 1 then

                    DrawText3Ds(dl.x, dl.y, dl.z, '~g~E~w~ - Sell Drugs') 
                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('qb-sellitems:server:selldrugs')
                    end
                end
            end

        if not InRange then
            Wait(5000)
        end
        Wait(5)
    end
end)
