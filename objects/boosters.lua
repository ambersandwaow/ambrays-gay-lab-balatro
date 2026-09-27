SMODS.Booster {
    key = 'smallQuestPack',
    config = {
        choose = 1,
        extra = 3
    },
    atlas = 'boosters',
    pos = {x=0,y=0},
    group_key = 'questPack',
    weight = 2,
    cost = 4,
    kind = 'questPack',
    create_card = function(self, card, i)
        return {set = 'ambray_quest', area = G.pack_cards, skip_materialize = true, soulable = true, key_append = 'questPackGen', }
    end,
--[[    loc_vars = function(self, info_queue, card)
        return { vars = { math.min(card.ability.choose + (G.GAME.modifiers.booster_choice_mod or 0), math.max(1, card.ability.extra +
        (G.GAME.modifiers.booster_size_mod or 0))), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0)) } }
    end,
]]    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.ambray_quest)
        ease_background_colour({ new_colour = G.C.SET.ambray_quest, special_colour = G.C.SECONDARY_SET.ambray_quest, contrast = 2 })
    end,
}
SMODS.Booster {
    key = 'mediumQuestPack',
    config = {
        choose = 1,
        extra = 5
    },
    atlas = 'boosters',
    pos = {x=1,y=0},
    group_key = 'questPack',
    weight = 1,
    cost = 6,
    kind = 'questPack',
    create_card = function(self, card, i)
        return create_card("ambray_quest", G.ambray_quests, nil, nil, true, true, nil, "medQuestPack")
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { math.min(card.ability.choose + (G.GAME.modifiers.booster_choice_mod or 0), math.max(1, card.ability.extra +
        (G.GAME.modifiers.booster_size_mod or 0))), math.max(1, card.ability.extra + (G.GAME.modifiers.booster_size_mod or 0)) } }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.ambray_quest)
        ease_background_colour({ new_colour = G.C.SET.ambray_quest, special_colour = G.C.SECONDARY_SET.ambray_quest, contrast = 2 })
    end,
}