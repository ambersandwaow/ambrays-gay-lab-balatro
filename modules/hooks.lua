local oldbuyfromshop = G.FUNCS.buy_from_shop
function G.FUNCS.buy_from_shop(e,...)
    if e.config.ref_table.ability.set == 'ambray_quest' and e.config.id == 'buy_and_use' then
        if not G.FUNCS.check_for_buy_space(e.config.ref_table) then
            e.disable_button = nil
            return false
        end
    end
    local ret = oldbuyfromshop(e,...)
    return ret
end

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

local oldcanbuyanduse = G.FUNCS.can_buy_and_use
function G.FUNCS.can_buy_and_use(e) --why did i make this??????
    local ret = oldcanbuyanduse(e)
    if Ambray.overrideUse or e.config.ref_table.area == G.consumeables then
        if e.config.ref_table.highlighted then
            e.UIBox.states.visible = true
        end
        e.config.colour = G.C.SECONDARY_SET.Voucher
        e.config.button = 'buy_from_shop'
    end
    return ret
end

local olddiscardtodeck = G.FUNCS.draw_from_discard_to_deck
function G.FUNCS.draw_from_discard_to_deck(e,...)
    Ambray.destroyWhiteSeals()
    local ret = olddiscardtodeck(e,...)
    return ret
end

local oldgameupdate = Game.update
function Game:update(dt,...)
    local ret = oldgameupdate(self,dt,...)
    if G.GAME and Ambray.config and Ambray.config.stupid then
        G.GAME.ambray_drag = true
    end
    return ret
end

local oldcardstartdissolve = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice,...)
    if SMODS.has_enhancement(self,'m_ambray_lost') then
        SMODS.calculate_context({ambray_lostTrigger = true, card=self})
        return
    end
    local ret = oldcardstartdissolve(self, dissolve_colours, silent, dissolve_time_fac, no_juice,...)
    return ret
end

local oldcardremove = Card.remove
function Card:remove(...)
    if SMODS.has_enhancement(self,'m_ambray_lost') and not G.STATES.GAME_OVER then
        SMODS.calculate_context({ambray_lostTrigger = true, card=self})
        self.destroyed = false
        self.removed = false
        return
    end
    local ret = oldcardremove(self,...)
    return ret
end

local oldgeneratecardui = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
    if card and Ambray.shouldActuallyHideDesc(card) then
        specific_vars = specific_vars or {}
        specific_vars.no_name = true
        return oldgeneratecardui(_c, full_UI_table, specific_vars, card_type, badges, true, Ambray.misprintInfo(), Ambray.misprintInfo(), card)
    end
    return oldgeneratecardui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
end

local oldcardsetsprites = Card.set_sprites
function Card:set_sprites(_center, _front, ...)
    if self.edition and self.edition.ambrayRemember then
        _center = G.P_CENTERS[self.edition.ambrayRemember]
    end
    oldcardsetsprites(self, _center, _front, ...)
end

local oldgetjokerwinsticker = get_joker_win_sticker
function get_joker_win_sticker(_center, index, ...)
    if _center and _center.key == 'j_ambray_ralsei' then
        return 0
    end
    return oldgetjokerwinsticker(_center, index, ...)
end

local oldcardhover = Card.hover
function Card:hover(...)
    local ret = oldcardhover(self,...)
    if self.config and self.config.center and self.config.center.key and self.config.center.key == 'j_ambray_pomp' then
        Ambray.simpleEvent(function()
            play_sound('ambray_lady')
            return true
        end)
    end
    return ret
end

local olddrawfromplaytodiscard = G.FUNCS.draw_from_play_to_discard
G.FUNCS.draw_from_play_to_discard = function(e)
    local b = 1
    for _,i in ipairs(G.play.cards) do
        if Ambray.shouldntDiscard(i) then
            Ambray.simpleEvent(function()
                Ambray.sendCard(G.discard, G.hand, i, b*100/#G.play.cards, 'down')
                b = b + 1
                return true
            end, 1, false)
        end
    end
    return olddrawfromplaytodiscard(e)
end

--everything below is (moslty) stolen from aikoyori (:

local oldcardareainit = CardArea.init
function CardArea:init(X, Y, W, H, config)
    local ret = oldcardareainit(self,X,Y,W,H,config)
    if not self.states.collide.can then
        self.states.collide.can = true
    end
    return ret
end

local oldcardupdate = Card.update
function Card:update(dt)
    local ret = oldcardupdate(self,dt)
    if Ambray.shouldSteal(self) and not self.states.drag.can then
        self.states.drag.can = true
    end
    if Ambray.shouldSteal(self) and not self.states.click.can then
        self.states.click.can = true
    end
    return ret
end

local oldcardareaaligncards = CardArea.align_cards
function CardArea:align_cards()
    local ret = oldcardareaaligncards(self)
    if G.GAME.ambray_theft and not self.states.collide.can then
        self.states.collide.can = true
    end
    if G.GAME.ambray_drag and self == G.play and self.states.collide.can then
        self.states.collide.can = false
    end
    return ret
end

local oldcardstopdrag = Card.stop_drag
function Card:stop_drag()
    local area = self.area
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
        if Ambray.shouldDrag(self,area) and area ~= G.play and not (area == G.shop_jokers and not Ambray.shouldSteal(self)) then
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
    return oldcardstopdrag(self)
end