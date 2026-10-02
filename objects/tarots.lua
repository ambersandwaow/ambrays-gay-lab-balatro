SMODS.Consumable{--Page of Wands
    key = 'PoW',
    set = 'Tarot',
    atlas = 'consumables',
    pos = {x=0,y=2},
    discovered = true,
    config = {max_highlighted=1,mod_conv='m_ambray_lost',extra={money=5}},
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge(localize('k_ambray_artBy')..' Amber', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = {key='c_ambray_lostTip',set='ambray_tooltips'}
        return { vars = {
            card.ability.max_highlighted,
            localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv },
            card.ability.extra.money
        } }
    end,
    use = function(self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_ability(card.ability.mod_conv)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
        ease_dollars(-card.ability.extra.money)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end,
}
SMODS.Consumable{--Knight of Wands
    key = 'KoW',
    set = 'Tarot',
    atlas = 'consumables',
    pos = {x=1,y=2},
    discovered = true,
    config = {max_highlighted=1,mod_conv='m_ambray_lost',extra={money=5}},
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge(localize('k_ambray_artBy')..' Amber', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    loc_vars = function(self,info_queue,card)
        return { vars = {
            card.ability.max_highlighted,
            colours = {G.C.waowgradient}
        } }
    end,
    use = function(self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_ability(Ambray.funny(true))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
    can_use = function(self, card)
        local count
        for _,i in ipairs(G.hand.highlighted) do
            if i == card then
                count = card.ability.max_highlighted + 1
            end
        end
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= (count or card.ability.max_highlighted)
    end,
}
SMODS.Consumable{--Queen of Wands
    key = 'QoW',
    set = 'Tarot',
    atlas = 'consumables',
    pos = {x=2,y=2},
    discovered = true,
    config = {max_highlighted=1,mod_conv='m_ambray_gaia',mod_conv2='m_ambray_ambray'},
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge(localize('k_ambray_artBy')..' Amber', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = {key='c_ambray_gaiaTip',set='ambray_tooltips'}
        info_queue[#info_queue + 1] = {key='c_ambray_ambrayTip',set='ambray_tooltips'}
        return { vars = {
            card.ability.max_highlighted,
            localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv },
            localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv2 }
        } }
    end,
    use = function(self,card,area,copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        local gaming
        local waaa = pseudorandom(pseudoseed('QoW'),1,2)
        if waaa == 1 then gaming = card.ability.mod_conv end
        if waaa == 2 then gaming = card.ability.mod_conv2 end
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_ability(gaming)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end,
}
SMODS.Consumable{--King of Wands
    key = 'KioW',
    set = 'Tarot',
    atlas = 'consumables',
    pos = {x = 3, y = 2},
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_ambray_artBy')..' Amber', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.2)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                local rember = Ambray.getHighlightedCards(card)
                Ambray.removeFromTable(rember, card)
                if not rember then return true end
                local bingus = rember[1][1]
                local awawa = rember[1][2]
                Ambray.sendCard(bingus.area, awawa.area, bingus)
                Ambray.sendCard(awawa.area, bingus.area, awawa)
                play_sound('tarot2', 1, 0.6)
                return true
            end
        }))
    end,
    can_use = function()
        local idk = Ambray.getHighlightedCards()
        if idk then
            if #idk[1] == 3 then
                return true
            end
        end
        return false
    end
}
SMODS.Tarot:take_ownership('wheel_of_fortune', {
    config = {extra = {num = 1, odds = 3}},
    loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = G.P_CENTERS.e_foil
            info_queue[#info_queue+1] = G.P_CENTERS.e_holo
            info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
            info_queue[#info_queue+1] = G.P_CENTERS.e_ambray_aberrance
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.num, card.ability.extra.odds, 'wheel_of_fortune')
        return{vars = {numerator, denominator}}
    end,
    use = function(self, card, area, copier)
        local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
        local eligible_card = pseudorandom_element(editionless_jokers, 'wheel_of_fortune')
        local edition = 'e_ambray_aberrance'
        if SMODS.pseudorandom_probability(card, 'wheel_of_fortune', card.ability.extra.num, card.ability.extra.odds) then
            --since smods automatically sets the editions for poll_edition for 'wheel_of_fortune' and 'aura' keys i dont have to specify them
            edition = SMODS.poll_edition{key = "wheel_of_fortune", guaranteed = true, no_negative = true}
        end
        eligible_card:set_edition(edition, true)
        check_for_unlock{type = 'have_edition'}
        SMODS.calculate_context{wheel_used = true, edicion = edition}
    end,
}, false)