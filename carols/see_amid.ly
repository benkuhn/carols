\version "2.24.0"

\include "header.ly"

% Source: https://www.cpdl.org/wiki/index.php/See_amid_the_winter%27s_snow_(John_Goss)

\header {
  title = "See Amid the Winter’s Snow"
  poet = "Edward Caswall (1814–1878)"
  composer = "John Goss (1800–1880)"
  meter = "Humility 7.7.7.7. with Refrain"
}

\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative g' {
    \clef "treble" \key g \major \numericTimeSignature\time 4/4 | % 1
    g4. a8 g4 fis4 | % 2
    e4. d8 d2 | % 3
    g4 a4 c4 b4 | % 4
    b4. a8 a2 \break | % 5
    g4. a8 g4 fis4 | % 6
    e4. d8 d2 | % 7
    g4 a4 b4 c4 | % 8
    a4. g8 g2 \bar "||" \break
    | % 9
    d'4. d8 c4 b4 | \barNumberCheck #10
    a4 g4 fis2 | % 11
    d'4. d8 c4 b4 | % 12
    a4 g4 fis2 \break | % 13
    g4. a8 g4 fis4 | % 14
    e4. d8 d2 | % 15
    d'4. b8 g4 c4 | % 16
    b4 a4 g2 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { "See," a -- mid the win --
    "ter’s" "snow," Born for us on earth be -- "low," "See," the ten --
    der Lamb ap -- "pears," Pro -- mised from e -- ter -- nal "years."
    "Hail," thou e -- ver -- bless -- "èd" "morn!" "Hail," re -- demp --
    "tion’s" hap -- py "dawn!" Sing through all Je -- ru -- sa -- "lem:"
    "“Christ" is born in Beth -- le -- "hem!”" }
PartPOneVoiceOneLyricsThree =  \lyricmode { "“Say," ye low -- ly shep --
    "herds," "say," What your joy -- ful news to -- "day;" Where -- fore
    have ye left your sheep On the lone -- ly moun -- tain "steep?”"
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4
    \skip4 }
PartPOneVoiceOneLyricsFive =  \lyricmode { Sa -- cred In -- "fant," all
    di -- "vine," What a ten -- der love was "Thine," Thus to come from
    high -- est bliss Down to such a world as "this!" \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 }
PartPOneVoiceTwo =  \relative b {
    \clef "treble" \key g \major \numericTimeSignature\time 4/4 | % 1
    b4 c4 d4 d4 | % 2
    c4 c4 b2 | % 3
    b4 c4 g'4 g4 | % 4
    e4 e4 d2 | % 5
    d4 b4 c4 d4 | % 6
    g,4 a4 b4 ( a4 ) | % 7
    b4 c4 d4 e4 | % 8
    c4 c4 b2 \bar "||"
    | % 9
    g'4. g8 g4 g4 | \barNumberCheck #10
    d4 d4 d2 | % 11
    d4. g8 g4 g4 | % 12
    e4 d4 d2 | % 13
    b4. b8 cis4 d4 | % 14
    d4 cis4 d2 | % 15
    d4. d8 e4 g4 | % 16
    fis4 fis4 g2 \bar "|."
    }

PartPOneVoiceTwoLyricsTwo =  \lyricmode { "Lo!" with -- in a man -- ger
    lies He who built the star -- ry "skies;" He "who," throned in light
    sub -- "lime," Sits a -- mid the Cher -- u -- "bim!" \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 }
PartPOneVoiceTwoLyricsFour =  \lyricmode { "“As" we watched at dead of
    "night," "Lo," we saw a won -- drous "light;" An -- gels sing -- ing
    peace on earth Told us of a Sa -- "viour’s" "birth.”" \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 }
PartPOneVoiceTwoLyricsSix =  \lyricmode { "Teach," O teach "us," Ho --
    ly "Child," By Thy face so meek and "mild," Teach us to re -- sem --
    ble Thee In Thy sweet hu -- mi -- li -- "ty." \skip4 \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4
    \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 \skip4 }
PartPTwoVoiceOne =  \relative g {
    \clef "bass" \key g \major \numericTimeSignature\time 4/4 | % 1
    g4 g4 g4 d4 | % 2
    e4 fis4 g4 ( a4 ) | % 3
    b4 c4 e4 d4 | % 4
    d4 cis4 d2 | % 5
    g,4 g4 g4 d4 | % 6
    e4 fis4 g4 ( a4 ) | % 7
    g4 g4 g4 g4 | % 8
    g4 fis4 g2 \bar "||"
    | % 9
    b4. b8 e4 d4 | \barNumberCheck #10
    c4 b4 a2 | % 11
    g4. g8 e'4 d4 | % 12
    c4 b4 a2 | % 13
    g4. g8 e4 d4 | % 13
    b'4 a8 ( [ g8 ) ] fis2
    | % 15
    g4. g8 g4 e'4 | % 16
    d4 c4 b2 \bar "|."
    }

PartPTwoVoiceTwo =  \relative g, {
    \clef "bass" \key g \major \numericTimeSignature\time 4/4 | % 1
    g4 g4 a4 b4 | % 2
    c4 c4 g2 | % 3
    g'4 fis4 e4 g4 | % 4
    d4 d4 d4 ( c4 ) | % 5
    b4 g4 a4 b4 | % 6
    c4 c4 g'4 ( fis4 ) | % 7
    e4 e4 d4 c4 | % 8
    d4 d4 g,2 \bar "||"
    | % 9
    g'4. g8 g4 g4 | \barNumberCheck #10
    fis4 g4 d2 | % 11
    b4. b8 c4 g4 | % 12
    a4 b8 [ c8 ] d2 | % 13
    e4. e8 a,4 b4 | % 14
    g4 a4 d4 ( c ?4 ) | % 15
    b4. b8 c4 a4 | % 16
    d4 d4 g,2 \bar "|."
    }

\score {
    <<
        \new ChoirStaff <<
            \new Staff <<
                \set Staff.instrumentName = " "
                \set Staff.shortInstrumentName = " "
                \context Staff <<
                    \context Voice = "PartPOneVoiceOne" { \voiceOne \PartPOneVoiceOne }
                    \context Voice = "PartPOneVoiceTwo" { \voiceTwo \PartPOneVoiceTwo }
                    \new Lyrics \lyricsto "PartPOneVoiceOne" { \set stanza = #"1. " \PartPOneVoiceOneLyricsOne }
                    \new Lyrics \lyricsto "PartPOneVoiceTwo" { \set stanza = #"2. " \PartPOneVoiceTwoLyricsTwo }
                    \new Lyrics \lyricsto "PartPOneVoiceOne" { \set stanza = #"3. " \PartPOneVoiceOneLyricsThree }
                    \new Lyrics \lyricsto "PartPOneVoiceTwo" { \set stanza = #"4. " \PartPOneVoiceTwoLyricsFour }
                    \new Lyrics \lyricsto "PartPOneVoiceOne" { \set stanza = #"5. " \PartPOneVoiceOneLyricsFive }
                    \new Lyrics \lyricsto "PartPOneVoiceTwo" { \set stanza = #"6. " \PartPOneVoiceTwoLyricsSix }
                    >>
                >>
            \new Staff <<
                \context Staff <<
                    \context Voice = "PartPTwoVoiceOne" { \voiceOne \PartPTwoVoiceOne }
                    \context Voice = "PartPTwoVoiceTwo" { \voiceTwo \PartPTwoVoiceTwo }
                    >>
                >>
            >>
        >>
    }
