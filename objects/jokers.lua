local config = Ambray.config
SMODS.Joker{--Eat the Rich
    key = 'eatRich',
    atlas = 'jokers',
    unlocked = true,
    blueprint_compat = false,
    pos = {x = 2, y = 1},
    config = {
        extra = {
            rewardDollars = 15,
            maxDollars = 100
        }
    },
    rarity = 2,
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return{vars = {
            card.ability.extra.rewardDollars,
            card.ability.extra.maxDollars
        }}
    end,
    calculate = function(self, card, context)
        if context.money_altered and G.GAME.dollars + context.amount >= 100 then
            Ambray.loseRound()
        end
    end,
    calc_dollar_bonus = function(self,card)
        return card.ability.extra.rewardDollars
    end
}
SMODS.Joker{--Absurd joker
    key = 'absurd',
    atlas = 'jokers',
    pos = {x = 8, y = 1},
    rarity = 1,
    cost = 5,
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return{vars = {colours = {G.C.waowgradient}}}
    end,
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Amber', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    in_pool = function(self,args)
        if config ~= nil and not config.balanced then return true end
        return false
    end,
    calculate = function(self,card,context)
        if context.first_hand_drawn then
            G.E_MANAGER:add_event(Event({
                blocking = false,
                func = function()
                    local stinky = SMODS.add_card({set='Base'})
                    stinky:ambraySetAbility(Ambray.funny(true, nil, {jokers = true, consumables = true}))
                    return true
                end
            }))
        end
    end
}
SMODS.Joker{--Off Putting Joker
    key = 'offPutting',
    atlas = 'jokers',
    unlocked = true,
    pos = {x=6,y=0},
    rarity = 3,
    cost = 8,
    config = {extra = {
        spectralNum = 1,
        spectralDenom = 3,
        perRound = 1
    }},
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    loc_vars = function (self,info_queue,card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.spectralNum, card.ability.extra.spectralDenom)
        return{vars = {
            numerator,
            denominator
        }}
    end,
    calculate = function(self,card,context)
        if (context.remove_playing_cards or context.joker_type_destroyed) and G.GAME.consumeable_buffer + #G.consumeables.cards <
        G.consumeables.config.card_limit and SMODS.pseudorandom_probability(card, 'ambray_offPutting',
        card.ability.extra.spectralNum, card.ability.extra.spectralDenom) then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                func = (function()
                    SMODS.add_card {
                        set = 'Spectral',
                        key_append = 'ambray_offPutting'
                    }
                    return true
                    end)
                }))
            G.GAME.consumeable_buffer = 0
        end
        if context.selling_card and context.card.ability.set == "Spectral" and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func=function()
                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips / 2)
                    SMODS.juice_up_blind()
                    return true
                end
            }))
        end
    end
}
SMODS.Joker{--Went Missing
    key = 'missing',
    atlas = 'jokers',
    pos = {x=7,y=0},
    cost = 7,
    rarity = 2,
    unlocked = true,
    config={extra={xmult=0.1,destroyNum = 1,destroyDenom = 10}},
    loc_vars = function(self,info_queue,card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.destroyNum, card.ability.extra.destroyDenom)
        return{vars={card.ability.extra.xmult,numerator,denominator}}
    end,
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    calculate = function(self,card,context)
        if context.before then
            for i=1, #context.full_hand do
                local bleh = context.full_hand[i]
                bleh.ability.perma_x_mult = (bleh.ability.perma_x_mult or 0) + card.ability.extra.xmult
                if SMODS.pseudorandom_probability(card, 'j_ambray_missing',card.ability.extra.destroyNum, card.ability.extra.destroyDenom) then
                    SMODS.destroy_cards(context.full_hand[i])
                end
            end
        end
    end
}
SMODS.Joker{--IO
    key = 'io',
    atlas = 'jokers',
    pos = {x=9,y=0},
    cost = 5,
    rarity = 2,
    unlocked = true,
    config={extra={dollars=15,remaining=15}},
    loc_vars = function(self,info_queue,card)
        return{vars={
            card.ability.extra.dollars,
            card.ability.extra.remaining
        }}
    end,
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    calculate = function(self,card,context)
        if context.money_altered and context.amount <= 0 then
            card.ability.extra.remaining = card.ability.extra.remaining + context.amount
            if card.ability.extra.remaining <= 0 then
                SMODS.upgrade_poker_hands({hands={'Flush'},from=card})
                card.ability.extra.remaining = card.ability.extra.remaining + card.ability.extra.dollars
            end
        end
    end
}
SMODS.Joker{--Out for a Shower
    key = 'washed',
    atlas = 'jokers',
    pos = {x=2,y=0},
    cost = 4,
    rarity = 1,
    unlocked = true,
    config={extra={mult=1.2}},
    loc_vars = function(self,info_queue,card)
        return{vars={card.ability.extra.mult}}
    end,
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    calculate = function(self,card,context)
        if context.first_hand_drawn then
            Ambray.washedDebuff = pseudorandom_element(G.jokers.cards,pseudoseed('j_ambray_washed'))
            while Ambray.washedDebuff.config.center.key == 'j_ambray_washed' and #G.jokers.cards ~= 1 do
                Ambray.washedDebuff = pseudorandom_element(G.jokers.cards,pseudoseed('j_ambray_washed'))
            end
            pcall(Spectrallib.manipulate, Ambray.washedDebuff,{
                type = 'X',
                value = 1.2, --hardcoded bc it kept breaking if i didnt and im too lazy to fix
                no_deck_effects = false
            })
            SMODS.debuff_card(Ambray.washedDebuff,true,'j_ambray_washed')
        end
    end
}
SMODS.Joker{--Diesel
    key = 'diesel',
    atlas = 'jokers',
    unlocked = true,
    pos = {x=1, y=1},
    rarity = 1,
    cost = 5,
    eternal_compat = false,
    config = {extra = {
        d6Remain = 5,
        speedRemain = 3
    }},
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    loc_vars = function(self,info_queue,card)
            info_queue[#info_queue + 1] = G.P_TAGS.tag_d_six--{key = 'tag_d_six', set = 'Tag'} idk why it works for these but for nothing else????
            info_queue[#info_queue+1] = G.P_TAGS.tag_skip--{set = 'Tag', key = 'tag_skip'}
        return{vars = {
            card.ability.extra.d6Remain,
            card.ability.extra.speedRemain,
            localize { type = 'name_text', set = 'Tag', key = 'tag_d_six'},
            localize { type = 'name_text', set = 'Tag', key = 'tag_skip'}
        }}
    end,
    calculate = function(self,card,context)
        if context.setting_blind and G.GAME.blind_on_deck == "Small" or context.setting_blind and G.GAME.blind_on_deck == "Big" then
            card.ability.extra.d6Remain = card.ability.extra.d6Remain - 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    add_tag({ key = 'tag_d_six' })
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
            if card.ability.extra.d6Remain == 0 and not context.blueprint then
                SMODS.destroy_cards(card,nil,nil,true)
                return{message = 'outta gas'},
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('ambray_noGas',1,1.5)
                        return true
                    end
                }))
            end
        elseif context.setting_blind and G.GAME.blind_on_deck == "Boss" then
            card.ability.extra.speedRemain = card.ability.extra.speedRemain - 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    add_tag({ key = 'tag_skip' })
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
            if card.ability.extra.speedRemain == 0 and not context.blueprint then
                SMODS.destroy_cards(card,nil,nil,true)
                return{message = 'outta gas'},
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('ambray_noGas',1,1.5)
                        return true
                    end
                }))
            end
        end
    end
}
SMODS.Joker{--P.O.I
    key = 'poi',
    atlas = 'jokers',
    pos = {x=4,y=0},
    rarity = 2,
    cost = 5,
    unlocked = true,
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    calculate = function(self,card,context)
        if context.first_hand_drawn then
            local selectedCard = pseudorandom_element(G.deck.cards,pseudoseed('j_ambray_poi'))
            local buh = 1
            while selectedCard:get_seal() ~= nil do
                selectedCard = pseudorandom_element(G.deck.cards,'j_ambray_poi')
                buh = buh + 1
                if buh >= 1000 then
                    selectedCard = SMODS.add_card({set='Playing Card'})
                    return{message='thats a lot of seals'}
                end
            end
            if selectedCard ~= nil then -- idk why this exists but im too scared to remove it :sob:
                selectedCard:set_seal('ambray_white')
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck:juice_up(0.3,0.6)
                        return true
                    end
                }))
            end
        end
    end
}
SMODS.Joker{--Only Just Begun
    key = 'begun',
    atlas = 'jokers',
    pos  = {x = 5, y = 0},
    cost = 6,
    rarity = 2,
    unlocked = true,
    blueprint_compat = false,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {key = 'c_ambray_lostTip', set = 'ambray_tooltips'}
    end,
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    calculate = function(self,card,context)
        if context.before and #context.full_hand == 1 and G.GAME.current_round.hands_played == 0 then
            G.E_MANAGER:add_event(Event({
                func=function()
                    context.full_hand[1]:set_ability('m_ambray_lost')
                    context.full_hand[1]:juice_up()
                    return true
                end
            }))
        end
    end
}
SMODS.Joker{--Larva
    key = 'larva',
    atlas = 'jokers',
    pos = {x=8,y=0},
    rarity = 1,
    cost = 1,
    unlocked = true,
    eternal_compat = false,
    config = {extra = {
        evolveRounds = 3,
        currentRounds = 3,
        chips = 4
    }},
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    loc_vars = function(self,info_queue,card)
        return{vars={
            card.ability.extra.evolveRounds,
            card.ability.extra.currentRounds,
            card.ability.extra.chips
        }}
    end,
    in_pool = function(self,args) if SMODS.find_card('j_ambray_pupa',false) or SMODS.find_card('j_ambray_imago') then return false else return true end end,
    calculate = function(self,card,context)
        if context.joker_main then
            return{chips = card.ability.extra.chips}
        end
        if context.end_of_round and context.main_eval then
            card.ability.extra.currentRounds = card.ability.extra.currentRounds - 1
            if card.ability.extra.currentRounds == 0 and not context.blueprint then
                SMODS.destroy_cards(card)
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        play_sound('generic1',0.9+math.random()*0.1,0.8)
                        return true
                    end)
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = (function()
                        SMODS.add_card({key = 'j_ambray_pupa'})
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end),
                }))
            end
        end
    end
}
SMODS.Joker{--Pupa
    key = 'pupa',
    atlas = 'jokers',
    pos = {x=3,y=0},
    rarity = 2,
    cost = 5,
    unlocked = false,
    eternal_compat = false,
    in_pool = function(self,args)
        return false
    end,
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    config = {extra = {
        evolveRounds = 3,
        currentRounds = 3,
        mult = 4
    }},
    loc_vars = function(self,info_queue,card)
        return{vars={
            card.ability.extra.evolveRounds,
            card.ability.extra.currentRounds,
            card.ability.extra.mult
        }}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return{mult=card.ability.extra.mult}
        end
        if context.end_of_round and context.main_eval then
            card.ability.extra.currentRounds = card.ability.extra.currentRounds - 1
            if card.ability.extra.currentRounds == 0 and not context.blueprint then
                SMODS.destroy_cards(card,nil,nil,true)
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        play_sound('generic1',0.9+math.random()*0.1,0.8)
                        return true
                    end)
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = (function()
                        SMODS.add_card({key = 'j_ambray_imago'})
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end),
                }))
            end
        end
    end
}
SMODS.Joker{--Imago
    key = 'imago',
    atlas = 'jokers',
    pos = {x=0,y=1},
    rarity = 3,
    cost = 8,
    unlocked = false,
    in_pool = function(self,args)
        return false
    end,
    config = {extra = {
        Xmult = 3
    }},
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    loc_vars=function(self,info_queue,card)
        return{vars={card.ability.extra.Xmult}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return{Xmult=card.ability.extra.Xmult}
        end
    end
}
local old
SMODS.Joker{--Whatever it Takes 
    key = 'whatever',
    atlas = 'jokers',
    pos = {x=0,y=0},
    cost = 6,
    rarity = 2,
    unlocked = true,
    blueprint_compat = false,
    config = {extra={dollars=5,limit=25,hsize=0}},
    loc_vars=function(self,info_queue,card)
        if config ~= nil and config.extraGay then
            info_queue[#info_queue+1] = {key = 'c_ambray_whateverTip', set = 'ambray_tooltips'}
        end
        return{vars={card.ability.extra.dollars,card.ability.extra.limit,card.ability.extra.hsize}}
    end,
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    add_to_deck=function(self,card,from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.limit
    end,
    remove_from_deck=function(self,card,from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.limit
    end,
    calculate = function(self,card,context)
        if context.money_altered or context.setting_blind then
            old = (card.ability.extra.hsize or 0)
            card.ability.extra.hsize = math.floor(math.abs((G.GAME.dollars-math.abs(G.GAME.dollars))/2)/card.ability.extra.dollars)
            G.hand:change_size(card.ability.extra.hsize-old)
        end
    end
}
SMODS.Joker{-- Unique Joker
    key = 'unique',
    atlas = 'jokers',
    pos = {x = 1, y = 0},
    cost = 6,
    rarity = 3,
    unlocked = true,
    config = {extra = {chips = 0, mult = 0, xmult = 1, cmod = 5, mmod = 1, xmod = 0.15}},
    loc_vars = function(self, info_queue, card)
        return{vars = {
            card.ability.extra.chips,card.ability.extra.mult,card.ability.extra.xmult,
            card.ability.extra.cmod,card.ability.extra.mmod,card.ability.extra.xmod
        }}
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    calculate = function(self, card, context)
        if (context.card_added or context.money_altered) and not context.blueprint then
            card.ability.extra.chips = (G.GAME.ambray_cards_bought.consumables or 0) * card.ability.extra.cmod --all these are tracked in main.lua
            card.ability.extra.mult = (G.GAME.ambray_cards_bought.jokers or 0) * card.ability.extra.mmod
            card.ability.extra.xmult = (G.GAME.ambray_cards_bought.vouchers or 0) * card.ability.extra.xmod + 1
        end
        if context.joker_main then
            return{chips = card.ability.extra.chips, mult = card.ability.extra.mult, xmult = card.ability.extra.xmult}
        end
    end
}
SMODS.Joker{--(⸝⸝>ᴗ<⸝⸝) Joker
    key = 'sillyy',
    atlas = 'jokers',
    pos = {x=9,y=1},
    rarity = 1,
    cost = 4,
    unlocked = true,
    config = {extra = {
        num = 1,
        denom = 10
    }},
    loc_vars = function (self,info_queue,card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.num, card.ability.extra.denom)
        return{vars = {
            numerator,
            denominator
        }}
    end,
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Amber', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
        SMODS.pseudorandom_probability(card, 'siwwyy', card.ability.extra.num, card.ability.extra.denom) then
            local waa = SMODS.poll_enhancement({guaranteed = true})
            context.other_card:set_ability(waa)
            return{message = '!!!'}
        end
    end
}
SMODS.Joker{--Ralsei
    key = 'ralsei',
    atlas = 'ralsei',
    pixel_size = {w = 71, h = 95},
    cost = 1,
    rarity = 1,
    discovered = false,
    eternal_compat = false,
    perishable_compat = false,
    config = {extra = {slots = 1}},
    loc_vars = function(self, info_queue, card)
        return{vars = {colours = {G.C.transGrad, G.C.transGradInv}}}
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('she/they (maybe)', SMODS.Gradients['ambray_transGrad'], SMODS.Gradients['ambray_transGradInv'], 1)
    end,
    calculate = function(self, card, context)
        if self.sticker then self.sticker = nil end
    end,
    add_to_deck = function(self, card)
        G.jokers:change_size(card.ability.extra.slots)
    end,
    remove_from_deck = function(self, card)
        G.jokers:change_size(-card.ability.extra.slots)
    end,
}
SMODS.Joker{--Artistic Joker
    key = 'artistic',
    atlas = 'jokers',
    pos = {x = 0, y = 2},
    rarity = 2,
    cost = 5,
    unlocked = true,
    config = {extra = {transNum = 1, transDenom = 3}},
    loc_vars = function (self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.transNum, card.ability.extra.transDenom)
        return{vars = {numerator, denominator}}
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('art by: Amber', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and #G.deck.cards > 0 and
        SMODS.pseudorandom_probability(card, 'YOWCH',card.ability.extra.transNum, card.ability.extra.transDenom) then
            SMODS.copy_card(pseudorandom_element(G.deck.cards),{new_card=context.other_card})
        end
    end
}
SMODS.Joker{--Cuddles in the Woods
    key = 'forest',
    atlas = 'jokers',
    pos = {x=3,y=1},
    cost = 6,
    rarity = 2,
    unlocked = true,
    config={extra={x=1}},
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'c_ambray_gaiaTip', set = 'ambray_tooltips'}
        info_queue[#info_queue+1] = {key = 'c_ambray_ambrayTip', set = 'ambray_tooltips'}
        if config ~= nil then
            if config.extraGay then
                return{key='j_ambray_forest_alt',vars={card.ability.extra.x}}
            else
                return{key='j_ambray_forest',vars={card.ability.extra.x}}
            end
        end
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('art by: Amber', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step then
            if Ambray.yuriTrigger and #context.full_hand == 2 then
                G.play.cards[2].ability.perma_repetitions = (G.play.cards[2].ability.perma_repetitions or 0) + card.ability.extra.x
                G.play.cards[1].ability.perma_repetitions = (G.play.cards[1].ability.perma_repetitions or 0) + card.ability.extra.x
                Ambray.simpleEvent(function()
                    SMODS.debuff_card(G.play.cards[1],true,'j_ambray_forest')
                    SMODS.debuff_card(G.play.cards[2],true,'j_ambray_forest')
                end)
                Ambray.remember = G.play.cards
            end
        end
    end
}