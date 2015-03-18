Here's the problem with existing books of Christmas carols:

- They don't all the carols I like.
- They take up space with carols I don't like.
- They pick bad arrangements.
- They pick bad lyrics.
- It's expensive to buy enough copies to have a good caroling party.

This is a book of four-part Christmas carols that I compiled from
various different sources, primarily:

- *Worship in Song*, the Quaker hymnal (which I learned a number of
  these from)
- The *Oxford Book of Carols*
- There's one carol that I arranged myself (El Noi de la Mare),
  because I couldn't find any other good arrangements.

## Project structure

Each carol lives in its own Lilypond file inside the `carols`
subdirectory. The final book is a LaTeX file (so that it can have a
nice title page, index, etc.), `book.tex`.

The book can be compiled in two modes: "handout" (meant to be printed
one- or two-sided and stapled in the upper-left corner), and "booklet"
(two pages per side of a sheet of paper; meant to be printed
double-sided and stapled down the middle).

## Compiling

The `build.sh` script should take care of compiling any files that
have changed and rebuilding the book. It needs to be run in the
project root and takes one argument, `handout` or `booklet`, according
to which output you want. It dumps the final product in `./book.pdf`.

## Dependencies

You should have Lilypond and a LaTeX distribution installed.
