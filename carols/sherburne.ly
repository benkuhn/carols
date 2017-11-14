\header {
  filename = "sherburne.ly"
  enteredby = "Ben Kuhn"
  composer = "Daniel Read, 1783"
  arranger = ""
  poet = "Nahum Tate, 1700"
  date ="1830"
  title = "Sherburne"
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Ben Kuhn"
  lastupdated = "2015/Dec/05"
  see_also = "While Shepherds Watched their Flocks!Sherburne"
}

\version "2.14.2"

\include "header.ly"

global= {
  \preamble
  \time 4/4
  \key d \major
}

sop = \context Voice = "sop"    {
  \sacredHarpHeads
  \relative c'' {
    a2 a4 fis4 | g8( a) b( cis) d4 d | d2. d4 | cis a b a | a2.
    \repeat volta 2 {
      r4 |
      r1 | r1 | r2. a4 | d d fis d | b b b a | b2. b4 | b b b a8( g) | a2. a4 | fis fis fis2 |
      r2. fis4 | a a a a | b b b d | e2. cis4 |
    }
    \alternative {
      { d4 d d2 ~ | d2. }
      { d4 d d2 ~ | d1 }
    }
  }
}

alto=\context Voice = "alto"   {
  \sacredHarpHeads
  \relative c' {
    d2 d4 d | d d d fis | fis2. fis4 | fis d cis d | e2.
    \repeat volta 2 {
      r4 |
      r1 | r2. a,4 | d d fis d | b b b a | d2. fis4 | e e e e | e1 ~ | e2. e4 | d d d2 |
      fis fis4 fis | fis fis fis d | e e e fis8( g) | a2. g4 |
    }
    \alternative {
      { fis1 ~ | fis2. }
      { fis1 ~ | fis1 }
    }
  }
}

tenor = \context Voice = "tenor"   {
  \sacredHarpHeads
  \relative c'' {
    a2 fis4 d | b'4 b b a | b2. d4 | a8.( fis16) d4 g fis | e2.
    \repeat volta 2 {
      \bar ";" r4 |
      r2. a4 | d d fis d | b b b a | d2. a4 | fis fis fis a | b2. g4 | e e e2 | r2.
      a4 | b b b d | a a a d, | d2. d4 | g g g b | e2. d4 |
    }
    \alternative {
      { a a a2 ~ |
        % make LY happy w/ partial measure
        \set Timing.measureLength = #(ly:make-moment 3 4)
        a2.
        \set Timing.measureLength = #(ly:make-moment 4 4)
      }
      { a4 a a2 ~ | a1 \bar "|." }
    }
  }
}

bass = \context Voice = "bass"   {
  \sacredHarpHeads
  \relative c {

    d2 d4 d | g g g d | b2. b4 | fis' fis e d | a2.
    \repeat volta 2 {
      a4 |
      d d fis d | b b b a | d1 ~ | d2. fis4 | b, b b d | e1 ~ | e2. e4 | a a a2 |
      r2. d,4 | d d d d | a' fis d fis | e2. d4 | a2. a4 |
    }
    \alternative {
      { d1 ~ | d2. }
      { d1 ~ | d1 }
    }
  }
}

accomp=\chordmode {

}



stanzaa = \lyricmode {
  While shep -- herds watch'd their flocks by night
  All seat -- ed on the ground,
}
filler = \lyricmode {
  % ugh can't figure out how to skip multiple measures
  "" "" "" "" "" "" "" "" "" "" "" "" "" ""
}
stanzab = \lyricmode {
  All glo -- ry be to God on high, And to the earth be peace
}
vaa = \lyricmode { The an -- gel of the Lord came down, }
vab = \lyricmode { And glo -- ry shone a -- round, }
vaf = \lyricmode { And glo -- ry shone a -- round. }
vba = \lyricmode { Good will hence -- forth from heav'n to men }
vbb = \lyricmode { Be -- gin and nev -- er cease }
vbf = \lyricmode { Be -- gin and nev -- er cease. }

sopa = {
  \vaa
  \vab
  \vab
  \vaa
  \vaf
}
altoa = \sopa
bassa = \sopa
tenora = {
  \vaa
  \vab
  \vab
  \vaa
  \vab
  \vaf
}

sopb = {
  \vba
  \vbb
  \vbb
  \vba
  \vbf
}
altob = \sopb
bassb = \sopb
tenorb = {
  \vba
  \vbb
  \vbb
  \vba
  \vbb
  \vbf
}

% max size that makes this fit on 1 page
#(set-global-staff-size 10.5)

\score {
  \context ChoirStaff <<
    \context ChordNames \accomp
    \unset ChoirStaff.melismaBusyProperties
    \context Staff ="sopStaff"  { \clef "G" <<
      \global
      \sop
    >>}
    \lyricsto "sop" \context Lyrics = "sop-1" {
      \set stanza = "1."
      \stanzaa
      \sopa
    }
    \lyricsto "sop" \context Lyrics = "sop-2" {
      \filler
      \sopb
    }

    \context Staff ="altoStaff"  { \clef "G" <<
      \global
      \alto
    >>}
    \lyricsto "alto" \context Lyrics = "alto-1" {
      \filler
      \altoa
    }
    \lyricsto "alto" \context Lyrics = "alto-2" {
      \filler
      \altob
    }

    \context Staff = "tenorStaff"  { \clef "G"<<
      \global
      \tenor
    >>}
    \lyricsto "tenor" \context Lyrics = "tenor-1" {
      \filler
      \tenora
    }
    \lyricsto "tenor" \context Lyrics = "tenor-2" {
      \set stanza = "1."
      \stanzab
      \tenorb
    }

    \context Staff = "bassStaff"  { \clef "F"<<
      \global
      \bass
    >>}
    \lyricsto "bass" \context Lyrics = "bass-1" {
      \filler
      \bassa
    }
    \lyricsto "bass" \context Lyrics = "bass-2" {
      \filler
      \bassb
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
