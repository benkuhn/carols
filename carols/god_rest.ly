\header {
  filename = "god_rest.ly"
  enteredby = "Gordon Gilbert and Ben Kuhn"
  composer = "London Melody, 18th Cent."
  arranger = "Sir John Stainer"
  poet = "London Carol"
  date=""
  title = "God Rest Ye Merry, Gentlemen"
  metre = "God Rest Ye Merry 7 6. 7 6. 7 6. with Refrain"
  meter = \metre
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Gordon Gilbert"
  maintainerEmail = "gord@angel.eicat.ca"
  lastupdated = "2012/Dec/23"
}

\version "2.14.2"

\include "header.ly"

global = {
  \preamble
  \time 4/4
  \key e \minor
  
  \partial 4
}

sop = \context Voice = "sop"    {
  \voiceOne
  \relative c' {
    \slurDotted
    e4 |
    e b' b a |
    g( fis) e d |
    e fis g a |
    b2.
    %\bar""\break
    e,4 |
    
    e b' b a |
    g( fis) e d |
    e fis g a |
    b2 b4 \rest
    %\bar""\break
    b |
    
    c a b c |
    d( e) b a |
    g e fis g |
    a2
    %\bar "||" \break
    
    \slurSolid
    g4( a) |
    b2 c4 b |
    b( a) g fis |
    e2 g8\noBeam fis e4 |
    a2 g4( a) |
    b( c) d e |
    b( a) g fis |
    e2. \bar "|." % \break
  }
}

alto=\context Voice = "alto"   {
  \voiceTwo 
  \relative c' {
    e4 |
    e g fis dis |
    \slurDotted e( d) c b |
    \slurSolid e dis e e |
    dis2. e4 |
    
    e g fis dis |
    \slurDotted e( d) c b |
    \slurSolid
    e dis e e |
    dis2 s4 e |
    
    e d d g |
    \slurDotted f( e) d dis |
    \slurSolid
    e cis d g |
    fis2
    
    g4( d) |
    d2 e4 d |
    g( fis) e dis
    e2 b8\noBeam b cis4 |
    d2 e4( fis) |
    g2 g4 g |
    g( fis) e dis |
    e2.
  }
}	

tenor = \context Voice = "tenor"   {
  \voiceOne
  \relative c' {
    e,4 |
    g e fis b |
    \slurDotted b( b) g g |
    \slurSolid
    g b b e, |
    fis2. e4 |
    
    g e fis b |
    \slurDotted b( b) g g |
    \slurSolid
    g b b e, |
    fis2 s4 gis |
    
    a a g g |
    \slurDotted g( g) g fis |
    \slurSolid
    g g a d |
    d( c)
    
    b( a) |
    g2 g4 g |
    d'( c) b b |
    g2 g8\noBeam g g4 |
    fis( a) d( c) |
    b( g) d' c |
    d( c) b b |
    g2.
  }
}

bass = \context Voice = "bass"   {
  \voiceTwo
  \relative c' {
    e,4 |
    e e dis b |
    \slurDotted e( b) c g |
    \slurSolid
    c b e c |
    b2. e4 |
    
    e e dis b |
    \slurDotted e( b) c g |
    \slurSolid
    c b e c |
    b2 d4\rest e |
    
    a fis g e |
    \slurDotted b( c) g b |
    \slurSolid
    e e d b |
    d2
    
    e4( fis) |
    g2 c,4 g' |
    g,( a) b b |
    e2 e8\noBeam e e4 |
    d( c) b( a) |
    g( e') b c |
    g( a) b b |
    e2.
  }
}

accomp=\chordmode {
  
}

stanzaa = \lyricmode {
  \set ignoreMelismata = ##t
  God rest ye mer -- ry, gen -- tle -- men, 
  \unset ignoreMelismata
  Let no -- thing you dis -- may,
  Re -- mem -- ber Christ our Sav -- iour 
  Was born on Christ -- mas Day;
  \set ignoreMelismata = ##t
  To save us all from Sa -- tan's pow'r
  When we were gone a -- stray.
  \unset ignoreMelismata
  O ti -- dings of com -- fort and joy,
  Com -- fort and joy;
  O ti -- dings of com -- fort and joy!
}

stanzab = \lyricmode {
  In Beth -- le -- hem, in Jew -- ry,
  This bless -- ed Babe was born,
  And laid with -- in a man -- ger
  Up -- on this bless -- ed morn;
  The which his moth -- er Ma -- ry
  Did noth -- ing take in scorn.
}

stanzac = \lyricmode {
  From God our heav'n -- ly Fa -- ther 
  A bles -- sed an -- gel came;
  And un -- to cer -- tain shep -- herds 
  Brought ti -- dings of the same;
  \set ignoreMelismata = ##t
  How that in Beth -- le -- hem was born
  The Son of God by name.
}

stanzad = \lyricmode {
  The shep -- herds at those ti -- dings,
  Re -- joic -- ed much in mind,
  And left their flocks a -- feed -- ing,
  In tem -- pest, storm, and wind,
  \set ignoreMelismata = ##t
  And went to Beth -- le -- hem strait -- way,
  The Son of God to find.
}


\score {
  \context ChoirStaff <<
    \context ChordNames \accomp
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
    \lyricsto "sop" \context Lyrics = "stanza-4" {
      \set stanza = "4."
      \stanzad }
    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
