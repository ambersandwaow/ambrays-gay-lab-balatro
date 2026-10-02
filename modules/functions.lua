function Ambray.kill_game()
    if ((G or {}).SOUND_MANAGER or {}).channel then
        G.SOUND_MANAGER.channel:push({
            type = "kill",
        })
    end
    if ((G or {}).SAVE_MANAGER or {}).channel then
        G.SAVE_MANAGER.channel:push({
            type = "kill",
        })
    end
    if ((G or {}).HTTP_MANAGER or {}).channel then
        G.HTTP_MANAGER.channel:push({
            type = "kill",
        })
    end
    assert(require "lovely".reload_patches())
    love.event.quit()
end

function Ambray.contains(table, element)
    if not table and element then return false end
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function Ambray.findPos(table, val)
    for index, v in pairs(table) do
        if v == val then
            return index
        end
    end
    return false
end

function Ambray.removeFromTable(tabel, val)
    local index = Ambray.findPos(tabel, val)
    if index then
        table.remove(tabel, index)
        return true
    end
    return false
end

--wtf does imp and gobaling mean :sob:
function Ambray.copyCardTable(imp)
    local gobaling
    for k, v in pairs(imp) do
        if type(v) == 'table' then
            gobaling[k] = copy_table(v)
        else
            gobaling[k] = v
        end
    end
    return gobaling
end

function Ambray.getKey(card)
    return card and card.config and card.config.center and card.config.center.key
end

