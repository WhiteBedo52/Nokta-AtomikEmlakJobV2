local QBCore = exports['qb-core']:GetCoreObject()

function HoldingMenu(job)
    exports['qb-menu']:openMenu({
        {
            header = "Holding Menüsü",
            isMenuHeader = true,
        },
        {
            header = "Para Akla",
            txt = "Yarı fiyatına temiz para alın.",
            params = {
                event = "atomik-holdingjob:paraakla",
                args = {
                    job = job
                }
            }
        },
        {
            header = "Depoya Eriş",
            txt = "Holding deponuza erişin.",
            params = {
                event = "atomik-holdingjob:depo",
                args = {
                    job = job
                }
            }
        },
    })
end

RegisterNetEvent("atomik-holdingjob:depo", function(data)
    local job = data.job
    TriggerServerEvent("inventory:server:OpenInventory", "stash", job .. "_depo")
    TriggerEvent("inventory:client:SetCurrentStash", job .. "_depo")
end)

RegisterNetEvent("atomik-holdingjob:paraakla", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Para Akla",
        submitText = "Akla",
        inputs = {
            {
                text = "Miktar",
                name = "bill",
                type = "number",
                isRequired = true
            }
        }
    })
    
    if dialog and dialog['bill'] then
        local amount = tonumber(dialog['bill'])
        if amount and amount > 0 then
            TriggerServerEvent("atomik-holdingjob:server:paraakla", amount)
        else
            QBCore.Functions.Notify("0'dan büyük bir değer girin.", "error")
        end
    else
        QBCore.Functions.Notify("Geçerli bir miktar girin.", "error")
    end
end)


CreateThread(function()
    for _, location in ipairs(Config.Locations) do
        exports['qb-target']:AddCircleZone(location.name, location.coords, 1.2, { 
            name = location.name,
            debugPoly = false,
        }, {
            options = {
                {
                    type = "client",
                    event = "atomik-holdingjob:menu",
                    icon = "fas fa-circle",
                    label = "Menü",
                    job = location.job
                },
            },
            distance = 4.0
        })
    end
end)

RegisterNetEvent("atomik-holdingjob:menu", function(data)
    HoldingMenu(data.job)
end)

CreateThread(function()
    for _, location in ipairs(Config.Locations) do
        if location.blipEnabled then
            local blip = AddBlipForCoord(location.coords)
            SetBlipSprite(blip, 476)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 0.4)
            SetBlipColour(blip, 69)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Kiralık Emlak")
            EndTextCommandSetBlipName(blip)
        end
    end
end)

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 250
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 75)
end

