#!/bin/bash -eu

MODE=$1

DOCKER="docker run -v `pwd`:`pwd` -w `pwd` lilypond"

if [ "$MODE" != "handout" ] && [ "$MODE" != "booklet" ]; then
    echo "Usage: ./build.sh [handout|booklet]"
    exit 1
fi

# Make sure 'build' directory exists
if [ ! -d ./build ]; then
  echo "Creating './build' directory."
  mkdir build
fi

for FILE in carols/*.ly; do
    BASE=$(basename $FILE .ly)
    if [ "$BASE" == "header" ]; then
        continue
    fi
    INFILE=carols/$BASE.ly
    OUTFILE_LY=build/$BASE
    OUTFILE=$OUTFILE_LY.pdf
    # Check whether file needs to be rebuilt; it may be cached. If it
    # is cached, we continue.
    if [ -f $OUTFILE ]; then
        LATEST=$(ls -1t $INFILE $OUTFILE | head -n 1)
        if [ "$LATEST" == $OUTFILE ]; then
            echo $FILE up-to-date
            continue
        elif [ "$LATEST" != $INFILE ]; then
            echo Unknown value of LATEST: $LATEST
            continue
        fi
    fi
    $DOCKER lilypond -drelative-includes -o $OUTFILE_LY $INFILE
done

# Always compile the main file in handout mode first to produce the index right
if [ -f modes/curmode.tex ]; then
    rm modes/curmode.tex
fi
ln modes/handout.tex modes/curmode.tex
$DOCKER makeindex book.idx
$DOCKER pdflatex book.tex

if [ $MODE == "booklet" ]; then
    rm modes/curmode.tex
    ln modes/booklet.tex modes/curmode.tex
    $DOCKER pdflatex book.tex
fi
