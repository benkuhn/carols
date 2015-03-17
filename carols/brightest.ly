\header {
  filename = "brightest.ly"
  enteredby = "Ben Kuhn"
  composer = "James P. Harding"
  arranger = ""
  poet = "Reginald Heber, 1811"
  date ="1830"
  title = "Brightest and Best"
  metre = "Morning Star 11.10.11.10. with Refrain"
  meter = \metre
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Ben Kuhn"
  maintainerEmail = "gord@angel.eicat.ca"
  lastupdated = "2012/Dec/24"
}

\version "2.14.2"

\include "header.ly"

global= {
  \preamble
  \time 4/4
  \key a \minor
  #(set-global-staff-size 12)
}

sop = \context Voice = "sop"    {
  \voiceOne
  \stemNeutral
  \sacredHarpHeadsMinor
  a'2 e''4 e'' e''2 a'4 a' c''2 c''4 e'' b' (a') b'2
  d''2 c''4 d'' e''2 e''4 f'' e''2 b'4 b' a'1
  a'2 e''4 e'' e''2 a'4 a' c''2 c''4 e'' b' (a') b'2
  d''2 c''4 d'' e''2 e''4 f'' e''2 b'4 b' a'1
  
  e''2 c''4 a' b'2 g'4 g' d''4. (e''8) d''4 b' e''2 e''
  d''2 c''4 a' b'2 g'4 b'4 d''2 d''4 f'' e''1
  a'2 c''4 c'' d''2 e''4 e'' c''2 c''4 a' g' (a') b'2
  a' c''4 d'' e''2 e''4 f'' e''2 b'4 b' a'1
  \bar "|."
}

alto=\context Voice = "alto"   {
  \voiceTwo
  \stemNeutral
  \sacredHarpHeadsMinor
  a'2 a'4 b' a'2 e'4 e' g'2 g'4 a' g' (f') e'2
  a'2 c''4 a' b'2 e'4 d' e'2 g'4 g' a'1
  a'2 a'4 b' a'2 e'4 e' g'2 g'4 a' g' (f') e'2
  a'2 c''4 a' b'2 e'4 d' e'2 g'4 g' a'1
  
  a'2 c''4 d'' e''2 d''4 c'' d''4. (c''8) d''4 e'' c''2 a'
  a'2 c''4 d'' e''2 d''4 c'' d''4. (c''8) d''4 c'' b'1
  e''2 e''4 c'' a'2 e'4 e' g'2 g'4 a' g'4 (f') e'2
  a'2 c''4 a' b'2 e'4 d' e'2 g'4 g' a'1
}	

tenor = \context Voice = "tenor"   {
  \voiceThree
  \stemNeutral
  \sacredHarpHeadsMinor
  a2 a4 e a,2 a,4 a, c2 c4 a, e2 e
  d c4 a, e2 e4 f e2 e4 e a,1
  a2 a4 e a,2 a,4 a, c2 c4 a, e2 e
  d c4 a, e2 e4 f e2 e4 e a,1
  
  a2 g4 g e2 g4 g g2 g4 e a2 a
  a2 g4 g e2 g4 e4 d2 d4 f e1
  a2 a4 a a2 a,4 a, c2 c4 a,4 e2
  e d2 c4 a, e2 e4 f e2 e4 e a,1
}

bass = \context Voice = "bass"   {
  \voiceTwo
}

accomp=\chordmode {
  
}



stanzaa = \lyricmode {
  Hail the blest morn! See the great Me -- di -- a -- tor,
  Down from the re -- gions of glo -- ry des -- cend!
  Shep -- herds, go wor -- ship the babe in the man -- ger,
  Lo, for his guard the bright an -- gels at -- tend.
  
  Bright -- est and best of the sons of the morn -- ing!
  Dawn on our dark -- ness, and lend us thine aid;
  Star in the east, the ho -- ri -- zon a -- dorn -- ing,
  Guide where our in -- fant Re -- dee -- mer was laid.
}
stanzab = \lyricmode {
  Cold on his crad -- le the dew -- drops are shin -- ing;
  Low lies his bed, with the beasts of the stall;
  An -- gels a -- dore him, in slum -- bers rec -- lin -- ing,
  Wise men and shep -- herds be -- fore him do fall.
}
stanzac = \lyricmode {
  Say, shall we yield him, in cost -- ly de -- vo -- tion,
  O -- dours of E -- den, and of -- f'rings di -- vine,
  Gems from the moun -- tain, and pearls from the o -- cean,
  Myrrh from the fo -- rest, and gold from the mine?

  Bright -- est and best of the sons of the morn -- ing!
  Dawn on our dark -- ness, and lend us thine aid;
  Star in the east, the ho -- ri -- zon a -- dorn -- ing,
  Guide where our in -- fant Re -- dee -- mer was laid.
}
stanzad = \lyricmode {
  Vain -- ly we of -- fer each am -- ple o -- bla -- tion,
  Vain -- ly with gold we his fa -- vour se -- cure;
  Rich -- er by far is the heart's a -- do -- ra -- tion:
  Dear -- er to God are the pray'rs of the poor.
}
stanzae = \lyricmode {
  
}
stanzaf = \lyricmode {
  
}

\score {
  \context ChoirStaff <<
    \context ChordNames \accomp
    \unset ChoirStaff.melismaBusyProperties 
    \context Staff ="sopStaff"  { \clef "G" <<
      \global
      \sop
    >>}

    \lyricsto "sop" \context Lyrics = "stanza-1" {
      \set stanza = "1."
      \stanzaa }
    \lyricsto "sop" \context Lyrics = "stanza-2" {
      \set stanza = "2."
      \stanzab }
    
    \context Staff ="altoStaff"  { \clef "G" <<
      \global
      \alto
    >>}

    \lyricsto "sop" \context Lyrics = "stanza-3" {
      \set stanza = "3."
      \stanzac }
    \lyricsto "sop" \context Lyrics = "stanza-4" {
      \set stanza = "4."
      \stanzad }
    
    \context Staff = "tenorStaff"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
  \layout{
    indent = 0.0\pt
    \context {
      \ChordNames
      \override ChordName  #'style = #'american
      chordChanges = ##t
    }
  }
}
