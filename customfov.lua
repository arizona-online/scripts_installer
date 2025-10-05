script_name("Custom FOV")
script_author("MTG MODS x Mike_Rotch")
script_version("1.0")

require 'lib.moonloader'
require('encoding').default = 'CP1251'

local u8 = require('encoding').UTF8
local notification = require("notifications")
local enable = false
local fov = 70

function main()
        while not isSampAvailable() do wait(100) end
        sampAddChatMessage("{00FF00}[Loaded]{FFFFFF} Custom FOV ��������.", 0xFFFFFF) -- ����������
		notification.Notification(u8"Loaded", u8"Custom FOV ��������.", "info", 5.0) -- ����������

    sampRegisterChatCommand('fov', function (arg)
        enable = not enable
        sampAddChatMessage('{00ccff}[Custom FOV] {ffffff}������ ' .. (enable and '�����������! ��� ����������� ������� ������� ��� ���' or '�������������! ��� ��������� ��������� ������� ������� ��� ���.'),-1) -- ����������
        if enable then
            if arg and arg ~= '' and arg:find('%d+') and not arg:find('%D+') then
                fov = arg
                sampAddChatMessage('{00ccff}[Custom FOV] {ffffff}����������� ����� �������� ' .. fov,-1) -- ����������
				notification.Notification(u8"Custom FOV", u8"����������� ����� ��������.", "info", 5.0) -- ����������
            else
                sampAddChatMessage('{00ccff}[Custom FOV] {ffffff}������� ������ ��� �������� {00ccff}(/fov [���� ������], ����� ����������� - 100.)',-1) -- ����������
				notification.Notification(u8"Custom FOV", u8"������� ������ ��� �������� (/fov \n[���� ������], ����� ����������� - 100).", "info", 10.0) -- ����������
            end
        end
    end)

    while true do
        wait(0)
        if enable then
            cameraSetLerpFov(fov, fov, 1000, 1)
        end
    end

end