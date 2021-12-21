if Config.OOC_CHAT_DEFAULT then
    AddEventHandler('chatMessage', function(source, name, message)
        TriggerClientEvent(
            'chatMessage',
            -1,
            Config.OOC_CHAT_PREFIX .. ' ' .. source .. ' | ' .. name,
            {255, 255, 255},
            message
        )

        CancelEvent()
    end)
end