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
    sampAddChatMessage("{00FF00}[Loaded]{FFFFFF} FastCall загружен.", -1) -- Оповещение
	notification.Notification(u8"Loaded", u8"FastCall загружен.", "info", 5.0) -- Оповещение
    while true do wait(0) end
end

-- команда /ca ID
function cmd_ca(param)
    if not param or param == "" then
        sampAddChatMessage("{00FF00}[FastCall] {FF0000}Неверный формат использования. {FFFFFF}Пример: /ca [ID].", -1) -- Оповещение
		notification.Notification(u8"FastCall", u8"Неверный формат использования.\nПример: /ca [ID].", "info", 5.0) -- Оповещение
        return
    end
    targetID = tonumber(param)
    if targetID == nil then
        sampAddChatMessage("{00FF00}[FastCall] {FF0000}Неверный ID.", -1) -- Оповещение
		notification.Notification(u8"FastCall", u8"Неверный ID.", "info", 5.0) -- Оповещение
        return
    end
    waitingNumber = true
    sampSendChat("/number " .. targetID)
end

-- получение номера из чата
function sampev.onServerMessage(color, text)
    if waitingNumber then
        -- удаление кода цветов
        local cleanText = text:gsub("{......}", "")
        -- поиск чисел (номера) после двоеточий
        local num = cleanText:match(":%s*(%d+)")
        if num then
            sampAddChatMessage("{00FF00}[FastCall] {FFFFFF}Звоню по номеру: " .. num, -1) -- Оповещение
			notification.Notification(u8"FastCall", u8"Звоню по полученному номеру.", "info", 5.0) -- Оповещение
            sampSendChat("/call " .. num)
            waitingNumber = false
            return
        end
    end
end
