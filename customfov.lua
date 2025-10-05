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
        sampAddChatMessage("{00FF00}[Loaded]{FFFFFF} Custom FOV загружен.", 0xFFFFFF) -- Оповещение
		notification.Notification(u8"Loaded", u8"Custom FOV загружен.", "info", 5.0) -- Оповещение

    sampRegisterChatCommand('fov', function (arg)
        enable = not enable
        sampAddChatMessage('{00ccff}[Custom FOV] {ffffff}Скрипт ' .. (enable and 'активирован! Для деактивации введите команду еще раз' or 'деактивирован! Для повторной активации введите команду еще раз.'),-1) -- Оповещение
        if enable then
            if arg and arg ~= '' and arg:find('%d+') and not arg:find('%D+') then
                fov = arg
                sampAddChatMessage('{00ccff}[Custom FOV] {ffffff}Установлено новое значение ' .. fov,-1) -- Оповещение
				notification.Notification(u8"Custom FOV", u8"Установлено новое значение.", "info", 5.0) -- Оповещение
            else
                sampAddChatMessage('{00ccff}[Custom FOV] {ffffff}Укажите нужное Вам значение {00ccff}(/fov [Угол обзора], самое оптимальное - 100.)',-1) -- Оповещение
				notification.Notification(u8"Custom FOV", u8"Укажите нужное Вам значение (/fov \n[Угол обзора], самое оптимальное - 100).", "info", 10.0) -- Оповещение
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