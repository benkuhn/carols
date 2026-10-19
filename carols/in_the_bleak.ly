\version "2.24.0"

\header {
  composer = "Gustav Holst"
  poet = "Christina Rossetti"
  title = "In the Bleak Midwinter"
  meter = "Cranham 6.5.6.5.D."
  mutopiacomposer = \composer
  mutopiapoet=\poet
}

\include "header.ly"

global= {
  \autoBeamOff

  \time 4/4
  \key f \major
}

sop = \context Voice = "sop" \relative c''   {
  \voiceOne
  \slurDotted
  a4.( bes8) c4 a |
  g2 f |
  g4.( a8) g4 d |
  g1 | \break

  a4. bes8 c4 a |
  g4.( g8) f2 |
  g4( a) g4. f8 |
  f2. f4 |

  bes4. a8 bes4( c) |
  d( d) a( a) |
  c( a) g( f) |
  e2. \parenthesize a4 |

  a4.( bes8) c4 a |
  g2 f |
  \slurSolid
  g4( a) g4.( f8) |
  f1 \bar "|."
}

alto=\context Voice = "alto" \relative c'  {
  \voiceTwo
  \slurDotted f4.( f8) f4 c |
  d2 d |
  d4.( d8) d4 c |
  bes1 |

  c4. f8 f4 c |
  d4.( d8) d2 |
  f4( f) e4. f8 |
  f2. f4 |

  f4. f8 f4( ees4) |
  d( d) f( f) |
  f( e) d( d) |
  c2. \parenthesize c4 |

  c4.( f8) f4 c |
  d2 d |
  \slurSolid
  f2 e4.( f8) |
  f1 \bar "|."
}

tenor = \context Voice = "tenor" \relative c' {
  \voiceOne
  \slurDotted c4.( c8) c4 f, |
  a2 a |
  g4.( d8) d4 f |
  \slurSolid f2( e) |

  \slurDotted f4. c'8 c4 f, |
  a4.( a8) a2 |
  d4( d) bes4. a8 |
  a2. a4 |

  bes4. c8 bes4( a) |
  bes( bes) a( a) |
  f( c') bes( a) |
  g2. \parenthesize f4 |

  f4.( c'8) c4 f, |
  a2 a |
  \slurSolid
  d2 bes4.( a8) |
  a1 \bar "|."
}

bass = \context Voice = "bass" \relative c {
  \voiceTwo
  \slurDotted f4.( g8) a4 f |
  d2 d |
  bes4.( c8) bes4 a |
  \slurSolid g2( c) |

  \slurDotted f4.( g8) a4 f |
  d4. d8 d2 |
  bes4( bes) c4. f8 |
  f2. f4 |

  d4. f8 d4( c) |
  bes( bes) d d |
  a( a) bes( bes) |
  c2. \parenthesize f4 |

  f4.( g8) a4 f |
  d2 d |
  \slurSolid
  bes2 c4.( f8) |
  f1 \bar "|."
}

stanzaa = \lyricmode {
  \set ignoreMelismata = ##t
  In the bleak mid -- win -- ter,
  fros -- ty wind made moan,
  Earth stood hard as i -- _ ron,
  wa -- ter like a stone, ""
  Snow had fal -- len, snow on snow, ""
  snow __ _ on __ _ snow, ""
  In the bleak mid -- win -- ter,
  \set ignoreMelismata = ##f
  Long a -- go.
}

stanzab = \lyricmode {
  \set ignoreMelismata = ##t
  Hea -- ven can -- not hold Him
  Nor __ _ earth sus -- tain;
  Heav’n and earth shall flee a -- way
  When He comes to reign; ""
  In the bleak mid -- win -- _ ter a sta -- ble place suf -- ficed
  The Lord __ _ God Al -- migh -- ty,
  \set ignoreMelismata = ##f
  Je -- sus Christ.
}
stanzac = \lyricmode {
  \set ignoreMelismata = ##t
  An -- gels and arch -- an -- gels May have ga -- thered there
  Cher -- u -- bim and Ser -- a -- phim
  Throng -- _ ed the air
  But on -- ly His __ _ mo -- _ ther ""
  In her maid -- en bliss ""
  Wor -- shipped the Be -- lov -- ed
  \set ignoreMelismata = ##f
  with a kiss.
}
stanzad = \lyricmode {
  \set ignoreMelismata = ##t
  What __ _ can I give Him,
  Poor __ _ as I am?
  If I were a shep -- _ herd
  I would bring a lamb; ""
  If I were a wise __ _ man ""
  I would do my part;
  Yet what I can I give Him
  \set ignoreMelismata = ##f
  Give my heart.
}

\score {
  \context ChoirStaff <<
    \context Staff ="upper"  { \clef "G" <<
      \global
      \sop
      \alto
    >>}

    \context Lyrics = "stanza-1" \lyricsto "sop" {
      \set stanza = "1."
      \stanzaa }
    \context Lyrics = "stanza-2" \lyricsto "sop" {
      \set stanza = "2."
      \stanzab }
    \context Lyrics = "stanza-3" \lyricsto "sop" {
      \set stanza = "3."
      \stanzac }
    \context Lyrics = "stanza-4" \lyricsto "sop" {
      \set stanza = "4."
      \stanzad }
    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
