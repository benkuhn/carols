\version "2.14.2"
\include "header.ly"

\header {
  title = "The Wassail Song"
  poet = "Traditional"
  composer = "Traditional (Yorkshire)"
}
global = {
  \preamble
  \key e \major
  \time 6/8
}

sopMusic = \relative c' {
  \time 6/8
  \partial 8 e8 |
  e4 fis8 gis4 fis8 |
  \slurDotted e4( fis8) gis4 fis8 |
  e4 b'8 b4 b8 |
  
  \slurSolid b4.( b4) b8 |
  cis4 cis8 b4 gis8 |
  b4.( a4) gis8 |
  \slurDotted fis4( e8) fis4 gis8 |
  a4. \bar "||"
  
  \time 2/2
  \partial 2 gis4 a |
  b2 e4 cis |
  b2 gis4 a |
  b b e cis |
  b2 gis4 a |
  b2 cis4 gis |
  
  \slurSolid a( fis) e dis |
  e4.( fis8) gis4 e |
  a2 gis4 a |
  b2 cis4 gis |
  a fis e( dis) |
  e2 \bar "|." 
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c' {
  \time 6/8
  e8 |
  e4 e8 dis4 dis8 |
  \slurDotted e4( e8) dis4 dis8 |
  e4 e8 a4 gis8 |
  
  fis4.~ fis4 fis8 |
  a4 e8 e4 e8 |
  \slurSolid fis4.( dis4) e8 |
  \slurDotted cis4( e8) dis4 e8 |
  dis4. \bar "||"
  
  
  e4 dis |
  e2 e4 fis |
  gis2 e4 dis |
  e dis gis e |
  dis2 gis4 fis |
  fis2 eis4 eis |
  
  \slurSolid fis( cis) b b |
  b4.( dis8) e4 e |
  cis( dis) e e |
  fis2 cis4 cis |
  cis cis b2 |
  b2
}
altoWords = {
  \lyricmode {
    \set stanza = #"1. "
    \set ignoreMelismata = ##t
    _ Here we come a -- was -- sail -- ing A -- mong the leaves so green, _ _
    Here we come a -- wan -- d’ring, So fair __ _ to be seen.
  }
}
altoWordsII = {
  \set stanza = "2."
  \lyricmode {
    \set ignoreMelismata = ##t
    We are not dai -- ly beg -- _ gars That beg from door to door, _
    But we are neigh -- bors’ chil -- dren Whom you have seen be -- fore.
    \unset ignoreMelismata
  }
  \lyricmode {
    \set associatedVoice = "altos"
    Love and joy come to you, And to you your was -- sail too,
    And God bless you, and send you a hap -- py new year,
    \unset associatedVoice
    And God send you a hap -- py new year.
  }
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  \set ignoreMelismata = ##t
  Good Mas -- ter and good Mis -- _ tress, As you sit by the fire, __ _
  Pray think of us poor chil -- dren Who wan -- der in the mire.
}
altoWordsIV = \lyricmode {
}
altoWordsV = \lyricmode {
}
altoWordsVI = \lyricmode {
}
altoWordsVII = \lyricmode {
}
tenorMusic = \relative c' {
  \time 6/8
  gis8 |
  gis4 a8 b4 a8 |
  \slurDotted gis4( a8) b4 a8 |
  gis4 b8 dis4 e8 |
  
  dis4.~ dis4 dis8 |
  e4 a,8 b4 b8 |
  b4.~ b4 b8 |
  cis4( b8) a4 gis8 |
  fis4. \bar "||" 
  
  
  b4 b |
  b2 cis4 dis |
  e2 b4 b |
  b b b ais |
  b2 b4 cis |
  b2 b4 b |
  
  a2 gis4 fis |
  \slurSolid gis4.( a8) b4 cis |
  a2 b4 cis |
  b2 gis4 b |
  a4 a gis( fis) |
  gis2
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  \time 6/8
  e8 |
  e4 e8 b4 b8 |
  \slurDotted e4( e8) b4 b8 |
  e4 gis8 fis4 e8 |
  
  b'4.~ b4 b8 |
  a4 a8 gis4 e8 |
  \slurSolid dis4.( fis4) e8 |
  \slurDotted a4( gis8) fis4 e8 |
  b4. \bar "||"
  
  e4 fis |
  gis2 a4 a |
  e2 e4 fis |
  gis fis e fis |
  b,2 e4 e |
  dis2 cis4 cis |
  
  \slurSolid fis( a,) b b |
  gis'4.( fis8) e4 cis |
  fis2 e4 cis |
  dis2 eis4 eis |
  fis4 a, b2 |
  e2
}
bassWords = \lyricmode {

}

\score {
  <<
  \transpose e f
   \new ChoirStaff <<
    \new Staff = women <<
     \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"women" } \lyricsto "sopranos" \sopWords
    \new Lyrics = "altosVII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsVII
    \new Lyrics = "altosVI"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsVI
    \new Lyrics = "altosV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsV
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"men"  } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men"  } \lyricsto "basses" \bassWords
  >>
%    \new PianoStaff << \new Staff { \new Voice { \pianoRH } } \new Staff { \clef "bass" \pianoLH } >>
  >>
}