local funnyJokers = {'j_gros_michel','j_ambray_pupa','j_joker','j_credit_card','j_mr_bones','j_ambray_ralsei'}
local funnyConsumables = {'c_pluto','c_ambray_KoW','c_ouija','c_ambray_gambling'}
local funnyDecks = {'b_erratic','b_painted','b_anaglyph','b_yellow'}
local funnyVouchers = {'v_glow_up','v_illusion','v_antimatter'}
--jokers, consumables, decks, vouchers
function Ambray.funny(single, card, args)
    local wee = {}
    args = args or {}
    if card and card.ability then
        local idk = card.ability.set
        if card.ability.consumeable then args.consumables = true
        elseif idk == 'Joker' then args.jokers = true
        elseif idk == 'Voucher' then args.vouchers = true
        elseif idk == ('Booster' or 'Default' or 'Enhanced') then args.decks = true args.consumables = true
        end
    elseif args == {} then
        args.jokers = true
        args.consumables = true
        args.decks = true
        args.vouchers = true
    end
    if args.jokers then
        for _,i in ipairs(funnyJokers) do
            wee[#wee+1] = i
        end
    end
    if args.consumables then
        for _,i in ipairs(funnyConsumables) do
            wee[#wee+1] = i
        end
    end
    if args.vouchers then
        for _,i in ipairs(funnyVouchers) do
            wee[#wee+1] = i
        end
    end
    if args.decks then
        for _,i in ipairs(funnyDecks) do
            wee[#wee+1] = i
        end
    end
    if single then
        wee = pseudorandom_element(wee)
    end
    return wee
end

function G.FUNCS.ambrayMusicPlaylist()
    love.system.openURL("https://www.youtube.com/watch?v=tksJbDi38tQ&list=PLSMB_bpe8pz4")
end

function G.FUNCS.ambrayGayLink()
    G.FUNCS.go_to_menu()
    love.system.openURL("https://forms.gle/cczkfYG75Q5WBk8aA")
end

function G.FUNCS.ambraySpanishTranslation()
    love.system.openURL("https://forms.gle/B8oRimXYQBz6eniS6")
end

function G.FUNCS.ambrayMusicCycle(e) --stolen from spectrallib :)
    Ambray.config.musicType = e.to_key
end

function G.FUNCS.ambrayEnableDraggable()
    if Ambray and Ambray.config then
        if Ambray.config.balanced or not Ambray.config.stupid then
            Ambray.draggableRemember = false
            G.GAME.ambray_drag = false
        else
            Ambray.draggableRemember = true
            G.GAME.ambray_drag = true
        end
    end
end

function G.FUNCS.ambray_select_quest(e, mute, nosave)
    SMODS.destroy_cards(G.quests.cards)
    Ambray.simpleEvent(function()
        G.FUNCS.use_card(e, mute, nosave)
        return true
    end, #G.quests.cards >= 1 and 0.75 or 0)
end

--this is stolen directly from smods since it only exists in a version unsupported by multiplayer
function Ambray.is_playing_card(card)
    if not type(card) == "table" then return false end
	local set = (card.ability or {}).set or ((card.config or {}).center or {}).set
	return card.playing_card or set == "Default" or set == "Enhanced"
end

function Ambray.questArea()
    SMODS.current_mod.custom_card_areas = function(game)
        local abcdefg = 0
        if MP and MP.LOBBY and MP.LOBBY.code then abcdefg = 3 end
        game.quests = CardArea(
            game.consumeables.T.x + 2.4, game.consumeables.T.y + 3 + abcdefg,
            game.consumeables.T.w / 2, game.consumeables.T.h,
            {card_limit = 1, type = 'joker', highlight_limit = 1, align_buttons = true}
        )
    end
end

function Ambray.make_tooltip(name, vars)
    SMODS.Consumable{
        key = name,
        set = 'ambray_tooltips',
        no_collection = true,
        loc_vars = function(self, info_queue, card)
            return{vars = {vars}}
        end
    }
end

function Ambray.destroyWhiteSeals()
    for i = 1, #G.deck.cards do
        if G.deck.cards[i]:get_seal() == 'ambray_white' then
            Ambray.simpleEvent(function()
                G.deck:juice_up(1,2)
                play_sound('ambray_boom')
                SMODS.destroy_cards(G.deck.cards[i])
                return true
            end, 0.4)
        end
    end
end

Ambray.transCards = {}
function Ambray.resetTransCards()
    Ambray.transCards[1] = {rank = 'Ace', suit = 'Spades'}
    Ambray.transCards[2] = {rank = 'Ace', suit = 'Hearts'}
    local valid_idol_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_suit(playing_card) and not SMODS.has_no_rank(playing_card) then
            valid_idol_cards[#valid_idol_cards + 1] = playing_card
        end
    end
    local idol_card = pseudorandom_element(valid_idol_cards, 'yayyy')
    if idol_card then
        Ambray.transCards[1].rank = idol_card.base.value
        Ambray.transCards[1].suit = idol_card.base.suit
        Ambray.transCards[1].id = idol_card.base.id
    end
    idol_card = pseudorandom_element(valid_idol_cards, 'wahoo')
    if idol_card then
        Ambray.transCards[2].rank = idol_card.base.value
        Ambray.transCards[2].suit = idol_card.base.suit
        Ambray.transCards[2].id = idol_card.base.id
    end
end

function Ambray.loseRound()
    G.STATE = G.STATES.GAME_OVER
    if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
        G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
    end
    G:save_settings()
    G.FILE_HANDLER.force = true
    G.STATE_COMPLETE = false
end

function Ambray.bully(w,h,fs)
    fs = fs or false
    love.window.setMode(w,h,{fullscreen = fs})
    love.resize(w,h)
end

Ambray.misprintInfo = function()
    local idk = {}
    for i = 1,8 do
        idk[i+1] = {
            n = G.UIT.O, config = {object = DynaText({string = Ambray.letters,
                colours = {G.C.UI.TEXT_DARK},
                pop_in_rate = 9999999,
                silent = true,
                random_element = true,
                pop_delay = 0.5,
                scale = 0.32,
                min_cycle_time = 0
            })}
        }
    end
    return idk
end

function Ambray.simpleEvent(func, delay, blocking, blockable, trigger)
    G.E_MANAGER:add_event(Event{
        trigger = trigger or 'after',
        blocking = blocking or true,
        blockable = blockable or true,
        delay = delay or 0.1,
        func = func
    })
end

--returns a table of all highlighted cards and a table of all cardareas with highlighted cards in them
function Ambray.getHighlightedCards(remove, areas)
    local bleh, graa, nuhuh, nuh = {}, {}, false, false
    if not areas then
        areas = {}
        for _,i in pairs(G.I.CARDAREA) do
            areas[#areas+1] = i
        end
    end
    if type(areas) ~= 'table' then
        areas = {areas}
    end
    for _,i in pairs(areas) do
        if i.highlighted then
            for _,j in pairs(i.highlighted) do
                if j == remove then
                    nuh = true
                else
                    nuhuh = true
                    bleh[#bleh+1] = j
                end
            end
            if nuh and not nuhuh then
                graa[#graa+1] = i
            end
        end
    end
    return{bleh, graa}
end

--why isnt this a base game thing?
function Card:ambraySetRank(rank)
    rank = rank or SMODS.Ranks[self.base.value] or {}
    self.base.nominal = rank.nominal or 0
    self.base.face_nominal = rank.face_nominal or 0
    self.base.id = rank.id
end

function Card:shouldDragToNowhere()
    if G.VIEWING_DECK or G.SETTINGS.paused then return false end
    if self.ambray_drag_nowhere then return true
    elseif SMODS.has_enhancement(self, 'm_gaia_amber') or SMODS.has_enhancement(self, 'm_gaia_gaia') or
    SMODS.has_enhancement(self, 'm_gaia_amberv1') or SMODS.has_enhancement(self, 'm_gaia_gaiav1') then
        return true
    end
    return false
end

--hook this function to add your own centers to completely hide description
function Ambray.shouldActuallyHideDesc(card)
    if not card then return false end
    if card.ambrayShouldHideDesc then return true end
    if card.edition and (card.edition.ambray_aberrance or card.edition.ambrayShouldHideDesc) then return true end
    return false
end

--hook this function to add your own centers to override drag restrictions
function Card:shouldDragOverride()
    if self:shouldStealOverride() then return true end
    if self.ambray_drag_override then return true end
    if SMODS.has_enhancement(self,'m_gaia_amber') or SMODS.has_enhancement(self,'m_gaia_gaia') or
    SMODS.has_enhancement(self,'m_gaia_amberv1') or SMODS.has_enhancement(self,'m_gaia_gaiav1') then
        return true
    end
    return false
end

--hook this function to add your own centers to override theft restrictions
function Card:shouldStealOverride()
    if self.ambray_steal_override then return true end
    if self.edition and self.edition.ambray_distraction then return true end
    if SMODS.has_enhancement(self,'m_gaia_amber') or SMODS.has_enhancement(self,'m_gaia_gaia') or
    SMODS.has_enhancement(self,'m_gaia_amberv1') or SMODS.has_enhancement(self,'m_gaia_gaiav1') then
        return true
    end
    return false
end

function Ambray.shouldDrag(card, area)
    area = area or G.jokers
    if G.VIEWING_DECK or G.SETTINGS.paused or (area == G.hand and G.STATE == G.STATES.SHOP) then return false end
    if card and card:shouldDragOverride() or G.GAME.ambray_drag then return true end
    return false
end

function Ambray.shouldSteal(card)
    if G.VIEWING_DECK or G.SETTINGS.paused then return false end
    if card and card:shouldStealOverride() or G.GAME.ambray_theft then return true end
    return false
end

function Ambray.toPlayingCard(card, rank, suit)
    if not card then return false end
    if Ambray.is_playing_card(card) then
        return card
    end
    local base = pseudorandom_element(G.P_CARDS, pseudoseed("toPlayingCard"))
    Ambray.simpleEvent(function()
        card:set_base(base)
        if rank then
            card:ambraySetRank(rank)
        end
        if suit then
            card:change_suit(suit)
        end
        card.ambray_remove_children = true
        return true
    end)
    return card
end

--this was mostly copy pasted from aikoyori
--which was itself mostly copy pasted from vanilla
function Ambray.sendCard(from, to, card, percent, dir, sort, delay, mute, stay_flipped, vol, discarded_only, forced_facing)
    if not to or not to.cards then return true end
    percent = percent or 50
    delay = delay or 0.1
    if dir == 'down' then
        percent = 1-percent
    end
    sort = sort or false
    local drawn = nil
    Ambray.simpleEvent(function()
        if not to or not to.cards then return true end
        if card then
            if from == G.hand or from == G.deck then
                Ambray.removeFromTable(G.playing_cards, card)
            end
            if from then
                for _, cardarea in ipairs(G.I.CARDAREA) do
                    if cardarea and cardarea.cards then
                        cardarea:remove_card(card)
                    end
                end
            end
            if card then drawn = true end
            if card and to == G.hand and not card.states.visible then
                card.states.visible = true
            end
            if to then
                card = Ambray.toPlayingCard(card)
                if card and not card.area then
                    to:emplace(card)
                end
            end
            if card and forced_facing then
                card.sprite_facing = forced_facing
                card.facing = forced_facing
            end
        else
            if not to then return true end
            card = to:draw_card_from(from, stay_flipped, discarded_only)
            if card then drawn = true end
            if card and to == G.hand and not card.states.visible then
                card.states.visible = true
            end
            if card and forced_facing then
                card.sprite_facing = forced_facing
                card.facing = forced_facing
            end
        end
        if not mute and drawn then
            if from == G.deck or from == G.hand or from == G.play or from == G.jokers or from == G.consumeables or from == G.discard then
                G.VIBRATION = G.VIBRATION + 0.6
            end
            play_sound('card1', 0.85 + percent * 0.2 / 100, 0.6 * (vol or 1))
        end
        if sort then to:sort() end
        SMODS.drawn_cards = SMODS.drawn_cards or {}
        if card and card.playing_card then SMODS.drawn_cards[#SMODS.drawn_cards+1] = card end
        if to == (G.deck or G.hand) then
            G.playing_cards[#G.playing_cards+1] = card
        end
        if card and forced_facing then
            card.facing = forced_facing
            card.sprite_facing = forced_facing
        end
        return true
    end, delay, not (G.SETTINGS.GAMESPEED >= 999 and ((to == G.hand and from == G.deck) or (to == G.deck and from == G.hand))), nil, 'before')
end

--putting this at the bottom bc it sucks
function Ambray.quest()
    local quack = math.random(1,13)
    if quack == 1 then
        if G.GAME.blind.in_blind then
            SMODS.add_card({set = 'Playing Card', no_edition = true, enhancement = 'm_ambray_tree'})
        end
        Ambray.simpleEvent(function()
            play_sound('ambray_eggDelta')
            return true
        end)
    elseif quack == 2 then
        Ambray.simpleEvent(function()
            play_sound('ambray_tenna')
            return true
            end)
    elseif quack == 3 then
        Ambray.simpleEvent(function()
            play_sound('ambray_myKing')
            return true
        end)
    elseif quack == 4 then
        Ambray.simpleEvent(function()
            play_sound('ambray_glue')
            return true
        end)
    elseif quack == 5 then
        Ambray.simpleEvent(function()
            play_sound('ambray_imFalling')
            return true
        end)
    elseif quack == 6 then
        Ambray.simpleEvent(function()
            play_sound('ambray_splat')
            return true
        end)
    elseif quack == 7 then
        Ambray.simpleEvent(function()
            play_sound('ambray_sustingus')
            return true
        end)
    elseif quack == 8 then
        Ambray.simpleEvent(function()
            play_sound('ambray_itsMyJarona')
            return true
        end)
    elseif quack == 9 then
        Ambray.simpleEvent(function()
            play_sound('ambray_jaOrange')
            return true
        end)
    elseif quack == (10 or 11) then
        Ambray.simpleEvent(function()
            play_sound('ambray_sax')
            return true
        end)
    elseif quack == 12 then
        Ambray.simpleEvent(function()
            play_sound('ambray_eatingMyFlesh')
            return true
        end)
    elseif quack == 13 then
        Ambray.simpleEvent(function()
            play_sound('ambray_lady')
            return true
        end)
    end
end