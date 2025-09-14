script_name("FastCall")
script_author("Mike_Rotch")

local sampev = require 'lib.samp.events'

local waitingNumber = false
local targetID = -1

function main()
    repeat wait(0) until isSampAvailable()
    sampRegisterChatCommand("ca", cmd_ca)
    sampAddChatMessage("{00FF00}[Loaded]{FFFFFF} FastCall ��������.", -1)
    while true do wait(0) end
end

-- ������� /ca ID
function cmd_ca(param)
    if not param or param == "" then
        sampAddChatMessage("{FF0000}�������� ������ �������������. ������: /ca [ID]", -1)
        return
    end
    targetID = tonumber(param)
    if targetID == nil then
        sampAddChatMessage("{FF0000}�������� ID.", -1)
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
            sampAddChatMessage("{00FF00}[FastCall] ����� �� ������: " .. num, -1)
            sampSendChat("/call " .. num)
            waitingNumber = false
            return
        end
    end
end
