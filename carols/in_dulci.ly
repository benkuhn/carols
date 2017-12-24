\version "2.14.2"

\include "header.ly"

\header {
  title = "In ducli jubilo"
  poet = "Heinrich Seuse (1300–1366)"
  composer = "14th Century German Melody"
}

global = {
  \preamble
  \key f \major
  \time 6/4
}

sopMusic = \relative c' {
  \partial 4 f4 |
  f2 f4 a2 bes4 |
  c2( d4 c2) c4 |
  f,2 f4 a2 bes4 |
  c2( d4 c2.) |

  c2 d4 c2 bes4 |
  a2. f2 f4 |
  g2 g4 a2 g4 |
  f2( g4 a2) a4 |

  c2 d4 c2 bes4 |
  a2. f2 f4 |
  g2 g4 a2 g4 |
  f2( g4 a2.) |

  d,2 d4 e2 e4 |
  f2.( c'2.) |
  a2 a4 g2 g4 |
  \partial 4*5 f2. b2\rest \bar "|."
}
sopWords = \lyricmode {

}

altoMusic = \relative c' {
  c4 |
  d2 c4 f4. e8 d4 |
  c2( f4 e2) f4 |
  d2 c4 f4. e8 d4 |
  c2( f4 e2) s4 |

  f2 f4 e2 g4 |
  c,2. d2 f4 |
  f2 f4 e2 e4 |
  f2.~ f2 f4 |

  f2 f4 e2 g4 |
  c,2. f2 f4 |
  f2 f4 f2 e4 |
  f1. |

  d2 d4 d2 cis4 |
  d2.( e) |
  f2 f4 f2 e4
  f2. s2 \bar "|."
}
altoWords = \lyricmode {
  \set stanza = #"1. "
  \markup\italic In \markup\italic dul -- \markup\italic ci \markup\italic ju -- \markup\italic bi -- \markup\italic lo __ Now sing with hearts a -- glow!
__
  Our de -- light and plea -- sure Lies \markup\italic in \markup\italic præ -- \markup\italic se -- \markup\italic pi -- \markup\italic o, __
  Like sun -- shine is our trea -- sure
  \markup\italic Ma -- \markup\italic tris \markup\italic in \markup\italic gre -- \markup\italic mi -- \markup\italic o. __
  \markup\italic Al -- \markup\italic pha \markup\italic es \markup\italic et \markup\italic O! __
  \markup\italic Al -- \markup\italic pha \markup\italic es \markup\italic et \markup\italic O!
}
altoWordsII = \lyricmode {
  \set stanza = #"2. "
  \markup\italic O \markup\italic Je -- \markup\italic su, \markup\italic par -- \markup\italic vu -- \markup\italic le, __
  For thee I long al -- way; __
  Com -- fort my heart’s blind -- ness
  \markup\italic O \markup\italic Pu -- \markup\italic er \markup\italic op -- \markup\italic ti -- \markup\italic me, __
  With all Thy lov -- ing kind -- ness,
  \markup\italic O \markup\italic Prin -- \markup\italic ceps \markup\italic glo -- \markup\italic ri -- \markup\italic æ. __
  \markup\italic Tra -- \markup\italic he \markup\italic me \markup\italic post \markup\italic Te! __
  \markup\italic Tra -- \markup\italic he \markup\italic me \markup\italic post \markup\italic Te!
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  \markup\italic O \markup\italic Pa -- \markup\italic tris \markup\italic ca -- \markup\italic ri -- \markup\italic tas! __
  \markup\italic O \markup\italic na -- \markup\italic ti \markup\italic lem -- \markup\italic i -- \markup\italic tas! __
  Deep -- ly were we stain -- ed
  \markup\italic Per \markup\italic nos -- \markup\italic tra \markup\italic cri -- \markup\italic mi -- \markup\italic na; __
  But Thou for us hast gain -- ed
  \markup\italic Cœ -- \markup\italic lo -- \markup\italic rum \markup\italic gau -- \markup\italic di -- \markup\italic a. __
  O that we were there! O that we were there!
}
altoWordsIV = \lyricmode {
  \set stanza = #"4. "
  \markup\italic U -- \markup\italic bi \markup\italic sunt \markup\italic gau -- \markup\italic di -- \markup\italic a __
  In an -- y place  but there?
  There are an -- gels sing -- ing ""
  \markup\italic No -- \markup\italic va \markup\italic can -- \markup\italic ti -- \markup\italic ca __
  And there the bells are ring -- ing
  \markup\italic In \markup\italic Re -- \markup\italic gis \markup\italic cu -- \markup\italic ri -- \markup\italic a __
  O that we were there! O that we were there!
}

tenorMusic = \relative c' {
  a4 |
  bes2 a4 c2 bes4 |
  a2( bes4 g2) a4 |
  bes2 a4 c2 bes4 |
  a2( bes4 g2) s4 |

  c2 bes4 g2 e4 |
  f2. a2 a4 |
  d2 d4 c2 bes4 |
  a2( bes4 c2) c4 |

  c2 bes4 g2 e4 |
  f2. a2 a4 |
  d2 d4 c4.( d8) bes4 |
  a2( bes4)~ c2. |

  a2 a4 g2 g4 |
  a2( bes4 g2.) |
  f2 bes4 d2 c4 |
  a2. s2 \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  f4 |
  f2 f4 f2 f4 |
  f2.~ f2 f4 |
  f2 f4 f2 f4 |
  f2.( c2.) |

  a2 bes4 c2 c4 |
  f2. d2 d4 |
  bes2 bes4 c2 c4 |
  f2.~ f2 f4 |

  a,2 bes4 c2 c4 |
  f2. d2 d4 |
  bes2 bes4 c2 c4 |
  f1. |

  f2 f4 e2 e4 |
  d2.( c2.) |
  f2 d4 bes2 c4 |
  <<f2. f,>> d'2\rest \bar "|."

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
    \new Lyrics = "altos"  \with { alignBelowContext = #"women"  } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"men"  } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men"  } \lyricsto "basses" \bassWords
  >>
  >>
}
