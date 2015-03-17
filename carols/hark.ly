\header {
  filename = "HarkTheHerald-Complete.ly"
  enteredby = "Gordon Gilbert and Ben Kuhn"
  composer = "Felix Mendelssohn, 1840"
  poet = "Rev. Charles Wesley"
  date=""
  title = "Hark the Herald Angels Sing"
  metre = "Mendelssohn 7.7.7.7.D. with refrain"
  meter = \metre
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Gordon Gilbert"
  maintainerEmail = "gord@angel.eicat.ca"
  lastupdated = "2012/Dec/23"
}

\version "2.11.23"

\include "header.ly"

global= {
  \preamble
  \time 4/4
  \key f \major
  #(set-global-staff-size 13)
}

sop = \context Voice = "sop"    {
  \voiceOne
  c'4 f' f'4. e'8 f'4 a' a'(g')
  c'' c'' c''4. bes'8 a'4 g' a'2
  c'4 f' f'4. e'8 f'4 a' a'(g')
  c'' g' g'4. e'8 e'4 d' c'2
  c''4 c'' c'' f' bes' a' a'( g')
  c''4 c'' c'' f' bes' a' a'( g')
  d'' d'' d'' c'' bes' a' bes'2
  g'4 a'8( bes') c''4. f'8 f'4 g' a'2
  
  d''4. d''8 d''4 c'' bes' a' bes'2
  g'4 a'8( bes') c''4. f'8 f'4 g' f'2\bar "|."
  
}

alto=\context Voice = "alto"   {
  \voiceTwo
  c'4 c' c'4. c'8 c'4 f' f'( e')
  f' e' d' g' f' e' f'2
  c'4 c' c'4. c'8 a4 f' f'2 
  e'4 d' e'4. c'8 c'4 b c'2
  c'4 c' c' f' g' f' f'( e')
  c'4 c' c' f' g' f' f'( e')
  bes' bes' bes' a' g' fis' g'2
  e'4 e' f'4. c'8 c'4 e' f'2
  bes'4 bes'bes'a' g' fis' g'2
  c'4 e' f'4. c'8 c'4 e' f'2
}	

tenor = \context Voice = "tenor"   {
  \voiceOne
  a4 a a4. g8 f4 c' c'2
  c'4 c' d' d' c' c' c'2
  a4 a a4. g8 f4 c' d'2
  c'4 d' g4. g8 a4 f e2
  c'4 c' c' c' c' c' c'2
  c'4 c' c' c' c' c' c'2
  d'4 d' d' d' d' c' bes2
  c'4 c' c'4. a8 a4 c' c'2
  d'4. d'8 d'4 c' bes a bes2
  c'4 c' c'4. a8 a4 bes a2
}

bass = \context Voice = "bass"   {
  \voiceTwo
  f4 f f c a, f, c2
  a,4 a, bes, bes, c c f2
  f4 f f c d c b,4. g,8 
  a,4 b, c e, f, g, c2
  c'4 c' c' a e f c2
  c'4 c' c' a e f c2
  bes,4 bes, bes, bes, bes, d g2
  bes4 bes a f c c f2
  bes4 bes bes a g fis g( f)
  e bes a f c c <f f,>2
}
accomp=\chordmode {
  
}



stanzaa = \lyricmode {
  Hark! the her -- ald an -- gels sing,
  Glo -- ry to the new born King,
  Peace on earth, and mer -- cy mild,
  God and sin -- ners re -- con -- ciled.
  Joy -- ful all ye na -- tions, rise,
  Join the tri -- umph of the skies;
  With the-an -- gel -- ic host pro -- claim
  “Christ is born in Beth -- le -- hem.”
  Hark! the her -- ald an -- gels sing,
  “Glo -- ry to the new born King!”
}

stanzab = \lyricmode {
  Christ, by high -- est heaven a -- dored,
  Christ, the e -- ver -- last -- ing Lord
  Late in time be -- hold Him come,
  Off -- spring of a Vir -- gin's womb.
  Veiled in flesh the God -- head see!
  Hail, the-In -- car -- nate De -- i -- ty!
  Pleased as Man with man to dwell,
  Je -- sus, our Em -- man -- u -- el.
}
stanzac = \lyricmode {
  Hail the heaven born Prince of peace!
  Hail, the Sun of right -- eous -- ness!
  Light and life to all He brings,
  Ris'n with heal -- ing in His wings.
  Mild He lays His glo -- ry by,
  Born that man no more may die,
  Born to raise the sons of earth,
  Born to give them sec -- ond birth.
}	
stanzad = \lyricmode {
  
}	
stanzae = \lyricmode {
  
}
stanzaf = \lyricmode {
  
}

\score {
  \context ChoirStaff <<
    \context ChordNames \accomp
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
    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}

