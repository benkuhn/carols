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
  % a little more room between the title block and the first staff
  markup-system-spacing.padding = #2

  % Title, then 'poet | composer', then 'translator | arranger' (that line
  % only when there's a translator or arranger)
  bookTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)
    \column {
      \fill-line { \fromproperty #'header:dedication }
      \fill-line { \huge \larger \larger \bold \fromproperty #'header:title }
      \fill-line { \large \bold \fromproperty #'header:subtitle }
      \fill-line {
        \fromproperty #'header:poet
        \fromproperty #'header:composer
      }
      % translator | arranger, stacked if they don't fit side by side
      \on-the-fly #(lambda (layout props arg)
        (let* ((tr (chain-assoc-get 'header:translator props #f))
               (ar (chain-assoc-get 'header:arranger props #f))
               (lw (chain-assoc-get 'line-width props 100))
               (width (lambda (m)
                 (if m (interval-length (ly:stencil-extent
                         (interpret-markup layout props m) X)) 0))))
          (cond
            ((not (or tr ar)) empty-stencil)
            ((< (+ (width tr) (width ar) 4) lw)
             (interpret-markup layout props
               (markup #:fill-line ((or tr "") (or ar "")))))
            (else
             (interpret-markup layout props
               (markup #:column ((#:fill-line (tr ""))
                                 (#:fill-line ("" ar)))))))))
      \null
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
