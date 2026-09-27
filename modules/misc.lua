SMODS.Gradient{
    key = 'waowgradient',
    colours = {
        HEX('aa5522'),
        HEX('dd7777'),
        HEX('885555')
    },
    cycle = 6,
    interpoation='trig'
}
SMODS.Gradient{
    key = 'credits',
    colours = {
        HEX('344317'),
        HEX('2c4c5d')
    },
    cycle = 5,
    interpolation = 'trig'
}
SMODS.Gradient{
    key = 'funnyGrad',
    colours = {
        HEX('ff0000'),
        HEX('00ff00'),
        HEX('0000ff')
    },
    cycle = 6,
    interpolation = 'trig'
}
SMODS.Gradient{
    key = 'transGrad',
    colours = {
        HEX('f7a8b8'),
        HEX('ffffff'),
        HEX('55cdfc')
    },
    cycle = 6,
    interpoation='trig'
}
SMODS.Gradient{
    key = 'transGradInv',
    colours = {
        HEX('ffffff'),
        HEX('55cdfc'),
        HEX('f7a8b8')
    },
    cycle = 6,
    interpoation='linear'
}
SMODS.Gradient{
    key = 'nbGrad',
    colours = {
        HEX('FCF434'),
        HEX('ffffff'),
        HEX('9C59D1'),
        HEX('2c2c2c')
    },
    cycle = 8,
    interpoation='trig'
}
SMODS.Gradient{
    key = 'nbGradInv',
    colours = {
        HEX('9C59D1'),
        HEX('2c2c2c'),
        HEX('FCF434'),
        HEX('ffffff'),
    },
    cycle = 8,
    interpoation='linear'
}
SMODS.Gradient{
    key = 'lesGrad',
    colours = {
        HEX('D52D00'),
        HEX('EF7627'),
        HEX('FFFFFF'),
        HEX('D162A4'),
        HEX('A30262'),
    },
    interpolation = 'linear'
}
SMODS.Gradient{
    key = 'lesGradOffset',
    colours = {
        HEX('FFFFFF'),
        HEX('D162A4'),
        HEX('A30262'),
        HEX('D52D00'),
        HEX('EF7627'),
    },
    interpolation = 'linear'
}
SMODS.Gradient{
    key = 'lesGradInv',
    colours = {
        HEX('A30262'),
        HEX('D162A4'),
        HEX('FFFFFF'),
        HEX('EF7627'),
        HEX('D52D00'),
    },
    interpolation = 'linear'
}
SMODS.Gradient{
    key = 'lesGradCrazy',
    colours = {
        HEX('D52D00'),
        HEX('EF7627'),
        HEX('FFFFFF'),
        HEX('D162A4'),
        HEX('A30262'),
    },
    interpolation = 'trig',
    cycle = 3
}
SMODS.Gradient{
    key = 'normalGrad',
    colours = {
        HEX('FF0000'),
        HEX('FFA500'),
        HEX('CCCC00'),
        HEX('0000FF'),
        HEX('008000'),
        HEX('4b0082'),
    },
    interpolation = 'trig',
}
SMODS.Gradient{
    key = 'normalGradOff',
    colours = {
        HEX('0000FF'),
        HEX('008000'),
        HEX('4b0082'),
        HEX('FF0000'),
        HEX('FFA500'),
        HEX('CCCC00'),
    },
    interpolation = 'trig',
}
SMODS.Gradient{
    key = 'crazyGrad',
    colours = {
        HEX('FF0000'),
        HEX('FFA500'),
        HEX('CCCC00'),
        HEX('0000FF'),
        HEX('008000'),
        HEX('4b0082'),
    },
    interpolation = 'trig',
    cycle = 3
}
G.C.crazyGrad = SMODS.Gradients['ambray_crazyGrad']
G.C.lesGradOffset = SMODS.Gradients['ambray_lesGradOffset']
G.C.lesGradCrazy = SMODS.Gradients['ambray_lesGradCrazy']
G.C.lesGradInv = SMODS.Gradients['ambray_lesGradInv']
G.C.lesGrad = SMODS.Gradients['ambray_lesGrad']
G.C.waowgradient = SMODS.Gradients['ambray_waowgradient']
G.C.transGradInv = SMODS.Gradients['ambray_transGradInv']
G.C.transGrad = SMODS.Gradients['ambray_transGrad']
G.C.nbGrad = SMODS.Gradients['ambray_nbGrad']

--you have to put this after the gadients or it wont load properly on the badge
SMODS.Rarity{
    key = 'waow',
    badge_colour = SMODS.Gradients['ambray_waowgradient'],
    default_weight = 0,
    disable_if_empty = true,
    pools = {['Joker'] = true}
}


