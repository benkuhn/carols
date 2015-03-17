% Created on Tue Nov 24 23:05:52 EST 2009
\version "2.15.19"

\header {
	title = "'Twas in the Moon of Wintertime"
	subtitle = "IesoȢs Ahatonnia"
	poet = "St. Jean de Brébeuf (c. 1643)"
	composer = "Ancient French Carol"
	arranger = "arr. Healey Willan, 1927 (modified)"
	
}
#(set-global-staff-size 15)
\paper {
	#(set-paper-size "letter")
	% ragged-bottom=##f
	% ragged-last-bottom=##f
}


verseI= \lyricmode {
	\set stanza = "Wendat."	
	E -- stenn -- ia -- lon de tson -- Ȣ -- e Ie -- soȢs a -- ha -- tonn -- ia
	On -- na -- Ȣa -- te -- Ȣa d'o -- ki n'on -- Ȣ -- and -- as -- kȢa -- en -- tak
	En -- non -- chi -- en skȢa -- tri -- ho -- tat -- _  n'on -- Ȣan -- di -- lon -- rach -- a -- tha
	Ie -- soȢs a -- ha -- tonn -- ia; a -- ha -- tonn -- ia
	Ie -- soȢs a -- ha -- tonn -- ia.
	}
 
verseII= \lyricmode {
	\set stanza = "1."	
	'Twas in the moon of win -- ter -- time when all the birds had fled
	That migh -- ty Git -- chi Man -- i -- tou sent an -- gel choirs in -- stead;
	Be -- fore their light the stars grew dim,
	And won -- dring hun -- ters heard the hymn:
	Je -- sus your King is born, Je -- sus is born
	In ex -- cel-sis glo -- ri -- a 
	2. With -- in a lodge of 

}
 
verseIII= \lyricmode {
	\set stanza = "2."	
	With -- in a lodge of bro -- ken bark
	The ten -- der babe was found,
	A rag -- ged robe of rab -- bit skin en -- wrapped His beau -- ty round;
	But as the hun -- ter braves drew nigh
	the an -- gel song rang loud and high.
}
 
verseIIII= \lyricmode {
	\set stanza = "3."	
	The ear -- liest moon of win -- ter time
	Is not so round and fair
	As was the ring of glo -- ry  on
	The help -- less In -- fant there.
	The chiefs from far be -- fore Him knelt
	With gifts of fox and bea -- ver pelt.

}
verseIIIII= \lyricmode {
	\set stanza = "4."
	O chil -- dren of the for -- est free,
	O sons of Man -- i -- tou
	The Ho -- ly Child of earth and heav'n
	Is born to -- day for you.
	Come kneel be -- for the ra -- diant Boy
	Who brings you beau -- ty, peace and joy.
}

staffSoprano = \new Staff  {
	\time 4/8
	\set Staff.instrumentName="Melody"
	\set Staff.midiInstrument="choir aahs"
	\key a \minor
	\clef treble
	\relative { 	
		\context Voice = "melodySop" {
			\dynamicUp		
 \partial 8 r8 r2 r r r8 r4
 	e'8
	a b c d 
	\repeat volta 5 {c b a g 
	a a b g 
	a4 r8 e8
	a b c d 
	c b a g 
	a c b g 
	a4 r8 a8
	e' e b c
	d8. c16 b8 b
	c b a a 
	b8. a16 a8( g)\fermata
	e a a4
	g8 f e4
	a4 g8 e
	a r8 a8 b
	\time 3/4   \override Staff.TimeSignature #'stencil = ##f c( d) e4 b 
	\time 4/8   \override Staff.TimeSignature #'stencil = ##f a4. r8 }
	\alternative {
	{r4 r8 e8
	a b c d}
	{r2 r r r }
	}
 
		}

% \bar "|."
	}

}
staffPiano = \new PianoStaff {
	\set PianoStaff.midiInstrument = #"acoustic grand"
	\set PianoStaff.instrumentName = #"Piano  "
				<<
		\context Staff = "RH" {  % Right hand 
			\clef treble
			\key a \minor
			\relative  {
	\partial 8 r8 r4 r8 e'8
	a b c <e, b' e>
	<a e' a>4 <b d g(> <a) e' a>4. r8 
	 r4 r8 f8 
	a b c <b e> 
	<< { e8 d b4 } \\ {a4 ~ a8 g} >>
	r8  e8 a b
	<a c> <b e> <c a'> <b g>
	<c a> < b e> <a c> <b e> ~
	<c e> ~ <c f> <b g> ~ <b e> 
	<< {e8 d c d} \\ { a2 } >>
	<< { <e a e'>4 <g g'> } \\ {s4 b8 c} >>
	<d, a' d>4 <d g b>
	<e c'> <c a'>
	<e b'> <c a'>8 <b g'> \fermata
	<< {e8( a a4)} \\ {c,2} >>
	<< {g'8( f e4)} \\ {c2} >>
	<c a'>4( <b g'>) 
	<< {e'4.^\markup \italic \small "poco rall. e cresc." d8}  \\ {c8 b a4} >>
	\override Staff.TimeSignature #'stencil = ##f <g c>8 <f a d> << {<g e'>2} \\ {c4 b} >>
	\override Staff.TimeSignature #'stencil = ##f a8 <e b'>_\markup \italic \small "a tempo" <a c> <b e> 
	<c a'> <b e> <c a'> <e b'>
	<a c> r8 r f,
	<c' a'>( <e b'> <a c> <b e>
	\ottava #1 <a e' a>4) <b d g>
	<fis d' fis a>2\pp
	<e c' e a>\ppp \ottava #0		}
		}
		\context Staff = "LH" {  % Left hand 			
			\clef bass
			\key a \minor
			\relative  {
	\partial 8 e8\p
	a b c e
	c b a e 
	<< { <e a,>2 } \\ { d'4 \rest <b e g>4 } >>
	<< {<a, e'>4 e'8} { <a c e>4. s8 } >>
	a b c d 
	c b a g
	f4 g( 
	<a c>4.) e8
	a e a,4 ~
	a8 e' c' b
	a4 e 
	f2
	<c a'>4 <e b'> 
	<f a> g
	<a c> <f a>
	<e g> <a, e'> ~
	<a e'>2
	<< {e'8 f g4} \\ {c,2} >>
	<a e'>2
	a'8 g f4
	\override Staff.TimeSignature #'stencil = ##f e8 d c4 e
	\override Staff.TimeSignature #'stencil = ##f <a e'>2 ~
	<a e'>8 r8 r e8(
	a b c d)
	<a e'>2\repeatTie 
	<< {<a e'>^\markup \italic \small "rall." } \\ {r4 <b e g> } >>
	<d,, a' fis'>2 <a' e' c'>
			}
		}
	>>
}



\score {	\transpose a e, 
	
	<<
		\staffSoprano
		\context Lyrics = "lmelodySopLI" \lyricmode  { \lyricsto "melodySop" \verseI }
		
		\context Lyrics = "lmelodySopLII" \lyricmode  { \lyricsto "melodySop" \verseII }
		
		\context Lyrics = "lmelodySopLIII" \lyricmode  { \lyricsto "melodySop" \verseIII }
		
		\context Lyrics = "lmelodySopLIIII" \lyricmode  { \lyricsto "melodySop" \verseIIII }

		\context Lyrics = "lmelodySopLIIIII" \lyricmode  { \lyricsto "melodySop" \verseIIIII }
		
		\staffPiano
	>>
	
	\midi {
	}

	\layout  {page-count = 2
	}
}

\paper {
}

