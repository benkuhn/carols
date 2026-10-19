\version "2.24.0"

\header {
  composer = "attributed to G. F. Handel"
  arranger = "Lowell Mason, 1830"
  poet = "Rev Isaac Watts, 1719"
  title = "Joy to the World"
  meter = "Antioch C.M. with Refrain"
  mutopiacomposer = \composer
  mutopiapoet=\poet
}

\include "header.ly"

global= {
  \autoBeamOff
  \time 2/4
  \key d \major
}

sop = \context Voice = "sop"    {
  \voiceOne
  d''4 cis''8. b'16 a'4. g'8 fis'4 e' d'4.
  a'8 b'4. b'8 cis''4. cis''8 d''4._"(watch out it's short!)"
  d''8 \autoBeamOn d''( cis'') \autoBeamOff \autoBeamOn b'( a') \autoBeamOff \autoBeamOn a'8.( g'16 fis'8) \autoBeamOff
  d'' \autoBeamOn d''( cis'') \autoBeamOff \autoBeamOn b'( a') \autoBeamOff \autoBeamOn a'8.( g'16 fis'8) \autoBeamOff
  fis' fis' fis' fis' \autoBeamOn fis'16( g') \autoBeamOff a'4.
  \autoBeamOn g'16( fis') \autoBeamOff e'8 e' e' \autoBeamOn e'16( fis') \autoBeamOff g'4.
  \autoBeamOn fis'16( e') \autoBeamOff d'8( d''4) b'8 \autoBeamOn a'8.( g'16 fis'8) \autoBeamOff g' fis'4 e' d'2 \bar "|."
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
  a8 fis( a4) d'8 d'4. b8 a4 \autoBeamOn a8( g) \autoBeamOff fis2
}

bass = \context Voice = "bass"   {
  \voiceTwo
  d4 d8. d16 d4. g,8 a,4 a, d4.
  fis8 g4. e8 a4. a8 d4.
  d8 d4 d d4. d8 d4 d d4. s8
  s4 s8 d8 d d d d a,4.
  a,8 a, a, a, a, d4. d8 d4. g,8 a,4 a, d2
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

\score {
  \context ChoirStaff <<
    \context Staff ="upper"  { \clef "G" <<
      \global
      \sop
      \alto
    >>}

    \context Lyrics = "stanza-1" \lyricsto "sop" {
      \set stanza = "1."
      \stanzaa }
    \context Lyrics = "stanza-2" \lyricsto "sop" {
      \set stanza = "2."
      \stanzab }
    \context Lyrics = "stanza-3" \lyricsto "sop" {
      \set stanza = "3."
      \stanzad }
    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
    \context Lyrics = "stanza-1b" \lyricsto "bass" {
      \stanzaamen
    }
    \context Lyrics = "stanza-2b" \lyricsto "bass" {
      \stanzabmen
    }
    \context Lyrics = "stanza-3b" \lyricsto "bass" {
      \stanzadmen
    }
  >>
}
