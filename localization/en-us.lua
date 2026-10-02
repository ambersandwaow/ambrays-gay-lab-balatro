return{
    descriptions = {
        ambray_quest = {
            c_ambray_yuri = {
                name = 'Yuri',
                text = {
                    {
                        'When this {C:ambray_quest}Quest{} is obtained',
                        'enhances 1 card in deck to a',
                        '{C:attention}Gaia{} card, and 1 to an {C:attention}Ambray{} card',
                    },
                    {
                        'This {C:ambray_quest}Quest{} is complete when',
                        '{C:attention}Gaia{} and {C:attention}Ambray{} trigger together'
                    }
                }
            },
            c_ambray_yuri_alt = {
                name = 'Yuri',
                text = {
                    {
                        'When this {C:ambray_quest}Quest{} is obtained',
                        'enhances 1 card in deck to a',
                        '{C:attention}Gaia{} card, and 1 to an {C:attention}Ambray{} card',
                    },
                    {
                        'This {C:ambray_quest}Quest{} is complete when',
                        '{C:attention}Gaia{} and {C:attention}Ambray{} trigger together'
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
                        'This {C:ambray_quest}Quest{} is completed when',
                        'you have {C:money}$#1#{} or less'
                    },
                    {
                        'This {C:ambray_quest}Quest{} gives an extra',
                        '{C:money}$#2#{} when it is complete'
                    }
                }
            },
            c_ambray_minimal = {
                name = 'Minimalism',
                text = {
                    {
                        'When this {C:ambray_quest}Quest{} is obtained',
                        'it creates {C:attention}#2#{}',
                        '{C:inactive}must have room'
                    },
                    {
                        'This {C:ambray_quest}Quest{} is complete when',
                        'you have less than {C:attention}#1#{} cards in deck'
                    }
                }
            },
            c_ambray_minimal_alt = {
                name = 'Minimalism',
                text = {
                    {
                        'When this {C:ambray_quest}Quest{} is obtained',
                        'it creates {C:attention}#2#{}',
                        '{C:inactive}must have room'
                    },
                    {
                        'This {C:ambray_quest}Quest{} is complete when',
                        'you have less than {C:attention}#1#{} cards in deck'
                    },
                    {
                        '{C:inactive,s:0.6}its kinda strange how romanticized minimalism is',
                        '{C:inactive,s:0.6}i wonder how related to classism that is'
                    }
                }
            },
            c_ambray_study = {
                name = 'Study',
                text = {
                    {
                        'When this {C:ambray_quest}Quest{} is obtained',
                        'it creates {C:attention}#1#{}',
                        '{C:inactive}must have room'
                    },
                    {
                        'This {C:ambray_quest}Quest{} is complete when',
                        'you have played a {C:attention}Flush House'
                    }
                },
                unlock = {
                    'Discover all {C:attention}vanilla{} hands'
                }
            },
            c_ambray_trans = {
                name = 'The Trans Agenda',
                text = {
                    {
                        'This {C:ambray_quest}Quest{} is complete when',
                        'A{C:attention} Jack{} or {C:attention}Queen{} increases its rank'
                    }
                }
            },
            c_ambray_trans_alt = {
                name = 'The Trans Agenda',
                text = {
                    {
                        'This {C:ambray_quest}Quest{} is complete when',
                        'A{C:attention} Jack{} or {C:attention}Queen{} increases its rank'
                    },
                    {
                        '{C:inactive,s:0.6}like Prometheus, trans people stole gender from the cis'
                    }
                }
            },
            c_ambray_gambling = {
                name = 'Lets Go Gambling!!!!',
                text = {
                    'This {C:ambray_quest}Quest{} is complete when',
                    'A {C:attention}#1#{} isnt {C:attention}#2#'
                }
            },
            c_ambray_doki = {
                name = 'Doki Hunter',
                text = {
                    'This {C:ambray_quest}Quest{} is complete when',
                    'you play a flush of {C:gaia_dokis}Dokis{}'
                },
                unlock = {
                    "Have at least {E:1,C:attention}20",
                    "cards with {E:1,C:gaia_dokis}Dokis",
                    "suit in your deck",
                },
            },
            c_ambray_absurdism = {
                name = 'Absurdism',
                text = {
                    'This {C:ambray_quest}Quest{} is complete when',
                    'you use {C:attention}#1#{} on a Joker'
                },
                unlock = {
                    'Have a {C:attention}Joker{} card',
                    'in your deck at',
                    'end of round'
                }
            }
        },
        ambray_tooltips = {
            c_ambray_quests = {
                name = 'Quest',
                text = {
                    'When a {C:ambray_quest}Quest{} is complete',
                    'it is {C:red}destroyed{} and you get {C:money}$15',
                    '{C:ambray_quest}Quests{} cannot be {C:money}sold'
                }
            },
            c_ambray_gaiaTip = {
                name = 'Gaia',
                text = {
                    'If played with an {C:attention}Ambray{}',
                    'card, some {C:white,X:ambray_lesgrad}gay stuff{} happens'
                }
            },
            c_ambray_ambrayTip = {
                name = 'Ambray',
                text = {
                    'If played with a {C:attention}Gaia{}',
                    'card, some {C:white,X:ambray_lesgrad}gay stuff{} happens'
                }
            },
            c_ambray_lostTip = {
                name = 'Lost Card',
                text = {
                    'When you try to {C:attention}copy',
                    'or {C:attention}destroy{} this card',
                    'that action fails and this card',
                    'gains an additional {C:attention}+1{} retrigger'
                }

            },
            c_ambray_lostTip2 = {
                name = 'trigger warning !!',
                text = {
                    'the cards try to kill themselves',
                    'i haven no clue why :('
                }
            },
            c_ambray_whateverTip = {
                name = 'almost killed me irl !!',
                text = {
                    'nah not really',
                    'but it did mess up my save file',
                    'and didnt even do the thing',
                    'another instance of me being lazy :('
                }
            },
            c_ambray_distractionTip = {
                name = 'Distraction',
                text = {
                    'grab it while',
                    'theyre not looking'
                }
            },
            c_ambray_marriageTip = {
                name = '',
                text = {
                    'just like how you',
                    'stole my heart <3'
                }
            },
            c_ambray_cryptidTip = {
                name = 'misprint theft !!',
                text = {
                    'cryptid has the same',
                    'edition, i just wanted',
                    'to use the shader i',
                    'made and so i took',
                    'their idea, sowwy'
                }
            },
            c_ambray_ralyTip = {
                name = 'blurry',
                text = {
                    'idk why theyre',
                    'blurry sometimes',
                    'sorry'
                }
            },
        },
        Back = {
            b_ambray_chud = {
                name = 'Fuck My Stupid Chud Deck',
                text = {
                    'Start with {C:attention}#1#{} and {C:attention} #2#{}',
                    'ambray additions appear {C:attention}5x{} as often'
                }
            },
            b_ambray_mesmerizer = {
                name = 'Mesmerizer Deck',
                text = {
                    'Start with 10 {C:green}random{}',
                    '{C:gaia_dokis}Dokis{} in your deck',
                    'adds 1 {C:attention}Gaia{} card',
                    'and 1 {C:attention}Ambray{} card',
                    'ambray and {C:gaia_dokis}DDGGPM{} additions',
                    'appear more often'
                },
                unlock = {
                    'Win a run with the',
                    '{C:purple}??? Deck{} on {C:attention}any stake',
                },
            }
        },
        Blind = {
            bl_final_acorn = {
                name = "Amber!! o:",
                text = {
                    "Flips and shuffles",
                    "all Joker cards",
                },
            },
        },
        Edition = {
            e_ambray_distraction = {
                name = 'Distraction',
                text = {
                    'grab it while',
                    'theyre not looking'
                }
            },
            e_ambray_aberrance = {
                name = 'Aberrance',
                text = {
                    'Becomes a {C:green,E:1}Random{}',
                    'card of the same type'
                }
            },
            e_ambray_misprint = {
                name = 'Misprint',
                text = {
                    '{C:dark_edition}Randomizes{} values',
                    'between {C:attention}#1#{} and {C:attention}#2#'
                }
            }
        },
        Enhanced = {
            m_ambray_gaia = {
                name = 'Gaia <3',
                text = {
                    {
                        'If played with an {C:attention}Ambray{}',
                        'card, some {C:white,B:1}gay stuff{} happens'
                    }
                }
            },
            m_ambray_gaia_alt = {
                name = 'Gaia <3',
                text = {
                    {
                        'If played with an {C:attention}Ambray{}',
                        'card, some {C:white,B:1}gay stuff{} happens'
                    },
                    {
                        '{C:inactive,s:0.8}what a beautiful creature'
                    }
                }
            },
            m_ambray_ambray = {
                name = 'Ambray',
                text = {
                    {
                        'If played with a {C:attention}Gaia{}',
                        'card, some {C:white,B:1}gay stuff{} happens'
                    }
                }
            },
            m_ambray_ambray_alt = {
                name = 'Ambray',
                text = {
                    {
                        'If played with a {C:attention}Gaia{}',
                        'card, some {C:white,B:1}gay stuff{} happens'
                    },
                    {
                        '{C:inactive,s:0.8}oh how infatuated she is'
                    }
                }
            },
            m_ambray_tree = {
                name = '',
                text = {
                    'there is a tree here'
                }
            },
            m_ambray_tree_alt = {
                name = '',
                text = {
                    'there is a tree here',
                    'wont work as expected due',
                    'to multiplayer being active'
                }
            },
            m_ambray_lost = {
                name = 'Lost Card',
                text = {
                    'When you try to {C:attention}copy',
                    'or {C:attention}destroy{} this card',
                    'that action fails and this card',
                    'gains an additional {C:attention}+#2#{} retrigger',
                    '{C:inactive}currently {C:attention}+#1#{C:inactive} retriggers'
                }
            }
        },
        Joker = {
            j_ambray_eatRich = {
                name = 'Eat the Rich',
                text = {
                    'Gives {C:money}$#1#{} at end',
                    'of round. {C:red}Kills you{} if',
                    'you have over {C:money}$#2#{}'
                }
            },
            j_ambray_diesel = {
                name = 'Diesel',
                text = {
                    {
                        'When entering {C:attention}Small{} or{C:attention} Big',
                        '{C:attention}blinds{}, create a {C:attention}#3#',
                        '{C:inactive}#1# remaining'
                    },
                    {
                        'When entering {C:attemtion}Boss blind{}',
                        'create a {C:attention}#4#',
                        '{C:inactive}#2# remaining  '
                    }
                }
            },
            j_ambray_offPutting = {
                name = 'Off-Putting Joker',
                text = {
                    {
                        '{C:green}#1# in #2#{} chance to generate',
                        'a {C:spectral}Spectral{} card when',
                        '{C:red,E:3}destroying{} a card',
                        '{C:inactive}Must have room{}'
                    },
                    {
                        'When you sell a',
                        '{C:spectral}Spectral{} card',
                        'the {C:attention}blind requirement{}',
                        'is halved'
                    }
                }
            },
            j_ambray_larva = {
                name = 'Larva',
                text = {
                    '{C:chips}+#3#{} chips',
                    '{C:attention}Evolves{} after {C:attention}#1#{} rounds',
                    '{C:inactive}currently #2#/#1#'
                }
            },
            j_ambray_pupa = {
                name = 'Pupa',
                text = {
                    '{C:mult}+#3#{} mult',
                    '{C:attention}Evolves{} after {C:attention}#1#{} rounds',
                    '{C:inactive}currently #2#/#1#',
                    '{C:inactive}Evolves from Larva'
                },
                unlock = {
                    'Grow me'
                }
            },
            j_ambray_imago = {
                name = 'Imago',
                text = {
                    '{X:mult,C:white}X#1#{} mult',
                    '{C:inactive}Evolves from Pupa'
                },
                unlock = {
                    'Growwww meeeee'
                }
            },
            j_ambray_poi = {
                name = 'P.O.I',
                text = {
                    'At start of round adds a',
                    '{C:attention}White Seal{} to {C:attention}1{} random card in deck'
                }
            },
            j_ambray_forest = {
                name = 'Cuddle in the Woods',
                text = {
                    {
                        'Before {C:attention}Gaia{} and {C:attention}Ambray{}',
                        'are scored, they gain an additional',
                        '{C:attention}+#1#{} permanent retrigger',
                        'then they are debuffed this round',
                    }
                }
            },
            j_ambray_forest_alt = {
                name = 'Cuddle in the Woods',
                text = {
                    {
                        'Before {C:attention}Gaia{} and {C:attention}Ambray{}',
                        'are scored, they gain an additional',
                        '{C:attention}+#1#{} permanent retrigger',
                        'then they are debuffed this round',
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
                        'At start of ronud',
                        'multiply all values of a',
                        'random other joker by {C:attention}#1#',
                        'then {C:red}debuff{} it'
                    }
                }
            },
            j_ambray_missing = {
                name = 'Went Missing',
                text = {
                    'Played cards gain {C:white,X:mult}X#1#{} mult',
                    '{C:green}#2# in #3#{} chance to be destroyed'
                }
            },
            j_ambray_begun = {
                name = 'Only Just Begun',
                text = {
                    {
                        'If {C:attention}first hand{} of round is a',
                        'single card, enhance that card',
                        'into a {C:attention}Lost{} card'
                    }
                }
            },
            j_ambray_absurd = {
                name = 'Absurd Joker',
                text = {
                    'At the start of every round',
                    'add {C:attention}1{} random',
                    '{C:white,B:1}silly{} card to your hand'
                }
            },
            j_ambray_io = {
                name = 'IO',
                text = {
                    'For every {C:money}$#1#{} spent',
                    'upgrade flush level',
                    '{C:money}$#2#{C:inactive} remaining'
                }
            },
            j_ambray_love = {
                name = 'True Love\'s First Kiss',
                text = {
                    'Gains {C:white,X:dark_edition}^#1#{} mult when',
                    'gayyyyy',
                    '{C:inactive}Currently {C:white,X:dark_edition}^#2#{C:inactive} mult'
                }
            },
            j_ambray_love_alt = {
                name = 'True Love\'s First Kiss',
                text = {
                    {
                        'Gains {C:white,X:dark_edition}^#1#{} mult when',
                        'gayyyyy',
                        '{C:inactive}Currently {C:white,X:dark_edition}^#2#{C:inactive} mult'
                    },
                    {
                        '{C:inactive,s:0.6}yeah how could i ever make this more gay'
                    }
                }
            },
            j_ambray_unique = {
                name = 'Unique Joker',
                text = {
                    'Gains {C:chips}+#4#{} for each unique{C:attention} consumable{} bought this run',
                    'gains {C:mult}+#5#{} for each unique {C:attention}joker{} bought this run',
                    'gains {C:white,X:mult}X#6#{} for each unique {C:attention}voucher{} bought this run',
                    '{C:inactive}Currently {C:chips}+#1#{C:inactive} chips, {C:mult}+#2#{C:inactive} mult, and {C:white,X:mult}X#3#{C:inactive} mult'
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
                name = 'White Seal',
                text = {
                    'Gives {C:white,X:mult}X#1#{} mult on score',
                    'gets {C:attention}removed{} on play or discard',
                    '{C:red}destroys{} itself at end of round'
                }
            },
            p_ambray_smallQuestPack = {
                name = 'Baby Quest pack',
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:ambray_quest} Quest{} cards"
                }
            },
            p_ambray_mediumQuestPack = {
                name = 'Medium Quest pack',
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:ambray_quest} Quest{} cards"
                }
            },
            p_ambray_bigQuestPack = {
                name = 'Gigantic Quest pack',
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:ambray_quest} Quest{} cards"
                }
            },
            ambray_transTip = {
                name = 'formula for the retrigger count',
                text = {
                    'the way its calculated is a constant (3)',
                    'multiplied by the current ante (#1#)',
                    'with a minimum added (8)',
                    'so 3x#1#+8=#2#'
                }
            },
            ambray_transTip2 = {
                name = 'multiplayer',
                text = {
                    'broken in mutliplayer',
                    'so i made it not able to spawn',
                    'sowwy'
                }
            },
            undiscovered_ambray_quest = {
                name = 'do they know?',
                text = {
                    'they dont know',
                    ':pensive:'
                }
            },
        },
        panel = {
            c_ambray_daydream = {
                name = 'Daydream Panel',
                text = {
                    'Add {C:dark_edition}#1#{} to #2#',
                    'selected cards',
                    '{C:inactive}excluding this one'
                },
            }
        },
        Tarot = {
            c_ambray_PoW = {
                name = 'Page of Wands',
                text = {
                    'Enhance {C:attention}#1#{} selected card',
                    'into a {C:attention}#2#{} card',
                    'you lose {C:money}$#3#'
                }
            },
            c_ambray_KoW = {
                name = 'Knight of Wands',
                text = {
                    'Enhance {C:attention}#1#{} selected card',
                    'into something {C:white,B:1}silly'
                }
            },
            c_ambray_QoW = {
                name = 'Queen of Wands',
                text = {
                    'Enhance {C:attention}#1#{} selected card',
                    'into either a {C:attention}#2#{} card',
                    'or a {C:attention}#3#{} card'
                }
            },
            c_ambray_KioW = {
                name = 'King of Wands',
                text = {
                    'Swap the area',
                    'of {C:attention}2{} selected cards',
                    '{C:inactive}excluding this one'
                }
            },
            c_ambray_chokun = {
                name = 'Chokun Gaming',
                text = {
                    'If used',
                    '{C:attention}Prevents Death{}',
                    'and gives {C:money}$#1#'
                }
            },
            c_wheel_of_fortune = {
                name = 'Wheel of Fortune',
                text = {
                    "{C:green}#1# in #2#{} chance to add",
                    "{C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or",
                    "{C:dark_edition}Polychrome{} edition",
                    "to a random {C:attention}Joker",
                    'else, add {C:dark_edition}Aberrance{}',
                    'to one random {C:attention}Joker'
                },
            },
        },
    },
    misc = {
        dictionary = {
            ambray_replace = 'replace',
            k_ambray_and = 'and',
            k_ambray_artBy = 'art by:',
            k_ambray_balanced = '"balanced" (option below must be off)',
            k_ambray_coding = 'Coding by',
            k_ambray_music1 = 'my remix selection',
            k_ambray_music2 = 'Takanaka remix',
            k_ambray_music3 = 'Dom Palombi remix',
            k_ambray_musicRemoveOther = 'remove everything except music',
            k_ambray_playlist = 'Playlist of songs used here',
            b_ambray_quest_cards = 'Quest Cards',
            k_ambray_quest = 'Quest',
            k_ambray_questPack = '{C:ambray_quest}Quest{} Pack',
            k_ambray_remove_custom_music = 'remove custom music',
            k_ambray_requiresRestart = 'requres restart',
            k_ambray_stupid = 'this is just stupid idk',
            k_ambray_seconds = 'seconds',
            k_ambray_tooltips = 'tooltips',
            b_ambray_tooltips_cards = 'tooltips cards',
            k_ambray_waow = ':waow:',
            k_any_pronouns = 'any pronouns',
            k_gaia_pronouns = 'they/its',
            k_gaia_mode = 'Gaia mode',
            k_he_him = 'he/him',
            k_ralsei_pronouns = 'she/they (maybe)',
            k_ideasArt = 'Ideas and art by:',
            k_she_her = 'she/her',
        },
        labels = {
            ambray_aberrance = 'Aberrance',
            ambray_distraction = 'Distraction',
            ambray_misprint = 'Misprint',
            ambray_quest = 'Quest',
            ambray_tooltips = 'Tooltips',
            ambray_white_seal = 'White Seal',
            k_ambray_waow = ':waow:',
        },
    }
}