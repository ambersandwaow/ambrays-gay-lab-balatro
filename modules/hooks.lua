local oldcheckforspace = G.FUNCS.check_for_buy_space
function G.FUNCS.check_for_buy_space(card,...)
    if card.ability.set == 'ambray_quest' then
        if #G.quests.cards >= G.quests.config.card_limit then
            alert_no_space(card, G.quests)
            return false
        else
            return true
        end
    end
    local ret = oldcheckforspace(card,...)
    return ret
end

local oldsmodsgetcardareas = SMODS.get_card_areas
function SMODS.get_card_areas(_type, _context)
    local g = oldsmodsgetcardareas(_type, _context)
    if _type == 'jokers' then
        table.insert(g, (G.quests or nil))
    end
    return g
end

local olddiscardtodeck = G.FUNCS.draw_from_discard_to_deck
function G.FUNCS.draw_from_discard_to_deck(e,...)
    Ambray.destroyWhiteSeals()
    local ret = olddiscardtodeck(e,...)
    return ret
end

local oldgameupdate = Game.update
function Game:update(dt,...)
    local ret = oldgameupdate(self, dt,...)
    if G.GAME and not G.GAME.ambray_drag and Ambray.config and Ambray.config.stupid then
        G.GAME.ambray_drag = true
    end
    return ret
end

local oldcardstartdissolve = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice,...)
    if SMODS.has_enhancement(self, 'm_ambray_lost') then
        SMODS.calculate_context{ambray_lostTrigger = true, card = self}
        self.destroyed = false
        self.removed = false
        return
    end
    local ret = oldcardstartdissolve(self, dissolve_colours, silent, dissolve_time_fac, no_juice,...)
    return ret
end

local oldcardremove = Card.remove
function Card:remove(...)
    if SMODS.has_enhancement(self, 'm_ambray_lost') and not G.STATES.GAME_OVER then
        SMODS.calculate_context{ambray_lostTrigger = true, card = self}
        self.destroyed = false
        self.removed = false
        return
    end
    local ret = oldcardremove(self,...)
    return ret
end

local oldgeneratecardui = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card,...)
    if card and Ambray.shouldActuallyHideDesc(card) then
        specific_vars = specific_vars or {}
        specific_vars.no_name = true
        return oldgeneratecardui(_c, full_UI_table, specific_vars, card_type, badges, true, Ambray.misprintInfo(), Ambray.misprintInfo(), card,...)
    end
    return oldgeneratecardui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card,...)
end

local oldcardsetsprites = Card.set_sprites
function Card:set_sprites(_center, _front, ...)
    if self.edition and self.edition.ambrayRemember then
        _center = G.P_CENTERS[self.edition.ambrayRemember]
    end
    oldcardsetsprites(self, _center, _front, ...)
end

local oldgetjokerwinsticker = get_joker_win_sticker
function get_joker_win_sticker(_center, index,...)
    if _center and _center.key == 'j_ambray_ralsei' then
        return 0
    end
    return oldgetjokerwinsticker(_center, index,...)
end

local oldcardhover = Card.hover
function Card:hover(...)
    local ret = oldcardhover(self,...)
    if Ambray.getKey(self) == 'j_ambray_pomp' then
        Ambray.simpleEvent(function()
            play_sound('ambray_lady')
            return true
        end)
    end
    return ret
end

local oldcardsetability = Card.set_ability
function Card:set_ability(center, initial, delay_sprites,...)
    local ret = oldcardsetability(self, center, initial, delay_sprites,...)
    if type(center) == "string" and string.sub(center, 1, 2) ~= 'm_' then
        self.ambray_remove_children = true
    else
        self.ambray_remove_children = false
    end
    return ret
end

local oldhighlightcard = highlight_card
function highlight_card(card, percent, dir,...)
    local ret = oldhighlightcard(card, percent, dir,...)
    if card.base then
        local key = Ambray.getKey(card)
        if key ~= 'c_base' and string.sub(key, 1, 2) ~= 'm_' then
            card.ambray_remove_children = true
        end
    end
    return ret
end

local oldcanselectfrombooster = G.FUNCS.can_select_from_booster
G.FUNCS.can_select_from_booster = function(e)
    if e.config.ref_table.ability.set == 'ambray_quest' then
        e.config.colour = G.C.GREEN
        e.config.button = 'ambray_select_quest'
    end
end

--everything below is stolen from aikoyori (:
--i modified everything so much that idk if i have to include this anymore honestly

local oldcardareainit = CardArea.init
function CardArea:init(X, Y, W, H, config,...)
    local ret = oldcardareainit(self, X, Y, W, H, config,...)
    if not self.states.collide.can then
        self.states.collide.can = true
    end
    return ret
end

local oldcardupdate = Card.update
function Card:update(dt,...)
    local ret = oldcardupdate(self, dt,...)
    if not self.states.drag.can and Ambray.shouldSteal(self) then
        self.states.drag.can = true
    end
    if not self.states.click.can and Ambray.shouldSteal(self) then
        self.states.click.can = true
    end
    if self.ambray_remove_children and self.children and self.children.front then
        self.children.front:remove()
        self.children.front = nil
    end
    return ret
end

local oldcardareaaligncards = CardArea.align_cards
function CardArea:align_cards(...)
    local ret = oldcardareaaligncards(self,...)
    if G.GAME.ambray_theft and not self.states.collide.can then
        self.states.collide.can = true
    end
    if G.GAME.ambray_drag and self == G.play and self.states.collide.can then
        self.states.collide.can = false
    end
    return ret
end

local oldcardstopdrag = Card.stop_drag
function Card:stop_drag(...)
    local area = self.area
    if self:shouldDragToNowhere() then
        for _,i in pairs(G.I.CARDAREA) do
            i:remove_card(self)
        end
        return oldcardstopdrag(self,...)
    end
    for _, k in ipairs(G.CONTROLLER.collision_list) do
        if (k:is(CardArea)) then
            if Ambray.shouldDrag(self) or not self.area then
                area = k
                break
            end
        end
        if (k:is(Card)) and false then
            if Ambray.shouldDrag(self) or not self.area then
                area = k.area
                break
            end
        end
    end
    if area and area ~= self.area then
        if Ambray.shouldDrag(self, area) and area ~= G.play and not (area == G.shop_jokers and not Ambray.shouldSteal(self)) then
            for _, cardarea in ipairs(G.I.CARDAREA) do
                if cardarea and cardarea.cards then
                    cardarea:remove_card(self)
                end
            end
            if not self:shouldDragToNowhere() then
                Ambray.sendCard(self.area, area, self, 1, 'up', nil, 0)
                area:align_cards()
            end
        end
    end
    return oldcardstopdrag(self,...)
end