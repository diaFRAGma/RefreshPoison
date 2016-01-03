function RefreshPoison()	
	--DEFAULT_CHAT_FRAME:AddMessage("Debug")
	-- TODO: Fehler Abfangen die z.B. entstehen können wenn kein Gift im Inventar gefunden wurde oder keine Waffe angelegt ist.
	if not IsBuffActive("Sofort wirkendes Gift VI", "mainhand") then
		useContainerItemByName("Sofort wirkendes Gift VI")
		PickupInventoryItem(16)
	end
	if not IsBuffActive("Sofort wirkendes Gift VI", "offhand") then
		useContainerItemByName("Sofort wirkendes Gift VI")
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