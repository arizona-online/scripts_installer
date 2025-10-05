script_name("ArzFastBankMenu")
script_author("Freym x Mike_Rotch")
script_version("1.0")

require 'lib.moonloader'
require('encoding').default = 'CP1251'

local u8 = require('encoding').UTF8
local notification = require("notifications")

function main()
    while not isSampAvailable() do wait(200) end
	sampAddChatMessage('{00FF00}[Loaded] {FFFFFF}Fast /bank загружен.' ,-1) -- Оповещение
	notification.Notification(u8"Loaded", u8"Fast /bank загружен.", "info", 5.0) -- Оповещение
	sampRegisterChatCommand('bank', function()
		sampSendChat('/phone')
		sendcef('launchedApp|24')
		sampSendChat('/phone')
	end)
	wait(-1)
end

function sendcef(str)
    local bs = raknetNewBitStream()
    raknetBitStreamWriteInt8(bs, 220)
    raknetBitStreamWriteInt8(bs, 18)
    raknetBitStreamWriteInt16(bs, #str)
    raknetBitStreamWriteString(bs, str)
    raknetBitStreamWriteInt32(bs, 0)
    raknetSendBitStream(bs)
    raknetDeleteBitStream(bs)
end