--lots of this was stolen from the vanilla joker display code :thubs:
if JokerDisplay then
    local jdef = JokerDisplay.Definitions
    jdef['j_ambray_eatRich'] = {
        text = {
            {text = "+$"},
            {ref_table = "card.ability.extra", ref_value = "rewardDollars"},
        },
        text_config = {colour = G.C.GOLD},
        reminder_text = {
            {ref_table = "card.joker_display_values", ref_value = "dying", colour = G.C.RED},
        },
        calc_function = function(card)
            card.joker_display_values.dying = G.GAME.dollars < 90 and 'max '..card.ability.extra.maxDollars or '!!!!!!!!!'
        end
    }
    jdef['j_ambray_offPutting'] = {
        extra = {
            {
                {text = "("},
                {ref_table = "card.joker_display_values", ref_value = "odds"},
                {text = ")"},
            }
        },
        extra_config = {colour = G.C.GREEN, scale = 0.3},
        calc_function = function(card)
            local numerator, denominator =
            SMODS.get_probability_vars(card, card.ability.extra.spectralNum, card.ability.extra.spectralDenom, 'ambray_offPutting')
            card.joker_display_values.odds = localize{type = 'variable', key = "jdis_odds", vars = {numerator, denominator}}
        end
    }
    jdef['j_ambray_missing'] = {
        text = {
            {ref_table = 'card.joker_display_values', ref_value = 'count'},
            {text = 'x', scale = 0.35},
            {
                border_nodes = {
                    {text = 'X'},
                    {ref_table = 'card.ability.extra', ref_value = 'xmult'}
                }
            }
        },
        extra = {
            {
                {text = "("},
                {ref_table = "card.joker_display_values", ref_value = "odds"},
                {text = ")"},
            }
        },
        extra_config = {colour = G.C.GREEN, scale = 0.3},
        calc_function = function(card)
            card.joker_display_values.count = #G.hand.highlighted
            local numerator, denominator =
            SMODS.get_probability_vars(card, card.ability.extra.destroyNum, card.ability.extra.destroyDenom, 'ambray_missing')
            card.joker_display_values.odds = localize{type = 'variable', key = "jdis_odds", vars = {numerator, denominator}}

        end
    }
    jdef['j_ambray_io'] = {
        text = {
            {ref_table = 'card.ability.extra', ref_value = 'remaining'},
            {text = 'remaining'}
        },
        text_config = {colour = G.C.UI.TEXT_INACTIVE}
    }
    jdef['j_ambray_diesel'] = {
        extra = {
            {
                {ref_table = 'card.ability.extra', ref_value = 'speedRemain', colour = G.C.FILTER},
                {ref_table = 'card.joker_display_values', ref_value = 'skip'},
            },
            {
                {ref_table = 'card.ability.extra', ref_value = 'd6Remain', colour = G.C.FILTER},
                {ref_table = 'card.joker_display_values', ref_value = 'd6'},
            }
        },
        extra_config = {scale = 0.3},
        calc_function = function(card, text, reminder_text, extra)
            card.joker_display_values.d6 = ' '..localize{type = 'name_text', set = 'Tag', key = 'tag_d_six'}
            card.joker_display_values.skip = ' '..localize{type = 'name_text', set = 'Tag', key = 'tag_skip'}
        end
    }
    jdef['j_ambray_larva'] = {
        text = {
            {text = '+'},
            {ref_table = 'card.ability.extra', ref_value = 'chips', retrigger_type = 'mult'}
        },
        text_config = {colour = G.C.CHIPS},
        reminder_text = {
            {text = "("},
            {ref_table = "card.joker_display_values", ref_value = "active"},
            {text = ")"},
        },
        calc_function = function(card)
            card.joker_display_values.is_active = card.ability.extra.currentRounds >= card.ability.extra.evolveRounds
            card.joker_display_values.active = card.joker_display_values.is_active and
            localize("jdis_active") or (card.ability.extra.currentRounds .. "/" .. card.ability.extra.evolveRounds)
        end,
        style_function = function(card, text, reminder_text, extra)
            if reminder_text and reminder_text.children and reminder_text.children[2] then
                reminder_text.children[2].config.colour = card.joker_display_values.is_active and G.C.GREEN or G.C.UI.TEXT_INACTIVE
            end
        end
    }
    jdef['j_ambray_pupa'] = {
        text = {
            {text = '+'},
            {ref_table = 'card.ability.extra', ref_value = 'mult', retrigger_type = 'mult'}
        },
        text_config = {colour = G.C.MULT},
        reminder_text = {
            {text = "("},
            {ref_table = "card.joker_display_values", ref_value = "active"},
            {text = ")"},
        },
        calc_function = function(card)
            card.joker_display_values.is_active = card.ability.extra.currentRounds >= card.ability.extra.evolveRounds
            card.joker_display_values.active = card.joker_display_values.is_active and
            localize("jdis_active") or (card.ability.extra.currentRounds .. "/" .. card.ability.extra.evolveRounds)
        end,
        style_function = function(card, text, reminder_text, extra)
            if reminder_text and reminder_text.children and reminder_text.children[2] then
                reminder_text.children[2].config.colour = card.joker_display_values.is_active and G.C.GREEN or G.C.UI.TEXT_INACTIVE
            end
        end
    }
    jdef['j_ambray_imago'] = {
        text = {
            {
                border_nodes = {
                    {text = 'X'},
                    {ref_table = 'card.ability.extra', ref_value = 'Xmult', retrigger_type = 'exp'}
                }
            }
        }
    }
    jdef['j_ambray_whatever'] = {
        reminder_text = {
            {text = '+'},
            {ref_table = 'card.ability.extra', ref_value = 'hsize'}
        },
        reminder_text_config = {scale = 0.35}
    }
    jdef['j_ambray_unique'] = {
        text = {
            {text = '+', colour = G.C.CHIPS},
            {ref_table = 'card.ability.extra', ref_value = 'chips', colour = G.C.CHIPS, retrigger_type = 'mult'},
            {text = ' +', colour = G.C.MULT},
            {ref_table = 'card.ability.extra', ref_value = 'mult', colour = G.C.MULT, retrigger_type = 'mult'},
            {text = ' '},
            {
                border_nodes = {
                    {text = 'X'},
                    {ref_table = 'card.ability.extra', ref_value = 'xmult', retrigger_type = 'exp'}
                }
            }
        }
    }
    jdef['j_ambray_forest'] = {
        text = {
            {text = '+'},
            {ref_table = 'card.joker_display_values', ref_value = 'count', retrigger_type = 'mult'}
        },
        calc_function = function(card)
            card.joker_display_values.active = G.GAME.current_round.hands_left <= 1
            card.joker_display_values.count = #G.hand.highlighted == 2 and card.ability.extra.x or 0
        end,
        style_function = function(card, text, reminder_text, extra)
            if text and text.children[1] and text.children[2] then
                text.children[1].config.colour = card.joker_display_values.active and G.C.FILTER or G.C.UI.TEXT_INACTIVE
                text.children[2].config.colour = card.joker_display_values.active and G.C.FILTER or G.C.UI.TEXT_INACTIVE
            end
        end
    }
    jdef['j_ambray_uno'] = {
        extra = {
            {
                {text = '('},
                {ref_table = 'card.joker_display_values', ref_value = 'odds'},
                {text = ')'}
            }
        },
        extra_config = {colour = G.C.DARK_EDITION, scale = 0.35},
        calc_function = function(card)
            local num, denom = SMODS.get_probability_vars(card, card.ability.extra.num, card.ability.extra.denom, 'ambray_uno')
            card.joker_display_values.odds = localize{type = 'variable', key = "jdis_odds", vars = {num, denom}}
        end
    }
    jdef['j_ambray_mia'] = {
        text = {
            {text = '+'},
            {ref_table = 'Ambray', ref_value = 'miaChips', retrigger_type = 'mult'}
        },
        text_config = {colour = G.C.CHIPS},
        reminder_text = {
            {text = "("},
            {ref_table = "card.joker_display_values", ref_value = "active"},
            {text = ")"},
        },
        calc_function = function(card)
            card.joker_display_values.is_active = card.ability.extra.current >= card.ability.extra.rounds
            card.joker_display_values.active = card.joker_display_values.is_active and
            localize("jdis_active") or (card.ability.extra.current .. "/" .. card.ability.extra.rounds)
        end,
        style_function = function(card, text, reminder_text, extra)
            if reminder_text and reminder_text.children and reminder_text.children[2] then
                reminder_text.children[2].config.colour = card.joker_display_values.is_active and G.C.GREEN or G.C.UI.TEXT_INACTIVE
            end
        end
    }
    jdef['j_ambray_caw'] = {
        reminder_text = {
            {text = "("},
            {ref_table = "card.joker_display_values", ref_value = "blueprint_compat", colour = G.C.RED},
            {text = ")"}
        },
        calc_function = function(card)
            local copied_joker, copied_debuff = JokerDisplay.calculate_blueprint_copy(card)
            card.joker_display_values.blueprint_compat = localize('k_incompatible')
            JokerDisplay.copy_display(card, copied_joker, copied_debuff)
        end,
        get_blueprint_joker = function(card)
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    return G.jokers.cards[i + 1]
                end
            end
            return nil
        end
    }
    jdef['j_ambray_meow'] = {
        text = {
            {
                border_nodes = {
                    {text = 'X'},
                    {ref_table = 'card.ability.extra', ref_value = 'xchips'}
                },
                border_colour = G.C.CHIPS
            }
        },
        reminder_text = {
            {ref_table = 'card.joker_display_values', ref_value = 'min'},
            {text = '< x <'},
            {ref_table = 'card.joker_display_values', ref_value = 'max'}
        },
        calc_function = function(card)
            card.joker_display_values.min = card.ability.extra.min / 100
            card.joker_display_values.max = card.ability.extra.max / 100
        end
    }
    jdef['j_ambray_ashley'] = {
        reminder_text = {
            {text = '<- X'},
            {ref_table = 'card.ability.extra', ref_value = 'left'},
            {text = '  '},
            {ref_table = 'card.ability.extra', ref_value = 'right'},
            {text = 'X ->'}
        }
    }
    jdef['j_ambray_love'] = {
        text = {
            {border_nodes = {
                {text = '^'},
                {ref_table = 'card.ability.extra', ref_value = 'current'}
            },
            border_colour = G.C.DARK_EDITION}
        }
    }
end