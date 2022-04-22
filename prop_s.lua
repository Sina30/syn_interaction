VORP = exports.vorp_inventory:vorp_inventoryApi()


VORP.RegisterUsableItem("cigarette", function(data)
	VORP.subItem(data.source, "cigarette", 1)
	TriggerClientEvent('prop:cigarettes', data.source)
end)

VORP.RegisterUsableItem("hairpomade", function(data)
	VORP.subItem(data.source, "hairpomade", 1)
	TriggerClientEvent('prop:hairpomade', data.source)
end)


VORP.RegisterUsableItem("cigar", function(data)
	VORP.subItem(data.source, "cigar", 1)
	TriggerClientEvent('prop:cigar', data.source)
end)

VORP.RegisterUsableItem("syn", function(data)
	
	count = VORP.getItemCount(data.source, "pipe")
	if count >= 1 then
		VORP.subItem(data.source, "syn", 1)
		TriggerClientEvent('prop:syn', data.source)
	else
		TriggerClientEvent("vorp:TipRight", data.source, "Du brauchst eine Pfeife, um Syn zu rauchen", 3000)
	end

end)

VORP.RegisterUsableItem("notebook", function(data)
	TriggerClientEvent('prop:ledger', data.source)
end)

VORP.RegisterUsableItem("pocket_watch", function(data)
	TriggerClientEvent('prop:watch', data.source)
end)

VORP.RegisterUsableItem("book", function(data)
	TriggerClientEvent('prop:book', data.source)
end)

VORP.RegisterUsableItem("pipe", function(data)
	TriggerClientEvent('prop:pipe', data.source)
end)

VORP.RegisterUsableItem("fan", function(data)
	TriggerClientEvent('prop:fan', data.source)
end)

VORP.RegisterUsableItem("chewingtobacco", function(data)
	VORP.subItem(data.source, "chewingtobacco", 1)
	TriggerClientEvent('prop:chewingtobacco', data.source)
end)

VORP.RegisterUsableItem("planttrimmer", function(data) -- Plant Trimmer Interactions with help from Roobie <3
    local ItemFound = false
    local chancehigh = 60
    local chancelow = 5
    local chance = math.random(1,20)
    local chance2 = math.random(1,20)
    local chance3 = math.random(1,20)
    local chance4 = math.random(1,20)
    local chance5 = math.random(1,20)
    local loot = math.random(3,4)
    local loot2 = math.random(1,2)
    local diceroll = chance
    local diceroll2 = chance2
    local diceroll3 = chance3
    local diceroll4 = chance4
    local diceroll5 = chance5
    local lootroll = loot
    local lootroll2 = loot2
    local chanceroll = diceroll + diceroll2 + diceroll3 + diceroll4 + diceroll5
    local seeds = lootroll - lootroll2
    local seedplural = seeds == 1 and 'seed' or 'seeds'
    --print("Roll Math: "..diceroll.." + "..diceroll2.." + "..diceroll3.." + "..diceroll4.." + "..diceroll5)
    --print("Loot Math: "..lootroll.." - "..lootroll2)
    for i, v in pairs(Config.trimmables) do
        local item = VORP.getItemCount(data.source, v.name)
        if item >= 1 then
            ItemFound = true
            VORP.subItem(data.source, v.name, 1)    
            TriggerClientEvent("vorp:TipRight", data.source, Config.Language.schneiden ..v.label.. Config.Language.saatgut, 3000)
            Wait(2000)
            if chanceroll >= chancelow and chanceroll <= chancehigh then
                VORP.addItem(data.source, v.seed, seeds) -- Seeds DB Item Name
                Wait(1000)
                TriggerClientEvent("vorp:TipRight", data.source, Config.Language.klingel..seeds.." "..seedplural..Config.Language.plant" "..v.plant, 3000)
            else
                TriggerClientEvent("vorp:TipRight", data.source, Config.Language.findest ..v.plant, 3000)
            end
            break
        end
    end
    if ItemFound == false then
        TriggerClientEvent("vorp:TipRight", data.source, Config.Language.trimmen, 3000)
    end
end)