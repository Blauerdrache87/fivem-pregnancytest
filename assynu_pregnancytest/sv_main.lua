ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('test_ciazowy', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('test_ciazowy', 1)

	TriggerClientEvent('test_ciazowy:start', source)
end)

ESX.RegisterUsableItem('tabletki', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tabletki', 1)

	TriggerClientEvent('test_ciazowy:tabletka', source)
end)

ESX.RegisterServerCallback('test_ciazowy:gumka', function(source, cb, player)
	local xPlayer = ESX.GetPlayerFromId(player)

	if xPlayer.getInventoryItem('gumka').count > 0 then
		xPlayer.removeInventoryItem('gumka', 1)
		cb(true)
	else
		cb(false)
	end
end)