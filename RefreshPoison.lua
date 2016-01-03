function RefreshPoison(item)	
	--DEFAULT_CHAT_FRAME:AddMessage("Debug")
	if not IsBuffActive(item, "mainhand") and not IsBuffActive(item, "offhand") then
		useContainerItemByName(item)
		PickupInventoryItem(16)	
	elseif not IsBuffActive(item, "mainhand") then
		useContainerItemByName(item)
		PickupInventoryItem(16)	
	elseif not IsBuffActive(item, "offhand") then
		useContainerItemByName(item)
		PickupInventoryItem(17)
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