\version "2.14.2"
\include "header.ly"

\header {
  title = "The Sussex Carol"
  poet = "Traditional English (17th century or earlier)"
}

global = {
  \preamble
  \key f \major
  \time 6/8
  \slurDotted
  \autoBeamOn
}

sopMusic = \relative c'' {
  \partial 8 c8 |
  \repeat volta 2 {
    c4 a8 bes4 c8 |
    a( g) f g4 e8 |
    f4 f8 g a bes |
  }
  \alternative {
    { a4 g8 f4 c'8 | }
    { a4 g8 f4. | }
  }

  g4. g4 f8 |
  g a bes c bes a |

  g2. |
  \time 9/8 c4. d c |
  \time 6/8 bes4 a8 g f g |
  f2.~ | f \bar "|." \break
}
sopWords = \lyricmode {

}

altoMusic = \relative c'' {
  \partial 8 c8 |
  \repeat volta 2 {
    a4 f8 f4 e8 |
    f( f) f8 c4 c8 |
    d4 d8 c f e |
  }
  \alternative {
    { f4 c8 f4 c'8 }
    { f,4 c8 f4. }
  }

  e d4 d8 |
  e f g a g f |

  e2. |
  f4. f f |
  f4 f8 c d e |
  f2.~ | f \bar "|."
}
altoWords = \lyricmode {
  \set stanza = #"1. "
  On Christ -- mas night all Chris -- tians sing
  To hear the news _ the an -- gels bring! On
  an -- gels bring:

  News of great joy, _ news of _ great mirth,
  News of our mer -- ci -- ful _ King’s birth! _
}
altoWordsII = \lyricmode {
%\markup\italic
  \set stanza = #"2. "
  \set ignoreMelismata = ##t
  Then why should men on earth be so sad,
  \unset ignoreMelismata
  Since our Re -- deem -- _ er made us glad? Then
  made us glad?

  When from our sin _ He set _ us free,
  All for to gain our lib -- _ er -- ty. _

  \set stanza = #"4. "
  All out of dark -- ness we have light,
  Which made the an -- gels sing this night,
  sing this night:

  “Glo -- ry to God and peace to men,
  Now and for ev -- er -- more, A -- men.”
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  When sin de -- parts be -- fore His grace,
  Then life and health _ come in its place. When
  in its place.

  An -- gels and men _ with joy _ may sing,
  All for to see the new -- _ born King!_
}
altoWordsIV = \lyricmode {
  \set stanza = #"4. "
  All out of dark -- ness we have light,
  Which made the an -- _ gels sing this night. All
  sing this night:

  “Glo -- ry to God _ and peace _ to men,
  Now and for ev -- er -- more, _ A -- men!” _
}

tenorMusic = \relative c' {
  \repeat volta 2 {
    \partial 8 c8 |
    c4 c8 d4 c8 |
    c( bes) a bes4 bes8 |
    a4 a8 bes a c |
  }
  \alternative {
    { d4 bes8 a4 c8 | }
    { d4 bes8 a4. | }
  }

  g bes4 a8 |
  bes f c' f,4 c'8 |

  c2. |
  a4. bes a |
  d4 c8 c a bes |
  a2.~ | a \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  \repeat volta 2 {
    \partial 8 c8 |
    f4 f8 bes,4 c8 |
    f( f) f8 e4 c8 |
    d4 d8 e d c |
  }
  \alternative {
    { d4 e8 f4 c8 | }
    { d4 e8 f4. | }
  }
  c g'4 d8 |
  c f e f4 f8 |
  c2. |
  f4. bes, c |
  f4 f8 e d c8 |
  <f f,>2.~ | <f f,> \bar "|."
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
    \new Lyrics \with { alignAboveContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "sopranos" \sopWords
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"men" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) } \lyricsto "basses" \bassWords
  >>

  >>
  \layout {
    \context {
      \Score
      %\override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 4)
      %\override SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 4)
    }
    \context {
      % Remove all empty staves
      % \Staff \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t
    }
    \context {
      \Lyrics
    }
  }
}

