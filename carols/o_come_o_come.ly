\version "2.24.0"
\header {
  title = "O Come, O Come, Emmanuel"
  poet = "Latin, 18th century"
  translator = "trans. John Mason Neale (1818–1866) and Henry Sloane Coffin (1877–1954)"
  composer = "French, 15th century"
  arranger = "arr. Thomas Helmore (1811–1890)"
  meter = "Veni Emmanuel 8.8.8.8. with Refrain"
}
\include "header.ly"
% smaller than the house staff size (14) so that this fits on one page
#(set-global-staff-size 13)
global = {
  \autoBeamOff
  \key e \minor
  \time 4/4
  \partial 4
}

sop = \context Voice = "sop" {
  \relative c' {
    \voiceOne
    e4 |
    g b b b |
    a( c b) a |
    g2. a4 |
    b g e g |

    a( fis e) d |
    e2. a4 |
    a e e fis |
    g2( fis4) e |

    d2. g4 |
    a b b b |
    a( c b) a |
    g2. \bar "||" \break

    d'4 |
    d2. b4 |
    b2. b4 |
    a( c b) a |
    \time 2/4 g a |
    \time 4/4 b g e g |
    a( fis e) d |
    e2. \bar "|."
  }
}

alto = \context Voice = "alto" {
  \relative c' {
    \voiceTwo
    b4 |
    e b d g |
    g2. fis4 |
    g2. d4 |
    d d c b |

    c2(  b4) b |
    b2. e8[ d] |
    c4 c e dis |
    e2( d4) cis |

    d2. b4 |
    d d d g |
    g2. fis4 |
    g2.

    g4 |
    fis2. g4 |
    fis2. g4 |
    g2. fis4 |
    g fis |
    g d e e |
    e( c b) b |
    b2.
  }
}

tenor = \context Voice = "tenor" {
  \relative c' {
    \voiceOne
    g4 |
    b fis g d' |
    e2( d4) c |
    b2. fis4 |
    g g g g |

    e( a g) fis |
    g2. a4 |
    a a b a |
    b( a a) g |

    fis2. g4 |
    fis fis g d' |
    e2( d4) c |
    b2.

    b4 |
    a2. e'4 |
    d2. d4 |
    e2( d4) c |
    b d |
    d d c b |
    a2( g4) fis |
    g2.
  }
}

bass = \context Voice = "bass" {
  \relative c {
    \voiceTwo
    e4 |
    e d b g |
    c( a b) d |
    e2. d4 |
    g, b c e |

    a,2( b4) b |
    e2. c8[ b] |
    a4 a' g fis |
    e( cis d) a |

    d2. e4 |
    d b g b |
    c( a b) d |
    g,2.

    g'4 |
    d2. e4 |
    b2. g4 |
    c( a b) d |
    e d |
    g b, c e |
    c( a b) b |
    e2.
  }
}

latin = \lyricmode {
  \lyricItal
  Ve -- ni, ve -- ni Em -- man -- u -- el!
  Cap -- ti -- vum sol -- ve Is -- ra -- el!
  Qui ge -- mit in ex -- i -- li -- o,
  Pri -- va -- tus De -- i Fi -- li -- o,
  Gau -- de, gau -- de, Em -- man -- u -- el
  Na -- sce -- tur pro te, Is -- ra -- el.
}

stanzaa = \lyricmode {
  O come, O come, Em -- man -- u -- el,
  And ran -- some cap -- tive Is -- ra -- el,
  That mourns in lone -- ly ex -- ile here
  Un -- til the Son of God ap -- pear.
  Re -- joice! Re -- joice! Em -- man -- u -- el
  Shall come to thee, O Is -- ra -- el!
}
stanzab = \lyricmode {
  O come, Thou Wis -- dom from on high,
  Who ord -- ’rest all things might -- i -- ly;
  To us the path of knowl -- edge show,
  And teach us in her ways to go.
}
stanzac = \lyricmode {
  O come, Thou Day -- spring from on high,
  And cheer us by Thy draw -- ing nigh;
  Dis -- perse the gloom -- y clouds of night,
  And death’s dark shad -- ow put to flight.
}
stanzad = \lyricmode {
  O come, De -- sire of na -- tions, bind
  In one the hearts of all man -- kind;
  Bid Thou our sad di -- vi -- sions cease,
  And be Thy -- self our King of Peace.
}

\score {
  \context ChoirStaff <<
    \context Staff ="upper"  { \clef "G" <<
      \global
      \sop
      \alto
    >>}

    \context Lyrics = "stanza-l" \lyricsto "sop" {
      \set stanza = #"Latin. "
      \latin }
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
