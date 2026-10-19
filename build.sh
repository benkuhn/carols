#!/bin/bash -eu

MODE=$1

DOCKER="docker run -v `pwd`:`pwd` -w `pwd` lilypond"

if [ "$MODE" != "handout" ] && [ "$MODE" != "booklet" ]; then
    echo "Usage: ./build.sh [handout|booklet]"
    exit 1
fi

# check that the docker image tagged `lilypond` exists
if [ -z "`docker images -q lilypond`" ]; then
    echo "Docker image 'lilypond' not found. Building..."
    docker build lilypond_docker -t lilypond:latest
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
    # Skip the file if its PDF is newer than both it and header.ly
    if [ -f $OUTFILE ] && [ $OUTFILE -nt $INFILE ] && [ $OUTFILE -nt carols/header.ly ]; then
        echo $FILE up-to-date
        continue
    fi
    $DOCKER lilypond -drelative-includes -o $OUTFILE_LY $INFILE
done

# Always compile the main file in handout mode first to produce the index right
if [ -f modes/curmode.tex ]; then
    rm modes/curmode.tex
fi
ln modes/handout.tex modes/curmode.tex
$DOCKER pdflatex book.tex
$DOCKER makeindex book.idx

if [ $MODE == "booklet" ]; then
    rm modes/curmode.tex
    ln modes/booklet.tex modes/curmode.tex
fi

$DOCKER pdflatex book.tex
mv book.pdf $MODE.pdf
