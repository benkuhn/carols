\version "2.14.2"
\include "header.ly"

\header {
  title = "The Angel Gabriel"
  poet = "trans. Sabine Baring-Gould (1834-1924)"
  composer = "Basque Carol"
  arranger = "harm. Edgar Pettman"
  metre = "Gabriel's Message 10.10.12.10"
  meter = \metre
}

global = {
  \preamble
  \key bes \major
  \time 6/4
}

sopMusic = \relative c' {
  \partial 8 d8 |
  \time 9/8 g4 bes8 a4 c8 bes4 a8 |
  \time 6/4 g4. a d,~ d4 \bar"" d8 |

  \time 9/8 g4 bes8 a4 c8 bes4 a8 |
  \time 6/4 g4.~ g4 f8 g4.~ g4 \bar"" bes8 |

  bes4 c8 bes4 a8 bes4 c8 d4 d8 |
  \slurDotted c4.( bes) \slurSolid a4.~ a4 \bar"" bes8 |

  c4 bes8 a4 g8 a4. d, |
  g4.( bes8[ a bes] g4.~ g4) f8 |
  \time 9/8 g2.~ g4 \bar "|."
}
sopWords = \lyricmode {

}

altoMusic = \relative c' {
  d8 |
  bes4 d8 c4 ees8 d4 c8 |
  d4. ees c~ c4 c8 |

  bes4 d8 c4 ees8 d4 ees8 |
  d4. d4. d4.~ d4 d8 |

  d4 ees8 d4 ees8 f4 ees8 d4 d8 |
  \slurDotted g4.( g) \slurSolid g4.( f4) f8 |

  c4 c8 c4 c8 c4. c4. |
  bes4.( ees d) d4. |
  bes2.~ bes4
}
altoWords = \lyricmode {
  \set stanza = #"1. "
  The an -- gel Ga -- bri -- el from heav -- en came,
  His wings as drif -- ted snow, his eyes as flame;
  “All hail,” said he, “thou low -- ly maid -- en Ma -- ry,
  Most high -- ly fa -- vored la -- dy,” Glo -- ri -- a!
}
altoWordsII = \lyricmode {
  \set stanza = #"2. "
  “For known a bles -- sed Mo -- ther thou shalt be,
  All ge -- ne -- ra -- tions laud and hon -- or thee,
  Thy Son shall be Em -- man -- u -- el, by
  \set ignoreMelismata = ##t
  seers fore --
  \unset ignoreMelismata
  told,
  Most high -- ly fa -- vored la -- dy,”
  Glo -- ri -- a!
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  Then gen -- tle Ma -- ry meek -- ly bowed her head,
  “To me be as it plea -- seth God,” she said,
  “My soul shall laud and mag -- ni -- fy His
  \set ignoreMelismata = ##t
  ho -- ly
  \unset ignoreMelismata
  Name.”
  Most high -- ly fa -- vored la -- dy,
  Glo -- ri -- a!
}
altoWordsIV = \lyricmode {
  \set stanza = #"4. "
  Of her, Em -- man -- u -- el, the Christ, was born
  In Beth -- le -- hem, all on a Christ -- mas morn,
  And Chris -- tian folk through -- out the world will
  \set ignoreMelismata = ##t
  ev -- er
  \unset ignoreMelismata
  say
  “Most high -- ly fa -- vored la -- dy,”
  Glo -- ri -- a!
}

tenorMusic = \relative c {
  d8 |
  d4 d8 d4 d8 d4 d8 |
  bes'4. c a ~ a4 a8 |

  g4 g8 g4 g8 g4 a8 |
  bes4. a4. bes4.~ bes4 bes8 |

  bes4 f8 f4 c'8 bes4 a8 bes4 bes8 |
  \slurDotted g4.( c) \slurSolid c~ c4 bes8 |

  g4 g8 g4 g8 g4. fis |
  g2.( bes4.) a |
  g2.~ g4
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  d8 |
  g,4 g8 g4 g8 g4 g8 |
  g'4. g g( fis4) fis8 |

  g4 g,8 g4 g8 g4 c8 |
  bes4. d g ~ g4 bes,8 |

  bes4 a8 bes4 c8 d4 c8 bes4 bes8 |
  \slurDotted ees4.( e) \slurSolid f4.~ f4 d8 |

  ees4 ees8 ees4 ees8 d4. d |
  ees( c bes) d |
  << d2. ~ g,2. ~ >> << d'4 g,4>>
}
bassWords = \lyricmode {

}

\score {
  \transpose g a
  <<
    \new ChoirStaff <<
      \new Staff = women <<
        \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
        \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
      >>
      \new Lyrics \with { alignAboveContext = #"women"} \lyricsto "sopranos" \sopWords
      \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIV
      \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
      \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
      \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWords
      \new Staff = men <<
        \clef bass
        \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
        \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
      >>
      \new Lyrics \with { alignAboveContext = #"men"} \lyricsto "tenors" \tenorWords
      \new Lyrics \with { alignBelowContext = #"men"} \lyricsto "basses" \bassWords
    >>
  >>
  \layout {
    \context {
      \Staff
      \remove Time_signature_engraver
    }
  }
}
