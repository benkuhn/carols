\version "2.14.2"
\include "header.ly"

\header {
  title = "We Three Kings of Orient Are"
  composer = "John H. Hopkins (1820–1891)"
  poet = "John H. Hopkins (1820–1891)"
}

global = {
  \key g \major
  \time 3/8
  \autoBeamOff
}

sopMusic = \relative c' {
  b'4 a8 g4 e8 |
  fis8\noBeam g fis |
  
  e4 b'8\rest |
  b4 a8 g4 e8 |
  \slurDotted fis8\noBeam( g) fis |
  e4 b'8\rest |
  g4 g8 |
  
  a4 a8 |
  b4 b8 |
  \slurSolid d[ c] b |
  \slurDotted a8\noBeam( b\noBeam) a |
  g4 fis8 |
  e4. | \break
  
  \slurSolid << {fis4\fermata( a8\fermata)} {s8 s32 s16. s8}>> |
  g4^\markup\italic"a tempo" g8 | g4 d8 g4 e8 | g4 b8\rest |
  g4 g8 | g4 d8 g4 e8 | g4 b8\rest |
  g4 g8 a4 b8 | c4 b8 a4 b8 |
  g4 g8 g4 d8 g4 e8 g4.\fermata \bar "|."
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c'' {
  g4 fis8 e4 e8 dis8\noBeam dis\noBeam dis |
  
  \slurDotted e4 s8 | g4 fis8 e4 e8 | dis8\noBeam( e\noBeam) dis |
  e4 s8 | e4 e8 |
  
  fis4 fis8 | g4 g8 |
  \slurSolid g[ fis] g |
  \slurDotted fis8\noBeam( g\noBeam) fis |
  e4 dis8 |
  e4. |
  
  d4. | d4 d8 d4 b8 b4 e8 d4 s8 |
  d4 d8 d4 b8 b4 e8 d4 s8 |
  
  e4 e8 fis4 g8 g4 g8 fis4 g8 d4 d8 b4 d8 |
  e4 c8 | d4. \bar "|."
}
altoWords = {
  \lyricmode {
    \set ignoreMelismata = ##t
    \set stanza = #"1. "
    We three kings of O -- ri -- ent are;
    Bear -- ing gifts we tra -- verse a -- far,
    Field and foun -- tain, moor and moun -- _ tain,
    Fol -- low -- ing yon -- der star.
    
    O __ _ 
  }
  \lyricmode {
    Star of won -- der, star of night,
    Star with roy -- al beau -- ty bright,
    West -- ward lead -- ing, still pro -- ceed -- ing,
    Guide us to Thy per -- fect light.
  }
}
altoWordsII = \lyricmode {
  \set ignoreMelismata = ##t
  \set stanza = #"2. "
  Born a King on Beth -- le -- hem’s plain,
  Gold I bring, to crown Him a -- gain,
  King for -- ev -- er, ceas -- ing nev -- _ er,
  O -- ver us all to reign.
}
altoWordsIII = {
  \lyricmode {
    \set ignoreMelismata = ##t
    \set stanza = #"3. "
    Frank -- in -- cense to of -- fer have I,
    In -- cense owns a De -- i -- ty nigh,
    Pray’r and prais -- ing, all men rais -- _ ing
    Wor -- ship Him, God most High.
  }
}
altoWordsIV = \lyricmode {
  \set ignoreMelismata = ##t
  \set stanza = #"4. "
  Myrrh is mine, its bit -- ter per -- fume,
  Breathes a life of gath -- er -- ing gloom;
  Sor -- rowing, sigh -- ing, bleed -- ing, dy -- _ ing,
  Seal’d in the stone -- cold tomb.
}
altoWordsV = \lyricmode {
  \set ignoreMelismata = ##t
  \set stanza = #"5. "
  Glo -- rious now be -- hold Him a -- rise,
  King and God and Sac -- _ ri -- fice,
  Al -- le -- lu -- ia, Al -- le -- lu -- _ ia,
  Earth _ to heav’n re -- plies.
}

tenorMusic = \relative c' {
  b4 b8 | b4 g8 | a8\noBeam b\noBeam a |
  
  \slurDotted g4 s8 | b4 b8 | b4 g8 | a8\noBeam( b\noBeam) a |
  g4 s8 | b4 b8 |
  
  d4 d8 | d4 d8 | \slurSolid b8[ c] d |
  \slurDotted c8\noBeam( c) c |
  b4 a8 | g4. |
  
  \slurSolid
  << a4\fermata( {s8 s32 s16.}>> c8\fermata) |
  b4 b8 b4 g8 g4 c8 b4 s8 |
  b4 b8 b4 g8 g4 c8 b4 s8 |
  
  b4 b8 d4 d8 e4 d8 | d4 d8 b4 b8 g4 g8 g4 c8 b4. \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  e4 e8 e4 e8 | b\noBeam b\noBeam b |
  
  \slurDotted e4 d8\rest | e4 e8 e4 e8 | b\noBeam( b\noBeam) b |
  e4 d8\rest | e4 e8 |
  
  d4 d8 | g4 g8 |
  \slurSolid b8[ a] g |
  \slurDotted a\noBeam( a) a |
  b4 b,8 | e4. |
  
  d4.\fermata | g4 g8 g4 g8 e4 c8 g'4 d8\rest |
  g4 g8 g4 g8 e4 c8 g'4 d8\rest |
  
  e4 e8 d4 g8 | c,4 g'8 | d4 g8 | g4 g8 | g4 b,8 |
  c4 c8 g4.\fermata \bar "|."
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
  >>
}
