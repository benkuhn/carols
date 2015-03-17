
\version "2.14.0"
\header {
  filename = "in_the_bleak.ly"
  enteredby = "Gordon Gilbert and Ben Kuhn"
  composer = "Gustav Holst"
  poet = "Christina Rossetti"
  date="1906"
  title = "In the Bleak Midwinter"
  metre = "Cranham 6.5.6.5.D."
  meter = \metre
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Gordon Gilbert"
  maintainerEmail = "gord@angel.eicat.ca"
  lastupdated = "2012/Dec/23"
}

\include "header.ly"

global= {
  \preamble

  \time 4/4
  \key f \major
}

sop = \context Voice = "sop"    {
  \voiceOne
  \slurDashed
  a'4.( bes'8) c''4 a' g'2 f'2
  g'4.( a'8) g'4 d' g'1
  a'4. bes'8 c''4 a' g'2 f'2
  g'4 a' g'4. f'8 f'1
  bes'4. a'8 bes'4 c'' d''( d'') a'2
  c''4( a') g'( f') e'1
  a'4. bes'8 c''4 a' g'2 f'2
  g'4( a') g'4.( f'8) f'1 \bar "|."
}

alto=\context Voice = "alto"   {
  \voiceTwo
  \slurDashed
  f'4.( f'8) f'4 c' d'2 d'2
  d'4. d'8 d'4 c' bes1
  c'4. f'8 f'4 c' d'2 d'2
  f'4 f' e'4. f'8 f'1
  f'4. f'8 f'4 ees' d'( d') f'2
  f'4( e') d'( d') c'1
  c'4. f'8 f'4 c' d'2 d'2
  f'4( f') e'4. f'8 f'1
}	

tenor = \context Voice = "tenor"   {
  \voiceOne
  \slurDashed
  c'4.( c'8) c'4 f a2 a2
  g4. d8 d4 f \slurSolid f2( e2) \slurDashed
  f4. c'8 c'4 f a2 a2
  d'4 d' bes4. a8 a1
  bes4. c'8 bes4 a bes( bes) a2
  f4( c') bes( a) g1
  f4. c'8 c'4 f a2 a2
  d'4( d') bes4.( a8) a1
}

bass = \context Voice = "bass"   {
  \voiceTwo
  \slurDashed
  f4.( g8) a4 f d2 d2
  bes,4. c8 bes,4 a, \slurSolid g,2( c2) \slurDashed
  f4. g8 a4 f d2 d2
  bes,4 bes, c4. f8 f1
  d4. f8 d4 c bes,( bes,) d2
  a,4( a,) bes,( bes,) c1
  f4. g8 a4 f d2 d2
  bes,4( bes,) c4. f8 f1
}
accomp=\chordmode {
  
}



stanzaa = \lyricmode {
  \set ignoreMelismata = ##t
  In the bleak mid -- win -- ter
  Fros -- ty wind made moan,
  Earth stood hard as i -- ron,
  Wa -- ter like a stone;
  Snow had fal -- len, snow on snow,
  \unset ignoreMelismata
  Snow on snow,
  In the bleak mid -- win -- ter
  Long a -- go.
}

stanzab = \lyricmode {
  \set ignoreMelismata = ##t
  Christ a home -- less strang -- er,
  So the gos -- pels say,
  Cra -- dled in a man -- ger
  And a bed of hay;
  \unset ignoreMelismata
  In the bleak mid -- win -- ter
  \set ignoreMelismata = ##t
  Sta -- ble -- place suf -- ficed
  \unset ignoreMelismata
  Ma -- ry and her ba -- by,
  Je -- sus Christ.
}
stanzac = \lyricmode {
  \set ignoreMelismata = ##t
  Once more child and moth -- er
  Weave their mag -- ic spell,
  Touch -- ing hearts with won -- der
  Words can nev -- er tell.
  \unset ignoreMelismata
  In the bleak mid -- win -- ter,
  \set ignoreMelismata = ##t
  In this world of pain,
  Where our hearts are o -- pen
  Love is born a -- gain.
}	
stanzad = \lyricmode {
  What can I give him,
  Poor as I am?
  \set ignoreMelismata = ##t
  If I were a shep -- herd
  I would bring a lamb,
  \unset ignoreMelismata
  If I were a wise man
  \set ignoreMelismata = ##t
  I would do my part,
  Yet what can I give him?
  I can give my heart.
}

\score {
  \context ChoirStaff <<
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