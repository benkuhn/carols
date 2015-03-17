\version "2.14.2"
\include "header.ly"
\header {
  title = "The Holly and the Ivy"
  poet = "17th Century English"
  arranger = "arr. A.L.R."
  composer = "English"
}
global = {
  \preamble
  \key g \major
  \time 3/4
  \autoBeamOff
}

sopMusic = \relative c'' {
  \partial 4 g4 |
  g8\noBeam g8 g4 e' |
  \slurDotted d4( b4.) g8 |
  g\noBeam( g) g\noBeam( g) e'\noBeam( e) |
  d2 \bar"" \break
  
  \slurSolid d8[ c] |
  b8\noBeam a g4 \slurDotted b8\noBeam( b) |
  e,\noBeam e d4 \slurSolid g8[ a] |
  b\noBeam c b4 \slurDotted a8\noBeam( a) |
  g2 b8\rest \bar""\break
  
  g8 |
  g\noBeam g\noBeam g4 e'4 |
  \slurSolid d( b) g8\noBeam g |
  g\noBeam g g4 e' |
  d2 \bar""\break d8[ c] |
  
  b8\noBeam a g4 b |
  e,8\noBeam e d4 g8\noBeam a |
  b\noBeam c b4 a |
  g2 \bar "|."
  
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c' {
  e4 |
  d8\noBeam d e4 fis |
  \slurDotted g( g4.) e8 |
  d8\noBeam( d) e\noBeam( e) g\noBeam( g) |
  \slurSolid g4( fis) 
  
  g8[ a] |
  g8\noBeam fis g4 \slurDotted fis8\noBeam( fis) |
  e8\noBeam e d4 \slurSolid e8[ g] |
  g8\noBeam g g4 \slurDotted fis8\noBeam( fis) |
  g2 s8
  
  e8 |
  d\noBeam d d4 \slurSolid e8[ fis] |
  g4( d) d8\noBeam d |
  d\noBeam d e4 fis |
  g( fis) e8[ fis] |
  
  g\noBeam fis g[ fis] e[ d] |
  c8\noBeam c d4 g8\noBeam g |
  g\noBeam g g4 fis |
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
    %\set associatedVoice = "basses"
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
  As white __ _ as the lil -- ly flow’r,
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
altoWordsVI = \lyricmode {
}
tenorMusic = \relative c' {
  c4 |
  b8\noBeam b c4 a |
  \slurDotted b4( d4.) b8 |
  b\noBeam( b) b\noBeam( b) c\noBeam( c) |
  a2
  
  \slurSolid b8[ d] |
  d8\noBeam d d4 \slurDotted d8\noBeam( d) |
  c\noBeam c b4 \slurSolid c8[ e] |
  d\noBeam e d4 \slurDotted d8\noBeam( c) |
  b2 s8
  
  c8 |
  b\noBeam c d4 c |
  \slurSolid b( g) g8\noBeam g |
  g\noBeam g c4 c |
  d2 c8[ d] |
  
  d8\noBeam d d4 g, |
  g8\noBeam a b4 c8\noBeam e |
  d\noBeam e d4 c |
  b2 \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c' {
  g4 |
  g8\noBeam g g4 g |
  \slurDotted g4( g4.) g8 |
  g8\noBeam( g) e\noBeam( e) c\noBeam( c) |
  d2
  
  \slurSolid e8[ fis] |
  g8\noBeam a b4 \slurDotted b8\noBeam( b) |
  c8\noBeam c b4 \slurSolid c8[ c,] |
  d\noBeam d d4 \slurDotted d8\noBeam( d) |
  g2 d8\rest
  
  g8 |
  g\noBeam a\noBeam b4 a4 |
  \slurSolid g4( g,) b8\noBeam b |
  c\noBeam e g4 a |
  b( a) g8[ fis] |
  
  g\noBeam a b4 g |
  c,8\noBeam c g4 e'8\noBeam c |
  d\noBeam d d4 d |
  g2 \bar "|."
}
bassWords = \lyricmode {

}

pianoRH = \relative c' {
  
}
pianoLH = \relative c' {
  
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
    \new Lyrics \with { alignAboveContext = #"women" } \lyricsto "sopranos" \sopWords
    \new Lyrics = "altosVI"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsVI
    \new Lyrics = "altosV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsV
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women"  } \lyricsto "sopranos" \altoWords
    \new Lyrics \with { alignAboveContext = #"men"  } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men"  } \lyricsto "basses" \bassWords
  >>
  >>
}
