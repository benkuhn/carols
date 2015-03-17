#!/bin/bash

MODE=$1

if [ "$MODE" != "handout" ] && [ "$MODE" != "booklet" ]; then
    echo "Usage: ./build.sh [handout|booklet]"
    exit 1
fi

for FILE in carols/*.ly; do
    BASE=$(basename $FILE .ly)
    if [ "$BASE" == "header" ]; then
        continue
    fi
    INFILE=carols/$BASE.ly
    OUTFILE=build/$BASE.pdf
    # Check whether file needs to be rebuilt; it may be cached. If it
    # is cached, we continue.
    if [ -f $OUTFILE ]; then
        LATEST=$(ls -1c $INFILE $OUTFILE | head -n 1)
        if [ "$LATEST" == $OUTFILE ]; then
            echo $FILE up-to-date
            continue
        elif [ "$LATEST" != $INFILE ]; then
            echo Unknown value of LATEST: $LATEST
            continue
        fi
    fi
    lilypond $INFILE -o $OUTFILE
done

# Always compile the main file in handout mode first to produce the index right
if [ -f modes/curmode.tex ]; then
    rm modes/curmode.tex
fi
ln modes/handout.tex modes/curmode.tex
pdflatex book.tex

if [ $MODE == "booklet" ]; then
    rm modes/curmode.tex
    ln modes/booklet.tex modes/curmode.tex
    pdflatex book.tex
fi
