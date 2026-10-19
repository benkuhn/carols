\version "2.24.0"
% Source: The Cambridge Carol Book, 1924
\include "header.ly"

\header {
  title = "Ding Dong Merrily on High"
  poet = "George Ratcliffe Woodward (1848–1934)"
  composer = "French, 16th century"
  arranger = "arr. Charles Wood (1866–1926)"
}

global = {
  \autoBeamOff
  \key bes \major
  \time 4/4
}

sop = \context Voice = "sop" \relative c'' {
  \voiceOne
  \repeat unfold 2 {
    bes4 bes c8 bes a g |
    f2. f4 |
    g bes bes a |
    bes2 bes
  } \break
  \repeat volta 2 {
    f'4.( \autoBeamOn ees8 d ees f d \autoBeamOff |
    ees4. \autoBeamOn d8 c d ees c \autoBeamOff |
    d4. \autoBeamOn c8 bes c d bes \autoBeamOff |
    c4. \autoBeamOn bes8 a bes c a \autoBeamOff |

    bes4. \autoBeamOn a8 g a bes g \autoBeamOff |
    a4.) g8 f4 f |
    g bes bes a |
    bes2 bes 2
  }
}

alto=\context Voice = "alto" \relative c' {
  \voiceTwo
  \repeat unfold 2 {
    f4 f g8 g ees ees |
    c2. f4 |
    f ees c f |
    f2 f |
  }
  \repeat volta 2 {
    r4 f2( bes4 |
    \autoBeamOn bes8 a g f g f \autoBeamOff ees4) |
    r4  \autoBeamOn f8( ees \autoBeamOff d4 g |
    \autoBeamOn g8 f ees d ees d \autoBeamOff c4) |

    r4 \autoBeamOn d8( c \autoBeamOff bes4 ees |
    \autoBeamOn c8 d ees) \autoBeamOff d c4 f |
    f ees c f |
    f2 f
  }
}

tenor = \context Voice = "tenor" \relative c' {
  \voiceOne
  \repeat unfold 2 {
    d4 bes g8 g c bes |
    a2. bes4 |
    bes bes c c |
    d2 d |
  }
  \repeat volta 2 {
    d,4\rest c'( d bes |
    c bes2 c4) |
    d,4\rest a'( bes g |
    a g2 a4) |

    d,\rest f( g2 |
    c4) bes c d |
    bes bes c c |
    d2 d
  }
}

bass = \context Voice = "bass" \relative c {
  \voiceTwo
  \repeat unfold 2 {
    bes4 d ees8 ees c c |
    f2. d4 |
    ees g f f |
    bes,2 bes |
  }
  \repeat volta 2 {
    s4 a'4( bes d, |
    c d \autoBeamOn ees8 d \autoBeamOff c4) |
    s4 f( g bes, |
    a bes \autoBeamOn c8 bes \autoBeamOff a4) |

    s4 d( ees g |
    f) g a bes |
    ees, g f f |
    bes,2 bes
  }
}

stanzaa = \lyricmode {
  Ding dong! mer -- ri -- ly on high in heav’n the bells are ring -- ing:
  Ding dong!  Ve -- ri -- ly the sky is riv’n with an -- gel sing -- ing.
  \markup\italic Glo -- \markup\italic ri -- \markup\italic a, \markup\italic ho -- \markup\italic san -- \markup\italic na \markup\italic in \markup\italic ex -- \markup\italic cel -- \markup\italic sis!
}
stanzab = \lyricmode {
  E’en so here be -- low, be -- low, let stee -- ple bells be swung -- en.
  And i -- o, i -- o, i -- o by priest and peo -- ple sung -- en.
}
stanzac = \lyricmode {
  Pray ye du -- ti -- ful -- ly prime your ma -- tin chime, ye ring -- ers;
  may ye beau -- ti -- ful -- ly rime your eve -- time song, ye sing -- ers.
}

\score {
  \context ChoirStaff <<
    \context Staff ="upper"  { \clef "G" <<
      \global
      \sop
      \alto
    >>}

    \context Lyrics = "stanza-1" \lyricsto "sop" {
      \set stanza = #"1. "
      \stanzaa }
    \context Lyrics = "stanza-2" \lyricsto "sop" {
      \set stanza = #"2. "
      \stanzab }
    \context Lyrics = "stanza-3" \lyricsto "sop" {
      \set stanza = #"3. "
      \stanzac }

    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
