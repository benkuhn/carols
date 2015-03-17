\version "2.14.2"
\include "header.ly"
\header {
  title = "The First Noël"
  poet = "Traditional"
  composer = "18th Century French Melody"
  arranger = "harm. by John Stainer"
}
global = {
  \preamble
  \key d \major
  \time 3/4
  \autoBeamOff
}

sopMusic = \relative c' {
  \partial 4 fis8[^\mf e] |
  d4.( e8) fis[ g] |
  a2 b8[ cis] |
  \slurDotted d4( cis) b |
  a2 b8\noBeam( cis) |
  d4( cis) b |
  
  a( b) cis |
  d( a) g |
  fis2 \slurSolid fis8[ e] |
  d4.( e8) \slurDotted fis8\noBeam( g) |
  \slurSolid a2 b8[ cis] |
  
  \slurDotted d4( cis) b |
  a2 b8\noBeam( cis) |
  d4( cis) b |
  a( b) cis |
  \slurSolid d( a) g |
  fis2 \bar "||" \break
  
  fis8[ e] |
  d4.( e8) fis[ g] |
  a2 d8[ cis] |
  b2 b4 |
  a2. |
  d4 cis b |
  a( b) cis |
  d( a) g |
  fis2 \bar "|."
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c' {
  d4 |
  a2 d4 |
  e2 e4 |
  \slurDotted a4( a) g |
  fis2 d8\noBeam( e) |
  a4( fis) g |
  
  a( d,) g |
  fis( fis) e |
  d2 cis4 |
  a2 d8\noBeam( d) |
  e2 e4 |
  
  a4( a) g |
  fis2 d8\noBeam( e) |
  a4( fis) g |
  a( g) g |
  fis2 e4 |
  d2
  
  cis4 |
  a2 d4 |
  cis2 fis4 |
  g2 g4 |
  \slurSolid fis2( a4) |
  fis4 fis g |
  fis2 g4 |
  fis2 e4 |
  d2 \bar "|."
}
altoWords = {
  \lyricmode {
    \set stanza = #"1. "
    The first No -- ël the
    \set ignoreMelismata = ##t
    an -- gel did say,
    Was to cer -- tain poor shep -- herds in fields as they lay;
    \unset ignoreMelismata
    
    In fields where they lay
    \set ignoreMelismata = ##t
    
    keep -- ing their sheep
    On a cold win -- ter’s night _ that was _ so deep.
    \unset ignoreMelismata
  }
  \lyricmode {
    No -- ël, No -- ël, No -- ël,
    \set associatedVoice = "altos"
    No -- ël,
    \unset associatedVoice
    Born is the King of Is -- ra -- el.
  }
}
altoWordsII = \lyricmode {
  \set stanza = #"2. "
  They look -- ed up and
  \set ignoreMelismata = ##t
  saw _ a Star
  Shin -- ing in _ the East _ be -- yond _ them far,
  \unset ignoreMelismata
  
  And to the earth it
  \set ignoreMelismata = ##t
  
  gave _ great light,
  And _ so it con -- tin -- ued both day _ and night.
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  And by

  the light of that same Star
  Three wise men came from coun -- try far;
  To seek 
\set ignoreMelismata = ##t
  for a King
\unset ignoreMelismata
  was their

  in -- tent,
\set ignoreMelismata = ##t
  And to fol -- low the star _ where e’er _ it went.
}
altoWordsIV = \lyricmode {
  \set stanza = #"4. "
  This star drew nigh to 
  \set ignoreMelismata = ##t
  the _ North West,
  O’er

  _ Beth -- _ le -- hem _ it took _ its rest,
  \unset ignoreMelismata
  
  And there it did both
  \set ignoreMelismata = ##t
  
  stop _ and stay
  Right _ o -- ver the place _ where Je -- _ sus lay.
}
altoWordsV = \lyricmode {
  \set stanza = #"5. "
  Then en -- ter’d in those
  \set ignoreMelismata = ##t
  Wise -- _ men three,
  Full _ rev -- _ ’rent -- ly _ on bend -- _ ed knee,
  \unset ignoreMelismata
  
  And of -- fer’d

  there in
  \set ignoreMelismata = ##t
  
  His _ pres -- ence,
  Their _ gold _ and myrrh _ and frank -- _ in -- cense.
}
altoWordsVI = \lyricmode {
  \set stanza = #"6. "
  Then let us all with one ac -- cord,
  Sing prais -- es to our
\set ignoreMelismata = ##t
  Heav -- en -- ly Lord,
\unset ignoreMelismata
  That hath made Heav’n and earth of naught,
  And with His Blood man -- kind hath bought.
}

tenorMusic = \relative c' {
  a8[ g] |
  fis2 d'4 |
  cis2 b4 |
  \slurDotted a4( a) \slurSolid b8[ cis] |
  d2 \slurDotted b8\noBeam( a) |
  a4( a) cis |
  
  d( b) g |
  a( d) a |
  a2 \slurSolid a8[ g] |
  fis2 \slurDotted d'8\noBeam( d) |
  \slurSolid d4( cis) b |
  
  \slurDotted a( a) \slurSolid b8[ cis] |
  d2 \slurDotted b8\noBeam( a) |
  a4( a) cis |
  d4( d) e |
  \slurSolid a,( d) a |
  a2
  
  a8[ g] |
  fis2 b4 |
  a2 a4 |
  b4.( cis8) d[ e] |
  fis2( e4) |
  d d d |
  d2 g,4 |
  a2 a4 |
  a2 \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  d4 |
  d2 b4 |
  a( a') g |
  \slurDotted fis( fis) g |
  d2 g8\noBeam( g) |
  fis4( d) e |
  
  fis( g) e |
  fis8[( g] a4) a |
  d,2 a4 |
  d2 b8\noBeam( b) |
  \slurSolid a4( a') g |
  
  \slurDotted fis( fis) g |
  d2 g8\noBeam( g) |
  fis4( d) e |
  fis( g) e |
  \slurSolid fis8[( g] a4) a, |
  d2
  
  a4 |
  d2 b4 |
  fis'2 d4 |
  g4.( a8) b[ cis] |
  d2( cis4) |
  b a g |
  d'( d,) e |
  fis8[( g] a4) a, |
  d2 \bar "|."
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
     %\new Lyrics = "altosVI"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsVI
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