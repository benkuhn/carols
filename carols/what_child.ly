\version "2.24.0"


\header {
  title = "What Child Is This?"
  poet = "William Chatterton Dix (1837–1898)"
  composer = "Traditional English"
  arranger = "arr. John Stainer (1840–1901)"
}

\include "header.ly"

global = {
  \autoBeamOff
  \time 6/8
  \key e \minor
  \partial 8
}

verseI= \lyricmode {
  \set stanza = #"1. "
  What Child is this, Who, laid to rest,
  On Ma -- ry’s lap is sleep -- ing?
  Whom an -- gels greet with an -- thems sweet,
  While shep -- herds watch are keep -- ing?
                                %refrain
  This, this is Christ the King,
  Whom shep -- herds guard and an -- gels sing;
  Haste, haste to bring Him laud
  The Babe, the Son of Ma -- ry.
}

verseII= \lyricmode {
  \set stanza = #"2. "
  Why lies He in such mean es -- tate
  Where ox and ass are feed -- ing?
  Good Chris -- tian, fear: for sin -- ners here
  The si -- lent Word is plead -- ing.
}

verseIII= \lyricmode {
  \set stanza = #"3. "
  So bring Him in -- cense, gold, and myrrh,
  Come peas -- ant, king, to own Him;
  The King of kings sal -- va -- tion brings,
  Let lov -- ing hearts en -- throne Him.
}

sop = \context Voice = "sop" {
  \voiceOne
  \relative c' {
  e8 |
  g4 a8 \autoBeamOn b8.( c16) \autoBeamOff b8
  a4 fis8 \autoBeamOn d8.( e16) \autoBeamOff fis8
  g4 e8 \autoBeamOn e8.( dis16) \autoBeamOff e8
  fis4( dis8) b4 e8
  g4 a8 \autoBeamOn b8.( c16) \autoBeamOff b8
  a4 fis8 \autoBeamOn d8.( e16) \autoBeamOff fis8
  \autoBeamOn g8.( fis16) \autoBeamOff e8 \autoBeamOn dis8.( cis16) \autoBeamOff dis8
  e4. e
                                %Refrain
  d' \autoBeamOn d8.( cis16) \autoBeamOff b8
  a4 fis8 \autoBeamOn d8.( e16) \autoBeamOff fis8
  g4 e8 \autoBeamOn e8.( dis16) \autoBeamOff e8
  fis4 dis8 b4.
  d' \autoBeamOn d8.( cis16) \autoBeamOff b8
  a4 fis8 \autoBeamOn d8.( e16) \autoBeamOff fis8
  \autoBeamOn g8.( fis16) \autoBeamOff e8 \autoBeamOn dis8.( cis16) \autoBeamOff dis8
  e4. e \bar "|."
}}

alto = \context Voice = "alto" {
  \voiceTwo
  \relative c' {
  e8 |
  e4 d8 d4 g8
  fis4 d8 d4 d8
  b4 b8 a4 e'8
  dis4( b8) b4 e8
  e4 d8 d4 g8
  fis4 d8 d4 d8
  b4 c8 b4 b8
  b4. b
                                %Refrain
  fis' b8. a16 g8
  fis4 d8 d4 d8
  b4 b8 a4 e'8
  dis4 b8 b4.
  fis'4. b8. a16 g8
  fis4 d8 d4 d8
  b4 c8 b4 b8
  b4. b
}}

tenor = \context Voice = "tenor" {
  \voiceOne
  \relative c' {
  g8 |
  b4 a8 g4 b8
  d4 a8 fis4 a8
  g4 g8 e4 e8
  b'4. b4 g8
  b4 a8 g4 b8
  d4 a8 fis4 a8
  g4 a8 fis4 b8 a4.g
                                %Refrain
  d' d4 d8
  d4 a8 fis4 a8
  g4 g8 e4 e8
  b'4 b8 b4.
  d d4 d8
  d4 a8 fis4 a8
  g4 a8 fis4 b8 a4. g
  }
}

bass = \context Voice = "bass" {
  \voiceTwo
  \relative c {
  e8 |
  e4 fis8 g4 g8
  d4 d8 d4 d8
  e4 e8 c4 c8
  b4. b4 e8
  e4 fis8 g4 g8
  d4 d8 d4 d8
  e4 a,8 b4 b8
  e4. e
                                %Refrain
  b'4. g4 g8
  d4 d8 d4 d8
  e4 e8 c4 c8
  b4 b8 b4.
  b' g4 g8
  d4 d8 d4 d8
  e4 a,8 b4 b8
  e4. e
  }
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
      \verseI }
    \context Lyrics = "stanza-2" \lyricsto "sop" {
      \set stanza = #"2. "
      \verseII }
    \context Lyrics = "stanza-3" \lyricsto "sop" {
      \set stanza = #"3. "
      \verseIII }
    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
}
