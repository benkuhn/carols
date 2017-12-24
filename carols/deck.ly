\version "2.14.2"
\include "header.ly"
\header {
  title = "Deck the Hall"
  poet = "Traditional"
  composer = "16th Century Welsh Tune"
}
global = {
  \preamble
  \key f \major
  \time 4/4
  \autoBeamOff
}

sopMusic = \relative c'' {
  c4. bes8 a4 g |
  f g a f |
  g8 a bes g a4. g8 |
  f4 e f2 |
  
  c'4. bes8 a4 g |
  f g a f |
  g8 a bes g a4. g8 |
  f4 e f2 |
  
  g4. a8 bes4 g |
  a4. bes8 c4 g |
  a8 b c4 d8 e f4 |
  e d c2 |
  
  c4. bes8 a4 g |
  f g a f |
  d'8 d d d c4. bes8 |
  a4 g f2 \bar "|."
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c' {
  a'4. g8 f4 e |
  d e f c |
  e8 f g e f4. d8 |
  c4 c c2 |

  a'4. g8 f4 e |
  d e f c |
  e8 f g e f4. d8 |
  c4 c c2 |

  e4. f8 g4 e |
  f4. f8 f4 g |
  f4 e a a|
  g f e2 |

  a4. g8 f4 e |
  d e f c |
  f8 f f f f4. g8 |
  f4 e c2 \bar "|."
}
altoWords = \lyricmode {
  \set stanza = #"1. "
  Deck the hall with boughs of hol -- ly, Fa la la la la, la la la la.
  ’Tis the sea -- son to be jol -- ly, Fa la la la la, la la la la.
  Don we now our gay ap -- par -- el; Fa la la, la la la, la la la.
  Troll the an -- cient Yule -- tide car -- ol, Fa la la la la, la la la la.
}
altoWordsII = \lyricmode {
  \set stanza = #"2. "
  See the blaz -- ing Yule be -- fore us, Fa la la la la, la la la la.
  Strike the harp and join the cho -- rus, Fa la la la la, la la la la.
  Fol -- low me in mer -- ry meas -- ure, Fa la la, la la la, la la la.
  While I tell of Yule -- tide treas -- ure, Fa la la la la, la la la la.
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  Fast a -- way the old year pass -- es, Fa la la la la, la la la la.
  Hail the new, ye lads and lass -- es, Fa la la la la, la la la la.
  Sing we joy -- ous all to -- geth -- er, Fa la la, la la la, la la la.
  Heed -- less of the wind and weath -- er, Fa la la la la, la la la la.

}
altoWordsIV = \lyricmode {
}

tenorMusic = \relative c' {
  c4. c8 c4 bes |
  a c c a |
  c8 c c c c4. bes8 |
  a4 g a2 |

  c4. c8 c4 bes |
  a c c a |
  c8 c c c c4. bes8 |
  a4 g a2 |

  c4. c8 c4 c |
  c4. g8 a4 c |
  c4 c c c |
  c b c2 |

  c4. c8 c4 bes |
  a c c a |
  bes8 bes bes bes c4. d8 |
  c4 bes a2 \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  f4. e8 f4 c |
  d c f f |
  c8 c c c f4. bes,8 |
  c4 c f2 |

  f4. e8 f4 c |
  d c f f |
  c8 c c c f4. bes,8 |
  c4 c f2 |

  c4. c8 c4 c |
  f4. f8 f4 e |
  f4 a f d |
  g g c,2 |

  f4. e8 f4 c |
  d c f f |
  bes8 bes bes bes a4. bes8 |
  c4 c, f2 \bar "|."
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
      \new Lyrics \with { alignAboveContext = #"men" } \lyricsto "tenors" \tenorWords
      \new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \bassWords
    >>
  >>
}
