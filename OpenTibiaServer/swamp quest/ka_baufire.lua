local config = {}

--//Config
config.storageid = 56002 -- ID DA QUEST
config.itemid = 2156 -- ID DA RECOMPENSA
config.msgdone = "You have found the red gem."
config.msgalreadydone = "It is empty."
--//Config

function onUse(cid, item, frompos, item2, topos)
	if getPlayerStorageValue(cid, config.storageid) == -1 then
		doPlayerAddItem(cid, config.itemid, 1)
		doPlayerSendTextMessage(cid, 25, config.msgdone)
		setPlayerStorageValue(cid, config.storageid, 1)
	else
		doPlayerSendCancel(cid, config.msgalreadydone)
		doSendMagicEffect(getCreaturePosition(cid), 2)
	end
	return true
end