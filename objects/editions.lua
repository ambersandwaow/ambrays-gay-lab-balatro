SMODS.Shader{
    key = 'distraction',
    path = 'distraction.fs',
    send_vars = function(sprite,card)
        return{
            random = card and card.edition.randombwaa or 0,
            random2 = card and card.edition.randomaa or 0
        }
    end
}
SMODS.Edition{
    key = "distraction",
    shader = "distraction",
    unlocked = true,
    config = {},
    in_shop = true,
    weight = 20,
    extra_cost = 3,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    on_apply = function(card)
        local remember = pseudorandom(':3', -1, 1)
        card.edition.randombwaa = remember < 0 and 1 or -1
        remember = pseudorandom('OwO', -1, 1)
        card.edition.randomaa = remember < 0 and 1 or -1
    end
}

SMODS.Shader{
    key = 'aberrance',
    path = 'aberrance.fs',
}
SMODS.Edition{
    key = "aberrance",
    shader = "aberrance",
    unlocked = true,
    config = {ambrayShouldHideDesc = true},
    in_shop = true,
    weight = 8,
    extra_cost = 3,
    disable_base_shader = true,
    replace_base_card = true,
    get_weight = function(self)
        return Ambray.config.balanced and G.GAME.edition_rate * self.weight or G.GAME.edition_rate * self.weight * 3
    end,
    on_apply = function(card)
        card.ambrayShouldHideDesc = true
        card.edition.ambrayRemember = card.config.center.key or 'j_joker'
        card:set_ability(Ambray.funny(true, card))
    end,
    on_remove = function(card)
        local idk = card.edition.ambrayRemember
        card.edition.ambrayRemember = nil
        Ambray.simpleEvent(function()
            card.ambrayShouldHideDesc = false
            card:set_ability(idk)
            return true
        end, 1, false)
    end
}

SMODS.Shader{
    key = 'misprint',
    path = 'misprint.fs',
    send_vars = function(sprite, card)
        return{
            bwee = card and card.edition and card.edition.bwee or 31
        }
    end
}
SMODS.Edition{
    key = "misprint",
    shader = "misprint",
    unlocked = true,
    in_shop = true,
    weight = 2,
    extra_cost = 3,
    disable_base_shader = true,
    replace_base_card = true,
    config = {
        min = Ambray.config.balanced and 0.8 or 0.1,
        max = Ambray.config.balanced and 2 or 10
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {key = 'c_ambray_cryptidTip', set = 'ambray_tooltips'}
        return{vars = {card.edition.min, card.edition.max}}
    end,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight * self.config.max
    end,
    on_apply = function(card)
        card.edition.bwee = math.random(10, 60)
        Spectrallib.manipulate(card, {
            min = card.edition.min,
            max = card.edition.max,
            dont_stack = false,
        })
    end,
    on_remove = function(card)
        Spectrallib.manipulate(card, {
            min = 1,
            max = 1,
            dont_stack = true,
            no_deck_effects = true
        })
    end
}