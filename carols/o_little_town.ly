\version "2.24.0"

\header {
  title = "O Little Town of Bethlehem"
  poet = "Phillips Brooks (1835–1893)"
  composer = "Lewis Henry Redner (1831–1908)"
  meter = "St. Louis 8.6.8.6.7.6.8.6."
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
  b'4 b' b' ais' b' d'' c'' e'
  a' g' fis'8 \melisma g' \melismaEnd a'4 d' b'2.
  b'4 b' b' e'' d'' d'' c'' e'
  a' g' fis'8 \melisma g' \melismaEnd b'4 a' g'2.
  b'4 b' b' a' g' fis'2 fis'4
  fis'4 e' fis' g' a' b'2.
  b'4 b' b' ais' b' d'' c'' e'
  e'' d'' g' b'4. a'8 g'2. \bar "|."

}

alto=\context Voice = "alto"   {
  \voiceTwo
  d'4 d' d' cis' d' f' e' c'
  e' d' d' d' d' d'2.
  d'4 d' g' gis' gis' a' e' c'
  e' d' d' fis' fis' g'2.
  g'4 g' g' fis' e' dis'2 dis'4
  dis' e' fis' g' e' fis'2.
  g'4 d' d' cis' d' e' e' c'
  e'8 fis' g'4 cis' d'4. c'8 b2.
}

tenor = \context Voice = "tenor"   {
  \voiceOne
  g4 g g g g gis a a
  c' b a8 b c'4 c' b2.
  g4 g b b e' e' e' e'
  c' b ais8 b d'4 c' b2.
  d'4 d' b c' cis' dis'2 dis'4
  b e fis g e' dis'2.
  d'4 d' b g g gis a a
  c' b b8 g g4. fis8 g2.
}

bass = \context Voice = "bass"   {
  \voiceTwo
  g4 g g g g c c c
  c d d d d g,2.
  g4 g f e e a a a,
  c d4. d8 d4 d g2.
  g4 g g a ais b2 b4
  b, e fis g c' b2.
  g4 g g g g c c c
  c d e d4. d8 g,2.
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
  Their watch of won -- d’ring love.
  O mor -- ning stars, to -- ge -- ther
  Pro -- claim the ho -- ly birth,
  And prai -- ses sing to God the King,
  And peace to men on earth!
}

stanzac = \lyricmode {
  How si -- lent -- ly, how si -- lent -- ly
  The won -- drous gift is giv’n!
  So God im -- parts to hu -- man hearts
  The bles -- sings of His heav’n:
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
  We hear the heav’n -- ly an -- gels
  The great glad ti -- dings tell:
  O come to us, a -- bide with us,
  Our Lord Em -- man -- u -- el.
}

\score {
  \transpose g f
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
