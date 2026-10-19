\version "2.24.0"
\header {
  tagline = ""
  copyright = ""
}
\paper {
  ragged-last-bottom = ##t
  #(set-paper-size "half letter")
  bottom-margin = 6\mm
  left-margin = 6\mm
  top-margin = 6\mm
  right-margin = 6\mm

  % Like LilyPond's default title block, plus an optional 'translator'
  % line under the poet (so long credits don't collide with the composer)
  bookTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)
    \column {
      \fill-line { \fromproperty #'header:dedication }
      \fill-line { \huge \larger \larger \bold \fromproperty #'header:title }
      \fill-line { \large \bold \fromproperty #'header:subtitle }
      \fill-line { \smaller \bold \fromproperty #'header:subsubtitle }
      \fill-line {
        \fromproperty #'header:poet
        \fromproperty #'header:composer
      }
      \on-the-fly #(lambda (layout props arg)
                     (if (chain-assoc-get 'header:translator props #f)
                         (interpret-markup layout props arg)
                         empty-stencil))
      \fill-line { \fromproperty #'header:translator "" }
      \fill-line {
        \fromproperty #'header:meter
        \fromproperty #'header:arranger
      }
    }
  }
}

#(set-global-staff-size 14)

\layout {
  indent = 0.0\pt
}

lyricItal = {
  \override Lyrics.LyricText.font-shape = #'italic
}

lyricNormal = {
  \revert Lyrics.LyricText.font-shape
  \revert Lyrics.LyricText.font-series
}
