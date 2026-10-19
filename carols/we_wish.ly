\version "2.24.0"
\include "header.ly"
\header {
  title = "We Wish You a Merry Christmas"
  poet = "Traditional English"
  composer = "Traditional English"
}
global = {
  \key aes \major
  \time 3/4
}

sopMusic = \relative c' {
  \partial 4 ees4 |
  aes4 aes8 bes aes g |
  f4 f f |
  bes bes8 c bes aes |
  g4 ees ees |

  c' c8 des c bes |
  \slurDashed aes4 f ees8( ees) |
  f4 bes g |
  aes2^\markup\italic"Fine" \bar "|." \break
  ees4 |
  aes aes aes |

  g2 g4 |
  aes g f |
  ees2 bes'4 |
  c bes aes |
  ees' ees, ees8 ees |
  f4 bes g |
  aes2
  \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup \small \italic "D.C. al Fine"
  \bar "||"
}

altoMusic = \relative c' {
  ees4 |
  c c8 c c c |
  des4 des ees |
  d d8 d d d |
  ees4 ees ees |

  e e8 e e e |
  \slurDashed f4 c ees8( ees) |
  des4 f ees |
  ees2 \bar "|."
  c4 |
  ees4 ees ees |

  ees2 ees4 |
  d4 d d |
  ees2 ees4 |
  ees des c |
  ees ees ees8 ees |
  des4 f ees |
  ees2 \bar "||"
}
altoWords = \lyricmode {
  \set stanza = #"1, 4. "
  \set ignoreMelismata = ##t
  We wish you a Mer -- ry Christ -- mas,
  We wish you a Mer -- ry Christ -- mas,
  We wish you a Mer -- ry Christ -- mas,
  And a hap -- py New Year!
}
altoWordsII = {
  \set stanza = #"2. "
  \lyricmode {
    \set ignoreMelismata = ##t
    Oh, bring us a fig -- gy pud -- ding,
    Oh, bring us a fig -- gy pud -- ding,
    Oh, bring us a fig -- gy pud -- ding,
    And a cup of good cheer.
    Good tid -- ings to you wher -- ev -- er you are;
    Good tid -- ings for Christ -- mas and a hap -- py New Year!
  }
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  \set ignoreMelismata = ##t
  We won’t go un -- til we get some,
  We won’t go un -- til we get some,
  We won’t go un -- til we get some,
  So _ bring it right here.
}
tenorMusic = \relative c {
  ees4 |
  ees4 ees8 ees aes aes |
  aes4 aes a |
  bes f8 aes g f |
  ees4 g g |

  g g8 g c c |
  \slurDashed c4 aes aes8( aes) |
  aes4 des des |
  c2 \bar "|."
  aes4 |
  c c c |

  bes2 bes4 |
  bes bes aes |
  g2 g4 |
  aes aes aes |
  aes aes aes8 aes |
  aes4 des des |
  c2 \bar "||"
}

bassMusic = \relative c {
  ees4 |
  aes, aes8 aes aes aes |
  des4 des c |
  bes bes8 bes bes bes |
  ees4 ees des |

  c c8 c c c |
  \slurDashed f4 f c8( c) |
  des4 bes ees |
  aes2 \bar "|."
  aes4 |
  aes, aes aes |

  bes2 bes4 |
  bes bes bes |
  ees2 ees4 |
  aes, aes aes |
  c c c8 c |
  des4 bes ees |
  aes2 \bar "||"
}

\score {
  \transpose aes g
  <<
    \new ChoirStaff <<
      \new Staff = women <<
        \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
        \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
      >>
      \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
      \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
      \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWords
      \new Staff = men <<
        \clef bass
        \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
        \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
      >>
    >>
  >>
}
