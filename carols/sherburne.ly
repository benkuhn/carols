\version "2.24.0"

\header {
  title = "Sherburne"
  poet = "Nahum Tate (1652–1715)"
  composer = "Daniel Read (1757–1836)"
  meter = "Sherburne 8.6.8.6."
}

\include "header.ly"
% smaller than the house staff size (14) so that this fits on one page
#(set-global-staff-size 10.5)

global= {
  \autoBeamOff
  \time 4/4
  \key d \major
}

sop = \context Voice = "sop"    {
  \sacredHarpHeads
  \relative c'' {
    a2 a4 fis4 | \autoBeamOn g8( a) \autoBeamOff \autoBeamOn b( cis) \autoBeamOff d4 d | d2. d4 | cis a b a | a2.
    \repeat volta 2 {
      r4 |
      r1 | r1 | r2. a4 | d d fis d | b b b a | b2. b4 | b b b \autoBeamOn a8( g) \autoBeamOff | a2. a4 | fis fis fis2 |
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
      fis fis4 fis | fis fis fis d | e e e \autoBeamOn fis8( g) \autoBeamOff | a2. g4 |
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
    a2 fis4 d | b'4 b b a | b2. d4 | \autoBeamOn a8.( fis16) \autoBeamOff d4 g fis | e2.
    \repeat volta 2 {
      \bar ";" r4 |
      r2. a4 | d d fis d | b b b a | d2. a4 | fis fis fis a | b2. g4 | e e e2 | r2.
      a4 | b b b d | a a a d, | d2. d4 | g g g b | e2. d4 |
    }
    \alternative {
      { a a a2 ~ |
        % make LY happy w/ partial measure
        \set Timing.measureLength = #(ly:make-moment 3/4)
        a2.
        \set Timing.measureLength = #(ly:make-moment 4/4)
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

\score {
  \context ChoirStaff <<
    \context Staff ="sopStaff"  { \clef "G" <<
      \global
      \sop
    >>}
    \context Lyrics = "sop-1" \lyricsto "sop" {
      \set stanza = "1."
      \stanzaa
      \sopa
    }
    \context Lyrics = "sop-2" \lyricsto "sop" {
      \filler
      \sopb
    }

    \context Staff ="altoStaff"  { \clef "G" <<
      \global
      \alto
    >>}
    \context Lyrics = "alto-1" \lyricsto "alto" {
      \filler
      \altoa
    }
    \context Lyrics = "alto-2" \lyricsto "alto" {
      \filler
      \altob
    }

    \context Staff = "tenorStaff"  { \clef "G"<<
      \global
      \tenor
    >>}
    \context Lyrics = "tenor-1" \lyricsto "tenor" {
      \filler
      \tenora
    }
    \context Lyrics = "tenor-2" \lyricsto "tenor" {
      \set stanza = "2."
      \stanzab
      \tenorb
    }

    \context Staff = "bassStaff"  { \clef "F"<<
      \global
      \bass
    >>}
    \context Lyrics = "bass-1" \lyricsto "bass" {
      \filler
      \bassa
    }
    \context Lyrics = "bass-2" \lyricsto "bass" {
      \filler
      \bassb
    }

  >>
}
