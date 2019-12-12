local http = require('coro-http')
local api = require("fromage")
local json = require('json')
local client = api()
local enums = client.enumerations()

local forum = args[2]
local thread = args[3]
local name = args[4]
local password = args[5]

print(forum)
print(thread)
print(name)

coroutine.wrap(function()

    client.connect(name, password)

    if client.isConnected() then
        print('Successfully logged in as ' .. name)

        print('Answering topic')

        --local head, body = http.request('GET', 'https://api.github.com/repos/Seniru/Timers4TFM/releases/latest', {{ "user-agent", 'Seniru' }})
        
        --TODO: Replace the merry christmas with the message
        client.answerTopic("Merry Christmas", {
            f = tonumber(forum),
            t = tonumber(thread)
        })

        print('Answered successfully!')

    end

    client.disconnect()
end)()
