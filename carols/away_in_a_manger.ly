\version "2.24.0"

\header {
  composer = "W.J. Kirkpatrick (1838-1921)"
  arranger = "arr. David Willcocks"
  poet = "19th cen. American"
  title = "Away in a Manger"
}

\include "header.ly"

global= {
  \autoBeamOff
  \time 3/4
  \key f \major
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
}

sop = \context Voice = "sop" \relative c' {
  \voiceOne
  \partial 4 c4 |
  f f \autoBeamOn g8( a) \autoBeamOff | f4 f \autoBeamOn a8( bes) \autoBeamOff | c4 c d | bes2 \autoBeamOn g8( a) \autoBeamOff |
  bes4 bes c | a a \autoBeamOn f8( a) \autoBeamOff | g4 d f | e2 c4 |
  f f \autoBeamOn g8( a) \autoBeamOff | f4 f \autoBeamOn a8( bes) \autoBeamOff | c4 c d | bes2 \autoBeamOn g8( a) \autoBeamOff |
  bes4 bes c | a a \autoBeamOn f8( a) \autoBeamOff | g4 d e | f2 \bar "|."
}

alto=\context Voice = "alto" \relative c' {
  \voiceTwo
  \partial 4 c4 |
  c c \autoBeamOn d8( e) \autoBeamOff | f4 c \autoBeamOn f8( g) \autoBeamOff | a4 a a | g2 d4 |
  \autoBeamOn g8( a) \autoBeamOff \autoBeamOn g( f) \autoBeamOff g4 | f c f | d4. c8 d4 | c2 c4 |
  c4. c8 \autoBeamOn d( e) \autoBeamOff | \autoBeamOn f( d) \autoBeamOff c4 \autoBeamOn f8( g) \autoBeamOff | \autoBeamOn a( bes) \autoBeamOff \autoBeamOn a( g) \autoBeamOff \autoBeamOn f( e) \autoBeamOff | d2 d4 |
  \autoBeamOn g8( f) \autoBeamOff \autoBeamOn g( e) \autoBeamOff \autoBeamOn f( g) \autoBeamOff | \autoBeamOn a( g) \autoBeamOff \autoBeamOn f( e) \autoBeamOff d4 | \autoBeamOn d8( c) \autoBeamOff d4 \autoBeamOn c8( bes) \autoBeamOff | a2 \bar "|."
}

tenor = \context Voice = "tenor" \relative c' {
  \voiceOne
  \partial 4 \autoBeamOn c8( bes) \autoBeamOff |
  a4 a \autoBeamOn bes8( c) \autoBeamOff | a4 a c | f4. g8 e4 | d( c) \autoBeamOn bes8( a) \autoBeamOff |
  g4 c g | c c d | b a b | c2 c4 |
  \autoBeamOn c8( bes) \autoBeamOff a4 \autoBeamOn bes8( c) \autoBeamOff | \autoBeamOn a( bes) \autoBeamOff \autoBeamOn c( d) \autoBeamOff \autoBeamOn e( d) \autoBeamOff | c4 \autoBeamOn f,8( g) \autoBeamOff a4 | \autoBeamOn bes8[( c d c)] \autoBeamOff \autoBeamOn bes( a) \autoBeamOff |
  g4 c g | c c a | d \autoBeamOn c8( bes) \autoBeamOff \autoBeamOn a( g) \autoBeamOff | f2 \bar "|."
}

bass = \context Voice = "bass" \relative c' {
  \voiceTwo
  \partial 4 \autoBeamOn a8( g) \autoBeamOff |
  f4 f f | f f f | f f f | f2 f4 |
  e e e | f e d | g g g | c,2 \autoBeamOn c'8( bes) \autoBeamOff |
  \autoBeamOn a( g) \autoBeamOff \autoBeamOn f( e) \autoBeamOff \autoBeamOn d( c) \autoBeamOff | \autoBeamOn f( g) \autoBeamOff \autoBeamOn a( bes) \autoBeamOff \autoBeamOn c( bes) \autoBeamOff | \autoBeamOn a( g) \autoBeamOff \autoBeamOn f( e) \autoBeamOff \autoBeamOn d( f) \autoBeamOff | \autoBeamOn g[( a bes a)] \autoBeamOff \autoBeamOn g( f) \autoBeamOff |
  \autoBeamOn e( d) \autoBeamOff \autoBeamOn e( c) \autoBeamOff \autoBeamOn d( e) \autoBeamOff | \autoBeamOn f( g) \autoBeamOff a4 \autoBeamOn d,8( c) \autoBeamOff | bes4 g c | f,2 \bar "|."
}

stanzaa = \lyricmode {
  A -- way in a man -- ger,
  no crib for a bed,
  The lit -- tle Lord Je -- sus
  laid down his sweet head;
  The stars in the bright sky looked
  down where he lay,
  The lit -- tle Lord Je -- sus
  a -- sleep on the hay.
}

stanzab = \lyricmode {
  The cat -- tle are low -- ing,
  the ba -- by a -- wakes,
  But lit -- tle Lord Je -- sus
  no cry -- ing he makes.
  I love thee, Lord Je -- sus!
  Look down from the sky,
  and stay by my side un -- til
  morn -- ing is nigh.
}

stanzac = \lyricmode {
  Be near me, Lord Je -- sus;
  I ask thee to stay
  Close by me for ev -- er,
  and love me, I pray.
  Bless all the dear child -- ren
  in thy ten -- der care,
  and fit us for hea -- ven,
  to live with thee there.
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

    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
