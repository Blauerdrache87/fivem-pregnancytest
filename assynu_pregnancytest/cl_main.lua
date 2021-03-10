ESX = nil
PlayerData = {}
tabletka = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
    Citizen.Wait(5000)
    PlayerData = ESX.GetPlayerData()
end)


RegisterNetEvent('test_ciazowy:tabletka')
AddEventHandler('test_ciazowy:tabletka', function()

    TriggerEvent('skinchanger:getSkin', function(skin)
        
        if skin.sex == 1 then
            tabletka = 1
            ESX.ShowNotification('Użyto tabletki antykoncepcyjnej')
        else
            ESX.ShowNotification('Nie możesz tego użyc!')
        end
    end)
end)


RegisterNetEvent('test_ciazowy:start')
AddEventHandler('test_ciazowy:start', function()

    local szansa = nil

    TriggerEvent('skinchanger:getSkin', function(skin)

    if skin.sex == 1 then

        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if closestPlayer ~= -1 and closestDistance <= 5.0 then

            ESX.TriggerServerCallback('test_ciazowy:gumka', function(cb)

                ESX.ShowNotification('Użyto testu ciążowego')

                if tabletka == 1 or cb == true then
                    szansa = math.random(1, 5)
                    if szansa == 1 then
                        ESX.ShowNotification('Test pozytywny')
                    else
                        ESX.ShowNotification('Test negatywny')
                    end
                else
                    szansa = math.random(1, 2)
                    if szansa == 1 then
                        ESX.ShowNotification('Test pozytywny')
                    else
                        ESX.ShowNotification('Test negatywny')
                    end
                end

            end, closestPlayer)
        else
            ESX.ShowNotification('Niema nikogo obok ciebie!')
        end

    else
        ESX.ShowNotification('Nie możesz tego użyc!')
    end
    end)

    tabletka = nil

end)