local config = Ambray.config or {}

Ambray.config_tab = function()
    return{--i saved like genuinely 30 rows by squishing this together :sob:
        n = G.UIT.ROOT, config = {r = 0.1, minw = 8, minh = 6, align = "tm", padding = 0.2, colour = G.C.BLACK, emboss = 0.1}, nodes = {
            {n = G.UIT.R, config = {padding = 0}, nodes = {
                {n = G.UIT.C, config = {align = "cm"}, nodes = {
                    {n = G.UIT.R,  config = {align = "cm", padding = 0.01},  nodes = {
                        create_toggle({
                            label = localize('k_gaia_mode'),
                            ref_table = config,
                            ref_value = 'extraGay'
                        }),
                        create_toggle({
                            label = localize('k_ambray_balanced'),
                            ref_table = config,
                            ref_value = 'balanced'
                        }),
                        create_toggle({
                            label = localize('k_ambray_stupid'),
                            ref_table = config,
                            ref_value = 'stupid'
                        }),
                    }},
                    {n = G.UIT.R, config = {align = "cm", padding = 0.01}, nodes = {
                        create_toggle({
                            label = localize('k_ambray_remove_custom_music'),
                            ref_table = config,
                            ref_value = 'musicR'
                        }),
                        create_option_cycle({
                            scale = 0.8,
                            w = 6,
                            options = {localize('k_ambray_music1'), localize('k_ambray_music2'), localize('k_ambray_music3')},
                            opt_callback = "ambrayMusicCycle",
                            current_option = config.musicType,
                            ref_table = config,
                            ref_value = 'musicType'
                        }),
                        create_toggle({
                            label = localize('k_ambray_musicRemoveOther'),
                            ref_table = config,
                            ref_value = 'musicK'
                        }),
                        {n=G.UIT.R, config={align = 'cm'}, nodes = {
                            {n=G.UIT.T, config = {text = localize('k_ambray_requiresRestart'), scale = 0.4, colour = G.C.UI.TEXT_DARK, shadow = true}}
                        }},
                    }}
                }}
            }}
        }
    }
end

Ambray.credits_tab = function()
    return{
        n = G.UIT.ROOT, config = {colour = G.C.BLACK, align = 'cm', padding = 0.2, r = 0.1, emboss = 0.1, minh = 6, minw = 8}, nodes = {
            {n = G.UIT.C, config = {align = 'tm', minh = 5, minw = 7.5}, nodes = {
                {n = G.UIT.R, config = {align = 'tm'}, nodes = {
                    {n = G.UIT.C, config = {align = 'tm'}, nodes = {
                        {n = G.UIT.R, config = {align = 'tm'}, nodes = {
                            {n = G.UIT.T, config = {text = localize('k_ideasArt'), scale = 1, colour = G.C.UI.TEXT_LIGHT}},
                        }},
                        {n = G.UIT.R, config = {align = 'cm', padding = 0.2}, nodes = {
                            {n = G.UIT.T, config = {text = 'Gaia ', scale = 0.8, colour = G.C.lesGradInv}},
                            {n = G.UIT.T, config = {text = localize('k_ambray_and'), scale = 0.6, colour = G.C.UI.TEXT_LIGHT}},
                            {n = G.UIT.T, config = {text = ' Ambray', scale = 0.8, colour = G.C.lesGrad}}
                        }},
                    }}
                }},
                {n = G.UIT.R, config = {align = 'tm', padding = 0.25}, nodes = {
                    {n = G.UIT.T, config = {text = localize('k_ambray_coding'), scale = 1, colour = G.C.UI.TEXT_LIGHT}},
                }},
                {n = G.UIT.R, config = {align = 'tm'}, nodes = {
                    {n = G.UIT.T, config = {text = 'Ambray', scale = 0.8, colour = G.C.lesGrad}}
                }},
                {n = G.UIT.R, config = {align = 'bm', padding = 0.5}, nodes = {
                    {n = G.UIT.C, config={align = "cm", padding = 0.1, r = 0.1, hover = true, colour = G.C.waowgradient,
                    button = 'ambrayMusicPlaylist', emboss = 0.05}, nodes = {
                        {n = G.UIT.T, config = {text = localize('k_ambray_playlist'), scale = 0.5, colour = G.C.UI.TEXT_LIGHT}},
                    }}
                }},
                {n = G.UIT.R, config = {align = 'bm', padding = 0.3}, nodes = {
                    {n = G.UIT.C, config = {align = "cm", padding = 0.1, r = 0.1, hover = true, colour = G.C.GREY,
                    button = 'ambraySpanishTranslation', emboss = 0.05}, nodes = {
                        {n = G.UIT.R, config = {padding = 0.05}, nodes= {
                            {n = G.UIT.T, config = {text = 'the Spanish translation was so ass it',
                            scale = 0.5, colour = G.C.UI.TEXT_LIGHT}},
                        }},
                        {n = G.UIT.R, config = {padding = 0.05, align = 'cm'}, nodes= {
                            {n = G.UIT.T, config = {text = 'made me want to kill myself button',
                            scale = 0.5, colour = G.C.UI.TEXT_LIGHT}},
                        }}
                    }}
                }}
            }}
        }
    }
end