SMODS.Atlas{
    key = 'jokers',
    path = 'jokers.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'seals',
    path = 'seals.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'consumables',
    path = 'consumables.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'enhancements',
    path = 'enhancements.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'boosters',
    path = 'boosters.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'decks',
    path = 'decks.png',
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'caw',
    path = 'caw.png',
    px = 71,
    py = 95,
    frames = 12,
    sprite_args = {
        frame_duration = 0.08,
    },
    atlas_table = "ANIMATION_ATLAS"
}
SMODS.Atlas{
    key = 'ralsei',
    path = 'ralseiSpin.png',
    px = 33,
    py = 41,
    frames = 7,
    sprite_args = {
        frame_duration = 0.2,
    },
    atlas_table = "ANIMATION_ATLAS"
}
SMODS.Sound{
    key = 'ambray_music_1',
    path = 'mainMusic.mp3',
    pitch = 1,
    select_music_track = function(self)
        if Ambray.config.musicType == 1 and not Ambray.config.musicR then
            return 2
        end
        return nil
    end
}
SMODS.Sound{
    key = 'ambray_music_4',
    path = 'shopMusic.mp3',
    pitch = 1,
    select_music_track = function(self)
        if Ambray.config.musicType == 1 and not Ambray.config.musicR and G.STATE == G.STATES.SHOP then
            return 5
        end
        return nil
    end
}
SMODS.Sound{
    key = 'ambray_music_5',
    path = 'bossMusic.mp3',
    pitch = 1,
    select_music_track = function(self)
        if Ambray.config.musicType == 1 and not Ambray.config.musicR and G.GAME and G.GAME.blind and G.GAME.blind.in_blind and
        (G.GAME.blind.boss or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) then
            return 5
        end
        return nil
    end
}
SMODS.Sound{
    key = 'ambray_music2_1',
    path = 'takanakaMusic1.mp3',
    pitch = 1,
    select_music_track = function(self)
        if Ambray.config.musicType == 2 and not Ambray.config.musicR then
            return 2
        end
        return nil
    end
}
SMODS.Sound{
    key = 'ambray_music2_2',
    path = 'takanakaMusic2.mp3',
    pitch = 1,
    select_music_track = function(self)
        if Ambray.config.musicType == 2 and not Ambray.config.musicR and G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            return 5
        end
        return nil
    end
}
SMODS.Sound{
    key = 'ambray_music2_3',
    path = 'takanakaMusic3.mp3',
    pitch = 1,
    select_music_track = function(self)
        if Ambray.config.musicType == 2 and not Ambray.config.musicR and G.STATE == G.STATES.SMODS_BOOSTER_OPENED and
        SMODS.OPENED_BOOSTER.config.center.kind == 'Celestial' then
            return 6
        end
        return nil
    end
}
SMODS.Sound{
    key = 'ambray_music2_4',
    path = 'takanakaMusic4.mp3',
    pitch = 1,
    select_music_track = function(self)
        if Ambray.config.musicType == 2 and not Ambray.config.musicR and G.STATE == G.STATES.SHOP then
            return 5
        end
        return nil
    end
}
SMODS.Sound{
    key = 'ambray_music2_5',
    path = 'takanakaMusic5.mp3',
    pitch = 1,
    select_music_track = function(self)
        if Ambray.config.musicType == 2 and not Ambray.config.musicR and G.GAME and G.GAME.blind and G.GAME.blind.in_blind and G.GAME.blind.boss then
            return 5
        end
        return nil
    end
}
SMODS.Sound{
    key = 'ambray_noGas',
    path = 'noGas.wav'
}
SMODS.Sound{
    key = 'ambray_boom',
    path = 'boom.wav'
}
SMODS.Sound{
    key = 'ambray_yippie',
    path = 'yippie.wav'
}
SMODS.Sound{
    key = 'ambray_myKing',
    path = 'myKing.wav'
}
SMODS.Sound{
    key = 'ambray_eggDelta',
    path = 'eggDelta.wav'
}
SMODS.Sound{
    key = 'ambray_glue',
    path = 'glue.wav'
}
SMODS.Sound{
    key = 'ambray_imFalling',
    path = 'imFalling.wav'
}
SMODS.Sound{
    key = 'ambray_splat',
    path = 'splat.wav'
}
SMODS.Sound{
    key = 'ambray_sustingus',
    path = 'sustingus.wav'
}
SMODS.Sound{
    key = 'ambray_tenna',
    path = 'tenna.wav'
}
SMODS.Sound{
    key = 'ambray_garbageNoise',
    path = 'garbageNoise.wav'
}
SMODS.Sound{
    key = 'ambray_jaOrange',
    path = 'jaOrange.wav'
}
SMODS.Sound{
    key = 'ambray_itsMyJarona',
    path = 'itsMyJarona.wav'
}
SMODS.Sound{
    key = 'ambray_sax',
    path = 'sax.wav'
}
SMODS.Sound{
    key = 'ambray_eatingMyFlesh',
    path = 'eatingMyFlesh.wav'
}
SMODS.Sound{
    key = 'ambray_lady',
    path = 'lady.wav'
}
SMODS.Sound{
    key = 'ambray_spongebob',
    path = 'spongebob.mp3'
}

SMODS.Font{
    key='wee',
    path='waa.ttf'
}

Ambray.letters = {
"!","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"," ",
" ","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
"0","1","2","3","4","5","6","7","8","9","+","-","?","$","%","[","]","(",")","+","-","?","$","%","[","]","(",")","!",
}