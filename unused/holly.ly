\version "2.24.0"
\include "../carols/header.ly"
\header {
  title = "The Holly and the Ivy"
  poet = "17th Century English"
  arranger = "arr. A.L.R."
  composer = "English"
}
global = {
  \key g \major
  \time 3/4
  \autoBeamOff
}

sopMusic = \relative c'' {
  \partial 4 g4 |
  g8 g8 g4 e' |
  \slurDotted d4( b4.) g8 |
  g( g) g( g) e'( e) |
  d2 \bar"" \break

  \slurSolid d8[ c] |
  b8 a g4 \slurDotted b8( b) |
  e, e d4 \slurSolid g8[ a] |
  b c b4 \slurDotted a8( a) |
  g2 b8\rest \bar""\break

  g8 |
  g g g4 e'4 |
  \slurSolid d( b) g8 g |
  g g g4 e' |
  d2 \bar""\break d8[ c] |

  b8 a g4 b |
  e,8 e d4 g8 a |
  b c b4 a |
  g2 \bar "|."

}

altoMusic = \relative c' {
  e4 |
  d8 d e4 fis |
  \slurDotted g( g4.) e8 |
  d8( d) e( e) g( g) |
  \slurSolid g4( fis)

  g8[ a] |
  g8 fis g4 \slurDotted fis8( fis) |
  e8 e d4 \slurSolid e8[ g] |
  g8 g g4 \slurDotted fis8( fis) |
  g2 s8

  e8 |
  d d d4 \slurSolid e8[ fis] |
  g4( d) d8 d |
  d d e4 fis |
  g( fis) e8[ fis] |

  g fis g[ fis] e[ d] |
  c8 c d4 g8 g |
  g g g4 fis |
  g2 \bar "|."
}
altoWords = {
  \lyricmode {
    \set stanza = #"1."
    \set ignoreMelismata = ##t
    The hol -- ly and the i -- vy,
    When they are both _ full __ _ grown,
    Of __ _ all the trees that are in the wood,
    The _ hol -- ly bears the __ _ crown:

    \unset ignoreMelismata
  }
  \lyricmode{
    The ris -- ing of the sun __
    And the run -- ning of the deer,
    The play -- ing of the mer -- ry or -- gan,
    Sweet sing -- ing in the choir.
  }
}
altoWordsII = \lyricmode {
  \set stanza = #"2."
  \set ignoreMelismata = ##t
  The hol -- ly bears a blos -- som,
  As white __ _ as the lil -- y flow’r,
  And _ Ma -- ry bore sweet _ Je -- sus Christ, To __ _ be our sweet Sav -- _ ior:
}
altoWordsIII = {
  \set stanza = "3."
  \lyricmode {
    \set ignoreMelismata = ##t
    The hol -- ly bears a ber -- ry,
    As red as an -- _ y __ _ blood,
    And _ Ma -- ry bore sweet _ Je -- sus Christ, To __ _ do poor sin -- ners _ good:
  }
}
altoWordsIV = \lyricmode {
  \set stanza = #"4."
  \set ignoreMelismata = ##t
  The hol -- ly bears a prick -- le, As sharp as an -- _ y __ _ thorn,
  And _ Ma -- ry bore sweet _ Je -- sus Christ, On _ Christ -- mas day in the morn:
}
altoWordsV = \lyricmode {
  \set stanza = #"5."
  \set ignoreMelismata = ##t
  The hol -- ly bears a bark, __ _ As bit -- ter as __ _ an -- y gall,
  And _ Ma -- ry bore sweet _ Je -- sus Christ, For _ to re -- deem us __ _ all:
}
tenorMusic = \relative c' {
  c4 |
  b8 b c4 a |
  \slurDotted b4( d4.) b8 |
  b( b) b( b) c( c) |
  a2

  \slurSolid b8[ d] |
  d8 d d4 \slurDotted d8( d) |
  c c b4 \slurSolid c8[ e] |
  d e d4 \slurDotted d8( c) |
  b2 s8

  c8 |
  b c d4 c |
  \slurSolid b( g) g8 g |
  g g c4 c |
  d2 c8[ d] |

  d8 d d4 g, |
  g8 a b4 c8 e |
  d e d4 c |
  b2 \bar "|."
}

bassMusic = \relative c' {
  g4 |
  g8 g g4 g |
  \slurDotted g4( g4.) g8 |
  g8( g) e( e) c( c) |
  d2

  \slurSolid e8[ fis] |
  g8 a b4 \slurDotted b8( b) |
  c8 c b4 \slurSolid c8[ c,] |
  d d d4 \slurDotted d8( d) |
  g2 d8\rest

  g8 |
  g a b4 a4 |
  \slurSolid g4( g,) b8 b |
  c e g4 a |
  b( a) g8[ fis] |

  g a b4 g |
  c,8 c g4 e'8 c |
  d d d4 d |
  g2 \bar "|."
}

\score {
  <<
   \new ChoirStaff <<
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics = "altosV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsV
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women"  } \lyricsto "sopranos" \altoWords
  >>
  >>
}
