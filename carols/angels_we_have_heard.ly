\version "2.14.2"
\include "header.ly"
\header {
  title = "Angels We Have Heard on High"
  meter = "Gloria 7.7.7.7. with refrain"
  poet = "trans. Bishop James Chadwick (1813–1882)"
  composer = "18th Century French Carol"
}
global = {
  \preamble
  \key g \major
  \time 4/4
  \autoBeamOff
}

sopMusic = \relative c'' {
  b4 b b d |
  d4. c8 b2 |
  b4 a b d |
  b4. a8 g2 |

  b4 b b d |
  d4. c8 b2 |
  b4 a b d |
  b4. a8 g2 |
  
  \repeat volta 2 {
    d'2( e8[ d c b] |
    c2 d8[ c b a] |
    b2 c8[ b a g] |
    a4.) d,8 d2 | \break
    g4 a b c |
  }
  \alternative {
    { b2 a | }
    { b2( a2) | g1 | }
  }
}
sopWords = \lyricmode {

}

altoMusic = \relative c'' {
  g4 g fis fis |
  a fis g2 |
  g4 fis g g |
  g fis g2 |
  
  g4 g fis fis |
  g a g2 |
  g4 fis g g |
  g fis g2 |
  
  g4( b8[ a] g2~ |
  g4 a8[ g] fis2~ |
  fis4 g8[ fis] e2 |
  d4.) d8 d2 |
  d4 fis g g |
  g2 fis2 |
  
  g2( fis2) | d1 |
}
altoWords = {
  \lyricmode {
    \set stanza = #"1. "
    An -- gels we have heard on high,
    Sweet -- ly sing -- ing o’er the plains;
    And the moun -- tains in re -- ply
    Ech -- o -- ing their joy -- ous strains.
    \lyricItal Glo -- ri -- a  in  ex -- cel -- sis  De -- o, De -- o! \lyricNormal
  }
}
altoWordsII = \lyricmode {
  \set stanza = #"2. "
  Shep -- herds, why this ju -- bi -- lee?
  Why your joy -- ous songs pro -- long?
  What the glad -- some ti -- dings be
  Which in -- spire your heav’n -- ly song?
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  Come to Beth -- le -- hem and see
  Him whose birth the an -- gels sing;
  Come a -- dore on bend -- ed knee
  Christ, the Lord, our new -- born King.
}
altoWordsIV = \lyricmode {
  \set stanza = #"4. "
  See Him in a man -- ger laid,
  Whom the choirs of an -- gels praise;
  Ma -- ry, Jo -- seph, lend your aid,
  While our hearts in love we raise.
}

tenorMusic = \relative c' {
  d4 d d d |
  c d d2 |
  d4 d d d |
  d4. c8 b2 |

  d4 d d d |
  c d d2 |
  d4 d d d |
  d4. c8 b2 |

  b2( e~ |
  e d~ |
  d c4. b8 |
  a4) g fis2 |
  g4 d' d e |
  d2 d2 |
  d2.( c4) | b1 |
}
tenorWords = \lyricmode {

}

bassMusic = \relative c' {
  g4 g b b |
  a d, g2 |
  g4 d g b |
  d d, g2 |

  g4 g b b |
  e, fis g2 |
  g4 d e b8 c |
  d4 d g2 |

  g2( e4 g |
  a2 d,4 fis |
  g2 c,4 e |
  fis) e d( c) |
  b d g c, |
  d2 d |

  d1 | g1 |
}
bassWords = \lyricmode {

}

\score {
  \transpose g f
  <<
   \new ChoirStaff <<
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"women" } \lyricsto "tenors" \sopWords
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "tenors" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "tenors" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "tenors" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "tenors" \altoWords
    \new Lyrics \with { alignAboveContext = #"men" } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \bassWords
  >>
  >>
}
