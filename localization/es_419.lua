--idk why im making this
--also why is it 419???
return{
    descriptions = {
        ambray_tooltips = {
            c_ambray_quests = {
                name = 'Misión',
                text = {
                    'Cuando un {C:ambray_quest}Misión{} esta completada',
                    'lo es {C:red}destruido{} y recibes {C:money}$15',
                    '{C:ambray_quest}Misiónes{} no pueden estar {C:money}vendido'
                }
            },
            c_ambray_gaiaTip = {
                name = 'Gaia',
                text = {
                    'Si esta jugado con una carta',
                    '{C:attention}Ambray{}, algo {C:white,X:ambray_lesgrad}gay{} occure'
                }
            },
            c_ambray_ambrayTip = {
                name = 'Ambray',
                text = {
                    'Si esta jugado con una carta',
                    '{C:attention}Gaia{}, algo {C:white,X:ambray_lesgrad}gay{} occure'
                }
            },
            c_ambray_lostTip = {
                name = 'Carta Perdida',
                text = {
                    'Cuando intentas {C:attention}copiar',
                    'o {C:attention}destruir{} esta carta',
                    'esa acion fallo y esta carta',
                    'gana para siempre {C:attention}+1{} reactiva'
                }

            },
            c_ambray_lostTip2 = {
                name = 'trigger warning !!',
                text = {
                    'las cartas intentan a murirlos',
                    'y no se por que :('
                }
            },
            c_ambray_distractionTip = {
                name = 'Distraction',
                text = {
                    'agarralo cuando',
                    'no estan mirando'
                }
            },
        },
        ambray_quest = {
            c_ambray_yuri = {
                name = 'Yuri',
                text = {
                    {
                        'Cuando esta {C:ambray_quest}Misión{} está obtenido',
                        'mejora a 1 carta en la baraja en una',
                        'carta {C:attention}Gaia{}, y a 1 otra en una carta {C:attention}Ambray{}',
                    },
                    {
                        'Esta {C:ambray_quest}Misión{} esta completada cuando',
                        '{C:attention}Gaia{} y {C:attention}Ambray{} estan jugado juntos'
                    }
                }
            },
            c_ambray_yuri_alt = {
                name = 'Yuri',
                text = {
                    {
                        'Cuando esta {C:ambray_quest}Misión{} está obtenido',
                        'mejora a 1 carta en la baraja en una',
                        'carta {C:attention}Gaia{}, y a 1 otra en una carta {C:attention}Ambray{}',
                    },
                    {
                        'Esta {C:ambray_quest}Misión{} esta completada cuando',
                        '{C:attention}Gaia{} y {C:attention}Ambray{} estan jugado juntos'
                    },
                    {
                        '{C:inactive,s:0.6}first there was nothing',
                        '{C:inactive,s:0.6}and then god created yuri'
                    }
                }
            },
            c_ambray_ubi = {
                name = 'Universal Basic Income',
                text = {
                    {
                        'Esta {C:ambray_quest}Misión{} esta completada cuando',
                        'tienes {C:money}$#1#{} o menos'
                    },
                    {
                        'Esta {C:ambray_quest}Misión{} te da {C:money}$#2#',
                        'mas cuando está completada'
                    }
                }
            },
            c_ambray_minimal = {
                name = 'Minimalism',
                text = {
                    {
                        'Cuando esta {C:ambray_quest}Misión{} está obtenido',
                        'lo genera {C:attention}#2#{}',
                        '{C:inactive}debe hacer espacio'
                    },
                    {
                        'Esta {C:ambray_quest}Misión{} esta completada cuando',
                        'tienes menos de {C:attention}#1#{} cartas en'
                    }
                }
            },
            c_ambray_minimal_alt = {
                name = 'Minimalism',
                text = {
                    {
                        'Cuando esta {C:ambray_quest}Misión{} está obtenido',
                        'lo genera {C:attention}#2#{}',
                        '{C:inactive}debe hacer espacio'
                    },
                    {
                        'Esta {C:ambray_quest}Misión{} esta completada cuando',
                        'tienes menos de {C:attention}#1#{} cartas en'
                    },
                    {
                        '{C:inactive,s:0.6}its kinda strange how romanticized minimalism is',
                        '{C:inactive,s:0.6}i wonder how related to classism that is'
                    }
                }
            },
            c_ambray_study = {
                name = 'Biblioteca',
                text = {
                    {
                        'Cuando esta {C:ambray_quest}Misión{} está obtenido',
                        'lo genera {C:attention}#1#{}',
                        '{C:inactive}debe hacer espacio'
                    },
                    {
                        'Esta {C:ambray_quest}Misión{} esta completada cuando',
                        'has jugado un {C:attention}Full de Calor'
                    }
                },
                unlock = {
                    'Descubrir todas las manos {C:attention}vanilla{}'
                }
            },
            c_ambray_trans = {
                name = 'The Trans Agenda',
                text = {
                    {
                        'Esta {C:ambray_quest}Misión{} esta completada cuando',
                        'una {C:attention}Jota{} o {C:attention}Reina{} aumenta su catagoria'
                    }
                }
            },
            c_ambray_trans_alt = {
                name = 'The Trans Agenda',
                text = {
                    {
                        'Esta {C:ambray_quest}Misión{} esta completada cuando',
                        'una {C:attention}Jota{} o {C:attention}Reina{} aumenta su catagoria'
                    },
                    {
                        '{C:inactive,s:0.6}like Prometheus, trans people stole gender from the cis'
                    }
                }
            },
            c_ambray_gambling = {
                name = 'Lets Go Gambling!!!!',
                text = {
                    'Esta {C:ambray_quest}Misión{} esta completada cuando',
                    'un {C:attention}#1#{} no es {C:attention}#2#'
                }
            },
            c_ambray_doki = {
                name = 'Doki Hunter',
                text = {
                    'Esta {C:ambray_quest}Misión{} esta completada cuando',
                    'you play a flush of {C:gaia_dokis}Dokis{}'
                },
                unlock = {
                    "Debes tener al menos {E:1,C:attention}20",
                    "cartas con {E:1,C:gaia_dokis}Dokis",
                    "palos en tu baraja",
                },
            },
            c_ambray_absurdism = {
                name = 'Absurdism',
                text = {
                    'Esta {C:ambray_quest}Misión{} esta completada cuando',
                    'usas {C:attention}#1#{} en un Comodín'
                },
                unlock = {
                    'Debe tener un {C:attention}Comodín{}',
                    'en tu baraja al',
                    'final de la ronda'
                }
            }
        },
        Back = {
            b_ambray_chud = {
                name = 'Fuck My Stupid Chud Deck',
                text = {
                    'Comienza la partida con {C:attention}#1#{} y {C:attention} #2#{}',
                    'addiciones ambray son {C:attention}4x{} mas común'
                }
            },
            b_ambray_mesmerizer = {
                name = 'Baraja Mesmerizer',
                text = {
                    'Comienza la partida con 8',
                    '{C:gaia_dokis}Dokis{} en tu baraja',
                    'agrega 1 carta {C:attention}Gaia{}',
                    'y 1 carta {C:attention}Ambray{}',
                    'addiciones de ambray y {C:gaia_dokis}DDGGPKM{}',
                    'son mas común'
                },
                unlock = {
                    'Gana una partida con la',
                    '{C:purple}Baraja ¿?{} en {C:attention}cualquier pozo',
                }
            },
        },
        Blind = {
            bl_final_acorn = {
                name = "Amber!! o:",
                text = {
                    "Voltea y mezcla",
                    "todos los comodines",
                },
            },
        },
        Edition = {
            e_ambray_distraction = {
                name = 'Distraction',
                text = {
                    'agarralo cuando',
                    'no estan mirando'
                }
            },
            e_ambray_misprint = {
                name = 'Mala impresión',
                text = {
                    '{C:dark_edition}Aleatoriza{} valures',
                    'entre {C:attention}#1#{} a {C:attention}#2#'
                }
            },
            e_ambray_aberrance = {
                name = 'Aberrancia',
                text = {
                    'Convertirce en una carta',
                    '{C:green,E:1}Aleatorio{} del mismo tipo'
                }
            },
        },
        Enhanced = {
            m_ambray_gaia = {
                name = 'Gaia <3',
                text = {
                    {
                        'Si esta jugado con una carta',
                        '{C:attention}Ambray{}, algo {C:white,X:ambray_lesgrad}gay{} occure'
                    }
                }
            },
            m_ambray_gaia_alt = {
                name = 'Gaia <3',
                text = {
                    {
                        'Si esta jugado con una carta',
                        '{C:attention}Ambray{}, algo {C:white,X:ambray_lesgrad}gay{} occure'
                    },
                    {
                        '{C:inactive,s:0.8}qué criatura tan bonita'
                    }
                }
            },
            m_ambray_ambray = {
                name = 'Ambray',
                text = {
                    {
                        'Si esta jugado con una carta',
                        '{C:attention}Gaia{}, algo {C:white,X:ambray_lesgrad}gay{} occure'
                    }
                }
            },
            m_ambray_ambray_alt = {
                name = 'Ambray',
                text = {
                    {
                        'Si esta jugado con una carta',
                        '{C:attention}Gaia{}, algo {C:white,X:ambray_lesgrad}gay{} occure'
                    },
                    {
                        '{C:inactive,s:0.8}qué enemorada ella es'
                    }
                }
            },
            m_ambray_tree = {
                name = '',
                text = {
                    'hay un arbol aqui'
                }
            },
            m_ambray_tree_alt = {
                name = '',
                text = {
                    'hay un arbol aqui',
                    'wont work as expected due',
                    'to multiplayer being active'
                }
            },
            m_ambray_lost = {
                name = 'Carta Perdida',
                text = {
                    'Cuando intentas {C:attention}copiar',
                    'o {C:attention}destruir{} esta carta',
                    'esa acion fallo y esta carta',
                    'gana para siempre {C:attention}+#2#{} reactiva',
                    '{C:inactive}actual {C:attention}#1#{C:inactive} reactiva'
                }
            }
        },
        Joker = {
            j_ambray_eatRich = {
                name = 'Eat the Rich',
                text = {
                    'Gana {C:money}$#1#{} al final',
                    'de la ronda. {C:red}Te muria{} si',
                    'tienes mas de {C:money}$#2#{}'
                }
            },
            j_ambray_diesel = {
                name = 'Diésel',
                text = {
                    {
                        'Durante entrando las {C:attention}ciegas pequeña',
                        'o{C:attention} grande crea un {C:attention}#3#',
                        '{C:inactive}queda #1#'
                    },
                    {
                        'Durante entrando la {C:attemtion}ciega Jefe{}',
                        'crea un {C:attention}#4#',
                        '{C:inactive}queda #2#'
                    }
                }
            },
            j_ambray_offPutting = {
                name = 'Comodín Off-Putting',
                text = {
                    {
                        '{C:green}#1# en #2#{} probabilidades de crear',
                        'crear una carta {C:spectral}espectral{} cuando',
                        '{C:red,E:3}destruyendo{} a una carta',
                        '{C:inactive}Debe tener espacio{}'
                    },
                    {
                        'Cuando vendes a una',
                        'carta {C:spectral}espectral{}',
                        'las {C:attention}fichas de ciega{}',
                        'son dividida a la mitad'
                    }
                }
            },
            j_ambray_larva = {
                name = 'Larva',
                text = {
                    '{C:chips}+#3#{} fichas',
                    '{C:attention}Evoluciona{} despues de {C:attention}#1#{} rondas',
                    '{C:inactive}actual #2#/#1#'
                }
            },
            j_ambray_pupa = {
                name = 'Pupa',
                text = {
                    '{C:mult}+#3#{} multi',
                    '{C:attention}Evoluciona{} despues de {C:attention}#1#{} roundas',
                    '{C:inactive}actual #2#/#1#',
                    '{C:inactive}Evoluciona desde Larva'
                },
                unlock = {
                    'Grow me'
                }
            },
            j_ambray_imago = {
                name = 'Imago',
                text = {
                    '{X:mult,C:white}X#1#{} multi',
                    '{C:inactive}Evoluciona desde Pupa'
                },
                unlock = {
                    'Growwww meeeee'
                }
            },
            j_ambray_poi = {
                name = 'P.O.I',
                text = {
                    'Cuando comienza de la ronda agrega',
                    '{C:attention}Sello Blanco{} a {C:attention}1{} carta en baraja'
                }
            },
            j_ambray_forest = {
                name = 'Cuddle in the Woods',
                text = {
                    {
                        'Antes que {C:attention}Gaia{} y {C:attention}Ambray{}',
                        'son jugados, les ganan',
                        '{C:attention}+#1#{} reactiva permanente',
                        'despues, son debilitadas por la ronda',
                    }
                }
            },
            j_ambray_forest_alt = {
                name = 'Cuddle in the Woods',
                text = {
                    {
                        'Antes que {C:attention}Gaia{} y {C:attention}Ambray{}',
                        'son jugados, les ganan',
                        '{C:attention}+#1#{} reactiva permanente',
                        'despues, son debilitadas por la ronda',
                    },
                    {
                        '{C:inactive,s:0.6}laying there in the woods together with nothing else to distract,',
                        '{C:inactive,s:0.6}they felt at home with eachother, like this was something',
                        '{C:inactive,s:0.6}that shouldve happened long ago'
                    }
                }
            },
            j_ambray_washed = {
                name = 'Out for a Shower',
                text = {
                    {
                        'Al inicio de la ronda',
                        'multiplicar todos los valures de',
                        'un otro comodín {C:attention}#1#',
                        'despues {C:red}debilitarlo'
                    }
                }
            },
            j_ambray_missing = {
                name = 'Went Missing',
                text = {
                    'Cartas jugadas ganan {C:white,X:mult}X#1#{} multi',
                    '{C:green}#2# en #3#{} probabilidades'
                }
            },
            j_ambray_begun = {
                name = 'Only Just Begun',
                text = {
                    {
                        'Si la {C:attention}primera mano{} de la ronad',
                        'es sola una carta, convertirse',
                        'en una {C:attention}carta Lost{}'
                    }
                }
            },
            j_ambray_absurd = {
                name = 'Comodín Absurdo',
                text = {
                    'Al inicio de la ronda',
                    'agrega {C:attention}1{} carta',
                    '{C:white,B:1}silly{} a la mano'
                }
            },
            j_ambray_io = {
                name = 'IO',
                text = {
                    'Para cada {C:money}$#1#',
                    'aumeto la nivel de Flush',
                    '{C:inactive}queda {C:money}$#2#'
                }
            },
            j_ambray_love = {
                name = 'Primer beso de amor verdadero',
                text = {
                    'Gana {C:white,X:dark_edition}^#1#{} multi cuando',
                    'gayyyyy',
                    '{C:inactive}Actual {C:white,X:dark_edition}^#2#{C:inactive} multi'
                }
            },
            j_ambray_love_alt = {
                name = 'Primer beso de amor verdadero',
                text = {
                    {
                        'Gana {C:white,X:dark_edition}^#1#{} multi cuando',
                        'gayyyyy',
                        '{C:inactive}Actual {C:white,X:dark_edition}^#2#{C:inactive} multi'
                    },
                    {
                        '{C:inactive,s:0.6}yeah how could i ever make this more gay'
                    }
                }
            },
            j_ambray_unique = {
                name = 'Comodín único',
                text = {
                    'Gana {C:chips}+#4#{} para cada {C:attention}consumible{} única comprada',
                    'gana {C:mult}+#5#{} para cada {C:attention}comodín{} única comprada',
                    'gana {C:white,X:mult}X#6#{} para cada {C:attention}vale{} única comprada',
                    '{C:inactive}actual {C:chips}+#1#{C:inactive} fichas, {C:mult}+#2#{C:inactive} multi, y {C:white,X:mult}X#3#{C:inactive} multi'
                }
            },
            j_ambray_whatever = {
                name = 'Whatever It Takes',
                text = {
                    'Go up to {C:red}-$#2#{} in debt',
                    'for every {C:money}$#1#{} under {C:money}$0{} you',
                    'have, gain {C:attention}+1{} hand size',
                    '{C:inactive}currently {C:attention}+#3#{C:inactive} hand size'
                }
            },
            j_ambray_sillyy = {
                name = '{f:ambray_wee}(⸝⸝>ᴗ<⸝⸝){} Joker',
                text = {
                    '{C:green}#1# in #2#{} chance to',
                    'randomly enhance played cards'
                }
            },
            j_ambray_artistic = {
                name = 'Artistic Joker',
                text = {
                    '{C:green}#1# in #2#{} chance to',
                    'turn scored cards into a random',
                    'card in deck'
                }
            },
            j_ambray_caw = {
                name = {
                    'caw (like a crow)',
                    '{s:0.8}(i assume)',
                },
                text = {
                    'blueprint',
                    '{C:inactive,s:0.6}i thought itd be funny bc shes like',
                    '{C:inactive,s:0.6}going into the one to the right',
                    '{C:inactive,s:0.6}and thats what the joker does ykyk'
                }
            },
            j_ambray_idk = {
                name = '5 finger discount',
                text = {
                    'you can steal'
                }
            },
            j_ambray_uno = {
                name = 'Uno',
                text = {
                    '{C:dark_edition}Negative{} cards now have a',
                    '{C:green}#1# in #2#{} chance to spawn in shop'
                }
            },
            j_ambray_flamee = {
                name = 'Flamee',
                text = {
                    ''
                }
            },
            j_ambray_mia = {
                name = 'Mia',
                text = {
                    {
                        'gets {C:attention}pregnant{} after #1# rounds',
                        '{C:inactive}#2# remaining'
                    },
                    {
                        '{C:green}#3# in #4#{} chance to',
                        'duplicate this joker on birth'
                    }
                }
            },
            j_ambray_miasBaby = {
                name = 'the beauty of mpreg <3',
                text = {
                    'daddy gives {C:chips}+#1#{} chips',
                    'for each of us'
                }
            },
            j_ambray_pomp = {
                name = 'bowl',
                text = {
                    'i am arrogant'
                }
            },
            j_ambray_ralsei = {
                name = 'Ralsei',
                text = {
                    'just stands there {V:1,B:2}cutely',
                    '{C:inactive,s:0.8}no fr they do nothing'
                }
            },
            j_ambray_pyke = {
                name = 'JoPyKer',
                text = {
                    'Sends the {C:attention}lefmost',
                    'played card back to your',
                    'hand {C:attention}after play'
                }
            },
            j_ambray_fih = {
                name = 'condom fish',
                text = {
                    'gives {C:mult}mult{} equal to',
                    '{C:attention}#2#X{} how high you can count',
                    'within {C:attention}#1#{} seconds'
                }
            },
            j_ambray_autumn = {
                name = 'Pink Security Autumn',
                text = {
                    'goes on a run after',
                    'every hand played'
                }
            },
            j_ambray_meow = {
                name = 'Meow',
                text = {
                    'Gives between {C:white,X:chips}X#1#{} chips',
                    'and {C:white,X:chips}X#2#{} chips',
                    'every hand played',
                    '{C:inactive}will be {C:white,X:chips}X#3#{C:inactive} chips'
                }
            },
            j_ambray_ashley = {
                name = 'Ashley',
                text = {
                    'Multiply the {C:dark_edition}stats{} of',
                    'the {C:attention}right{} card by {C:white,X:attention}X2{} and',
                    'the {C:attention}left{} card by {C:white,X:attention}X0.5'
                }
            },
            j_ambray_transness = {
                name = 'The Trans Experience',
                text = {
                    {
                        'At end of round this joker',
                        'changes it\'s task, if you',
                        'don\'t complete that task',
                        'it {C:red}kills{} you',
                        'otherwise you cannot die to blinds',
                    },
                    {'possible abilities are:'},
                    {
                        'You must play {C:attention}1{} of {C:attention}2',
                        'randomly selected cards in your deck',
                        'this rounds cards are',
                        '{V:1}#1# of #2#{} and {V:2}#3# of #4#'
                    },
                    {
                        'You must trigger a minimum of {C:attention}#6#',
                        'cards this round'
                    },
                    {
                        'You have a total of {C:attention}#7#{}',
                        'seconds in this blind'
                    }
                }
            },
            j_ambray_transness1 = {
                name = 'The Trans Experience',
                text = {
                    {
                        'At end of round this joker',
                        'changes it\'s task, if you',
                        'don\'t complete that task',
                        'it {C:red}kills{} you',
                        'otherwise you cannot die to blinds'
                    },
                    {
                        'Current ability:',
                        'You must play {C:attention}1{} of {C:attention}2',
                        'randomly selected cards in your deck',
                        'this rounds cards are',
                        '{V:1}#1# of #2#{} and {V:2}#3# of #4#'
                    },
                    {
                        'You will {V:3}#5#{} this round'
                    }
                }
            },
            j_ambray_transness2 = {
                name = 'The Trans Experience',
                text = {
                    {
                        'At end of round this joker',
                        'changes it\'s task, if you',
                        'don\'t complete that task',
                        'it {C:red}kills{} you',
                        'otherwise you cannot die to blinds'
                    },
                    {
                        'Current ability:',
                        'You must trigger a minimum of {C:attention}#2#',
                        'cards this round',
                        '{C:inactive}current amount is {C:attention}#1#'
                    },
                    {
                        'You will {V:1}#3#{} this round'
                    }
                }
            },
            j_ambray_transness3 = {
                name = 'The Trans Experience',
                text = {
                    {
                        'At end of round this joker',
                        'changes it\'s task, if you',
                        'don\'t complete that task',
                        'it {C:red}kills{} you',
                        'otherwise you cannot die to blinds'
                    },
                    {
                        'Current ability:',
                        'You have a total of {C:attention}#1#{}',
                        'seconds in this blind'
                    },
                    {
                        'You will {V:1}#5#{} this round'
                    }
                }
            },
        },
        Other = {
            ambray_white_seal = {
                name = 'Sello Blanco',
                text = {
                    'Multi {C:white,X:mult}X#1#{}',
                    '{C:attention}eliminalo{} en jugar o descartar',
                    '{C:red}destruirlo{} al final de la ronda'
                }
            },
            p_ambray_smallQuestPack = {
                name = 'Paqueta de Misión pequeña',
                text = {
                    "Elije {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{C:ambray_quest} Misiónes{}"
                }
            },
            p_ambray_mediumQuestPack = {
                name = 'Paqueta de Misión normal',
                text = {
                    "Elije {C:attention}#1#{} de hasta",
                    "{C:attention}#2#{C:ambray_quest} Misiónes{}"
                }
            },
            undiscovered_ambray_quest = {
                name = '¿lo saben?',
                text = {
                    'no lo saben',
                    ':pensive:'
                }
            },
        },
        panel = {
            c_ambray_daydream = {
                name = 'Daydream Panel',
                text = {
                    'Agrega {C:dark_edition}#1#{} a #2#',
                    'cartas seleccionadas',
                    '{C:inactive}excluyendo esta'
                },
            }
        },
        Planet = {},
        Spectral = {},
        Stake = {},
        Tag = {},
        Tarot = {
            c_ambray_PoW = {
                name = 'Paje de Bastos',
                text = {
                    'Mejora a {C:attention}#1#{} carta seleccionada',
                    'a una carta {C:attention}#2#{}',
                    'perdidas {C:money}$#3#'
                }
            },
            c_ambray_KoW = {
                name = 'Caballero de Bastos',
                text = {
                    'Mejora a {C:attention}#1#{} carta seleccionada',
                    'a algo {C:white,B:1}silly'
                }
            },
            c_ambray_QoW = {
                name = 'Reina de Bastos',
                text = {
                    'Mejora a {C:attention}#1#{} carta seleccionada',
                    'a una carta {C:attention}#2#{} o a una carta {C:attention}#3#{}'
                }
            },
            c_ambray_KioW = {
                name = 'Rey de Bastos',
                text = {
                    'Intercambio la zona',
                    'de {C:attention}2{} cartas seleccionadas',
                    '{C:inactive}excluyendo esto'
                }
            },
            c_ambray_chokun = {
                name = 'Chokun Gaming',
                text = {
                    'Si usas,',
                    '{C:attention}Evita la muerte{}',
                    'y te da {C:money}$#1#'
                }
            },
            c_wheel_of_fortune = {
                name = 'La rueda de la fortuna',
                text = {
                    "{C:green}#1# en #2#{} probabilidades de agregar",
                    "que sean {C:dark_edition}laminadas{}, {C:dark_edition}holográficas{} o",
                    "{C:dark_edition}polícromas{}",
                    "a un {C:attention}comodín al azar",
                    'si no, agrega {C:dark_edition}aberrancia{}',
                    'a un {C:attention}comodín al azar'
                },
            },
        },
        Voucher = {},
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {},
        collabs = {},
        dictionary = {
            k_ambray_and = 'y',
            k_ambray_artBy = 'arte por:',
            k_ambray_balanced = '"equilibrado" (opción debajo debe estar desactivado)',
            k_ambray_coding = 'Codificación por:',
            k_ambray_music1 = 'mi seleccion de remix',
            k_ambray_music2 = 'remix Takanaka',
            k_ambray_music3 = 'remix Dom Palombi',
            k_ambray_musicRemoveOther = 'elimina todo excepto musica',
            k_ambray_playlist = 'Lista de canciónes usados aqui',
            k_ambray_quest = 'Misión',
            k_ambray_quest_cards = 'Cartas Misión',
            k_ambray_questPack = 'Paquete de {C:ambray_quest}Misión',
            k_ambray_remove_custom_music = 'elimina la musica personalizado',
            k_ambray_requiresRestart = '(necesita reinicio)',
            k_ambray_seconds = 'segundos',
            k_ambray_stupid = 'eso es stupido yo no se',
            k_any_pronouns = 'cualquier pronombres',
            k_gaia_pronouns = 'elle',
            k_gaia_mode = 'modo Gaia',
            k_he_him = 'el',
            k_ralsei_pronouns = 'ella/elle (probablamente)',
            k_ideasArt = 'Ideas y arte por:',
            k_she_her = 'ella',
        },
        high_scores = {},
        labels = {
            ambray_aberrance = 'Aberrancia',
            ambray_distraction = 'Distracción',
            ambray_misprint = 'Mala impresión',
            ambray_quest = 'Misión',
            ambray_white_seal = 'Sello Blanco',
        },
        poker_hand_descriptions = {},
        poker_hands = {},
        quips = {},
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorial = {},
        v_dictionary = {},
        v_text = {},
    },
}