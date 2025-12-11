\version "2.14.2"
\include "header.ly"

\header {
  title = "Halsway Carol"
  poet = "Iain Frisk"
  composer = "Nigel Eaton"
  arranger = "Ben Kuhn"
}

global = {
  \preamble
  \key d \major
  \time 4/4
}

sopMusic = \relative a' {
  a4 g8 fis e d e fis |
  b4 a e fis8 g |
  b4. a8 g fis e d |
  g4 fis e2 |

  a4 g8 fis e d e fis |
  g4 fis e2 |
  d4 e8 fis g fis e d |
  fis4 e d4. d'8 |

  cis8 d a4. d8 cis d |
  g,4 g8( a) fis2 |
  e4 fis8 g a( g) fis e |
  g4 fis e4. d'8 |
  cis8 d a4 a8 b cis d |
  g,4 g8 a fis4. fis8 |
  e4 fis8 g a g fis e |
  fis4 e d2 \bar "|."
}
sopWords = \lyricmode {
}

altoMusic = \relative fis' {
  fis4 d8 d b a b d |
  g4 fis cis d8 d |
  g4. fis8 d d b a |
  d4 d d( cis) |
  d4 d8 d cis b d d |
  d4 d cis2 |
  b4 d8 d d d d b |
  d4 cis a4. fis'8 |
  e8 fis d4. fis8 e fis |
  d4 cis e( d) |
  cis4 d8 e fis e d d |
  d4 d d( cis8) fis |
  e8 fis cis4 d8 d e d |
  d4 e8 e d4. d8 |
  cis4 d8 d cis cis b b |
  d4 cis a2 \bar "|."
}
altoWords = \lyricmode {
  \set stanza = #"1."
  Lo for the ti -- ding of the long night moon,
  Let the sun -- rise call a -- bout the morn -- ing soon,
  Short is the bid -- ing of the fad -- ing light,
  Sing for the com -- ing of the long -- est night.
  A win -- ter day, the sum -- mer grass turned hay,
  Frost in the field 'til the dawn of May,
  A sum -- mer's light nev -- er shone as clear or as bright,
  So dance in the sha -- dows of a win -- ter's night.
}
altoWordsII = \lyricmode {
  \set stanza = #"2."
  North wind _ tell us what we need to know
  When the stars are shin -- ing on the mid -- night snow,
  All of the branch -- es will be turned to white,
  Sing for the com -- ing of the long -- est night.
}
altoWordsIII = \lyricmode {
  \set stanza = #"3."
  Lo for the tid -- ing of the long night moon,
  May the har -- vest last un -- til the spring -- time bloom,
  Home is our com -- fort at the win -- ter's height,
  Sing for the com -- ing of the long -- est night.
}
altoWordsIV = \lyricmode {
  \set stanza = #"4."
  All of the col -- ours of the sun -- rise sky
  Shine a light up -- on us, as the day goes by,
  Sun -- set -- ting sha -- dows fad -- ing out of sight,
  Sing for the com -- ing of the long -- est night.
}
altoWordsV = \lyricmode {
}
altoWordsVI = \lyricmode {
}

tenorMusic = \relative d' {
  d4 b8 a g fis g a |
  d4 d a a8 b |
  d4. d8 b a g fis |
  e4 a a2 |
  fis4 b8 a a fis b b |
  b4 a a( g) |
  fis4 g8 a b a g e |
  a4 a8 g fis4. a8 |
  a8 a fis4. a8 a a |
  b4 e, a2 |
  a4 a8 g fis g a b |
  b4 a a4. a8 |
  a8 a fis4 fis8 fis a a |
  b4 cis8 cis cis4( b8) b |
  a4 a8 b fis fis d d |
  a'4 a8 g fis2 \bar "|."
}
tenorWords = \lyricmode {
}

bassMusic = \relative d {
  d4 d8 d d d d d |
  d4 d a d8 d |
  g,4. d'8 d d d d |
  g,4 d' a2 |
  b4 b8 b fis fis b b |
  g4 d' a2 |
  b4 b8 b g a b g |
  a4 a d4. d8 |
  e8 d d4. d8 e d |
  g,4 a d2 |
  a4 d8 d d d d d |
  g,4 d' a4. d8 |
  e8 d fis8 e d b a fis |
  g4 a8 a b4. b8 |
  a4 a8 g fis fis b g |
  a4 a d2 \bar "|."
}
bassWords = \lyricmode {
}

\score {
  <<
   \new ChoirStaff <<
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"women" } \lyricsto "sopranos" \sopWords
    \new Lyrics = "altosVI"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsVI
    \new Lyrics = "altosV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsV
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"men" } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \bassWords
  >>
  >>
}
