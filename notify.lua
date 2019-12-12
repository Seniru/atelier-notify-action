local http = require('coro-http')
local api = require("fromage")
local json = require('json')
local client = api()
local enums = client.enumerations()

local forum = args[2]
local thread = args[3]
local name = args[4]
local password = args[5]

coroutine.wrap(function()

    client.connect(name, password)

    if client.isConnected() then
        print('Successfully logged in as ' .. name)

        print('Answering topic')

        local head, body = http.request('GET', 'https://api.github.com/repos/Seniru/Timers4TFM/releases/latest', {{ "user-agent", 'Seniru' }})
        local data = json.parse(body)
        
        local msg = 
        [[
        [p=center][size=20][b]New Release! [i][color=#AAAAAA](]] .. data.tag_name .. [[)[/color][/i][/b][/size][/p]
        [color=#CCCC22][size=18][b] ]] .. data.name .. [[ [/b][/size][/color]
        
        ]] .. data.body .. [[
        
        [hr][p=right][url=]] .. data.html_url .. [[]View on Github[/url][/p] ]]

        --TODO: Replace the merry christmas with the message
        client.answerTopic("Merry Christmas", {
            f = forum,
            t = thread
        })

        print('Answered successfully!')

    end

    client.disconnect()
end)()
