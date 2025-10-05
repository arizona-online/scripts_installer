script_name("Binder")
script_author("Mike_Rotch")
script_version("1.0")

require 'lib.moonloader'
require('encoding').default = 'CP1251'

local u8 = require('encoding').UTF8
local notification = require("notifications")

function main()
        while not isSampAvailable() do wait(100) end
        sampAddChatMessage("{00FF00}[Loaded]{FFFFFF} Binder ��������.", 0xFFFFFF) -- ����������
		notification.Notification(u8"Loaded", u8"Binder ��������.", "info", 5.0) -- ����������
	
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(0) end
    
    while true do
        wait(0)
        
        if isKeyJustPressed(VK_XBUTTON1) and not sampIsCursorActive() then
            sampProcessChatInput('/dr 3') -- ������������� ������
			sampAddChatMessage('{BE2D2D}[Binder Punish]{FFFFFF} ������ ���������� ������, ��������� �����...') -- ����������
			notification.Notification(u8"Binder Punish", u8"������ ���������� ������, ���������\n�����...", "info", 3.0) -- ����������
        end
        
        if isKeyJustPressed(VK_END) and not sampIsCursorActive() then
            sampProcessChatInput('/balloon') -- �������������� ����
			sampAddChatMessage('{BE2D2D}[Binder Punish]{FFFFFF} ������ ���������� ������, ������������ ���...') -- ����������
			notification.Notification(u8"Binder Punish", u8"������ ���������� ������,\n������������ ���...", "info", 3.0) -- ����������
        end
		
		if isKeyJustPressed(VK_OEM_5) and isKeyDown(VK_OEM_6) and not sampIsCursorActive() then
            sampProcessChatInput('/dk') -- �������
			sampAddChatMessage('{BE2D2D}[Binder Punish]{FFFFFF} ������ ���������� ������, ��������� �������...') -- ����������
			notification.Notification(u8"Binder Punish", u8"������ ���������� ������, ���������\n�������...", "info", 3.0) -- ����������
	    end
			
		if isKeyJustPressed(VK_F3) and not sampIsCursorActive() then
            sampProcessChatInput('/fov 100') -- ��������� Custom FOV �� �������� 100
			sampAddChatMessage('{BE2D2D}[Binder Punish]{FFFFFF} ������ ���������� ������, ������� FOV �� �������� 100...') -- ����������
			notification.Notification(u8"Binder Punish x Custom FOV", u8"������ ���������� ������, �������\nFOV �� �������� 100...", "info", 3.0) -- ����������
		end
    end
end