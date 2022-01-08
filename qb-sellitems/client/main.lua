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

CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)

            local dist = #(PlayerPos - vector3(-96.97, -1013.49, 27.28)) 
            if dist < 10 then
                InRange = true
                DrawMarker(2, -96.97, -1013.49, 27.28, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
                if dist < 1 then

                    DrawText3Ds(-96.97, -1013.49, 27.28, '~g~E~w~ - Sell resources') 
                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('qb-sellitems:server:sell')
                    end
                end
            end

        if not InRange then
            Wait(5000)
        end
        Wait(5)
    end
end)
