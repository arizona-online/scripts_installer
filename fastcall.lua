script_name("FastCall")
script_author("Mike_Rotch")
script_version("1.0")

require 'lib.moonloader'
require('encoding').default = 'CP1251'

local sampev = require 'lib.samp.events'
local u8 = require('encoding').UTF8
local notification = require("notifications")

local waitingNumber = false
local targetID = -1

function main()
    repeat wait(0) until isSampAvailable()
    sampRegisterChatCommand("ca", cmd_ca)
    sampAddChatMessage("{00FF00}[Loaded]{FFFFFF} FastCall ��������.", -1) -- ����������
	notification.Notification(u8"Loaded", u8"FastCall ��������.", "info", 5.0) -- ����������
    while true do wait(0) end
end

-- ������� /ca ID
function cmd_ca(param)
    if not param or param == "" then
        sampAddChatMessage("{00FF00}[FastCall] {FF0000}�������� ������ �������������. {FFFFFF}������: /ca [ID].", -1) -- ����������
		notification.Notification(u8"FastCall", u8"�������� ������ �������������.\n������: /ca [ID].", "info", 5.0) -- ����������
        return
    end
    targetID = tonumber(param)
    if targetID == nil then
        sampAddChatMessage("{00FF00}[FastCall] {FF0000}�������� ID.", -1) -- ����������
		notification.Notification(u8"FastCall", u8"�������� ID.", "info", 5.0) -- ����������
        return
    end
    waitingNumber = true
    sampSendChat("/number " .. targetID)
end

-- ��������� ������ �� ����
function sampev.onServerMessage(color, text)
    if waitingNumber then
        -- �������� ���� ������
        local cleanText = text:gsub("{......}", "")
        -- ����� ����� (������) ����� ���������
        local num = cleanText:match(":%s*(%d+)")
        if num then
            sampAddChatMessage("{00FF00}[FastCall] {FFFFFF}����� �� ������: " .. num, -1) -- ����������
			notification.Notification(u8"FastCall", u8"����� �� ����������� ������.", "info", 5.0) -- ����������
            sampSendChat("/call " .. num)
            waitingNumber = false
            return
        end
    end
end
