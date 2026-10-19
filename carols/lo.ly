\version "2.24.0"

\header {
  title = "Lo, How a Rose E’er Blooming"
  poet = "German, 16th century"
  translator = "trans. Theodore Baker (1851–1934) and Harriet Krauth Spaeth (1845–1925)"
  composer = "German, 16th century"
  arranger = "arr. Michael Praetorius (1571–1621)"
}

\include "header.ly"

global= {
  \autoBeamOff
  \time 10/4
  \key f \major
}

sop = \context Voice = "sop"    {
  \voiceOne
  \relative c' {
  c'2 c4 c d c c2 a |
    bes a4 g2 f e4 f2 |
    c'2 c4 c d c c2 a |
    bes a4 g2 f e4 f2 |
    \time 8/4
    b4 \rest a g e f d c2 |
    \time 10/4 b'4 \rest c c c d c c2 a |
    \time 12/4 bes a4 g2 f e4 f1 \bar "|."
  }}

alto=\context Voice = "alto"   {
  \voiceTwo
  \relative c' {
  a'2 a4 f f f e2 d d
  c4 c d4.( a8 c4) c c2
  a'2 a4 f f f e2 d d
  c4 c d4.( a8 c4) c c2
  s4 f d c c b \autoBeamOn c8( d \autoBeamOff e4) s
  e4 g f f f e2 d d
  f4 d e( f g) c, c1
  }}

tenor = \context Voice = "tenor"   {
  \voiceOne
  \relative c' {
  c2 c4 a bes a g2 f f
  a4 c bes( a2) g4 a2
  c2 c4 a bes a g2 f f
  a4 c bes( a2) g4 a2
  d,4 \rest c'4 bes a a g g2 d4 \rest
  g4 g a bes a g2 fis g
  c4 bes a2 g a1
  }}

bass = \context Voice = "bass"   {
  \voiceTwo
  \relative c' {
  f,2 f4 f bes f c2 d bes
  f'4 e d2 c f
  f2 f4 f bes f c2 d bes
  f'4 e d2 c f
  s4 f g a f g c,2 s4
  c4 e f bes, f' c2 d g,
  a4 bes c2 c <<f1 f,>>
  }}
stanzaa = \lyricmode {
  Lo, how a Rose e’er bloom -- ing
  From ten -- der stem hath sprung!
  Of Jes -- se’s lin -- eage com -- ing
  As men of old have sung.
  It came a flow’ -- ret bright,
  A -- mid the cold of win -- ter,
  When half -- spent was  the night.
}

stanzab = \lyricmode {
  I -- sai -- ah ’twas fore -- told it,
  The Rose I have in mind,
  With Ma -- ry we be -- hold it,
  The Vir -- gin Moth -- er kind.
  To show God’s love a -- right,
  She bore to men a Sav -- iour,
  When half -- spent was the night.
}
stanzac = \lyricmode {
  This flow’r, whose fra -- grance ten -- der
  With sweet -- ness fills the air,
  Dis -- pels with glo -- rious splen -- dour
  The dark -- ness ev -- ery -- where;
  True man, yet ver -- y God,
  From sin and death He saves us,
  And light -- ens ev -- ery load.
}

\score {  %\transpose d c
  \context ChoirStaff <<
    \context Staff ="upper"  { \clef "G" <<
      \global
      \sop
      \alto
    >>}

    \context Lyrics = "stanza-1" \lyricsto "alto" {
      \set stanza = #"1. "
      \stanzaa }
    \context Lyrics = "stanza-2" \lyricsto "alto" {
      \set stanza = #"2. "
      \stanzab }
    \context Lyrics = "stanza-3" \lyricsto "alto" {
      \set stanza = #"3. "
      \stanzac }

    \context Staff = "lower"  { \clef "F"<<
      \global
      \tenor
      \bass
    >>}
  >>
  \layout {
    \context {
      \Staff
      \remove Time_signature_engraver
    }
  }
}
