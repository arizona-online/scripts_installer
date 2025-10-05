script_name("PayDayWarning")
script_author("Mike_Rotch")
script_version("1.0")

require 'lib.moonloader'
require('encoding').default = 'CP1251'

local u8 = require('encoding').UTF8
local notification = require("notifications")

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
    sampAddChatMessage("{00FF00}[Loaded]{FFFFFF} Warning PayDay ��������.", 0xFFFFFF) -- ����������
	notification.Notification(u8"Loaded", u8"Warning PayDay ��������.", "info", 5.0) -- ����������

    sampRegisterChatCommand("testpd", function()
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
    sampAddChatMessage("{00FF00}[Warning]{FFFFFF} " .. chatMsg, 0xFFFFFF) -- ����������
	notification.Notification(u8"Warning", u8"����� ����� PayDay!", "info", 3.0) -- ����������
    
    -- ����� ����� ��
    local screenMsg = string.format("~r~PAY DAY IN ~w~%d ~r~MINUTES", minsLeft)
    printStringNow(screenMsg, 5000)
    
    -- ������� ������
    printStringNow("~r~PayDay is a coming soon!", 5000, 0.5, 0.45)
end

function TestPayday()
    sampAddChatMessage("{00FF00}[Warning]{FFFFFF} �������� �������������� ��������.", 0xFFFFFF) -- ����������
	notification.Notification(u8"Warning", u8"�������� �������������� ��������.", "info", 3.0) -- ����������
    ShowPaydayWarning(5)
end