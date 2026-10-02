Ambray = SMODS.current_mod

local folder = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "modules")
for _, file in ipairs(folder) do
    assert(SMODS.load_file("modules/" .. file))()
end

Ambray.saved = {false}
Ambray.yuriTrigger = false
if not Ambray.config.musicK then
    Ambray.optional_features = {
        cardareas = {G.deck, G.discard}
    }

    --dont have nested folders so i can finally use this
    folder = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "objects")
    for _, file in ipairs(folder) do
        assert(SMODS.load_file("objects/" .. file))()
    end

   Ambray.calculate = function(self, context)
        --this has to be here bc G.GAME gets reset when a game gets started
        G.GAME.ambray_drag = Ambray.draggableRemember
        G.GAME.ambray_cards_bought = G.GAME.ambray_cards_bought or {consumables = 0, jokers = 0, vouchers = 0}
        G.GAME.ambrayAutumnCards = G.GAME.ambrayAutumnCards or {}

        if context.buying_card and context.card.ability.set == 'Voucher' then
            G.GAME.ambray_cards_bought.vouchers = G.GAME.ambray_cards_bought.vouchers or 0
        end
        if context.card_added then
            if not Ambray.contains(G.GAME.ambray_cards_bought, context.card.config.center.key) then
                G.GAME.ambray_cards_bought[#G.GAME.ambray_cards_bought + 1] = context.card.config.center.key
                if context.card.ability.set == 'Joker' then
                    G.GAME.ambray_cards_bought.jokers = (G.GAME.ambray_cards_bought.jokers or 0) + 1
                elseif context.card.ability.consumeable then
                    G.GAME.ambray_cards_bought.consumables = (G.GAME.ambray_cards_bought.consumables or 0) + 1
                end
            end
        end

        if context.setting_blind then
            if Ambray.washedDebuff ~= nil then
                SMODS.debuff_card(Ambray.washedDebuff,false,'j_ambray_washed')
            end
            for _,gayy in pairs(G.deck.cards) do
                SMODS.debuff_card(gayy, false, 'j_ambray_forest')
            end
        end

        if context.end_of_round and context.main_eval then
            if Ambray.saved[1] then
                local remberr = Ambray.saved[2]
                Ambray.saved = {false}
                return{saved = remberr}
            end
        end

        if not next(SMODS.find_card('j_ambray_mia',true)) and Ambray.miaBabies then
            for _, i in pairs(Ambray.miaBabies) do
                i:start_dissolve()
            end
        end

        Ambray.canGay = next(SMODS.find_mod('GAIAMOD')) and Ambray.config.extraGay

        if Ambray.canGay then
            G.localization.misc.dictionary.ph_you_win = 'I Love You!'
        else
            G.localization.misc.dictionary.ph_you_win = 'YOU WIN!'
        end

        if context.after then
            for _,card in pairs(G.GAME.ambrayAutumnCards) do
                local area = pseudorandom_element(G.I.CARDAREA)
                if area == G.play then
                    area = pseudorandom_element(G.I.CARDAREA)
                end
                Ambray.simpleEvent(function()
                    Ambray.sendCard(card.area, area, card)
                    return true
                end, 1)
            end
        end
    end


    function SMODS.current_mod.reset_game_globals(run_start)
        Ambray.resetTransCards()
    end

end