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
        badges[#badges+1] = create_badge('art by: Gaia', SMODS.Gradients['ambray_credits'], G.C.UI.TEXT_LIGHT, 1)
    end,
    loc_vars = function(self,info_queue,card)
        return{vars = {
            localize {type='name_text',key='j_ambray_larva',set='Joker'},
            localize {type='name_text',key='c_ambray_yuri',set='ambray_quest'}
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
Ambray.make_tooltip('fihTip')
