\version "2.14.2"
\include "header.ly"
\header {
  title = "Noël Nouvelet"
  poet = "trans. P.S.B."
  composer = "15th Century French Carol"
}

global = {
  \preamble
  \key bes \major
  \time 2/4
  \autoBeamOff
}

sopMusic = \relative c'' {
  g8 d' e c |
  d4 bes |
  c8 c16[ d] bes8 a |
  g2 | \break
  
  \slurDotted
  g8( d') e c |
  \slurSolid
  d4 bes |
  c8 c16[ d] bes8 a |
  g2 | \break
  
  bes4 a8 g |
  a4. d,8 |
  bes' bes a g |
  a2 | \break
  
  g8 d' e c |
  d4 bes |
  c8 c16[ d] bes8 a |
  g2 \bar "|."
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c' {
  g'8 d g g |
  d4 g |
  e8 e g fis |
  d2 |
  
  \slurDotted
  g8( d) g g |
  \slurSolid
  d4 g |
  e8 e g fis |
  d2 |
  
  d4 e8 e |
  d4. d8 |
  d d e e |
  d2 |
  
  g8 d g g |
  d4 g |
  e8 e g fis |
  d2 \bar "|."
}
altoWords = \lyricmode {
  \set stanza = "1. "
  \markup\italic “No -- \markup\italic ël \markup\italic nou -- \markup\italic ve -- \markup\italic let,”
  come let us sing \markup\italic “no -- \markup\italic ël;”
  \set ignoreMelismata = ##t
  Let us faith -- ful folk,
  \unset ignoreMelismata
  cry out our thanks to God!
  
  Sing we \markup\italic “no -- \markup\italic ël,”
  un -- to the ti -- ny King,
  \markup\italic “No -- \markup\italic ël \markup\italic nou -- \markup\italic ve -- \markup\italic let,”
  come let us sing \markup\italic “no -- \markup\italic ël.”
}
altoWordsII = \lyricmode {
  \set stanza = "2. "
  Prais -- es to our Lord, our Sav -- ior Je -- sus Christ,
  \set ignoreMelismata = ##t
  Come to earth as man, 
  \unset ignoreMelismata
  as man to live and die,
  
}
altoWordsIII = \lyricmode {
  \markup\italic No -- \markup\italic ël \markup\italic nou -- \markup\italic ve -- \markup\italic let, \markup\italic No -- \markup\italic ël \markup\italic chan -- \markup\italic tons \markup\italic i -- \markup\italic ci,
  \markup\italic Dé -- \markup\italic vo -- \markup\italic tes \markup\italic gens, \markup\italic cri -- \markup\italic ons \markup\italic à \markup\italic Dieu \markup\italic mer -- \markup\italic ci!
  
  \markup\italic Chan -- \markup\italic tons \markup\italic No -- \markup\italic ël \markup\italic pour \markup\italic le \markup\italic Roi \markup\italic nou -- \markup\italic ve -- \markup\italic let!
  \markup\italic No -- \markup\italic ël \markup\italic nou -- \markup\italic ve -- \markup\italic let, \markup\italic No -- \markup\italic ël \markup\italic chan -- \markup\italic tons \markup\italic i -- \markup\italic ci!
}
altoWordsIV = \lyricmode {
}

tenorMusic = \relative c' {
  g8 bes c c |
  bes4 d |
  c8 g d' d |
  bes2 |
  
  \slurDotted
  g8( bes) c c |
  \slurSolid
  bes4 d |
  c8 g d' d |
  bes2 |
  
  bes4 c8 c |
  a[ g fis] d |
  bes' bes c c |
  fis,([ g] a4) |
  
  g8 bes c c |
  bes4 d |
  c8 g d' c |
  bes2 \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c' {
  g8 g c, e |
  g4 g |
  c,8 c d d |
  g2 |
  
  \slurDotted
  g8( g) c,8 e |
  \slurSolid
  g4 g |
  c,8 c d d |
  g2 |
  
  g4 a8 a |
  fis8[ e d] d8 |
  g g a a |
  d,([ e] fis4) |
  
  g8 g c, e |
  g4 g |
  c,8 c d d |
  g,2 \bar "|."
}
bassWords = \lyricmode {

}

\score {
  <<
   \new ChoirStaff <<
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"women" } \lyricsto "sopranos" \sopWords
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women"  } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"men"  } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men"  } \lyricsto "basses" \bassWords
  >>
  >>
}
