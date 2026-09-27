local config = Ambray.config

SMODS.Joker{--True Love's First Kiss
    key = 'love',
    atlas = 'jokers',
    pos = {x = 4,y = 1},
    soul_atlas = 'jokers',
    soul_pos = {x = 5,y = 1},
    cost = 20,
    rarity = 'ambray_waow',
    unlocked = true,
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Amber', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    in_pool = function(self,args) if config ~= nil and config.balanced then return false else return true end end,
    config = {extra = {scalar = 0.05, current = 1}},
    loc_vars=function(self,info_queue,card)if config ~= nil then
            if config.extraGay then
                return{key = 'j_ambray_love_alt',vars = {card.ability.extra.scalar, card.ability.extra.current}}
            else
                return{key = 'j_ambray_love',vars = {card.ability.extra.scalar, card.ability.extra.current}}
            end
        end
    end,
    calculate = function(self,card,context)
        if context.pre_joker and not context.blueprint then
            if Ambray.yuriTrigger then
                card.ability.extra.current = card.ability.extra.current + card.ability.extra.scalar
                return{message = 'upgayed'}
            end
        end
        if context.joker_main then
            return{emult = card.ability.extra.current}
        end
    end
}
SMODS.Joker{--5 Finger Discount
    key = 'idk',
    atlas = 'jokers',
    pos = {x = 4,y = 2},
    soul_atlas = 'jokers',
    soul_pos = {x = 5,y = 2},
    cost = 20,
    rarity = 'ambray_waow',
    discovered = false,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        if Ambray.canGay then
            info_queue[#info_queue+1] = {set = "ambray_tooltips", key = "c_ambray_marriageTip"}
        end
    end,
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Amber', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    in_pool = function(self,args) if config and not config.balanced and G.GAME.ambray_drag then return true end return false end,
    add_to_deck = function(self,card,from_debuff) G.GAME.ambray_theft = true end,
    remove_from_deck = function(self,card,from_debuff) G.GAME.ambray_theft = false end
}
SMODS.Joker{--The Trans Experience i want to make it so that the round doesnt end when your chips are over the req but it never worked
    key = 'transness',
    atlas = 'jokers',
    pos = {x = 6, y = 1},
    soul_atlas = 'jokers',
    soul_pos = {x = 7, y = 1},
    cost = 20,
    rarity = 'ambray_waow',
    discovered = false,
    blueprint_compat = false,
    set_badges = function(self,card,badges)
        badges[#badges+1] = create_badge('art by: Amber', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    config = {extra = {willWin = true, stinkyyy = 0, tally = 0, retrigCount = 0, timer = 90, lost = false, saver = 0}},
    loc_vars = function(self,info_queue,card)
        local willWin
        if card.ability.extra.willWin == true then
            willWin = {'Win', G.C.FILTER}
        else
            willWin = {'Lose', G.C.RED}
        end
        if card.ability.extra.stinkyyy == 1 then
            local a = (Ambray.transCards[1] or {rank='Ace',suit='Spades'})
            local b = (Ambray.transCards[2] or {rank='Ace',suit='Hearts'})
            return{key = 'j_ambray_transness1',vars = {
                localize(a.rank, 'ranks'), localize(a.suit, 'suits_plural'),
                localize(b.rank, 'ranks'), localize(b.suit, 'suits_plural'),
                willWin[1],
                colours = {G.C.SUITS[a.suit], G.C.SUITS[b.suit], willWin[2]},
            }}
        elseif card.ability.extra.stinkyyy == 2 then
            info_queue[#info_queue+1] = {set = "Other", key = "ambray_transTip", vars = {G.GAME.round_resets.ante,card.ability.extra.retrigCount}}
            return{key='j_ambray_transness2',vars = {
                card.ability.extra.tally, card.ability.extra.retrigCount, willWin[1],
                colours = {willWin[2]}
            }}
        elseif card.ability.extra.stinkyyy == 3 then
            return{key='j_ambray_transness3',vars = {
                card.ability.extra.timer, willWin[1],
                colours = {willWin[2]}
            }}
        else
            if next(SMODS.find_mod('Multiplayer')) then
                info_queue[#info_queue+1] = {set = "Other", key = "ambray_transTip2"}
            end
            local a = (Ambray.transCards[1] or {rank = 'Ace', suit = 'Spades'})
            local b = (Ambray.transCards[2] or {rank = 'Ace', suit = 'Hearts'})
            return{vars = {
                localize(a.rank, 'ranks'), localize(a.suit, 'suits_plural'),
                localize(b.rank, 'ranks'), localize(b.suit, 'suits_plural'),
                colours = { G.C.SUITS[a.suit], G.C.SUITS[b.suit] },
                card.ability.extra.tally, card.ability.extra.retrigCount,
                card.ability.extra.timer
            }}
        end
    end,
    add_to_deck = function(self,card)
        card.ability.extra.stinkyyy = pseudorandom('gamerr',1,2)
    end,
    in_pool=function(self,args)
        if (config ~= nil and config.balanced) or (MP and MP.LOBBY and MP.LOBBY.code) then
            return false
        else
            return true
        end
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.main_eval then
            if card.ability.extra.willWin then
                card.ability.extra.tally = 0
                card.ability.extra.willWin = false
                card.ability.extra.lost = false
                card.ability.extra.saver = math.huge
                card.ability.extra.stinkyyy = pseudorandom('gamerr',1,3)
                if context.game_over then
                    return{saved = ''}
                end
            else
                Ambray.loseRound()
            end
        end
        if G.GAME.blind.in_blind then
            if card.ability.extra.stinkyyy == 0 then
                card.ability.extra.willWin = true --for testing
            elseif card.ability.extra.stinkyyy == 9 then
                card.ability.extra.willWin = false
            elseif card.ability.extra.stinkyyy == 1 then
                if context.individual and context.cardarea == G.play then
                    for _,bleh in ipairs(Ambray.transCards) do
                        if context.other_card.base.value == bleh.rank and context.other_card.base.suit == bleh.suit then
                            card.ability.extra.willWin = true
                            return{message = 'win!'}
                        end
                    end
                end
            elseif card.ability.extra.stinkyyy == 2 then
                card.ability.extra.retrigCount = 8+3*G.GAME.round_resets.ante
                if context.individual and (context.cardarea == G.play or
                (context.cardarea == G.hand and SMODS.has_enhancement(context.other_card,'m_steel') and not context.end_of_round)) then
                    card.ability.extra.tally = card.ability.extra.tally+1
                    if card.ability.extra.tally >= card.ability.extra.retrigCount then
                        card.ability.extra.willWin = true
                        return{message = 'win!'}
                    end
                    return{message = '+1'}
                end
            elseif card.ability.extra.stinkyyy == 3 then
                if context.first_hand_drawn then
                    card.ability.extra.saver = G.TIMERS.REAL
                elseif G.TIMERS.REAL >= ((card.ability.extra.saver or G.TIMERS.REAL)+card.ability.extra.timer) then
                    if not card.ability.extra.lost then
                        card.ability.extra.willWin = false
                        card.ability.extra.lost = true
                        card.ability.extra.saver = nil
                        Ambray.loseRound()
                    end
                else
                    card.ability.extra.willWin = true
                end
            end
        end
    end
}