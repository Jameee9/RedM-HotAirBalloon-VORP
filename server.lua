local VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

RegisterServerEvent('spawnBalloon')
AddEventHandler('spawnBalloon', function()
    local _source = source
    local User = VORPcore.getUser(_source)
    local Character = User.getUsedCharacter
    local price = 750 -- Price to Purchase Ballon

    if Character.money >= price then
    
        Character.removeCurrency(0, price) -- 0 for Cash, 1 for Gold

        TriggerClientEvent('spawnBalloonClient', _source)
    else

        TriggerClientEvent('vorp:TipBottom', _source, 'You do not have enough money to spawn a hot air balloon.', 4000)
    end
end)

