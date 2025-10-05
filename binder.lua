script_name("Binder")
script_author("Mike_Rotch")
script_version("1.0")

require 'lib.moonloader'
require('encoding').default = 'CP1251'

local u8 = require('encoding').UTF8
local notification = require("notifications")

function main()
        while not isSampAvailable() do wait(100) end
        sampAddChatMessage("{00FF00}[Loaded]{FFFFFF} Binder загружен.", 0xFFFFFF) -- Оповещение
		notification.Notification(u8"Loaded", u8"Binder загружен.", "info", 5.0) -- Оповещение
	
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(0) end
    
    while true do
        wait(0)
        
        if isKeyJustPressed(VK_XBUTTON1) and not sampIsCursorActive() then
            sampProcessChatInput('/dr 3') -- Использование укропа
			sampAddChatMessage('{BE2D2D}[Binder Punish]{FFFFFF} Нажата комбинация клавиш, использую Укроп...') -- Оповещение
			notification.Notification(u8"Binder Punish", u8"Нажата комбинация клавиш, использую\nУкроп...", "info", 3.0) -- Оповещение
        end
        
        if isKeyJustPressed(VK_END) and not sampIsCursorActive() then
            sampProcessChatInput('/balloon') -- Развертываиние шара
			sampAddChatMessage('{BE2D2D}[Binder Punish]{FFFFFF} Нажата комбинация клавиш, разворачиваю Шар...') -- Оповещение
			notification.Notification(u8"Binder Punish", u8"Нажата комбинация клавиш,\nразворачиваю Шар...", "info", 3.0) -- Оповещение
        end
		
		if isKeyJustPressed(VK_OEM_5) and isKeyDown(VK_OEM_6) and not sampIsCursorActive() then
            sampProcessChatInput('/dk') -- Домкрат
			sampAddChatMessage('{BE2D2D}[Binder Punish]{FFFFFF} Нажата комбинация клавиш, использую Домкрат...') -- Оповещение
			notification.Notification(u8"Binder Punish", u8"Нажата комбинация клавиш, использую\nДомкрат...", "info", 3.0) -- Оповещение
	    end
			
		if isKeyJustPressed(VK_F3) and not sampIsCursorActive() then
            sampProcessChatInput('/fov 100') -- Настройка Custom FOV на значение 100
			sampAddChatMessage('{BE2D2D}[Binder Punish]{FFFFFF} Нажата комбинация клавиш, изменяю FOV на значение 100...') -- Оповещение
			notification.Notification(u8"Binder Punish x Custom FOV", u8"Нажата комбинация клавиш, изменяю\nFOV на значение 100...", "info", 3.0) -- Оповещение
		end
    end
end