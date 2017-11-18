\header {
  enteredby = "Maia McCormick"
  composer = "W.J. Kirkpatrick (1838-1921)"
  arranger = "arr. David Wilcocks"
  poet = "19th cen. American"
  title = "Away in a Manger"
}

\version "2.14.2"
\include "header.ly"

global= {
  \preamble
  \time 3/4
  \key f \major
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
}

sop = \context Voice = "sop" \relative c' {
  \voiceOne
  \partial 4 c4 |
  f f g8( a) | f4 f a8( bes) | c4 c d | bes2 g8( a) |
  bes4 bes c | a a f8( a) | g4 d f | e2 c4 |
  f f g8( a) | f4 f a8( bes) | c4 c d | bes2 g8( a) |
  bes4 bes c | a a f8( a) | g4 d e | f2 \bar "|."
}

alto=\context Voice = "alto" \relative c' {
  \voiceTwo
  \partial 4 c4 |
  c c d8( e) | f4 c f8( g) | a4 a a | g2 d4 |
  g8( a) g( f) g4 | f c f | d4. c8 d4 | c2 c4 |
  c4. c8 d( e) | f( d) c4 f8( g) | a( bes) a( g) f( e) | d2 d4 |
  g8( f) g( e) f( g) | a( g) f( e) d4 | d8( c) d4 c8( bes) | a2 \bar "|."
}

tenor = \context Voice = "tenor" \relative c' {
  \voiceOne
  \partial 4 c8( bes) |
  a4 a bes8( c) | a4 a c | f4. g8 e4 | d( c) bes8( a) |
  g4 c g | c c d | b a b | c2 c4 |
  c8( bes) a4 bes8( c) | a( bes) c( d) e( d) | c4 f,8( g) a4 | bes8[( c d c)] bes( a) |
  g4 c g | c c a | d c8( bes) a( g) | f2 \bar "|."
}

bass = \context Voice = "bass" \relative c' {
  \voiceTwo
  \partial 4 a8( g) |
  f4 f f | f f f | f f f | f2 f4 |
  e e e | f e d | g g g | c,2 c'8( bes) |
  a( g) f( e) d( c) | f( g) a( bes) c( bes) | a( g) f( e) d( f) | g[( a bes a)] g( f) |
  e( d) e( c) d( e) | f( g) a4 d,8( c) | bes4 g c | f,2 \bar "|."
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
    \unset ChoirStaff.melismaBusyProperties
    \context Staff ="upper"  { \clef "G" <<
      \global
      \sop
      \alto
    >>}

    \lyricsto "sop" \context Lyrics = "stanza-1" {
      \set stanza = "1."
      \stanzaa }
    \lyricsto "sop" \context Lyrics = "stanza-2" {
      \set stanza = "2."
      \stanzab }
    \lyricsto "sop" \context Lyrics = "stanza-3" {
      \set stanza = "3."
      \stanzac }

    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
