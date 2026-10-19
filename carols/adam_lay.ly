\version "2.24.0"

\header {
  title = "Adam Lay Ybounden"
  poet = "English, 15th century"
  composer = "Boris Ord (1897–1961)"
}

\include "header.ly"

\paper {
  system-system-spacing =
    #'((basic-distance . 15)
       (minimum-distance . 14)
       (padding . 3)
       (stretchability . 12))
}

global= {
  \autoBeamOff
  \time 3/4
  \key b \minor
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
}

sop = \context Voice = "sop" \relative c'' {
  \voiceOne
  b4. b8 a b | fis4 fis2 | b4. d8 cis b | fis2. |
  d'4 d d | \break b b2 | a8 a b4 gis | fis2. |

  fis2 fis8 b | a4 a4. a8 | \break d4. d8 a b | a2 b4\rest |
  a a b | \autoBeamOn a8( g) \autoBeamOff g2 | fis8 fis g4 b | fis2. | \break

  d'4 d8 d cis d | a a a4. a8 | d4. fis8 e d | b2. |
  e8 e d d e4 | a, a4. b8 | cis4 d8 e fis4 | e2. | \break

  d4 d cis8 b | a2 a4 | fis'4. fis8 e d | e2.
  e4. e8 fis d | e4 e e8 fis |
    g4.( \autoBeamOn fis8 d e \autoBeamOff | fis4. \autoBeamOn e8 cis) \autoBeamOff d | \break
    e4 fis d | b4.( \autoBeamOn a8 b d \autoBeamOff |
    cis4.) b8( a4) | b2. \bar "|."
}

alto= \context Voice = "alto" \relative c' {
  \voiceTwo
  fis4 fis e8 d | cis4 cis2 | d4 fis e8 d | d4( cis2) |
  fis4 \autoBeamOn fis8( e) \autoBeamOff a4 | a2 g4 | fis8 fis fis4 \autoBeamOn e8( d) \autoBeamOff | cis2. |

  d2 cis8 b | cis4 cis4. fis8 | g4. fis8 e d | cis2 s4 |
  fis \autoBeamOn fis8( e) \autoBeamOff fis4 | e4 d2 | d8 d d4 e | cis2. |

  fis4 fis8 g a fis | e e e4 fis | fis fis g8 a | a4( g2) |
  g8 g fis fis e4 | d fis fis | a a8 a fis4 | a2. |

  d4 d cis8 b | a2 a4 | a a a8 gis | a2. |
  gis4 a a8 fis | a4 a g?8 a |
    b4.( \autoBeamOn a8 fis) \autoBeamOff g | a2 a8 fis |
    b4( a) a | a g4. g8 |
    g2 fis4 | dis2. \bar "|."
}

tenor = \context Voice = "tenor" \relative c' {
  \voiceOne
  d4 d cis8 b | b4 ais2 | b4 fis g8 g | b4( ais2) |
  a?4 a d | d2 e4 | cis8 cis d4 b | b( ais4.) fis8 |

  b4. b8 a b | fis4 fis4. fis8 | b4. d8 cis b | fis2 r4 |
  d'4 cis d | b b2 | a8 a b4 g | fis2. |

  a4 d8 d a a | d d cis4 cis | b b b8 a | d2. |
  b8 b d cis \autoBeamOn b( cis) \autoBeamOff | d4 cis d | e d8 d \autoBeamOn a( b) \autoBeamOff | cis2.

  d4 d cis8 b | a2 e'4 | d d e8 e | cis2. |
  b4 cis d8 d | d4 cis c8 c |
    d2 b4 | d4. \autoBeamOn cis8( a) \autoBeamOff b |
    \autoBeamOn b( cis \autoBeamOff d4.) a8 | \autoBeamOn b( cis) \autoBeamOff d4. b8 |
    e4( d) cis | b2.

}

bass = \context Voice = "bass" \relative c' {
  \voiceTwo
  b4 d, e8 e | fis4 fis2 | b4 d, e8 e | fis2. |
  d4 a' fis | g2 e4 | fis8 fis d4 e | fis2. |

  R | R | R | R |
  d4 a' d, | e g2 | d8 d b4 e | fis2. |

  d4 d8 e fis fis | a a a4 fis | b d, e8 fis | g2. |
  e8 e b' a g4 | fis fis d | a' fis8 fis d4 | a'2. |

  d4 d cis8 b | a2 cis4 | d d cis8 b | a2. |
  e4 a d,8 b' | a4 a c8 c |
    \autoBeamOn g( a \autoBeamOff b4. g8 | \autoBeamOn d e \autoBeamOff fis4.) b8 |
    g4 \autoBeamOn d8( e) \autoBeamOff fis4 | g2( fis4 |
    e2) fis4 | << fis2. b, >> \bar "|."

}

wordsCenter = \lyricmode {
  A -- dam lay y -- bound -- en,
  Bound -- en in a bond;
  Four thou -- sand win -- ter
  Thought he not too long.

  And all was for an ap -- ple,
  An ap -- ple that he took,
  As clerk -- es find -- en
  Writ -- ten in their book.

  Ne had the ap -- ple tak -- en been,
  The ap -- ple tak -- en been,
  Ne had nev -- er our la -- dy
  A -- been heav -- en -- é queen.

  Bless -- ed be the time
  That ap -- ple tak -- en was,
  There -- fore we moun sing -- en,
  \lyricItal
    De -- o gra -- ci -- as,
    De -- o gra -- ci -- as,
    De -- o gra -- ci -- as!
  \lyricNormal
}

wordsTop = \lyricmode {
  \repeat unfold 21 { \skip 1 }
  All for an ap -- ple, An
  \repeat unfold 59 { \skip 1 }
  \lyricItal
    De -- o gra -- ci -- as,
    De -- o gra -- ci -- as!
  \lyricNormal
}

wordsBottom = \lyricmode {
  \repeat unfold 75 { \skip 1 }
  \lyricItal
    De -- o gra -- ci -- as,
    De -- o gra -- ci -- as!
  \lyricNormal
}

\score {
  \context ChoirStaff <<
    \context Staff ="upper"  { \clef "G" <<
      \global
      \sop
      \alto
    >>}

  \context Lyrics = "top" \with { alignAboveContext = "upper" } \lyricsto "sop" {
      \wordsTop }

    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}

    \context Lyrics = "mid" \with { alignAboveContext = "lower" } \lyricsto "tenor" {
      \wordsCenter }

    \context Lyrics = "bottom" \lyricsto "bass" {
      \wordsBottom
    }
  >>
}
