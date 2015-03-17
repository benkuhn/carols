\version "2.14.2"
\include "header.ly"
\header {
  title = "Masters in This Hall"
  poet = "William Morris (1834–1896)"
  composer = "Marin Marais (1656–1728)"
  arranger = "arr. Edmund Sedding (1836–1868)"
  metre = "Marche pour les Matelots"
}

global = {
  \preamble
  \key f \major
  \time 6/8
  \autoBeamOff
  #(set-global-staff-size 12)
}

sopMusic = \relative c' {
  d4 a'8 a4 g8 |
  f4.( g) |
  a4 g8 f4 e8 |
  f4( e8 d4 cis8) |
  
  d4 a'8 a4 g8 |
  f4.( g4) g8 |
  a4 g8 f4 e8 |
  d2. \bar"||" \break
  
  \repeat unfold 2 {
    f'4 e8 d4 cis8 |
    d4. a |
    f'4 e8 d4 cis8 |
    d4.a4 c8 |
    
    bes4 g8 a4 e8 |
    f4( d8) f4( g8) |
  }
  \alternative {
    {
      a4 a8 cis4 cis8 |
      d2. |
    }
    {
      a4 a8 f4 e8 |
      d2. \bar"|."
    }
  }
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c' {
  a4 f'8 e4 e8 |
  d4.( e) |
  f4 e8 d4 cis8 |
  d4( bes8 a4.) |
  
  a4 f'8 e4 e8 |
  d4.( e4) e8 |
  f4 e8 d4 cis8 |
  d2.
  
  \repeat unfold 2 {
    a'4 g8 f4 e8 |
    f4. f |
    a4 g8 f4 e8 |
    f4. d4 d8 |
    
    d4 d8 e4 e8 |
    d4. d |
  }
  \alternative {
    {
      d4 f8 e4 g8 |
      f2. |
    }
    {
      d4 d8 d4 cis8 |
      d2. \bar"|."
    }
  }
}
altoWords = {
  \lyricmode {
    \set stanza = #"1. "
    Mas -- ters in this hall,
    Hear ye news to -- day,
    Brought from o -- ver sea,
    And ev -- er I you pray,
  }
  \lyricmode{
    No -- ël! No -- ël! No -- ël! 
    No -- ël sing we clear! Holp -- en are all folk on earth
    Born is God’s Son so dear:
    
    No -- ël! No -- ël! No -- ël! 
    No -- ël, sing we loud!
    God to -- day hath poor folk rais’d
    And cast a -- down the proud.
  }
}
altoWordsII = \lyricmode {
%\markup\italic
  \set stanza = #"12. "
  This is Christ, the Lord, __
  Mas -- ters be ye glad! __ 
  Christ -- mas is come in, __
  And no folk should be sad!
}
verses = \markup { \fill-line {
  \hspace #0.1
  \column {
    \line { \bold "2." Going o'er the hills, through the milk-white snow, }
    \line { Heard I ewes bleat, while the wind did blow. }
    \vspace #0.1
    \line { \bold "3." Shepherds many a one sat among the sheep, }
    \line { No man spake more word than they had been asleep: }
    \vspace #0.1
    \line { \bold "4." Quoth I, “Fellows mine, why this guise sit ye? }
    \line { Making but dull cheer, shepherds though ye be? }
    \vspace #0.1
    \line { \bold "5." “Shepherds should of right leap and dance and sing, }
    \line { Thus to see ye sit, is a right strange thing”: }
    \vspace #0.1
    \line { \bold "6." Quoth these fellows then, “To Bethlem town we go, }
    \line { To see a mighty lord lie in manger low”: }
  }
  \hspace #0.1
  \column {
    \line { \bold "7." “How name ye this lord, shepherds?” then said I, }
    \line { “Very God,” they said, “Come from Heaven high”: }
    \vspace #0.1
    \line { \bold "8." Then to Bethlem town we went two and two, }
    \line { And in a sorry place heard the oxen low: }
    \vspace #0.1
    \line { \bold "9." Therein did we see a sweet and goodly may }
    \line { And a fair old man, upon the straw she lay: }
    \vspace #0.1
    \line { \bold "10." And a little child on her arm had she, }
    \line { “Wot ye who this is?” said the hinds to me: }
    \vspace #0.1
    \line { \bold "11." Ox and ass him know, kneeling on their knee, }
    \line { Wondrous joy had I this little babe to see: }
  }
  \hspace #0.1
}}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  \set ignoreMelismata = ##t
}
altoWordsIV = \lyricmode {
  \set stanza = #"4. "
  \set ignoreMelismata = ##t
}
altoWordsV = \lyricmode {
  \set stanza = #"5. "
  \set ignoreMelismata = ##t
}
altoWordsVI = \lyricmode {
  \set stanza = #"6. "
  \set ignoreMelismata = ##t
}
tenorMusic = \relative c {
  f4 a8 a4 a8 |
  a4.( c) |
  c4 bes8 a4 a8 |
  a4( g8 a4 g8) |
  
  f4 a8 a4 a8 |
  a4.( c4) c8 |
  c4 bes8 a4 a8 |
  f2.
  
  \repeat unfold 2 {
    a4 a8 a4 a8 |
    a4. d |
    d4 bes8 a4 a8 |
    a4. a4 a8 |
    
    g4 bes8 a4 a8 |
    a4( f8) f4. |
  }
  \alternative {
    {
      f4 d8 a'4 a8 |
      a2. |
    }
    {
      f4 f8 a4 g8 |
      f2. \bar "|."
    }
  }
}
tenorWords = \lyricmode {

}

bassMusic = \relative c{
  d4 d8 cis4 cis8 |
  d4.( c!) |
  f4 g8 a4 a,8 |
  d4( g8 f4 e8) |
  
  f4 d8 cis4 cis8 |
  d4.( c!4) c8 |
  f4 g8 a4 a,8 |
  d2. |
  
  \repeat unfold 2 {
    d4 a8 a4 a8 |
    d4. d |
    d4 g8 a4 a8 |
    d,4. fis4 fis8 |
    
    g4 g8 cis,4 cis8 |
    d4. bes |
  }
  \alternative {
    {
      a4 a8 a4 a8 |
      d2.
    }
    {
      a4 a8 a4 a8 |
      d2. \bar"|."
    }
  }
}

\score {
  <<
   \new ChoirStaff <<
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"women" } \lyricsto "sopranos" \sopWords
     \new Lyrics = "altosVI"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsVI
    \new Lyrics = "altosV"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsV
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"men"  } \lyricsto "tenors" \tenorWords
  >>
  >>
}
\verses