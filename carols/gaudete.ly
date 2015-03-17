\version "2.14.2"  % necessary for upgrading to future LilyPond versions.

\include "header.ly"

global= {
  \preamble
  \key a \minor
}

cantusMusicChorus = \relative a' {
  \time 5/4
  a4^\markup{\bold Chorus} a g a8 b c4 
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  c8 b4 a8 g4 g | 
  g a b4. a8 
  \time 5/4
  g4 a8 b4 a8 g4 a
  \bar ":|"
}

altusMusicChorus = \relative c' {
  \time 5/4
  e4 e e f8 g g4 
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  g8 g4 a8 e4 e | e e g4. a8 
  \time 5/4
  e4 d8 d4 g8 d4 e 
  \bar ":|"
}

tenorMusicChorus = \relative c' {
  \time 5/4
  c4 c b c8 d e4 
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  e8 d4 c8 b4 b | b c d4. c8 
  \time 5/4
  b4 c8 d4 c8 b4 c 
  \bar ":|"
}

bassusMusicChorus = \relative c {
  \time 5/4
  a4 a e' e8 d c4
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  a8 d4 d8 e4 e | e c g4. g8
  \time 5/4
  e4 g8 g4 g8 e4 a
  \bar ":|"
}

altusMusicVerse = \relative a' {
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  a8^\markup{Solo} a g a c b a4 | a8 f e f d4 d |
  d8 d f d f g a4 | c8 a b c a4 a
  \bar "||"
}

bassusMusicVerse = \relative c {
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  a8^\markup{Solo} e' e d c b a4 | b8 c b a g4 e |
  a8 c b c d b g4 | c8 a g b a4 a
}

wordsChorus = \lyricmode {
  Gau -- de -- te, Gau -- de -- te! Chri -- stus est na -- tus
  Ex Ma -- ri -- a Vir -- gi -- ne: gau -- de -- te!
}

wordsVerseA = \lyricmode {
  \set stanza = "1."
  Tem -- pus ad -- est gra -- ti -- ae, Hoc quod op -- ta -- ba -- mus
  Car -- mi -- na lae -- ti -- ti -- ae De -- vo -- te red -- da -- mus.
}

wordsVerseB = \lyricmode {
  \set stanza = "2."
  De -- us ho -- mo fac -- tus est, na -- tu -- ra mi -- ran -- te
  Mun -- dus re -- no -- va -- tus est a Chri -- sto reg -- nan -- te.
}

wordsVerseC = \lyricmode {
  \set stanza = "3."
  Eze -- chi -- e -- lis por -- \skip 8 ta clau -- sa per -- tran -- si -- tur
  Un -- de lux est or -- \skip 8 ta Sa -- lus in -- ve -- ni -- tur.
}

wordsVerseD = \lyricmode {
  \set stanza = "4."
  Er -- go nos -- tra con -- ci -- o Psal -- lat iam in lus -- tro
  Be -- ne -- di -- cat Do -- mi -- no Sa -- lus Re -- gi nos -- tro.
}

\book {

  \header{
    title = "Gaudete"
    tagline = "" 
  }

  \score {
    <<
      \context ChoirStaff <<
	\context Staff = treble <<
	  \context Voice = cantus { \voiceOne << \global \cantusMusicChorus >> }
	  \context Voice = altus { \voiceTwo << \global \altusMusicChorus >> }
	>>
	\context Lyrics = chorusLyrics { s1 }
	\context Staff = bass <<
	  \clef bass
	  \context Voice = tenor { \voiceOne << \global \tenorMusicChorus >> }
	  \context Voice = bassus { \voiceTwo << \global \bassusMusicChorus >> }
	>>

      >>

      \lyricsto "cantus" \context Lyrics = chorusLyrics \wordsChorus

    >>

    \layout {
      indent = 0\mm
      betweensystemspace = 5\mm
    }
  }

  \score {
    <<
      \context Staff = verseAltusStaff <<
	\context Voice = verseAltus { << \global \altusMusicVerse >> }
      >>
      \context Lyrics = verseLyricsA { s1 }
      \context Lyrics = verseLyricsC { s1 }
      \lyricsto "verseAltus" \context Lyrics = verseLyricsA \wordsVerseA
      \lyricsto "verseAltus" \context Lyrics = verseLyricsC \wordsVerseC
    >>

    \layout {
      indent = 0\mm
      betweensystemspace = 5\mm
    }
  }

  \score {
    << 
      \context Staff = verseBassusStaff <<
	\clef bass
	\context Voice = verseBassus { << \global \bassusMusicVerse >> }
      >>
      \context Lyrics = verseLyricsB { s1 }
      \context Lyrics = verseLyricsD { s1 }
      \lyricsto "verseBassus" \context Lyrics = verseLyricsB \wordsVerseB
      \lyricsto "verseBassus" \context Lyrics = verseLyricsD \wordsVerseD
    >>
    \layout {
      indent = 0\mm
      betweensystemspace = 5\mm
    }
  }
}

