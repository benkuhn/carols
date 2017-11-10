\version "2.14.2"
\include "header.ly"
\header {
  title = "Somerset Wassail"
  poet = "18th Century English"
  composer = "18th Century English"
  arranger = "Arr. Ed."
}
global = {
  \preamble
  \key f \major
  \time 4/4
  \autoBeamOff
}

sopMusic = \transpose c f { \relative c' {
  \partial 4 c4 |
  c( a') g f | e2 d4 c | c( d) e f | g2. c,4 |
  c( a') g f | e2 d4 c | c( d) e f | g2. g4 |
  a( f) bes a | g2 e4 e | f e d e | f2 e4 f |
  g( c) a f | g2 e4 e | d c e d | c2 g4 g |
  c2 d | g, g4 g | c2 d4( e) | f2 e4 f |
  g( c) a f | g2 e4 e | d c e( d) | c1 |
}}
sopWords = \lyricmode {

}

altoMusic = \transpose c f { \relative c' {
  \partial 4 c4 |
  c2 c4 c | c2 c4 c | c2 c4 c | c2. c4 |
  c2 c4 c | c2 c4 c | c2 c4 c | c2. c4 |
  c2 c4 c | d2 bes4 bes | a( g) g g | a2 g4 a |
  c2 c4 c | b2 b4 b | a2 b | a f4 f |

  e2 a | g f4 f | e2 g | a g4 a |
  c2 c4 c | b2 g4 g | a2 b | g1 |
}}
altoWords = \lyricmode {
  \set stanza = #"1."
  Was -- sail and was -- sail _ all o -- ver the town,
  The bread it is white and the ale it is brown
  The cup it is made of the good _  ash -- en tree
  And _ so is the malt of the best _  bar _ -- ley

  For it's your was -- sail, and it's our was -- sail,
  And it's joy be to you and a jol -- ly was -- sail!
}
altoWordsII = {
  \set stanza = "2."
  \lyricmode {
  }
}
altoWordsIII = \lyricmode {
  \set stanza = #"3."
  \set stanza = #"  6."
}

verses = \markup { \fill-line {
}}
altoWordsIV = \lyricmode {
}
altoWordsV = \lyricmode {
}
altoWordsVI = \lyricmode {
}
tenorMusic = \transpose c f { \relative c {
  \partial 4 e4 |
  e( f) e d | g2 f4 e | e f g f | e2. e4 |
  e( f) e d | g2 g4 a | bes a g f | e2. e4 |
  f a g f | g2 g4 g | f c d c | f2 g4 a |
  e g f a | g2 g4 g | f2 f | e d4 d |

  e2 f | b, d4 d | c2 b4 c | c2 c4 c |
  c2 c4 c | d2 g4 g | f f f2 | e1 |
}}
tenorWords = \lyricmode {

}

bassMusic = \transpose c f { \relative c {
  \partial 4 c4 |
  c2 c4 c | c2 c4 c | c2 c4 c | c2. c4 |
  c2 c4 c | c2 c4 c | c2 c4 c | c2. c4 |
  c2 c4 c | bes2 c4 c | f, c' bes c | f,2 c'4 c |
  c2 c4 c | e2 e,4 e | f2 g | a b4 b |

  c2 a | e b'4 b | c2 g | f e4 d |
  c e f a | g2 e4 e | f f g2 | c,1 \bar "|."
}}
bassWords = \lyricmode {

}

\score {
  <<
   \new ChoirStaff <<
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic>> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"women" } \lyricsto "sopranos" \sopWords
    \new Lyrics = "altosVI"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsVI
    \new Lyrics = "altosV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsV
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women"  } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"men" } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \bassWords
  >>
%    \new PianoStaff << \new Staff { \new Voice { \pianoRH } } \new Staff { \clef "bass" \pianoLH } >>
  >>
}
\verses
