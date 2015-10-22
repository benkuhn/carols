\version "2.14.2"
\include "header.ly"

\header {
  title = "The Boar’s Head Carol"
  poet = "15th Century English"
  composer = "Traditional English"
  tagline = ""
}
global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  %\mergeDifferentlyDottedOn
}

sopMusic = \relative c'' {
  \partial 4 g4 |
  \slurDotted c4( c) c4( c8) c8 |
  b4 c g4 \parenthesize e8\noBeam e |
  
  f4 f a4. f8 |
  g4. g8 c4 \bar""\break g8\noBeam( g) |
  c4 c8\noBeam( c) c4 c |
  
  b c g4. e8 |
  f4 f a4. f8 |
  g4. g8 c2 | \break
  
  \repeat volta 2 {
    c4. c8 b4 b |
    c c g2 |
    f4 f a4. f8 |
    g4. g8 c4
  }
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c' {
  e4 |
  \slurDotted e( e) e4( e8) e8 |
  g4 g e4 e8\noBeam e |
  
  f4 f f4. c8 |
  \slurSolid f8[ e] d4 e \slurDotted e8\noBeam( e) |
  e4 e8\noBeam( e) e4 e |
  
  g g e4. e8 |
  f4 f f4. c8 |
  \slurSolid f[ e] d4 e2 |
  
  e4. e8 d4 d |
  e e d2 |
  c4 c c4. d8 |
  \slurSolid d[ e] f4 e |
}
altoWords = {
  \lyricmode {
    \set stanza = #"1."
    \set ignoreMelismata = ##t
    The boar’s _ head _ in hand bear I "" Be -- decked with bays and rose -- ma -- ry;
    \set associatedVoice = "basses"
    And I pray you my mas -- ters mer -- ry be;
    \lyricItal Quot _ es -- tis _ in con -- vi -- vi -- o. \lyricNormal
  }
  \lyricmode {
    \unset ignoreMelismata
    \lyricItal
    Ca -- put a -- pri de -- fe -- ro
    \set associatedVoice = "tenors"
    Red -- dens
    \set associatedVoice = "basses"
    lau -- des Do -- mi -- no.
    \lyricNormal
  }
}
altoWordsII = {
  \set stanza = "2."
  \lyricmode {
    \set ignoreMelismata = ##t
    The boar’s _ head as I un -- der -- stand Is the rar -- est dish in all this land,
    \set associatedVoice = "basses"
    Which is thus be -- _ decked with_a gay gar -- land,
    Let _ us
    \lyricItal ser -- _ vi -- re can -- ti -- co. \lyricNormal
  }
}
altoWordsIII = \lyricmode {
  \set stanza = #"3."
  \set ignoreMelismata = ##t
  Our stew -- ard hath _ pro -- vid -- ed this
  "" In hon -- or of the King of bliss,
  \set associatedVoice = "basses"
  Which _ on this __ _ day to_be serv -- ed is,
  \lyricItal In _ Re -- gi -- _ nen -- si a -- tri -- o. \lyricNormal
}
altoWordsIV = \lyricmode {
}
altoWordsV = \lyricmode {
}
altoWordsVI = \lyricmode {
}
tenorMusic = \relative c' {
  c4 |
  \slurDotted g( g) g4( g8) g8 |
  d'4 e c4 c8\noBeam c |
  
  c4 c c4. a8 |
  c4 b c c8\noBeam( c) |
  g4 g8\noBeam( g) g4 g |
  
  d' e c4. c8 |
  c4 c c4. a8 |
  c4 b c2 |
  
  g4. g8 g4 g |
  g a \slurSolid c( b) |
  a a a4. a8 |
  c4 b c |
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  c4 |
  \slurDotted c( c) c4( c8) c8 |
  g'4 c, c4 c'8\noBeam( bes) |
  
  a4 \slurSolid a8[ g] f4. f8 |
  g4 g c, \slurDotted c8\noBeam( c) |
  c4 c8\noBeam( c) c4 c |
  
  g' c, c'4 c8[ bes] |
  a4 \slurSolid a8[ g] f4 f |
  g4 g c,2 |
  
  c4. c8 g'4 g |
  c, a' g2 |
  a4 a8[ g] f[ e] d4 |
  g4 g, c |
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
    \new Lyrics = "altosVI"  \with { alignBelowContext = #"women" } \lyricsto "tenors" \altoWordsVI
    \new Lyrics = "altosV"  \with { alignBelowContext = #"women" } \lyricsto "tenors" \altoWordsV
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "tenors" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "tenors" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "tenors" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "tenors" \altoWords
    \new Lyrics \with { alignAboveContext = #"men" } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \bassWords
  >>
%    \new PianoStaff << \new Staff { \new Voice { \pianoRH } } \new Staff { \clef "bass" \pianoLH } >>
  >>
}
