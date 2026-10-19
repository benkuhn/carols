\version "2.24.0"
\include "header.ly"
\header {
  title = "El Noi de la Mare"
  poet = "Traditional Catalan"
  composer = "Traditional Catalan"
  arranger = "arr. Ben Kuhn"
}
global = {
  \key c \major
  \time 3/4
}

sopMusic = \relative c' {
  e4. f8 g4 | g4. a8 b4 | c4. b8 a4 | a2 g4 |
  e4. f8 g4 | g4. a8 b4 | c4. b8 a4 | g2.   |
  e4. f8 g4 | g4. f8 e4 | d4. c8 d4 | e2 c4 |
  e4. f8 g4 | g4. f8 e4 | d4. e8 d4 | c2.   |
  e4. f8 g4 | g4. f8 e4 | d4. c8 d4 | e2 c4 |
  e4. f8 g4 | g4. f8 e4 | d4. e8 d4 | c2.   \bar "|."
}

altoMusic = \relative c' {
  c4. d8 e4 | d4. d8 d4 | e4. d8 c4 | c2 b4 |
  c4. d8 e4 | d4. d8 d4 | e4. d8 c4 | b2.   |
  c4. c8 c4 | b4. b8 c4 | c4. c8 b4 | c2 c4 |
  b4. b8 b4 | c4. c8 c4 | c4. c8 b4 | c2.   |
  c4. d8 e4 | b4. b8 c4 | c4. c8 b4 | b2 c4 |
  c4. d8 e4 | b4. b8 c4 | c4. c8 b4 | c2.   |
}
altoWords = {
  \lyricmode {
    \set stanza = #"1. "
    Què li da -- rem an el Noi de la Ma -- re,
    Què li da -- rem que li sà -- pi -- ga bo?
    Li da -- rem pan -- ses amb un -- es ba -- lan -- ces,
    Li da -- rem fi -- gues amb un pa -- ne -- ró.
    Li da -- rem pan -- ses amb un -- es ba -- lan -- ces,
    Li da -- rem fi -- gues amb un pa -- ne -- ró.
  }
}
altoWordsII = \lyricmode {
  \set stanza = #"2. "
  Què li da -- rem al Fi -- llet de Ma -- ri -- a?
  Què li da -- rem al for -- mós In -- fan -- tó?
  Pan -- ses i fi -- gues i nous i o -- li -- ves,
  Pan -- ses i fi -- gues i mel i ma -- tó.
  Pan -- ses i fi -- gues i nous i o -- li -- ves,
  Pan -- ses i fi -- gues i mel i ma -- tó.
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  Què li da -- rem que les fi -- gues són ver -- des,
  Què li da -- rem que ja ma -- du -- ra -- ran.
  Si no ma -- du -- ren el di -- a de Pa -- squa,
  ma -- du -- ra -- ran en el di -- a del Ram.
  Si no ma -- du -- ren el di -- a de Pa -- squa,
  ma -- du -- ra -- ran en el di -- a del Ram.
}

tenorMusic = \relative c' {
  g4. g8 g4 | g4. g8 g4 | a4. d,8 d4 | d2 g4 |
  g4. g8 g4 | g4. g8 g4 | a4. a8 fis4 | g2.  |
  g4. g8 g4 | g4. g8 g4 | a4. a8 g4 | g2 g4  |
  g4. g8 g4 | a4. a8 a4 | a4. a8 gis4 | a2.  |
  g4. c8 c4 | g4. g8 a4 | a4. a8 g4 | gis2 a4 |
  g4. c8 c4 | g4. g8 a4 | a4. a8 g f | e2.   |
}

bassMusic = \relative c {
  c4. c8 c4 | b4. b8 b4 | a4. a8 a4 | g2 g4 |
  c4. c8 c4 | b4. b8 b4 | a4. a8 d4 | g,2.   |
  c4. d8 e4 | e4. d8 c4 | f4. d8 g4 | c,2 c4 |
  c4. d8 e4 | a,4. a8 f'4 | f4. d8 e4 | a,2. |
  g4. g8 g4 | e4. e8 a4 | f4. d8 g f | e2 a4 |
  g4. g8 g4 | e4. e8 a4 | f4. d8 g4 | <g c,>2. |
}

\score {
  \transpose c ees <<
   \new ChoirStaff <<
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
  >>
  >>
}
