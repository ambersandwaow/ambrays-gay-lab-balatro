local config = Ambray.config

SMODS.ConsumableType {
    key = 'ambray_quest',
    default = 'c_ambray_yuri',
    collection_rows = { 4, 5 },
    primary_colour = HEX('004e4e'),
    secondary_colour = HEX('00aeae'),
    shop_rate = 3,
    select_card = 'quests'
}

--if you want to add a quest with create_card or SMODS.add_card or whatever you have to put area = G.quests


Ambray.questReward = 15 -- amount gained for completing quests
-- to change this in the info_queue you have to go to c_ambray_quests since variables are just displayed as 'nil' in info_queues

Ambray.questArea()


SMODS.Consumable{--Yuri
    key = 'yuri',
    set = 'ambray_quest',
    atlas = 'consumables',
    pos = {x=0,y=0},
    cost = 4,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = { key = 'c_ambray_quests', set = 'ambray_tooltips'}
        info_queue[#info_queue+1] = {key = 'c_ambray_gaiaTip', set = 'ambray_tooltips'}
        info_queue[#info_queue+1] = {key = 'c_ambray_ambrayTip', set = 'ambray_tooltips'}
        if config ~= nil then
            if config.extraGay then
                return{key = 'c_ambray_yuri_alt'}
            end
        end
    end,
    add_to_deck = function(self,card)
        local selectedCard1 = pseudorandom_element(G.deck.cards, pseudoseed('c_ambray_yuri'))
        local selectedCard2 = pseudorandom_element(G.deck.cards, pseudoseed('c_ambray_yuri2'))
        if selectedCard1 == selectedCard2 then
            selectedCard2 = pseudorandom_element(G.deck.cards, pseudoseed('c_ambray_yuri3'))
        end
        selectedCard1:set_ability('m_ambray_gaia')
        selectedCard2:set_ability('m_ambray_ambray')
    end,
    calculate = function(self,card,context)
        if context.final_scoring_step then
            if Ambray.yuriTrigger then -- comes from m_ambray_gaia
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(1,3)
                        play_sound('ambray_yippie')
                        return true
                    end
                }))
                SMODS.destroy_cards(card)
                return{message = 'yippie!',dollars = Ambray.questReward}
            end
        end
    end,
    can_use = function()
        return true
    end,
    keep_on_use = function()
        return true
    end,
    use = function(self,card,area,copier)
        Ambray.quest()
    end,
    can_sell = function(self,card,context)
        return false
    end
}
SMODS.Consumable{--Universal Basic Income
    key = 'ubi',
    set = 'ambray_quest',
    atlas = 'consumables',
    pos = {x=1,y=0},
    cost = 4,
    config={extra={limit = 0,extraDollars=5}},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = {key = 'c_ambray_quests', set = 'ambray_tooltips'}
        return{vars={card.ability.extra.limit,card.ability.extra.extraDollars}}
    end,
    calculate = function(self,card,context)
        if context.money_altered and ((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0) + context.amount) <= card.ability.extra.limit then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up(1,3)
                    play_sound('ambray_yippie')
                    return true
                end
            }))
            SMODS.destroy_cards(card)
            return{message='yippie!',dollars=Ambray.questReward+card.ability.extra.extraDollars}
        end
    end,
    can_use = function()
        return true
    end,
    keep_on_use = function()
        return true
    end,
    use = function(self,card,area,copier)
        Ambray.quest()
    end,
    can_sell = function(self,card,context)
        return false
    end
}
SMODS.Consumable{--Minimalism
    key = 'minimal',
    set = 'ambray_quest',
    atlas = 'consumables',
    pos = {x=0,y=1},
    cost = 4,
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end,
    config={extra={cardsInDeck = 45, tarot = 'c_hanged_man'}},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { key = 'c_ambray_quests', set = 'ambray_tooltips'}
        info_queue[#info_queue + 1] = { key = card.ability.extra.tarot, set = 'Tarot', vars={2}}
        if config ~= nil then
            if config.extraGay then
                return{key = 'c_ambray_minimal_alt', vars={
                    card.ability.extra.cardsInDeck,
                    localize{type = 'name_text', set = 'Tarot', key = card.ability.extra.tarot}
                }}
            else
                return{key = 'c_ambray_minimal', vars={
                    card.ability.extra.cardsInDeck,
                    localize{type = 'name_text', set = 'Tarot', key = card.ability.extra.tarot}
                }}
            end
        end
    end,
    add_to_deck = function(self,card)
        if G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit then
            SMODS.add_card({set='Tarot',key=card.ability.extra.tarot})
        end
    end,
    calculate = function(self,card,context)
        if context.remove_playing_cards then
            if #G.playing_cards <= card.ability.extra.cardsInDeck+#context.removed then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(1,3)
                        play_sound('ambray_yippie')
                        return true
                    end
                }))
                SMODS.destroy_cards(card)
                return{message = 'yippie!',dollars = Ambray.questReward}
            end
        end
    end,
    keep_on_use = function()
        return true
    end,
    can_use = function()
        return true
    end,
    use = function(self,card,area,copier)
        Ambray.quest()
    end,
    can_sell = function(self,card,context)
        return false
    end
}
SMODS.Consumable{--Study rename this
    key = 'study',
    set = 'ambray_quest',
    atlas = 'consumables',
    pos = {x=1,y=1},
    cost = 4,
    unlocked = false,
    config={extra={tarot = 'c_strength'}},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { key = 'c_ambray_quests', set = 'ambray_tooltips'}
        info_queue[#info_queue + 1] = { key = card.ability.extra.tarot, set = 'Tarot',vars={2}}
        return{vars={
            localize{type = 'name_text', set = 'Tarot', key = card.ability.extra.tarot}
        }}
    end,
    add_to_deck = function(self,card)
        if G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit then
            SMODS.add_card({set='Tarot',key=card.ability.extra.tarot})
        end
    end,
    calculate = function(self,card,context)
        if context.after then
            if SMODS.is_poker_hand_visible('Flush House') then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(1,3)
                        play_sound('ambray_yippie')
                        return true
                    end
                }))
                SMODS.destroy_cards(card)
                return{message = 'yippie!',dollars = Ambray.questReward}
            end
        end
    end,
    can_use = function()
        return true
    end,
    keep_on_use = function()
        return true
    end,
    use = function(self,card,area,copier)
        Ambray.quest()
    end,
    can_sell = function(self,card,context)
        return false
    end,
    check_for_unlock = function(self,args)
        if args.type == 'hand_contents' then
            if SMODS.is_poker_hand_visible('Flush House') and SMODS.is_poker_hand_visible('Flush Five')
            and SMODS.is_poker_hand_visible('Five of a Kind') then
                return true
            end
        end
    end
}
SMODS.Consumable{--Transgenderrr
    key = 'trans',
    set = 'ambray_quest',
    atlas = 'consumables',
    pos = {x=2,y=0},
    cost = 4,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { key = 'c_ambray_quests', set = 'ambray_tooltips'}
    end,
    calculate = function(self,card,context)
        if context.change_rank then
            if tostring(context.old_rank) == ('12' or '11') then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(1,3)
                        play_sound('ambray_yippie')
                        return true
                    end
                }))
                SMODS.destroy_cards(card)
                return{message = 'yippie!',dollars = Ambray.questReward}
            end
        end
    end,
    can_use = function()
        return true
    end,
    keep_on_use = function()
        return true
    end,
    use = function(self,card,area,copier)
        Ambray.quest()
    end,
    can_sell = function(self,card,context)
        return false
    end
}
SMODS.Consumable{--Lets Go Gambling!!!
    key = 'gambling',
    set = 'ambray_quest',
    atlas = 'consumables',
    pos = {x=2,y=1},
    cost = 4,
    config={extra={tarot='c_wheel_of_fortune'}},
    pixel_size = {w=71,h=35},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { key = 'c_ambray_quests', set = 'ambray_tooltips'}
        info_queue[#info_queue + 1] = { key = card.ability.extra.tarot, set = 'Tarot',vars={1,4}}
        return{vars={localize{type = 'name_text', set = 'Tarot', key = card.ability.extra.tarot}}}
    end,
    calculate = function(self,card,context)
        if context.wheel_used then --why the fuck does this work??????
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up(1,3)
                    play_sound('ambray_yippie')
                    return true
                end
            }))
            SMODS.destroy_cards(card)
            return{message='yippie!',dollars=Ambray.questReward}
        end
    end,
    can_use = function()
        return true
    end,
    keep_on_use = function()
        return true
    end,
    use = function(self,card,area,copier)
        Ambray.quest()
    end,
    can_sell = function(self,card,context)
        return false
    end
}
SMODS.Consumable{--Absurdism
    key = 'absurdism',
    set = 'ambray_quest',
    atlas = 'consumables',
    pos = {x=3,y=1},
    cost = 4,
    in_pool = function(self,args) if config and not config.balanced and config.stupid then return true end return false end,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = { key = 'c_ambray_quests', set = 'ambray_tooltips'}
        return{vars={localize{type = 'name_text', set = 'Tarot', key = 'c_death'}}}
    end,
    calculate = function(self,card,context)
        if context.death_used and context.card.ability.set == 'Joker' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up(1,3)
                    play_sound('ambray_yippie')
                    return true
                end
            }))
            SMODS.destroy_cards(card)
            return{message='yippie!',dollars=Ambray.questReward}
        end
    end,
    can_use = function()
        return true
    end,
    keep_on_use = function()
        return true
    end,
    use = function(self,card,area,copier)
        Ambray.quest()
    end,
    can_sell = function(self,card,context)
        return false
    end,
    check_for_unlock = function(self,args)
        if args.type == 'round_win' then
            for _,i in ipairs(G.deck.cards) do
                if i.ability and i.ability.set and i.ability.set == 'Joker' then
                    return true
                end
            end
        end
    end
}