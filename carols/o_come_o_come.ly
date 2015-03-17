\version "2.14.2"
\header {
  filename = "o_come_o_come.ly"
  enteredby = "Gordon Gilbert and Ben Kuhn"
  composer = "Ancient plainsong"
  arranger = "arr. Thomas Helmore"
  poet = "trans. John M. Neale and Henry Sloane Coffin"
  date=""
  title = "O Come O Come Emmanuel"
  metre = "8.8.8.8.8.8. with Refrain"
  meter = \metre
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Gordon Gilbert"
  maintainerEmail = "gord@angel.eicat.ca"
  lastupdated = "2011/Dec/11"
}
\include "header.ly"
global = {
  \preamble
  \key e \minor
  \time 4/4
  \partial 4
  #(set-global-staff-size 13)
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
    g2. a4 |
    b g e g |
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
    g2. |

    g4 |
    fis2. g4 |
    fis2. g4 |
    g2. fis4 |
    g2. fis4 |
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
    b2. |
    
    b4 |
    a2. e'4 |
    d2. d4 |
    e2( d4) c |
    b2. d4 |
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
    g,2. |
    
    g'4 |
    d2. e4 |
    b2. g4 |
    c( a b) d |
    e2. d4 |
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
  Who ord -- 'rest all things migh -- ti -- ly;
  To us the path of knowl -- edge show,
  And teach us in her ways to go.
}
stanzac = \lyricmode {
  O come, Thou Day -- spring from on high,
  And cheer us by Thy draw -- ing nigh;
  Dis -- perse the gloom -- y clouds of night,
  And death's dark sha -- dow put to flight.
}
stanzad = \lyricmode {
  O come, De -- sire of na -- tions, bind
  In one the hearts of all man -- kind;
  Bid Thou our sad di -- vi -- sions cease,
  And be Thy -- self our King of Peace.
}

\score {
  \context ChoirStaff <<
    \unset ChoirStaff.melismaBusyProperties 
    \context Staff ="upper"  { \clef "G" <<
      \global
      \sop
      \alto
    >>}
    
    \lyricsto "sop" \context Lyrics = "stanza-l" {
      \set stanza = "Latin."
      \latin }
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
                                %	\lyricsto "sop" \context Lyrics = "stanza-6" {
                                %		\set stanza = "6."
                                %			\stanzaf }
    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
