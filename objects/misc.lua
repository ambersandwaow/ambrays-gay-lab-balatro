SMODS.Booster {
    key = 'smallQuestPack',
    config = {choose = 1, extra = 3},
    atlas = 'boosters',
    pos = {x = 0, y = 0},
    group_key = 'questPack',
    weight = 2,
    cost = 4,
    kind = 'questPack',
    create_card = function(self, card, i)
        return{set = 'ambray_quest', area = G.pack_cards, skip_materialize = true, soulable = true, key_append = 'questPackGen'}
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.ambray_quest)
        ease_background_colour({new_colour = G.C.SET.ambray_quest, special_colour = G.C.SECONDARY_SET.ambray_quest, contrast = 2})
    end,
}
SMODS.Booster {
    key = 'mediumQuestPack',
    config = {choose = 1, extra = 5},
    atlas = 'boosters',
    pos = {x = 1, y = 0},
    group_key = 'questPack',
    weight = 1,
    cost = 6,
    kind = 'questPack',
    create_card = function(self, card, i)
        return create_card("ambray_quest", G.pack_cards, nil, nil, true, true, nil, "medQuestPack")
    end,
    loc_vars = function(self, info_queue, card)
        return{vars = {math.min(card.ability.choose + (G.GAME.modifiers.booster_choice_mod or 0), math.max(1, card.ability.extra +
        (G.GAME.modifiers.booster_size_mod or 0))), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0))}}
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.ambray_quest)
        ease_background_colour({new_colour = G.C.SET.ambray_quest, special_colour = G.C.SECONDARY_SET.ambray_quest, contrast = 2})
    end,
}

SMODS.Back{--Fuck My Stupid Chud Deck
    key = 'chud',
    atlas = 'decks',
    name = 'Fuck My Stupid Chud Deck',
    pos = {x = 0, y = 0},
    discovered = true,
    order = 80,
    config = {
        consumables = {'c_ambray_yuri'},
        jokers = {'j_ambray_larva'}
    },
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(localize('k_ambray_artBy')..' Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    loc_vars = function(self, info_queue, card)
        return{vars = {
            localize{type = 'name_text', key = 'j_ambray_larva', set = 'Joker'},
            localize{type = 'name_text', key = 'c_ambray_yuri', set = 'ambray_quest'}
        }}
    end
}

SMODS.Seal{--White Seal
    key = 'white',
    atlas = 'seals',
    pos = {x = 0, y = 0},
    badge_color = G.C.WHITE,
    text_colour = G.C.BLACK,
    discovered = true,
    sound = {sound = 'generic1', per = 1.2, vol = 0.4},
    config = {extra = {xmult = 6}},
    loc_vars = function(self,info_queue,card)
        return{vars = {card.ability.seal.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return{xmult = card.ability.seal.extra.xmult}
        end
        if (context.after and context.cardarea == G.play) or (context.discard and context.other_card == card) then
            Ambray.simpleEvent(function()
                card:set_seal(nil, nil, true)
                play_sound('generic1')
                return true
            end)
        end
    end
}

SMODS.ConsumableType {
    key = 'ambray_tooltips',
    default = 'c_ambray_quests',
    collection_rows = {4, 5},
    primary_colour = HEX('004e4e'),
    secondary_colour = HEX('00aeae'),
    shop_rate = 0,
    no_collection = true,
}

Ambray.make_tooltip('quests', Ambray.questReward or 15)
Ambray.make_tooltip('gaiaTip')
Ambray.make_tooltip('ambrayTip')
Ambray.make_tooltip('lostTip')
Ambray.make_tooltip('lostTip2')
Ambray.make_tooltip('whateverTip')
Ambray.make_tooltip('distractionTip')
Ambray.make_tooltip('marriageTip')
Ambray.make_tooltip('cryptidTip')
Ambray.make_tooltip('ralyTip')