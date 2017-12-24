\header {
  filename = "GoodKingWenceslas.ly"
  enteredby = "Gordon Gilbert"
  composer = "Melody from Piae Cantones, 1582"
  poet = "J. M. Neale"
  date=""
  title = "Good King Wenceslas"
  metre = ""
  meter = \metre
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Gordon Gilbert"
  maintainerEmail = "gord@angel.eicat.ca"
  lastupdated = "2011/Dec/13"
}

\version "2.14.2"

\include "header.ly"

global= {
  \preamble
  \time 4/4
  \key aes \major
}

sop = \context Voice = "sop"    {
  \voiceOne
  \relative c'' {
    aes4 aes aes bes |
    aes aes ees2 |
    f4 ees f g |
    aes2 aes |

    aes4 aes aes bes |
    aes aes ees2 |
    f4 ees f g |
    aes2 aes |

    ees'4 des c bes |
    c bes aes2 |
    f4 ees f g |
    aes2 aes |

    ees4 ees f g |
    aes aes bes2 |
    ees4 des c bes |
    aes2( des) |
    aes1 \bar "|."
  }}

alto=\context Voice = "alto"   {
  \voiceTwo
  \relative c' {
  ees4 ees f ees |
  ees f bes,2 |
  des4 ees des des |
  ees2 ees |

  ees4 ees f f |
  ees f bes,2 |
  des4 ees des des |
  ees2 ees |

  aes4 aes aes g |
  aes g f2 |
  aes,4 ees' des des |
  ees2 ees |

  ees4 ees des des |
  c c ees2 |
  ees4 aes g g |
  aes2( f) |
  ees1 \bar "|."

  }}

tenor = \context Voice = "tenor"   {
  \voiceOne
  \relative c' {
  c4 c c bes |
  c des g,2 |
  aes4 aes aes bes |
  c2 c |

  c4 c c bes |
  c des g,2 |
  aes4 aes aes bes |
  c2 c |

  ees4 f ees ees |
  ees ees c2 |
  des4 aes aes bes |
  ees,2 ees |

  aes4 aes aes bes |
  aes aes g2 |
  aes4 f' ees ees |
  c2( des)
  c1 \bar "|."
  }}

bass = \context Voice = "bass"   {
  \voiceTwo
  \relative c' {
  aes4 aes f g |
  aes des, ees2 |
  des4 c des4 bes4 |
  aes2 aes |

  aes'4 aes f g |
  aes des, ees2 |
  des4 c des4 bes4 |
  aes2 aes |

  c4 des ees ees |
  c ees f2 |
  des4 c des bes |
  aes2 aes |

  c4 c des bes |
  f' f ees2 |
  c4 des ees ees |
  f2( des) |
  aes'1 \bar "|."
  }}

accomp=\chordmode {

}



stanzaa = \lyricmode {
  Good King Wen -- ces -- lass looked out
  On the feast of Ste -- phen,
  When the snow lay round a -- bout,
  Deep and crisp and e -- ven;
  Bright -- ly shone the moon that night,
  Though the frost was cru -- el;
  When a poor man came in sight
  Gath -- 'ring win -- ter fu -- el.
}

stanzab = \lyricmode {
  “Hi -- ther, page, and stand by me,
  If thou know'st it, tel -- ling,
  Yon -- der pea -- sant, who is he;
  Where and what his dwel -- ling?”
  “Sire, he lives a good league hence,
  Un -- der -- neath the moun -- tain,
  Right a -- gainst the for -- est fence,
  By Saint Ag -- nes' foun -- tain.”
}

stanzac = \lyricmode {
  “Bring me flesh and bring me wine;
  Bring me pine logs hi -- ther.
  Thou and I will see him dine,
  When we bear them thi -- ther.”
  Page and mon -- arch, forth they went;
  Forth they went to -- ge -- ther
  Through the rude wind's wild la -- ment
  And the bit -- ter wea -- ther.
}

stanzad = \lyricmode {
  “Sire, the night is dark -- er now,
  And the wind blows stron -- ger;
  Fails my heart, I know not how;
  I can go no lon -- ger.”
  “Mark my foot -- steps, good my page,
  Tread thou in them bold -- ly;
  Thou shalt find the win -- ter's rage
  Freeze thy blood less cold -- ly.”
}
stanzae = \lyricmode {
  In his mas -- ter's steps he trod,
  Where the snow lay din -- ted;
  Heat was in the ve -- ry sod
  Which the saint had prin -- ted.
  There -- fore, Chris -- tian men, be sure,
  Wealth or rank pos -- sess -- ing,
  Ye who now will bless the poor,
  Shall your -- selves find bless -- ing.
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
    \lyricsto "sop" \context Lyrics = "stanza-4" {
      \set stanza = "4."
      \stanzad }
    \lyricsto "sop" \context Lyrics = "stanza-5" {
      \set stanza = "5."
      \stanzae }
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

