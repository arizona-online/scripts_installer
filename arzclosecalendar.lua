script_name("ArzCloseCalendar")
script_author("Freym x Mike_Rotch")
script_version("1.0")

require ('moonloader')
require 'lib.moonloader'
require('encoding').default = 'CP1251'

local u8 = require('encoding').UTF8
local notification = require("notifications")
local inicfg = require 'inicfg'
math.randomseed(os.clock())
local json_timer = os.time()
local mainini = inicfg.load({   
    launcher =
    {
        banner = true
    }
	}, "banner")
inicfg.save(mainini, 'banner2.ini') 
if not doesFileExist('moonloader/config/banner2.ini') then
	inicfg.save(mainini,'banner2.ini')
end

local banner = mainini.launcher.banner

addEventHandler('onReceivePacket', function (id, bs)
    if banner == true then
        if id == 220 then
            raknetBitStreamIgnoreBits(bs, 8)
            if (raknetBitStreamReadInt8(bs) == 17) then
                raknetBitStreamIgnoreBits(bs, 32)
                local length = raknetBitStreamReadInt16(bs)
                local encoded = raknetBitStreamReadInt8(bs)
                local str = (encoded ~= 0) and raknetBitStreamDecodeString(bs, length + encoded) or raknetBitStreamReadString(bs, length)
                if str ~= nil then
                    if str:find('event.setActiveView') and str:find('RewardsNewYear') then
                        sampAddChatMessage('{00FF00}[AutoCloseCalendar] {FFFFFF}Календарь был скрыт. Выключить авто скрытие - /calendar.') -- Оповещение
						notification.Notification(u8"AutoCloseCalendar", u8"Календарь был скрыт. Выключить авто скрытие - /calendar.", "info", 3.0) -- Оповещение
                        sendCEF('rewardsNewYear.exit')
                    end
                end
            end
        end
    end
end)

function main()
    while not isSampAvailable() do wait(222) end
    sampAddChatMessage('{00FF00}[Loaded] {FFFFFF}AutoCloseCalendar загружен.',-1) -- Оповещение
	notification.Notification(u8"Loaded", u8"AutoCloseCalendar загружен.", "info", 5.0) -- Оповещение
	sampRegisterChatCommand('calendar',function()
        banner = not banner
        sampAddChatMessage('{00FF00}[AutoCloseCalendar] {FFFFFF}Скрытие календаря отключено.',-1) -- Оповещение
		notification.Notification(u8"AutoCloseCalendar", u8"Скрытие календаря отключено.", "info", 3.0) -- Оповещение
        mainini.launcher.banner = banner
        inicfg.save(mainini, "banner2.ini")
	end)
    while true do wait(-1) end
end

sendCEF = function(str)
    local bs = raknetNewBitStream()
    raknetBitStreamWriteInt8(bs, 220)
    raknetBitStreamWriteInt8(bs, 18)
    raknetBitStreamWriteInt16(bs, #str)
    raknetBitStreamWriteString(bs, str)
    raknetBitStreamWriteInt32(bs, 0)
    raknetSendBitStream(bs)
    raknetDeleteBitStream(bs)
end
