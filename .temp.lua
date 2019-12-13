local data = json.parse(body)
        
        local msg = 
        [[
        [p=center][size=20][b]New Release! [i][color=#AAAAAA](]] .. data.tag_name .. [[)[/color][/i][/b][/size][/p]
        [color=#CCCC22][size=18][b] ]] .. data.name .. [[ [/b][/size][/color]
        
        ]] .. data.body .. [[
        
        [hr][p=right][url=]] .. data.html_url .. [[]View on Github[/url][/p] ]]
