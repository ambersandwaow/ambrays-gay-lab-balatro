local config = SMODS.current_mod.config or {}

SMODS.current_mod.config_tab = function()
    return{--i saved like genuinely 30 rows by squishing this together :sob:
        n = G.UIT.ROOT, config = {r = 0.1, minw = 8, minh = 6, align = "tm", padding = 0.2, colour = G.C.BLACK, emboss = 0.1}, nodes = {
            {n = G.UIT.R, config = {padding = 0}, nodes = {
                {n = G.UIT.C, config = {align = "cm"}, nodes = {
                    {n = G.UIT.R,  config = {align = "cm", padding = 0.01},  nodes = {
                        create_toggle({
                            label = "Gaia mode",
                            ref_table = config,
                            ref_value = 'extraGay'
                        }),
                        create_toggle({
                            label = '"balanced" (option below must be off)',
                            ref_table = config,
                            ref_value = 'balanced'
                        }),
                        create_toggle({
                            label = "this is just stupid idk",
                            ref_table = config,
                            ref_value = 'stupid'
                        }),
                    }},
                    {n = G.UIT.R, config = {align = "cm", padding = 0.01}, nodes = {
                        create_toggle({
                            label = "remove custom music",
                            ref_table = config,
                            ref_value = 'musicR'
                        }),
                        create_option_cycle({
                            scale = 0.8,
                            w = 6,
                            options = {'my remix selection','takanaka remix'},
                            opt_callback = "ambrayMusicCycle",
                            current_option = config.musicType,
                            ref_table = config,
                            ref_value = 'musicType'
                        }),
                        {n=G.UIT.R, config={align = 'cm'}, nodes = {
                            {n=G.UIT.T, config = {text = 'requires restart', scale = 0.4, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
                        }},
                        create_toggle({
                            label = "remove everything except music",
                            ref_table = config,
                            ref_value = 'musicK'
                        }),
                        create_toggle({
                            label = 'enable "pointless" or broken cards',
                            ref_table = config,
                            ref_value = 'pointless'
                        }),
                    }}
                }}
            }}
        }
    }
end

SMODS.current_mod.credits_tab = function()
    return{
        n = G.UIT.ROOT, config = {colour = G.C.BLACK, align = 'cm', padding = 0.2, r = 0.1, emboss = 0.1, minh = 6, minw = 8}, nodes = {
            {n = G.UIT.C, config = {align = 'tm', minh = 5, minw = 7.5}, nodes = {
                {n = G.UIT.R, config = {align = 'tm'}, nodes = {
                    {n = G.UIT.C, config = {align = 'tm'}, nodes = {
                        {n = G.UIT.R, config = {align = 'tm'}, nodes = {
                            {n = G.UIT.T, config = {text = 'Ideas and art by:', scale = 1, colour = G.C.UI.TEXT_LIGHT}},
                        }},
                        {n = G.UIT.R, config = {align = 'cm', padding = 0.2}, nodes = {
                            {n = G.UIT.T, config = {text = 'Gaia', scale = 0.8, colour = G.C.lesGradInv}},
                            {n = G.UIT.T, config = {text = ' and ', scale = 0.6, colour = G.C.UI.TEXT_LIGHT}},
                            {n = G.UIT.T, config = {text = 'Ambray', scale = 0.8, colour = G.C.lesGrad}}
                        }},
                    }}
                }},
                {n = G.UIT.R, config = {align = 'tm', padding = 0.25}, nodes = {
                    {n = G.UIT.T, config = {text = 'Coding by:', scale = 1, colour = G.C.UI.TEXT_LIGHT}},
                }},
                {n = G.UIT.R, config = {align = 'tm'}, nodes = {
                    {n = G.UIT.T, config = {text = 'Ambray', scale = 0.8, colour = G.C.lesGrad}}
                }},
                {n = G.UIT.R, config = {align = 'bm', padding = 0.5}, nodes = {
                    {n=G.UIT.C, config={align = "cm", padding = 0.1, r = 0.1, hover = true, colour = G.C.waowgradient,
                    button = 'ambrayMusicPlaylist', emboss = 0.05}, nodes={
                        {n=G.UIT.T, config={text = 'playlist of songs used here', scale = 0.5, colour = G.C.UI.TEXT_LIGHT}},
                    }}
                }}
            }}
        }
    }
end

local isGaia
if next(SMODS.find_mod('GAIAMOD')) then
   isGaia = 'cross mod content is enabled!'
else
    isGaia = 'cross mod content is disabled :('
end
--idk why this doesnt work
SMODS.current_mod.custom_ui = {
    n = G.UIT.ROOT, config = {colour = G.C.BLACK, align = 'cm', padding = 0.2, r = 0.1, emboss = 0.1, minh = 6, minw = 5.5}, nodes = {
        {n = G.UIT.C, config = {align = 'tm', minh = 5, minw = 7.5}, nodes = {
            {n = G.UIT.R, config = {align = 'tm', outline_colour = G.C.WHITE}, nodes = {
                {n = G.UIT.T, config = {text = 'Authors: ', colour = G.C.UI.TEXT_LIGHT}},
                {n = G.UIT.T, config = {text = 'Amber, Gaia', colour = G.C.lesGrad}}
            }},
            {n = G.UIT.R, config = {align = 'tm'}, nodes = {
                {n = G.UIT.T, config = {text = 'yeah, ts kinda ', colour = G.C.UI.WHITE}},
                {n = G.UIT.T, config = {text = 'gayy', colour = G.C.lesGradCrazy}},
            }},
            {n = G.UIT.R, config = {align = 'tm', padding = 0.25}, nodes = {
                {n = G.UIT.T, config = {text = isGaia, colour = G.C.GREY}}
            }}
        }}
    }
}

--idk why this doesnt work either :sob:
SMODS.current_mod.description_loc_vars = function(self)
    return {
        vars = {
            isGaia,
        colours = {G.C.lesGradCrazy}
        },
        key = 'description'
    }
end

SMODS.current_mod.ui_config = {
    author_colour = G.C.lesGrad
}