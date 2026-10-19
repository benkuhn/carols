\version "2.24.0"

\header {
  title = "Silent Night"
  poet = "Joseph Mohr (1792–1848)"
  translator = "trans. John Freeman Young (1820–1885)"
  composer = "Franz Xaver Gruber (1787–1863)"
}

\include "header.ly"

global= {

  \time 6/8
  \key bes \major
}

sop = \context Voice = "sop"    {
  \voiceOne
  f'8.[ g'16] f'8 d'4.
  f'8.[ g'16] f'8 d'4.
  c''4 c''8 a'4. bes'4 bes'8 f'4.
  g'4 g'8 bes'8.[ a'16] g'8 f'8. g'16 f'8 d'4.
  g'4 g'8 \slurDashed bes'8.( a'16) \slurSolid g'8 f'8. g'16 f'8 d'4.
  c''4 c''8 ees''8. c''16 a'8 bes'4.( d'')
  bes'8[ f'] d' f'8. ees'16 c'8 bes2. \bar "|."
}

alto=\context Voice = "alto"   {
  \voiceTwo
  d'8. ees'16 d'8 bes4.
  d'8. ees'16 d'8 bes4.
  ees'4 ees'8 ees'4. d'4 d'8 d'4.
  ees'4 ees'8 g'8.[ f'16] ees'8 d'8. ees'16 d'8 bes4.
  ees'4 ees'8 \slurDashed g'8.( f'16) \slurSolid ees'8 d'8. ees'16 d'8 bes4.
  ees'4 ees'8 ees'8. ees'16 c'8 d'4.( f')
  d'4 bes8 a8. a16 a8 bes2.
}

tenor = \context Voice = "tenor"   {
  \voiceOne
  bes4 bes8 f4.
  bes4 bes8 f4.
  a4 a8 c'4. bes4 bes8 bes4.
  bes4 bes8 g8.[ a16] bes8 bes8. bes16 bes8 f4.
  bes4 bes8 \slurDashed g8.( a16) \slurSolid bes8 bes8. bes16 bes8 f4.
  a4 a8 a8. a16 f8 f4.( bes)
  f4 f8 f8. f16 ees8 d2.
}

bass = \context Voice = "bass"   {
  \voiceTwo
  bes,4 bes,8 bes,4.
  bes,4 bes,8 bes,4.
  f4 f8 f4. bes,4 bes,8 bes,4.
  ees4 ees8 ees4 ees8 bes,8. bes,16 bes,8 bes,4.
  ees4 \slurDashed ees8 ees8.( ees16) \slurSolid ees8 bes,8. bes,16 bes,8 bes,4.
  f4 f8 f8. f16 f8 bes,2.
  f,4 f,8 f,8. f,16 f,8 bes,2.
}

stanzaa = \lyricmode {
  Si -- lent night! Ho -- ly night!
  All is calm, all is bright
  Round yon Vir -- gin Moth -- er and Child,
  Ho -- ly \set ignoreMelismata = ##t In -- fant \unset ignoreMelismata so ten -- der and mild.
  Sleep in heav -- en -- ly peace,
  Sleep in heav -- en -- ly peace.
}

stanzab = \lyricmode {
  Si -- lent night! Ho -- ly night!
  Shep -- herds quake at the sight,
  Glo -- ries stream from heav -- en a -- far,
  Heav’n -- ly hosts sing al -- le -- lu -- ia;
  Christ, the Sav -- ior, is born,
  Christ, the Sav -- ior, is born.
}

stanzac = \lyricmode {
  Si -- lent night! Ho -- ly night!
  Son of God, love’s pure light
  Ra -- diant beams from Thy ho -- ly face,
  With the \set ignoreMelismata = ##t dawn of \unset ignoreMelismata  re -- dee -- _ ming grace,
  Je -- sus, Lord, at Thy birth.
  Je -- sus, Lord, at Thy birth.
}

\score {
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
    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
