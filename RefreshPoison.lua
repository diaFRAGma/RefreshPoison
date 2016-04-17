local count = 0

function RefreshPoison(item)
	--DEFAULT_CHAT_FRAME:AddMessage("Debug")
	if count == 0 then
		useContainerItemByName(item)
		PickupInventoryItem(16)	
		count = 1
	elseif count == 1 then
		useContainerItemByName(item)
		PickupInventoryItem(17)	
		count = 0
	end
end

function useContainerItemByName(pName)
	for bag = 0,4 do
		for slot = 1,GetContainerNumSlots(bag) do
			local itemlink = GetContainerItemLink(bag, slot)
			if itemlink ~= nil and string.find(tostring(itemlink), pName) then
				UseContainerItem(bag, slot, 1)
				break
			end
		end
	end
end