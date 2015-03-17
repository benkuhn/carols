\header {
  filename = "good_christian.ly"
  enteredby = "Gordon Gilbert and Ben Kuhn"
  composer = "German melody, 14th cent."
  poet = "Rev. John M. Neale, 1853"
  date=""
  title = "Good Christian Men Rejoice"
  metre = "In Dulci Jubilo P.M."
  meter = \metre
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Gordon Gilbert"
  maintainerEmail = "gord@angel.eicat.ca"
  lastupdated = "2012/Dec/24"
}

\version "2.14.2"

\include "header.ly"

global= {
  \time 6/4
  \key f \major
  \partial 4
}

sop = \context Voice = "sop"    {
  \voiceOne
  f'4 f'2 f'4 a'2 bes'4 c''2( d''4 c''2)
  c''4 f'2 f'4 a'2 bes'4 c''2( d''4 c''2.)
  c''2 d''4 c''2 bes'4 a'2 g'4 f'2.
  f'2. f'
  g'2 g'4 a'2 g'4 f'2 g'4 a'2.
  c''2 d''4 c''2 bes'4 a'2 g'4 f'2
  f'4 g'2 g'4 a'2 g'4 f'2 g'4 a'2.
  d'2 d'4 e'2 e'4 f'2.( c'')
  a'2 a'4 g'2 g'4 f'2. ~ f'2 \bar "|."
}

alto=\context Voice = "alto"   {
  \voiceTwo
  c'4 d'2 c'4 f' e' d' c'2( f'4 e'2)
  f'4 d'2 c'4 f' e' d' c'2( f'4 e'2.)
  f'2 f'4 e'2 e'4 f'2 e'4 f'2.
  f' f'
  d'2 g'4 f'2 e'4 f'2 f'4 f'2.
  f'2 f'4 f'2 e'4 f'2 e'4 d'2
  f'4 f'2 f'4 f'2 e'4 f'2 f'4 f'2.
  d'2 bes4 d'2 c'4 c'2.( f'2 e'4)
  f'2 f'4 f'2 e'4 f'2. ~ f'2
}	

tenor = \context Voice = "tenor"   {
  \voiceOne
  a4 bes2 a4 c'2 bes4 a2( bes4 g2)
  a4 bes2 a4 c'2 bes4 a2( bes4 g2.)
  c'2 bes4 g2 c'4 c'2 bes4 a2.
  f a
  bes2 d'4 c'2 bes4 a2 bes4 c'2.
  c'2 bes4 c'2 c'4 c'2 bes4 a2
  c'4 d'2 d'4 c'2 bes4 a2 bes4 c'2.
  bes2 f4 g2 g4 f2.( a2 bes4)
  c'2 d'4 d'2 c'4 a2.~a2
}

bass = \context Voice = "bass"   {
  \voiceTwo
  f4 f2 f4 f2 f4 f2. ~ f2
  f4 f2 f4 f2 f4 f2.( c2.)
  a,2 bes,4 c2 c4 f2 c4 d2.
  f d
  g,2 bes,4 c2 c4 f2 f4 f2.
  a2 bes4 a2 g4 f2 c4 d2
  a,4 bes,2 bes,4 c2 c4 f2 f4 f2.
  bes,2 bes,4 bes,2 bes,4 a,2.( a2 g4)
  f2 d4 bes,2 c4 f2.~f2
}
accomp=\chordmode {
  
}
stanzaa = \lyricmode {
  Good Christ -- ian men, re -- joice,
  With heart and soul and voice,
  Give ye heed to what we say:
  News! News!
  Je -- sus Christ is born to -- day
  Ox and ass be -- fore Him bow,
  And He is in the man -- ger now, 
  Christ is born to -- day!
  Christ is born to -- day!
}

stanzab = \lyricmode {
  Good Christ -- ian men, re -- joice,
  With heart and soul and voice;
  Now ye hear of end -- less bliss:
  Joy! Joy!
  Je -- sus Christ was born for this!
  He hath op'ed the heaven -- ly door,
  And man is bless -- ed ev -- er -- more.
  Christ was born for this!
  Christ was born for this!
}
stanzac = \lyricmode {
  Good Christ -- ian men, re -- joice,
  With heart and soul and voice;
  Now ye need not fear the grave:
  Peace! Peace!
  Je -- sus Christ was born to save!
  Calls you one and calls you all,
  To gain His ev -- er -- las -- ting hall:
  Christ was born to save,
  Christ was born to save.
}	
stanzad = \lyricmode {
  
}	
stanzae = \lyricmode {
  
}
stanzaf = \lyricmode {
  
}

\score {	%\transpose d c
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
                                %	\lyricsto "sop" \context Lyrics = "stanza-4" {
                                %		\set stanza = "4."
                                %			\stanzad }
                                %	\lyricsto "sop" \context Lyrics = "stanza-5" {
                                %		\set stanza = "5."
                                %			\stanzae }
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

