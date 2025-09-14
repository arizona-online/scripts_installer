script_name("PaydayWarning")
script_author("Mike_Rotch")
script_version("2.1")

local warnings = {
    [20] = 10,
    [25] = 5,
    [29] = 1,
    [50] = 10,
    [55] = 5,
    [59] = 1
}

function main()
    while not isSampAvailable() do wait(100) end
    sampAddChatMessage("{00FF00}[Loaded]{FFFFFF} Warning PayDay загружен.", 0xFFFFFF)

    sampRegisterChatCommand("ts", function()
        TestPayday()
    end)

    while true do
        local time = os.date("*t")
        local minute = time.min

        if warnings[minute] then
            ShowPaydayWarning(warnings[minute])
            wait(60000)
        end
        wait(1000)
    end
end

function ShowPaydayWarning(minsLeft)
    -- в чат
    local chatMsg = string.format("Через %d мин будет PayDay!", minsLeft)
    sampAddChatMessage("{00FF00}[Warning]{FFFFFF} " .. chatMsg, 0xFFFFFF)
    
    -- хуйня какая то
    local screenMsg = string.format("~r~PAY DAY IN ~w~%d ~r~MINUTES", minsLeft)
    printStringNow(screenMsg, 5000)
    
    -- рабочая залупа
    printStringNow("~r~PayDay is a coming soon!", 5000, 0.5, 0.45)
end

function TestPayday()
    sampAddChatMessage("{00FF00}[Warning]{FFFFFF} Тестовое предупреждение запущено!", 0xFFFFFF)
    ShowPaydayWarning(5)
end