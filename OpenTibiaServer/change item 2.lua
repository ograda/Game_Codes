local itens = {}
for i,j = 1, 10 do
local item[1] = id
local item[2] = id
local item[3] = id
local item[4] = id
local item[5] = id
local item[6] = id
local item[7] = id
local item[8] = id
local item[9] = id
local item[10] = id
end


local boxid = "number of box"
local maxpos = 4
local pos[1] = {x="", y="", z=""}
local pos[2] = {x="", y="", z=""}
local pos[3] = {x="", y="", z=""}
local pos[4] = {x="", y="", z=""}
local t1 = "3"
local t2 = "7"

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerMoney(cid) >= 950 then
		doPlayerRemoveMoney(cid, 950)
		
		i = math.random(1,10)
		prev = i
		v = itens[i]
		doCreateItem(v, 1, fromPosition)
		
		addEvent(changeitem,t1*1000,cid,v,fromPosition,prev)
	end
end


function changeitem(cid, item, fromPosition, prev)
	k = findItemInPos(item, fromPosition)
	if k == true then
		j = math.random(1,10)
		n = j
		while j == prev do
			j = math.random(1,10)
			n = itens[j]
		end
	doTransformItem(k.uid, n)
addEvent(removeitem,t2*1000,cid,n,fromPosition)
	else
	end
end

function removeitem(cid, item, fromPosition)
	l = findItemInPos(item, fromPosition)
	if l == true then
		doRemoveItem(l.uid, 1)
	end
if getItemAttribute(findItemInPos(boxid, fromPosition).uid, "aid") >= 1009 or getItemAttribute(findItemInPos(boxid, fromPosition).uid, "aid") > 1000 then
	if fromPosition == pos[maxpos] then
		local newpos = pos[1]
	else
		for i = 1, (maxpos-1) do
			while fromPosition ~= pos[i] do
				i = i+1
			end
			local newpos = pos[i+1]
		end
	end
	doRemoveItem(findItemInPos(boxid, fromPosition).uid, 1)
	a = doCreateItem(boxid, 1, newpos)
	doItemSetAttribute(a, "aid", 1000)
else	
	doItemSetAttribute(a, "aid", getItemAttribute(findItemInPos(boxid, fromPosition).uid, "aid")+1)
end
end