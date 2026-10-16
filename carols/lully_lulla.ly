\version "2.18.0"

\header {
  title = "Lully, Lulla, Lullay"
  poet = "Coventry Carol, 16th Century"
  composer = "Philip Stopford (b. 1977)"
}

\include "header.ly"

% Form: refrain + verse three times, then a final refrain (with
% optional descant) and a short coda. The repeat ends mid-bar and the
% coda starts on a downbeat, so the repeat is done by hand.
global = {
  \preamble
  \key aes \major
  \time 3/4
  \partial 2 s2 | s2.*15 |
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
  \mark \markup \small \line { \italic "last time to Coda" \musicglyph #"scripts.coda" }
  s2.*16 | s4
  \set Timing.measurePosition = #ZERO-MOMENT
  \set Score.repeatCommands = #'(end-repeat)
  \mark \markup \musicglyph #"scripts.coda"
  s2.*4 \bar "|."
}

descMusic = \relative c'' {
  c4(^\markup \italic "Descant (last time, optional)" ees) |
  aes2.~ | aes4 g( ees) | c2. |
  r4 c( ees) | aes2.~ | aes4 g( ees) | c2. |
  r4 c( ees) | aes2.~ | aes4 g( ees) | c2. |
  r4 des( c) | aes2 bes4 | g2 aes4 | aes2. |
  \stopStaff
}
descWords = \lyricmode {
  By, by, lul -- ly.
  By, by, lul -- lay.
  By, by, lul -- ly.
  By, by, lul -- ly, lul -- lay.
}

sopMusic = \relative c'' {
  % refrain
  r4 aes4 |
  aes2 bes4 | g2 aes4 | aes4( ees') c | bes2 aes4 |
  aes2 bes4 | g2 aes4 | aes2.~ | aes4 r aes |
  aes2 bes4 | g2 aes4 | g8 aes ees'4 c | bes2 aes4 |
  aes2 bes4 | g2 aes4 | aes2.~ |
  % verse
  aes2 r4 |
  c4 c c | ees2 c4 | bes2 aes4 | c2 r4 |
  aes4 c des | bes2 aes4 | aes2.~ | aes4 r aes |
  ees'2 c4 | \slurDashed bes( bes) \slurSolid aes | aes( ees') c | f,2 r4 |
  f4 g aes | aes( g) aes | aes2.~ | aes4
  % coda
  aes4\repeatTie r aes | aes2 bes4 | g2 aes4 | aes2.
}
% words sung by the sopranos only
sopWords = \lyricmode {
  \repeat unfold 15 { \skip 1 }
  thou lit -- tle ti -- ny Child,
}

altoMusic = \relative c' {
  % refrain
  r4 ees4 |
  f2 f4 | f2 f4 | aes2 aes4 | ees2 c4 |
  f2 f4 | f2 g4 | aes2( g4 | f4) r ees |
  f2 f4 | f( ees) ees | ees( aes) aes | ees2 c4 |
  f2 f4 | f( ees) g | aes2( g4 |
  % verse
  f2) r4 |
  aes4 g f | g2 g4 | g2 g4 | aes2 r4 |
  f4 f f | g2 g4 | aes2( g4 | f4) r f |
  f2 f4 | \slurDashed g( g) \slurSolid g | ees2 ees4 | f2 r4 |
  f4 f f | g2 g4 | aes2( g4 | f4)
  % coda
  f4 r c | f2 f4 | f( ees) des | c2.
}
altoWords = \lyricmode {
  Lul -- ly, lul -- la, lul -- ly, lul -- la,
  by, by, lul -- ly, lul -- lay.
  Lul -- ly, lul -- la, lul -- ly, lul -- la,
  by, by, lul -- ly, lul -- lay.

  \set stanza = #"1. "
  O sis -- ters too, how may we do
  for to pre -- serve this day?
  This poor young -- ling for whom we sing,
  By, by, lul -- ly, lul -- lay.

  \skip 1
  By, by, lul -- ly, lul -- lay.
}
altoWordsII = \lyricmode {
  \repeat unfold 28 { \skip 1 }
  \set stanza = #"2. "
  Her -- od, the king, in his ra -- ging,
  char -- ged he hath this day;
  His men of might in his own sight
  all young chil -- dren to slay.
}
altoWordsIII = \lyricmode {
  \repeat unfold 28 { \skip 1 }
  \set stanza = #"3. "
  That woe is me, poor Child, for Thee,
  and ev -- er morn and day,
  For Thy part --
  \set ignoreMelismata = ##t
  ing nei --
  \unset ignoreMelismata
  ther say nor sing,
  By, by, lul -- lay, lul -- lay.
}

tenorMusic = \relative c' {
  % refrain
  r4 aes4 |
  aes2 aes4 | bes2 bes4 | c2 c4 | g2 f4 |
  aes2 aes4 | bes2 bes4 | c2( bes4 | aes4) r aes |
  aes( g) aes | bes2 bes4 | c2 c4 | g2 f4 |
  c'( bes) aes | bes2 bes4 | c2( bes4 |
  % verse
  aes2) r4 |
  c4 bes aes | bes2 bes4 | ees2 ees4 | c2 r4 |
  aes4 aes aes | bes2 bes4 | c2( bes4 | aes4) r aes |
  aes2 aes4 | \slurDashed bes( bes) \slurSolid bes | aes2 aes4 | aes2 r4 |
  aes4 aes aes | bes2 bes4 | c2( bes4 | aes4)
  % coda
  aes4 r f | c'( bes) aes | bes2 bes4 | ees,2.
}

bassMusic = \relative c {
  % refrain
  r4 c4 |
  des2 des4 | ees2 ees4 | f2 f4 | f2 f4 |
  des2 des4 | ees2 ees4 | f2.~ | f4 r c |
  des2 des4 | ees2 ees4 | f2 f4 | f2 f4 |
  des2 des4 | ees2 ees4 | f2.~ |
  % verse
  f2 r4 |
  f4 f f | f2 f4 | f2 f4 | f2 r4 |
  des4 des des | ees2 ees4 | f2.~ | f4 r f |
  des2 des4 | \slurDashed ees( ees) \slurSolid ees | c2 c4 | des2 r4 |
  des4 des des | ees2 ees4 | f2.~ | f4
  % coda
  f4\repeatTie r f | des2 des4 | ees2 ees4 | aes,2.
}

\score {
  <<
    \new Staff = descant \with {
      \RemoveEmptyStaves
      \override VerticalAxisGroup.remove-first = ##t
      fontSize = #-3
      \override StaffSymbol.staff-space = #(magstep -3)
    } <<
      \new Voice = "descant" { << \global \descMusic >> }
    >>
    \new Lyrics \with {
      alignBelowContext = #"descant"
      fontSize = #-2
    } \lyricsto "descant" \descWords
   \new ChoirStaff <<
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"women" } \lyricsto "sopranos" \sopWords
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
  >>
  >>
  \layout {
    \context {
      \Lyrics
      \override LyricHyphen.minimum-distance = #0.5
    }
  }
}
