\version "2.24.0"
% Source: arrangement by BHB
\include "header.ly"
\header {
  title = "Gloucestershire Wassail"
  poet = "Traditional English"
  composer = "Traditional English"
}
global = {
  \key g \major
  \time 3/4
}

sopMusic = \relative c' {
  \tempo"Allegro"
  \partial 4 d4 |
  \slurDashed g4( g) g |
  g( a) b |
  c b a |
  \slurSolid b8( d4.) d4 |

  c4 a a |
  \slurDashed a( b) c |
  \slurSolid b8[ a] g[ a] b4 |
  a2 c4 |

  b8[ a] g[ a] b[ c] |
  d2 \slurDashed d8( c) |
  b4 g b |
  a2 g8 a |

  b2 a8 b |
  c2 b4 |
  a g fis |
  g2 \bar "|."
}

altoMusic = \relative c' {
  d4 |
  \slurDashed d( d) e|
  d( fis) g|
  g g fis |
  g2 g4 |

  a4 fis fis |
  fis( d) fis |
  \slurSolid g8[ fis] e[ fis] g4 |
  fis2 fis4 |

  g8[ fis] e[ fis] g4 |
  fis2 \slurDashed fis8( fis) |
  g4 g g |
  fis2 e8 fis |

  g2 fis8 g |
  g2 g4 |
  fis d4. c8 |
  b2
}
altoWords = \lyricmode {
  \set stanza = #"1. "
  \set ignoreMelismata = ##t
  Was -- sail, __ _ was -- sail __ _ all o -- ver the town, _
  Our toast it is white and our ale _ it __ _ is brown;
  Our bowl _ it __ _ is __ _ made of the white ma -- ple tree,
  With the was -- sail -- ing bowl we’ll drink un -- to thee.
  \unset ignoreMelismata

  \set stanza = #"4. "
}
altoWordsII = {
  \set stanza = #"2. "
  \lyricmode {
    \set ignoreMelismata = ##t
    So here is to Cher -- ry and to his right cheek, _
    Pray God send our mas -- ter a good _ piece _ of beef,
    A good _ piece _ of __ _ beef that _ may we all see,
    With the was -- sail -- ing bowl we’ll drink un -- to thee.
  }
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  \set ignoreMelismata = ##t
  And here is to Dob -- bin and to his right eye, __ _
  Pray God send our mas -- ter a good _ Christ -- _ mas pie,
  A good _ Christ -- _ mas _ pie that _ may we all see,
  With the was -- sail -- ing bowl we’ll drink un -- to thee.

  \set stanza = #"6. "
  \set ignoreMelismata = ##t
}

verses = \markup { \fill-line {
  \column {
  \line {\bold "4." And here is to Fillpail and to her left ear,}
  \line { Pray God send our master a happy New Year, }
  \line { A happy New Year as e’er he did see, }
  \line { With the wassailing bowl we’ll drink unto thee. }
  \combine \null \vspace #0.1
  \line { \bold "5." Come butler, come fill us a bowl of the best, }
  \line { Then we hope that your soul in heaven may rest, }
  \line { But if you do draw us a bowl of the small, }
  \line { Then down shall go butler, bowl and all. }
  }
  \column {
  \line { \bold "6." Then here’s to the maid in the lily white smock, }
  \line { Who tripp’d to the door and slipp’d back the lock, }
  \line { Who tripp’d to the door and pulled back the pin, }
  \line { For to let these jolly wassailers in. }
  }}
}
tenorMusic = \relative c' {
  b4 |
  \slurDashed b( b) c |
  b( c) d |
  e d c |
  \slurSolid d8( b4.) b4 |

  \slurDashed
  e4 d c |
  d( g,) a |
  g e' d |
  d2 d4 |

  g, e' d8[ c] |
  d2 a8( a) |
  g8[ d'] b4 d |
  d2 b8 d |

  g,2 d'8 g, |
  e'2 d4 |
  c b a |
  g2
}

bassMusic = \relative c {
  g'4 |
  \slurDashed g4( g) c, |
  g'( d) g |
  c, g' d |
  g2 g4 |

  a4 d, d |
  d( g) d |
  g b g |
  d2 d4 |

  g4 b g8[ e] |
  d2 \slurDashed d8( d) |
  g4 g g |
  d2 e8 d |

  g2 d8 g |
  c,2 g'4 |
  d d d |
  g,2
}

\score {
  <<
   \new ChoirStaff <<
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic>> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women"  } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
  >>
  >>
}
\verses
