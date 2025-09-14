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
    sampAddChatMessage("{00FF00}[Loaded]{FFFFFF} Warning PayDay ��������.", 0xFFFFFF)

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
    -- � ���
    local chatMsg = string.format("����� %d ��� ����� PayDay!", minsLeft)
    sampAddChatMessage("{00FF00}[Warning]{FFFFFF} " .. chatMsg, 0xFFFFFF)
    
    -- ����� ����� ��
    local screenMsg = string.format("~r~PAY DAY IN ~w~%d ~r~MINUTES", minsLeft)
    printStringNow(screenMsg, 5000)
    
    -- ������� ������
    printStringNow("~r~PayDay is a coming soon!", 5000, 0.5, 0.45)
end

function TestPayday()
    sampAddChatMessage("{00FF00}[Warning]{FFFFFF} �������� �������������� ��������!", 0xFFFFFF)
    ShowPaydayWarning(5)
end