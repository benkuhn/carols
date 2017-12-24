\version "2.14.2"

\header {
  title = "The Coventry Carol"
  poet = "Robert Croo, 1534"
  composer = "16th Centry English Carol"
  arranger = "arr. Martin Fallas Shaw (1875-1958)"
}

\include "header.ly"

global = {
  \preamble
  \key bes \major
  \time 4/4
}

% Rhythm from https://www.hymnsandcarolsofchristmas.com/Hymns_and_Carols/Images/_Sharp-Coventry-1825/Lully-lulla-Music-01.jpg
sopMusic = \relative c'' {
  % chorus
  g2 g4 fis |
  \time 3/4
  g2 bes4 |
  a4. a8 g g |
  fis2. |
  g4 a bes |
  \time 2/4 c a |
  \time 3/4 g2 d'4 |
  c4. c8 bes bes |
  a2. |
  g4 fis g |
  \time 2/4 c a |
  \time 3/4 b2. \bar "||"

  \time 4/4 g2 g4 fis |
  \time 3/4
  g2 bes4 |
  a2 g4 |
  fis2. |
  g4 a bes |
  \time 2/4 c a |
  \time 3/4 g2 d'4 |
  c2 bes4 |
  a2 bes4 |
  a2 g4 |
  fis2. |
  g4 fis g |
  \time 2/4 c a |
  \time 3/4 b2. \bar "|."
}
sopWords = \lyricmode {

}

altoMusic = \relative c' {
  d2 d4 d |
  d2 g4 |
  f4. f8 d d |
  d2. |
  d4 f f |
  g fis |
  g2 f4 |
  a4. a8 g g |
  f2. |
  d4 d d |
  g fis |
  g2. |

  d2 d4 d |
  d2 g4 |
  f2 d4 |
  d2. |
  d4 f f |
  g fis |
  g2 f4 |

  a2 g4 |
  f2 d4 |
  f2 c4 |
  d2. |
  d4 d d |
  g fis |
  g2. \bar "|."
}
altoWords = \lyricmode {
  Lul -- ly, lul -- lay, Thou lit -- tle ti -- ny Child,
  By, by, lul -- ly, lul -- lay, Thou lit -- tle ti -- ny Child,
  By, by, lul -- ly, lul -- lay.

  \set stanza = #"1. "
  O sis -- ters too, how may we do,
  For to pre -- serve this day;
  This poor Young -- ling for whom we sing
  By, by, lul -- ly, lul -- lay?
}
altoWordsII = \lyricmode {
  \repeat unfold 28 { \skip 1 }
  \set stanza = #"2. "
  Her -- od, the king, in his rag -- ing,
  Charg -- ed he hath this day;
  His men of might, in his own sight,
  All chil -- dren young to slay.
}
altoWordsIII = \lyricmode {
  \repeat unfold 28 { \skip 1 }
  \set stanza = #"3. "
  Then woe is me, poor Child, for Thee!
  And ev -- er mourn and say;
  For Thy part -- ing nor say nor sing,
  By, by, lul -- ly, lul -- lay.
}
altoWordsIV = \lyricmode {
  \repeat unfold 2 { \skip 1 }
  \set stanza = #"4. "

}

tenorMusic = \relative c' {
  bes2 bes4 a |
  bes2 ees4 |
  c4. c8 bes bes |
  a2. |
  bes4 c d |
  ees d |
  d2 d4 |
  f4. f8 d d |
  d2. |
  bes4 c d |
  ees d |
  d2. |

  bes2 bes4 a |
  bes2 ees4 |
  c2 bes4 |
  a2. |
  bes4 c d |
  ees d |
  d2 d4 |

  f2 d4 |
  d2 bes4 |
  c2 g4 |
  a2. |
  bes4 a bes |
  ees d |
  d2. \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c' {
  g2 g4 d |
  g2 ees4 |
  f4. f8 g g |
  d2. |
  g4 f d |
  c d |
  g2 bes4 |
  f2 g4 |
  d2. |
  g4 f d |
  c d |
  g,2. |

  g'2 g4 d |
  g2 ees4 |
  f2 g4 |
  d2. |
  g4 f d |
  c d |
  g2 bes4 |

  f2 g4 |
  d2 g4 |
  f2 e4 |
  d2. |
  g4 d g |
  c, d |
  g2. \bar "|."
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
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    %\new Lyrics \with { alignAboveContext = #"men" } \lyricsto "tenors" \tenorWords
    %\new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \bassWords
  >>
  >>
}
