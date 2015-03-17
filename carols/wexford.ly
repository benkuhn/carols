\version "2.14.2"
\include "header.ly"
\header {
  title = "The Wexford Carol"
  poet = "Traditional, 16th Century or earlier"
  composer = "Traditional"
                                %arranger = \markup\oldStyleNum"Edited by Benjamin Bloomfield (1984–)"
}
global = {
  \preamble
  \key g \major
  \time 3/4
  \autoBeamOff
  \slurSolid
  #(set-global-staff-size 12)
}

sopMusic = \relative c' {
  \partial 8 d8 |
  g8 g16[ fis] g4. a8 |
  b c d4 b8\rest d |
  c b g( d4) e8 |
  
  f g f4 \bar"" b8\rest d, |
  g g16[ fis] g4. a8 |
  b c d4 b8\rest b |
  
  c d b( g4) a8 |
  g g g4 \bar"" b8\rest g |
  g8 f' d( c4) a8 |
  
  bes c bes4. d16[ c] |
  \times 2/3 {bes8[ a] g} g( d4) e8 |
  f g f4 \bar"" b8\rest d, |
  
  g8 g16[ fis] g4. a8 |
  b c d4 b8\rest b |
  c d \slurDotted b8( g4) a8 |
  g g g4. \bar "|."
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c' {
  d8 |
  g d d8.[ c16 b8] d |
  g g fis4 s8 d |
  e fis g( d4) e8 |
  
  c c d4 s8 d |
  g d d8.[ c16 b8] d |
  g g fis4 s8 e |
  
  e8 d d( f4) e8 |
  d c d4 s8 |
  g |
  g a g( e4) f8 |
  
  g8 c, d4. d8 |
  d d g( d4) e8 |
  d e d4 s8 d |
  
  g d d8.[ c16 b8] d |
  g g fis4 s8 e |
  e8 d \slurDotted d( f4) e8 |
  e d b4.
}
altoWords = \lyricmode {
  \set stanza = #"1. "
  \set associatedVoice = "tenors"
  Good peo -- ple all, this Christ -- mas time,
  Con -- sid -- er well, and bear in mind,
  \set associatedVoice = "basses"
  What our good God for us has done,
  In send -- ing His be -- lov -- ed Son.
  
  With Ma -- ry ho -- ly, we should pray
  To God with love this Christ -- mas day;
  In Beth -- le -- hem up -- on that morn,
  There was a
  \set ignoreMelismata = ##t
  bless -- ed Mes -- si -- ah born.
  \unset ignoreMelismata
}
altoWordsII = \lyricmode {
                                %\markup\italic
  \set stanza = #"2. "
  \set associatedVoice = "tenors"
  The night be -- fore that hap -- py tide,
  The no -- ble Vir -- gin and her guide
  \set associatedVoice = "basses"
  Were long time seek -- ing up and down
  To find a lodg -- ing in the town.
  But mark how all things came to pass:
  From ev -- ’ry door re -- pelled A -- las!
  As long fore -- told their ref -- uge all
  Was but a hum -- ble ox -- ’s stall.
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  \set associatedVoice = "tenors"
  
}
verses = \markup { \fill-line{
  \hspace #0.1
  \column {
  \line { \bold "3." Let all your songs and praises be, }
  \line { Unto His Heav’nly Majesty; }
  \line { And evermore, amongst our mirth, }
  \line { Remember Christ our Savior’s birth. }
  \line { That night the Virgin Mary mild, }
  \line { Was safe deliver’d of a child; }
  \line { According unto Heav’n’s decree, }
  \line { Man’s sweet salvation for to be. }
  \vspace #0.1
  \line { \bold "5." With thankful heart and joyful mind, }
  \line { The shepherds went the  babe to find, }
  \line { And as God’s angels had foretold, }
  \line { They did our Savior Christ behold. }
  \line { Within a manger He was laid, }
  \line { And by His side the virgin maid }
  \line { Attending on the Lord of Life }
  \line { Who came to earth to end all strife. }
  }
  \hspace #0.1
  \column{
  \line { \bold "4." Near Bethlehem did shepherds keep }
  \line { Their flocks of lambs and feeding sheep; }
  \line { To whom God’s angels did appear, }
  \line { Which put the shepherds in great fear. }
  \line { “Prepare and go,” the angels said, }
  \line { “To Bethlehem. Be not afraid }
  \line { For there you’ll find this happy morn }
  \line { A princely babe sweet Jesus born.” }
  \vspace #0.1
  \line { \bold "6." See how the Lord of Heav’n and earth, }
  \line { Show’d Himself lowly in His birth; }
  \line { A sweet example for mankind, }
  \line { To learn to bear a humble mind. }
  \line { If quires of Angels did rejoice, }
  \line { Well may mankind with heart and voice }
  \line { Sing praises to the God of Heav’n, }
  \line { That unto us His Son has giv’n. }
  }
  \hspace #0.1
}}
altoWordsIV = \lyricmode {
}
altoWordsV = \lyricmode {
  
}
altoWordsVI = \lyricmode {
  \set stanza = #"6. "
  \set ignoreMelismata = ##t
}
tenorMusic = \relative c {
  d8 |
  g a b8.[ c16 d8] d |
  b g a4 s8 b |
  a fis b[ a] c[ b] |
  
  a g a4 s8 d, |
  g a b8.[ c16 d8] d |
  b g a4 s8 g |
  
  g g g4 c |
  b8 c b4 s8 |
  g |
  g c b( a4) c8 |
  
  d8 a f4. g8 |
  \times 2/3 {g[ a] bes} bes[ a] bes[ c] |
  a c a4 r8 d, |
  
  g a b8.[ c16 d8] d |
  b g a4 s8 g |
  g g \slurDotted g8( g4) c8 |
  b c d4.
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  d8 |
  g d b8.[ a16 g8] fis' |
  e e d4 d8\rest b |
  c d e[ fis] g4 |
  
  f8 e d4 d8\rest d |
  g d b8.[ a16 g8] fis' |
  e e d4 d8\rest e |
  
  c b b[ d] c4 |
  g'8 e g4 d8\rest g |
  g f g( a4) f8 |
  
  g f bes,4. g8 |
  g' g g[ f] g[ a] |
  d, c d4 g, |
  
  g'8 d b8.[ a16 g8] fis' |
  e e d4 d8\rest e |
  c b \slurDotted b( d4) c8 |
  e g g4.
}
bassWords = \lyricmode {

}

pianoRH = \relative c' {
  
}
pianoLH = \relative c' {
  
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff = women <<
        \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
        \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
      >>
      \new Lyrics \with { alignAboveContext = #"women" } \lyricsto "sopranos" \sopWords
      \new Staff = men <<
        \clef bass
        \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
        \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
      >>
      \new Lyrics = "altosVI"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsVI
      \new Lyrics = "altosV"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsV
      \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsIV
      \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsIII
      \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsII
      \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWords
      \new Lyrics \with { alignAboveContext = #"men" } \lyricsto "tenors" \tenorWords
      \new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \bassWords
    >>
  >>
}
\verses