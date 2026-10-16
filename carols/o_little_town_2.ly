\version "2.24.0"

\header {
  composer = "Trad. English Melody"
    arranger = "arr. Ralph Vaughan Williams"
  poet = "Bishop Phillips Brooks, 1868"
  title = "O Little Town of Bethlehem"
  meter = "Forest Green 8.6.8.6.7.6.8.6."
  mutopiacomposer = \composer
  mutopiapoet=\poet
}

\include "header.ly"

global= {
  \time 4/4
    \key g \major

     \partial 4
}

sop = \context Voice = "sop"    {
  \voiceOne
  d'4 g' g' g' a' b'8( a') b'( c'') d''4
  b' c'' b'8( g') a'4 a' g'2.
  d'4 g' g' g' a' b'8( a') b'( c'') d''4
  b' c'' b'8( g') a'4 a' g'2.
  g'8( b') d''4. e''8 d''( c'') b'( a') g'( a' b' c'') d''4
  d'4 g' b' a' g' d'2.
  d'4 g' g' g' a' b'8( a') b'( c'') d''4
  b'4 c'' b'8( g') a'4 a' g'2. \bar "|."

}

alto=\context Voice = "alto"   {
  \voiceTwo
  d'4 d' e' d' e'8( fis') g'4 g' fis'
  e' e' g' g' fis' g'2.
  d'4 d' e' d' e'8( fis') g'4 g' fis'
  e' e' g' g' fis' g'2.
  g'4 fis'4. e'8 fis'4 d' d'( g') fis'
  d'4 d' d' c' b8( c') d'2.
  d'4 d' e' d' e'8( fis') g'4 g' fis'
  e' e' g' g' fis' g'2.
}

tenor = \context Voice = "tenor"   {
  \voiceOne
  a4 b c' d' c' d' g a
  g c' d' e' d'8( c') b2.
  a4 b c' d' c' d' g a
  g c' d' e' d'8( c') b2.
  b4 b4. g8 d'4 d'8( c') b4( g) a
  fis4 g g e8( fis) g4 fis2.
  g8( a) b4 c' d' c' d' g a
  g4 c' d'8( b) d'4 d'8( c') b2.
}

bass = \context Voice = "bass"   {
  \voiceTwo
  fis4 g c' b a g e d
  e a, b, c d g2.
  fis4 g c' b a g e d
  e a, b, c d g2.
  e4 b,4. c8 d4 e8( fis) g4( e) d
  d8( c) b,4 g, c e d2.
  e8( fis) g4 c' b a g e d
  e a, b,8( e) d4 d g2.
}

stanzaa = \lyricmode {
  O lit -- tle town of Beth -- le -- hem
  How still we see thee lie;
  A -- bove thy deep and dream -- less sleep
  The si -- lent stars go by:
  Yet in thy dark streets shin -- eth
  The e -- ver -- las -- ting Light;
  The hopes and fears of all the years
  Are met in thee to -- night.
}

stanzab = \lyricmode {
  For Christ is born of Ma -- \skip4 ry;
  And ga -- thered all a -- bove,
  While mor -- tals sleep, the an -- gels keep
  Their watch of won -- dering love.
  O mor -- ning stars, to -- ge -- ther
  Pro -- claim the ho -- ly birth,
  An prai -- ses sing to God the King,
  And peace to men on earth!
}

stanzac = \lyricmode {
  How si -- lent -- ly, how si -- lent -- ly
  The won -- drous gift is giv'n!
  So God im -- parts to hu -- man hearts
  The bles -- sings of His heaven:
  No ear may hear His com -- ing;
  But in this world of sin,
  Where meek souls will re -- ceive Him, still
  The dear Christ en -- ters in.
}

stanzad = \lyricmode {
  O Ho -- ly Child of Beth -- le -- hem,
  Des -- cend to us we pray;
  Cast out our sin, and en -- ter in;
  Be born in us to -- day.
  We hear the heaven -- ly an -- gels
  The great glad ti -- dings tell:
  O come to us, a -- bide with us,
  Our Lord Em -- man -- u -- el.
}

\score {  \transpose g f
     \context ChoirStaff <<
     \unset ChoirStaff.melismaBusyProperties
    \context Staff ="upper"  { \clef "G" <<
      \global
      \sop
      \alto
    >>}

    \context Lyrics = "stanza-1" \lyricsto "sop" {
      \set stanza = "1."
        \stanzaa }
    \context Lyrics = "stanza-2" \lyricsto "sop" {
      \set stanza = "2."
        \stanzab }
    \context Lyrics = "stanza-3" \lyricsto "sop" {
      \set stanza = "3."
        \stanzac }
    \context Lyrics = "stanza-4" \lyricsto "sop" {
      \set stanza = "4."
        \stanzad }
  %  \context Lyrics = "stanza-5" \lyricsto "sop" {
  %    \set stanza = "5."
  %      \stanzae }
  %  \context Lyrics = "stanza-6" \lyricsto "sop" {
  %    \set stanza = "6."
  %      \stanzaf }
    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
