\header {
  filename = "joy.ly"
  enteredby = "Gordon Gilbert and Ben Kuhn"
  composer = "attributed to G. F. Handel"
  arranger = "Lowell Mason, 1830"
  poet = "Rev Isaac Watts, 1719"
  date ="1830"
  title = "Joy To The World"
  metre = "Antioch C.M. with Refrain"
  meter = \metre
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Gordon Gilbert"
  maintainerEmail = "gord@angel.eicat.ca"
  lastupdated = "2012/Dec/23"
}

\version "2.14.2"

\include "header.ly"

global= {
  \preamble
  \time 2/4
  \key d \major
}

sop = \context Voice = "sop"    {
  \voiceOne
  d''4 cis''8. b'16 a'4. g'8 fis'4 e' d'4.
  a'8 b'4. b'8 cis''4. cis''8 d''4.
  d''8 d''( cis'') b'( a') a'8.( g'16 fis'8)
  d'' d''( cis'') b'( a') a'8.( g'16 fis'8)
  fis' fis' fis' fis' fis'16( g') a'4.
  g'16( fis') e'8 e' e' e'16( fis') g'4.
  fis'16( e') d'8( d''4) b'8 a'8.( g'16 fis'8) g' fis'4 e' d'2 \bar "|."
}

alto=\context Voice = "alto"   {
  \voiceTwo
  d'4 d'8. d'16 d'4. e'8 d'4 cis' d'4.
  a'8 g'4. g'8 g'4. g'8 fis'4.
  fis'8 fis' a' g' fis' fis'8. e'16 d'8
  fis'8 fis' a' g' fis' fis'8. e'16 d'8
  d' d' d' d' d'16 e' fis'4.
  e'16 d' cis'8 cis' cis' cis'16 d' e'4.
  d'16 cis' d'8 fis'4 g'8 fis'8. e'16 d'8 e' d'4 cis' d'2
}

tenor = \context Voice = "tenor"   {
  \voiceOne
  fis4 a8. g16 fis4. b8 a4. g8 fis4.
  d'8 d'4. d'8 a4. a8 a4.
  a8 a4 d' d'( a8) a a4 d' d'( a8) d8 \rest
  d4 \rest d8 \rest a8 a a a a a2 ~ a4.
  a8 fis( a4) d'8 d'4. b8 a4 a8( g) fis2
}

bass = \context Voice = "bass"   {
  \voiceTwo
  d4 d8. d16 d4. g,8 a,4 a, d4.
  fis8 g4. e8 a4. a8 d4.
  d8 d4 d d4. d8 d4 d d4. s8
  s4 s8 d8 d d d d a,4.
  a,8 a, a, a, a, d4. d8 d4. g,8 a,4 a, d2
}

accomp=\chordmode {

}



stanzaa = \lyricmode {
  Joy to the world! The Lord is come:
  Let earth re -- ceive her King,
  Let ev -- ery heart pre -- pare Him room,
  And heaven and na -- ture sing,
  And heaven and na -- ture sing,
  And heaven, and heaven, and na -- ture sing.
}
skips = {
  \skip 1 \skip 1 \skip 1
  \skip 1 \skip 1 \skip 1
  \skip 1 \skip 1 \skip 1
  \skip 1 \skip 1 \skip 1
  \skip 1 \skip 1 \skip 1
  \skip 1 \skip 1 \skip 1
  \skip 1 \skip 1 \skip 1
  \skip 1
}
stanzaamen = \lyricmode {
  \skips
  And heaven and na -- ture sing,
  And heaven and na -- ture sing,
  And heaven and na -- ture sing.
}

stanzab = \lyricmode {
  Joy to the earth! The Sav -- iour reigns:
  Let men their songs em -- ploy;
  While fields and floods, rocks hills and plains
  Re -- peat the sound -- ing joy,
  Re -- peat the sound -- ing joy,
  Re -- peat, re -- peat the sound -- ing joy.
}
stanzabmen = \lyricmode {
  \skips
  Re -- peat the sound -- ing joy,
  Re -- peat the sound -- ing joy,
  Re -- peat the sound -- ing joy.
}


stanzac = \lyricmode {
  No more let sin and sor -- row grow,
  Nor thorns in -- fest the ground:
  He comes to make His bless -- ings flow
  Far as the curse is found,
  Far as the curse is found,
  Far as, far as the curse is found.
}

stanzad = \lyricmode {
  He rules the world with truth and grace,
  And makes the na -- tions prove
  The glo -- ries of His right -- eous -- ness
  And won -- ders of His love,
  And won -- ders of His love,
  And won -- ders, won -- ders of His love.
}
stanzadmen = \lyricmode {
  \skips
  And won -- ders of His love,
  And won -- ders of His love,
  And won -- ders of His love.
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
      \stanzad }
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
    \lyricsto "bass" \context Lyrics = "stanza-1b" {
      \stanzaamen
    }
    \lyricsto "bass" \context Lyrics = "stanza-2b" {
      \stanzabmen
    }
    \lyricsto "bass" \context Lyrics = "stanza-3b" {
      \stanzadmen
    }
  >>
  \layout{
    indent = 0.0\pt
    \context {
      \ChordNames
      \override ChordName  #'style = #'american
      chordChanges = ##t
    }
  }
}