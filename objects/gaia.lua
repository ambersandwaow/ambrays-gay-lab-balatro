SMODS.Enhancement{
    key = 'titlecard',
    atlas = 'enhancements',
    pos = {x=1,y=1},
    dependencies = 'GAIAMOD',
    replace_base_card = true,
    no_collection = true,
    in_pool = function(self, args)
        return false
    end
}

if next(SMODS.find_mod('GAIAMOD')) then
    SMODS.current_mod.menu_cards = function()
        return {
            remove_original = true,
            {key = 'm_ambray_titlecard'},
        }
    end
end

SMODS.Consumable{--Doki Hunter
    key = 'doki',
    set = 'ambray_quest',
    atlas = 'consumables',
    pos = {x=3,y=0},
    pixel_size = {w=71,h=71},
    cost = 4,
    dependencies = 'GAIAMOD',
    unlocked = false,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = {key = 'c_ambray_quests', set = 'ambray_tooltips'}
    end,
    calculate = function(self,card,context)
        if context.after and context.scoring_name == 'Flush' and context.scoring_hand[1]:is_suit('gaia_Dokis') then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:juice_up(1,3)
                    play_sound('ambray_yippie')
                    return{message='yippie!',dollars=Ambray.questReward}
                end
            }))
            SMODS.destroy_cards(card)
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
    check_for_unlock = function(self, args)
        if args.type == 'modify_deck' then
            local count = 0
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if playing_card.base.suit == "gaia_Dokis" then count = count + 1 end
                if count >= 20 then
                    return true
                end
            end
        end
        return false
    end
}

SMODS.Back{--Mesmerizer Deck
    key = 'mesmerizer',
    atlas = 'decks',
    pos = {x = 1, y = 0},
    name = 'Mesmerizer Deck',
    unlocked = false,
    order = 81,
    dependencies = 'GAIAMOD',
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_ambray_artBy')..' Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    calculate = function(self, back, context)
        if context.setting_blind and G.GAME.round == 1 then
            Ambray.simpleEvent(function()
                G.deck:shuffle('yurideck >.<')
                for i = 8, 1, -1 do
                    G.deck.cards[i]:change_suit("gaia_Dokis")
                end
                local bwaa = SMODS.add_card({set = 'Enhanced', area = G.deck})
                local awawa = SMODS.add_card({set = 'Enhanced', area = G.deck})
                bwaa:set_ability('m_ambray_gaia')
                awawa:set_ability('m_ambray_ambray')
                return true
            end)
        end
    end,
    check_for_unlock = function(self,args)
        return args.type == 'win_deck' and get_deck_win_stake('b_gaia_Susina') > 0
    end
}

SMODS.Consumable{--Daydream
    key = 'daydream',
    set = 'panel',
    atlas = "consumables",
    pos = {x = 4, y = 0},
    dependencies = 'GAIAMOD',
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge(localize('k_ambray_artBy')..' Amber', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    config = {extra = {max_highlighted = 3, edition = 'e_ambray_distraction'}},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = {key = 'c_ambray_distractionTip', set = 'ambray_tooltips'}
        return{vars = {
            localize {type = 'name_text', set = 'Edition', key = card.ability.extra.edition},
            card.ability.extra.max_highlighted
        }}
    end,
    use = function(self, card, area, copier)
        local cards = Ambray.getHighlightedCards{G.hand,G.jokers}[1]
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #cards do
            local percent = 1.15 - (i - 0.999) / (#cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    cards[i]:flip()
                    play_sound('card1', percent)
                    cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        for _,i in ipairs(cards) do
            i:set_edition(card.ability.extra.edition, true, false, 0.1)
        end
        for i = 1, #cards do
            local percent = 0.85 + (i - 0.999) / (#cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        local bleh = #Ambray.getHighlightedCards{G.jokers,G.hand}[1]
        if bleh > 0 and bleh <= card.ability.extra.max_highlighted then
            return true
        end
        return false
    end
}