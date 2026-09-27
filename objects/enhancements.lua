local config = Ambray.config


SMODS.Enhancement{--Ambray
    key = 'ambray',
    atlas = 'enhancements',
    pos={x=1,y=0},
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = {key = 'c_ambray_gaiaTip', set = 'ambray_tooltips'}
        if config ~= nil then
            if config.extraGay then
                return{key='m_ambray_ambray_alt',vars={colours={G.C.lesGrad}}}
            end
            return{vars={colours={G.C.lesGrad}}}
        end
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('she/her', SMODS.Gradients['ambray_transGrad'], SMODS.Gradients['ambray_transGradInv'], 1)
        badges[#badges+1] = create_badge('art by: Amber', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
}
SMODS.Enhancement {--Gaia
    key = 'gaia',
    atlas = 'enhancements',
    pos = { x = 0, y = 0 },
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
    config={extra={bwee=false}},
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue + 1] = {key = 'c_ambray_ambrayTip', set = 'ambray_tooltips'}
        if config ~= nil then
            if config.extraGay then
                return{key='m_ambray_gaia_alt',vars={colours={G.C.lesGrad}}}
            end
            return{vars={colours={G.C.lesGrad}}}
        end
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('they/its', SMODS.Gradients['ambray_nbGrad'], SMODS.Gradients['ambray_nbGradInv'], 1)
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    calculate = function(self,card,context)
        if context.before and context.cardarea == G.play then
        for i in ipairs(G.play.cards) do
                if G.play.cards[i] ~= nil then
                    if SMODS.has_enhancement(G.play.cards[i], 'm_ambray_ambray') then
                        Ambray.yuriTrigger = true
                        Ambray.yuriTriggerCards = {card,G.play.cards[i]}
                    end
                end
            end
        end
        if context.after and Ambray.yuriTrigger then
            if config ~= nil then
                card.ability.extra.bwee = false
                for _,jonkler in ipairs(G.jokers.cards) do
                    if jonkler:is_rarity('ambray_waow') then card.ability.extra.bwee = true end
                end
                if not config.balanced and not card.ability.extra.bwee then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local achoo=SMODS.add_card({set = 'Joker', rarity = 'ambray_waow'})
                            card:juice_up()
                            return true
                        end
                    }))
                    Ambray.yuriTrigger = false --i have no clue why this needs to be here but if its not it crashes and if its in the event it crashes
                elseif config.balanced and Ambray.yuriTrigger and not next(SMODS.find_card('j_ambray_forest',true)) then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({set='Joker',key='j_ambray_forest'})
                            card:juice_up()
                            return true
                        end
                    }))
                    Ambray.yuriTrigger = false
                end
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blocking = false,
                func=function()
                    Ambray.yuriTrigger = false
                    return true
                end
            }))
        end
    end
}
SMODS.Enhancement{--Tree
    key = 'tree',
    atlas = 'enhancements',
    pos = {x=0,y=1},
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    no_collection = true,
    in_pool = function(self,args) return false end,
    loc_vars = function(self,info_queue,card)
        if MP and MP.LOBBY and MP.LOBBY.code then
            return{key='m_ambray_tree_alt'}
        end
    end,
    calculate = function (self, card, context)
        if context.press_play then
            delay(1*G.SETTINGS.GAMESPEED)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('ambray_garbageNoise')
                    return true
                end
            }))
            delay(6*G.SETTINGS.GAMESPEED)
        end
        if context.main_scoring then
            if not (MP and MP.LOBBY and MP.LOBBY.code) then
                Ambray.kill_game()
            end
        end
    end
}
SMODS.Enhancement{--Lost
    key = 'lost',
    atlas = 'enhancements',
    pos = {x=2,y=0},
    config={extra={retriggers=0,scalar=1}},
    loc_vars=function(self,info_queue,card)
        info_queue[#info_queue + 1] = {key = 'c_ambray_lostTip2', set = 'ambray_tooltips'}
        return{vars={card.ability.extra.retriggers,card.ability.extra.scalar}}
    end,
    calculate = function(self,card,context)
        if context.repetition then
            return{repetitions = card.ability.extra.retriggers}
        end
        if context.ambray_lostTrigger and context.card == card and not G.VIEWING_DECK then
            card.ability.extra.retriggers = card.ability.extra.retriggers + card.ability.extra.scalar
        end
    end
}