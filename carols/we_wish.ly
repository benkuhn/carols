\version "2.14.2"
\include "header.ly"
\header {
  title = "We Wish You a Merry Christmas"
  poet = "Traditional"
  composer = "English Folk Song"
}
global = {
  \preamble
  \key aes \major
  \time 3/4
  \autoBeamOff
}

sopMusic = \relative c' {
  \partial 4 ees4 |
  aes4 aes8\noBeam bes aes\noBeam g |
  f4 f f |
  bes bes8\noBeam c bes\noBeam aes |
  g4 ees ees |
  
  c' c8\noBeam des c\noBeam bes |
  \slurDotted aes4 f ees8\noBeam( ees) |
  f4 bes g |
  aes2^\markup\italic"Fine" \bar "||" \break
  ees4 |
  aes aes aes |
  
  g2 g4 |
  aes g f |
  ees2 bes'4 |
  c bes aes |
  ees' ees, ees8\noBeam ees |
  f4 bes g |
  aes2 \bar "|."
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c' {
  ees4 |
  c c8\noBeam c c\noBeam c |
  des4 des ees |
  d d8\noBeam d d\noBeam d |
  ees4 ees ees |
  
  e e8\noBeam e e\noBeam e |
  \slurDotted f4 c ees8\noBeam( ees) |
  des4 f ees |
  ees2 \bar "||"
  c4 |
  ees4 ees ees |
  
  ees2 ees4 |
  d4 d d |
  ees2 ees4 |
  ees des c |
  ees ees ees8\noBeam ees |
  des4 f ees |
  ees2 \bar "|."
}
altoWords = \lyricmode {
  \set stanza = #"1, 4. "
  \set ignoreMelismata = ##t
  We wish you a Mer -- ry Christ -- mas,
  We wish you a Mer -- ry Christ -- mas,
  We wish you a Mer -- ry Christ -- mas,
  And a hap -- py New Year!
}
altoWordsII = {
  \set stanza = "2. "
  \lyricmode {
                                %\markup\italic
    \set ignoreMelismata = ##t
    Oh, bring us a fig -- gy pud -- ding,
    Oh, bring us a fig -- gy pud -- ding,
    Oh, bring us a fig -- gy pud -- ding,
    and a cup of good cheer.
    Good ti -- dings to you wher -- ev -- er you are;
    Good ti -- dings for Christ -- mas and a hap -- py New Year!
  }
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  \set ignoreMelismata = ##t
  We won’t go un -- til we get some,
  We won’t go un -- til we get some,
  We won’t go un -- til we get some,
  so _ bring it right here.
}
altoWordsIV = \lyricmode {
  \set stanza = #"4. "
}
altoWordsV = \lyricmode {
  \set stanza = #"5. "
}
altoWordsVI = \lyricmode {
  \set stanza = #"6. "
}
tenorMusic = \relative c {
  ees4 |
  ees4 ees8\noBeam ees aes\noBeam aes |
  aes4 aes a |
  bes f8\noBeam aes g\noBeam f |
  ees4 g g |
  
  g g8\noBeam g c\noBeam c |
  \slurDotted c4 aes aes8\noBeam( aes) |
  aes4 des des |
  c2_\markup\italic"Fine" \bar "||"
  aes4 |
  c c c |
  
  bes2 bes4 |
  bes bes aes |
  g2 g4 |
  aes aes aes |
  aes aes aes8\noBeam aes |
  aes4 des des |
  c2 \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  ees4 |
  aes, aes8\noBeam aes aes\noBeam aes |
  des4 des c |
  bes bes8\noBeam bes bes\noBeam bes |
  ees4 ees des |
  
  c c8\noBeam c c\noBeam c |
  \slurDotted f4 f c8\noBeam( c) |
  des4 bes ees |
  aes2 \bar "||"
  aes4 |
  aes, aes aes |
  
  bes2 bes4 |
  bes bes bes |
  ees2 ees4 |
  aes, aes aes |
  c c c8\noBeam c |
  des4 bes ees |
  aes2 \bar "|."
}
bassWords = \lyricmode {

}

pianoRH = \relative c' {
  
}
pianoLH = \relative c' {
  
}

\score {
  \transpose aes g
  <<
    \new ChoirStaff <<
      \new Staff = women <<
        \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
        \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
      >>
      \new Lyrics \with { alignAboveContext = #"women" } \lyricsto "sopranos" \sopWords
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
      \new Lyrics \with { alignAboveContext = #"men" } \lyricsto "tenors" \tenorWords
      \new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \bassWords
    >>
  >>
}
