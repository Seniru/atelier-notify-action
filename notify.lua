local http = require('coro-http')
local api = require("fromage")
local json = require('json')
local client = api()
local enums = client.enumerations()

local forum = tonumber(args[2])
local thread = tonumber(args[3])
local name = args[4]
local password = args[5]

coroutine.wrap(function()
    
    print('Attempting to log in as ' .. name .. '...')
    client.connect(name, password)

    if client.isConnected() then
        print('Successfully logged in as ' .. name)

        print('Answering topic (forum: ' .. tostring(forum) .. ', thread: ' .. tostring(thread) .. ') ...')

        --local head, body = http.request('GET', 'https://api.github.com/repos/Seniru/Timers4TFM/releases/latest', {{ "user-agent", 'Seniru' }})
        
        --TODO: Replace the merry christmas with the message
        client.answerTopic("Merry Christmas", {
            f = 5,
            t = 902724
        })

        print('Answered successfully!')

    end

    client.disconnect()
end)()
