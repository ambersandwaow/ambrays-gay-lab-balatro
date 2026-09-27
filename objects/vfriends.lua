SMODS.Consumable{--Chokun
    key = 'chokun',
    set = 'Tarot',
    atlas = 'consumables',
    pos = {x = 4, y = 1},
    config = {extra = {dollars = -10}},
    loc_vars = function(self, info_queue, card)
        return{vars = {card.ability.extra.dollars}}
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                Ambray.saved = {true, 'ily Chokun'}
                ease_dollars(card.ability.extra.dollars)
                return true
            end
        }))
    end,
    can_use = function() return G.GAME.blind.in_blind end,
}

SMODS.Joker{--Uno
    key = 'uno',
    atlas = 'jokers',
    pos = {x = 1, y = 2},
    rarity = 2,
    cost = 7,
    discovered = false,
    blueprint_compat = false,
    config = {extra = {
        num = 1,
        denom = 30
    }},
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('he/him', SMODS.Gradients['ambray_normalGrad'], SMODS.Gradients['ambray_normalGradOff'], 1)
    end,
    loc_vars = function (self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.num, card.ability.extra.denom)
        return{vars = {
            numerator,
            denominator
        }}
    end,
    calculate = function(self,card,context)
        if context.modify_shop_card and SMODS.pseudorandom_probability(card, 'call me the card', card.ability.extra.num, card.ability.extra.denom)then
            context.card:set_edition('e_negative')
        end
    end
}
SMODS.Joker{--Mia
    key = 'mia',
    atlas = 'jokers',
    pos = {x = 3, y = 2},
    cost = 3,
    rarity = 1,
    unlocked = true,
    blueprint_compat = false,
    config = {extra = {rounds = 2, current = 2, num = 1, denom = 6}},
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.num, card.ability.extra.denom)
        return{vars = {card.ability.extra.rounds, card.ability.extra.current, numerator, denominator}}
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('he/him', SMODS.Gradients['ambray_normalGrad'], SMODS.Gradients['ambray_normalGradOff'], 1)
    end,
    calculate = function(self, card, context)
        if card.highlighted and card.ability.extra.current <= 0 then
            card.ability.extra.current = card.ability.extra.rounds
            Ambray.simpleEvent(function()
                local cutie = SMODS.add_card{key = 'j_ambray_miasBaby'}
                cutie.area:remove_card(cutie)
                if SMODS.pseudorandom_probability(card, 'boypreggers :flushed:',card.ability.extra.num, card.ability.extra.denom) then
                    SMODS.add_card{key = 'j_ambray_mia', no_edition = true}
                end
                return true
            end)
        end
        if context.end_of_round and context.main_eval then
            card.ability.extra.current = card.ability.extra.current - 1
        end
        if context.joker_main then
            return{chips = Ambray.miaChips or 0}
        end
    end
}
SMODS.Joker{--mpreg
    key = 'miasBaby',
    atlas = 'jokers',
    pos = {x = 6, y = 2},
    pixel_size = {h = 40, w = 40},
    cost = 1,
    rarity = 1,
    no_collection = true,
    config = {chips = 1},
    in_pool = function(self, args)
        return false
    end,
    loc_vars = function(self, info_queue, card)
        return{vars = {card.ability.chips}}
    end,
    add_to_deck = function(self, card, from_debuff)
        Ambray.miaBabies = Ambray.miaBabies or {}
        card:ambrayAdd(Ambray.miaBabies)
        Ambray.miaChips = (Ambray.miaChips or 0) + card.ability.chips
    end,
    remove_from_deck = function(self, card, from_debuff)
        Ambray.removeFromTable(Ambray.miaBabies,card)
        Ambray.miaChips = (Ambray.miaChips or card.ability.chips) - card.ability.chips
    end,
    calculate = function(self, card, context)
        if card.area then
            card.area:remove_card(card)
        end
    end,
}
SMODS.Joker{--Pomp
    key = 'pomp',
    atlas = 'jokers',
    pos = {x = 7, y = 2},
    pixel_size = {w = 50, h = 55},
    cost = 1,
    rarity = 1,
    discovered = false,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('any', SMODS.Gradients['ambray_nbGrad'], SMODS.Gradients['ambray_nbGradInv'], 1)
    end,
    add_to_deck = function(self, from_debuff)
        Ambray.simpleEvent(function()
            Ambray.bully(500,300,false)
            return true
        end)
    end,
    remove_from_deck = function(self, from_debuff)
        Ambray.simpleEvent(function()
            Ambray.bully(2000,1000,true)
            return true
        end)
    end,
}
SMODS.Joker{--Caw
key = 'caw',
atlas = 'caw',
cost = 10,
rarity = 3,
discovered = false,
config = {extra = {killme = false}},
    in_pool = function(self, args)
        if next(SMODS.find_card('j_ambray_caw', true)) then return false end
        return true
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('she/her', SMODS.Gradients['ambray_transGrad'], SMODS.Gradients['ambray_transGradInv'], 1)
    end,
    loc_vars = function(self, info_queue, card) --blindly stolen from vanillaremade :fire:
        if card.area and card.area.cards and not G.SETTINGS.paused then
            local shiny
            for i = 1, #card.area.cards do
                if card.area.cards[i] == card then shiny = card.area.cards[i + 1] end
            end
            local compatible = shiny and shiny.config.center.blueprint_compat
            local main_end = {
                {n = G.UIT.C, config = {align = "bm", minh = 0.4}, nodes = {
                        {n = G.UIT.C, config = {ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) --cont
                        or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06}, nodes = {
                                {n = G.UIT.T, config = {text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', --cont
                                colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8}},
                            }
                        }
                    }
                }
            }
            return{main_end = main_end}
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.killme = false
        G.E_MANAGER:add_event(Event{
            blockable = false,
            blocking = false,
            no_delete = true,
            trigger = "after",
            delay = 1,
            timer = "UPTIME",
            func = function()
                if card.area and card.area.cards and #card.area.cards > 1 then
                    for i = 1, #card.area.cards do
                        if card.area.cards[i] == card and i+1 ~= #card.area.cards then
                            card.area.cards[i] = card.area.cards[#card.area.cards-1]
                            card.area.cards[#card.area.cards-1] = card
                        end
                    end
                end
                Event.start_timer = false
                if card.ability.extra.killme then return true end
            end
        })
    end,
    remove_from_deck = function(self, card, from_debuff)
        card.ability.extra.killme = true
    end,
    calculate = function(self, card, context)
        local shiny = nil
        for i = 1, #card.area.cards do
            if card.area.cards[i] == card then
                shiny = card.area.cards[i + 1]
            end
        end
        local ret = SMODS.blueprint_effect(card, shiny, context)
        if ret then
            ret.colour = G.C.lesGradCrazy
        end
        return ret
    end
}
SMODS.Joker{--Flamee
    key = 'flamee',
    atlas = 'jokers',
    pos = {x = 2, y = 2},
    rarity = 1,
    cost = 0,
    discovered = false,
    blueprint_compat = false,
    config = {extra = {minfps = 1, maxfps = 25, killme = false, counter = 0}},
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('he/him', SMODS.Gradients['ambray_normalGrad'], SMODS.Gradients['ambray_normalGradOff'], 1)
    end,
    loc_vars = function(self, info_queue, card)
        local r_fps = {}
        for i = card.ability.extra.minfps, card.ability.extra.maxfps do
            r_fps[#r_fps + 1] = tostring(i)
        end
        local main_start = {
            {n = G.UIT.T, config = {text = ' sets your fps to ', colour = G.C.UI.TEXT_DARK, scale = 0.32}},
            {n = G.UIT.O, config = {object = DynaText({string = r_fps,
                colours = {G.C.UI.TEXT_DARK},
                pop_in_rate = 9999999,
                silent = true,
                random_element = true,
                pop_delay = 0.5,
                scale = 0.32,
                min_cycle_time = 0})}}
        }
        return {main_start = main_start}
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.killme = false
        Ambray.bully(math.random(100,500), math.random(50,200))
        G.E_MANAGER:add_event(Event{
            blockable = false,
            blocking = false,
            no_delete = true,
            trigger = "after",
            delay = 1,
            timer = "UPTIME",
            func = function()
                local fps = math.random(card.ability.extra.minfps, card.ability.extra.maxfps)
                Ambray.fpsOverride = fps
                Event.start_timer = false
                if card.ability.extra.killme then
                    return true
                end
            end
        })
    end,
    remove_from_deck = function(self, card, from_debuff)
        card.ability.extra.killme = true
        Ambray.fpsOverride = 500
        Ambray.bully(1000, 100, true)
    end
}
SMODS.Joker{--JoPyKer
    key = 'pyke',
    atlas = 'jokers',
    pos = {x = 8, y = 2},
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('any', SMODS.Gradients['ambray_nbGrad'], SMODS.Gradients['ambray_nbGradInv'], 1)
    end,
    calculate = function(self, card, context)
        if context.after then
            Ambray.simpleEvent(function()
                Ambray.sendCard(G.discard, G.hand, SMODS.last_hand.full_hand[1], nil, 'down')
                play_sound('ambray_spongebob')
                card:juice_up()
                SMODS.last_hand.full_hand[1]:juice_up()
                return true
            end)
        end
    end
}
SMODS.Joker{--Pink Security Autumn
    key = 'autumn',
    atlas = 'jokers',
    pos = {x = 0, y = 3},
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    shouldntDiscard = true,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('she/her', SMODS.Gradients['ambray_transGrad'], SMODS.Gradients['ambray_transGradInv'], 1)
    end,
    add_to_deck = function(self, card, from_debuff)
        card:ambrayAdd(G.GAME.ambrayAutumnCards)
    end,
    remove_from_deck = function(self, card, from_debuff)
        Ambray.removeFromTable(G.GAME.ambrayAutumnCards, card)
    end
}
SMODS.Joker{--condom fish
    key = 'fih',
    atlas = 'jokers',
    pos = {x = 9, y = 2},
    pixel_size = {h = 71, w = 71},
    cost = 1,
    rarity = 1,
    config = {extra = {mult = 0, time = 2}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'c_ambray_fihTip', set = 'ambray_tooltips'}
        return{vars = {card.ability.extra.time}}
    end,
    calculate = function(self, card, context)
        local current, ret
        current = current or 1
        ret = ret or 0
        if context.before then
            current, card.ability.extra.mult = 1, 0
            local saver = G.TIMERS.REAL + card.ability.extra.time
            attention_text{
                text = 'go',
                scale = 1.3,
                hold = 1.4,
                major = card,
                backdrop_colour = G.C.CHANCE,
                align = 'bm',
                offset = {x = 0, y = 0},
            }
            Ambray.simpleEvent(function()
                if love.keyboard.isDown(tostring(current)) then
                    current = current + 1
                    if current == 10 then
                        current = 0
                    end
                    card.ability.extra.mult = card.ability.extra.mult + 1
                end
                if G.TIMERS.REAL >= saver then return true end
            end)
        end
        if context.joker_main then
            Ambray.simpleEvent(function()
                attention_text{
                    text = '+ '..tostring(card.ability.extra.mult)..' mult',
                    scale = 0.75, hold = 1.4, major = card,
                    backdrop_colour = G.C.MULT, align = 'bm', offset = {x = 0, y = 0},
                }
                mod_mult(card.ability.extra.mult + mult)
                update_hand_text({delay = 0}, {mult = mult})
                print(card.ability.extra.mult, mult)
                return true
            end)
        end
    end
}
SMODS.Joker{--Meow
    key = 'meow',
    atlas = 'jokers',
    pos = {x = 2, y = 3},
    cost = 5,
    rarity = 2,
    --100x bc pseudorandom only returns an integer
    config = {extra = {min = 75, max = 350, xchips = 1, killme = false}},
    loc_vars = function(self, info_queue, card)
        return{vars = {card.ability.extra.min / 100, card.ability.extra.max / 100, card.ability.extra.xchips}}
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('she/her', SMODS.Gradients['ambray_transGrad'], SMODS.Gradients['ambray_transGradInv'], 1)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local bwa = card.ability.extra.xchips
            card.ability.extra.xchips = pseudorandom(pseudoseed('im gay!'), card.ability.extra.min, card.ability.extra.max) / 100
            return{xchips = bwa}
        end
    end,
}
SMODS.Joker{--Ashley
    key = 'ashley',
    atlas = 'jokers',
    pos = {x = 1, y = 3},
    cost = 5,
    rarity = 2,
    config = {extra = {killme = false}},
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('she/her', SMODS.Gradients['ambray_transGrad'], SMODS.Gradients['ambray_transGradInv'], 1)
    end,
}