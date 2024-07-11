print([[^2
      ███╗   ██╗ ██████╗ ██╗  ██╗████████╗ █████╗ 
      ████╗  ██║██╔═══██╗██║ ██╔╝╚══██╔══╝██╔══██╗
      ██╔██╗ ██║██║   ██║█████╔╝    ██║   ███████║
      ██║╚██╗██║██║   ██║██╔═██╗    ██║   ██╔══██║
      ██║ ╚████║╚██████╔╝██║  ██╗   ██║   ██║  ██║
      ╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝
          ^8by BeyazADAM (github.com/noktadev)^0
^0---------------------[^3Tests^0]---------------------]])

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("atomik-holdingjob:server:paraakla")
AddEventHandler("atomik-holdingjob:server:paraakla", function(amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer then
        local item = xPlayer.Functions.GetItemByName('markedbills')

        if item and item.amount >= amount then
            xPlayer.Functions.RemoveItem('markedbills', amount)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], 'remove', amount)
            TriggerClientEvent('QBCore:Notify', source, 'Başarili şu kadar nakit aldin: $'..amount..'', 'success')
            xPlayer.Functions.AddMoney('cash', amount, "Holding")
        else
            TriggerClientEvent('QBCore:Notify', source, 'Üzerinde o kadar para yok', 'error')
        end
    else
        print("xPlayer bulunamadi. source: " .. tostring(source))
    end
end)
