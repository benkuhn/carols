\version "2.24.0"

\header {
  title = "O Little Town of Bethlehem"
  poet = "Phillips Brooks (1835–1893)"
  composer = "Traditional English"
  arranger = "arr. Ralph Vaughan Williams (1872–1958)"
  meter = "Forest Green 8.6.8.6.7.6.8.6."
}

\include "header.ly"

global= {
  \autoBeamOff
  \time 4/4
    \key g \major

     \partial 4
}

sop = \context Voice = "sop"    {
  \voiceOne
  d'4 g' g' g' a' \autoBeamOn b'8( a') \autoBeamOff \autoBeamOn b'( c'') \autoBeamOff d''4
  b' c'' \autoBeamOn b'8( g') \autoBeamOff a'4 a' g'2.
  d'4 g' g' g' a' \autoBeamOn b'8( a') \autoBeamOff \autoBeamOn b'( c'') \autoBeamOff d''4
  b' c'' \autoBeamOn b'8( g') \autoBeamOff a'4 a' g'2.
  \autoBeamOn g'8( b') \autoBeamOff d''4. e''8 \autoBeamOn d''( c'') \autoBeamOff \autoBeamOn b'( a') \autoBeamOff \autoBeamOn g'( a' b' c'') \autoBeamOff d''4
  d'4 g' b' a' g' d'2.
  d'4 g' g' g' a' \autoBeamOn b'8( a') \autoBeamOff \autoBeamOn b'( c'') \autoBeamOff d''4
  b'4 c'' \autoBeamOn b'8( g') \autoBeamOff a'4 a' g'2. \bar "|."

}

alto=\context Voice = "alto"   {
  \voiceTwo
  d'4 d' e' d' \autoBeamOn e'8( fis') \autoBeamOff g'4 g' fis'
  e' e' g' g' fis' g'2.
  d'4 d' e' d' \autoBeamOn e'8( fis') \autoBeamOff g'4 g' fis'
  e' e' g' g' fis' g'2.
  g'4 fis'4. e'8 fis'4 d' d'( g') fis'
  d'4 d' d' c' \autoBeamOn b8( c') \autoBeamOff d'2.
  d'4 d' e' d' \autoBeamOn e'8( fis') \autoBeamOff g'4 g' fis'
  e' e' g' g' fis' g'2.
}

tenor = \context Voice = "tenor"   {
  \voiceOne
  a4 b c' d' c' d' g a
  g c' d' e' \autoBeamOn d'8( c') \autoBeamOff b2.
  a4 b c' d' c' d' g a
  g c' d' e' \autoBeamOn d'8( c') \autoBeamOff b2.
  b4 b4. g8 d'4 \autoBeamOn d'8( c') \autoBeamOff b4( g) a
  fis4 g g \autoBeamOn e8( fis) \autoBeamOff g4 fis2.
  \autoBeamOn g8( a) \autoBeamOff b4 c' d' c' d' g a
  g4 c' \autoBeamOn d'8( b) \autoBeamOff d'4 \autoBeamOn d'8( c') \autoBeamOff b2.
}

bass = \context Voice = "bass"   {
  \voiceTwo
  fis4 g c' b a g e d
  e a, b, c d g2.
  fis4 g c' b a g e d
  e a, b, c d g2.
  e4 b,4. c8 d4 \autoBeamOn e8( fis) \autoBeamOff g4( e) d
  \autoBeamOn d8( c) \autoBeamOff b,4 g, c e d2.
  \autoBeamOn e8( fis) \autoBeamOff g4 c' b a g e d
  e a, \autoBeamOn b,8( e) \autoBeamOff d4 d g2.
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
  For Christ is born of Ma -- _ ry;
  And ga -- thered all a -- bove,
  While mor -- tals sleep, the an -- gels keep
  Their watch of won -- dering love.
  O mor -- ning stars, to -- ge -- ther
  Pro -- claim the ho -- ly birth,
  And prai -- ses sing to God the King,
  And peace to men on earth!
}

stanzac = \lyricmode {
  How si -- lent -- ly, how si -- lent -- ly
  The won -- drous gift is giv’n!
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
    \context Staff ="upper"  { \clef "G" <<
      \global
      \sop
      \alto
    >>}

    \context Lyrics = "stanza-1" \lyricsto "sop" {
      \set stanza = #"1. "
        \stanzaa }
    \context Lyrics = "stanza-2" \lyricsto "sop" {
      \set stanza = #"2. "
        \stanzab }
    \context Lyrics = "stanza-3" \lyricsto "sop" {
      \set stanza = #"3. "
        \stanzac }
    \context Lyrics = "stanza-4" \lyricsto "sop" {
      \set stanza = #"4. "
        \stanzad }
    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
