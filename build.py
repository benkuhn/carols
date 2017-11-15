#! /usr/bin/env python

import argparse
import os.path
# import os

import pylatex
from pylatex import Command, Package, UnsafeCommand
from pylatex.utils import NoEscape

import utils

# Compile modes
HANDOUT = 'handout'
BOOKLET = 'booklet'
MODES = [HANDOUT, BOOKLET]
HANDOUT_PKG = Package('booklet', options=['noprint', '1to1'])
BOOKLET_PKG = Package('booklet', options=['print', '1to1'])

# .ly "header" keys
TITLE = 'title'
TOC_AS = 'toc_as'
SEE_ALSO = 'see_also'

def argument_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        'mode',
        type=str,
        choices=MODES,
        help='mode to compile book in:\n'
        '- handout (for printing 1- or 2-sided, stapling in corner)\n'
        '- booklet (for printing 2-sided, stapling down the middle)',
    )

    parser.add_argument(
        '--ly_dir',
        type=str,
        default='./carols',
        help='directory containing .ly files of carols',
    )

    parser.add_argument(
        '--build_dir',
        type=str,
        default='./build',
        help='directory to build carol pdfs into'
    )

    return parser


def validate_dirs(args):
    ly_dir = args.ly_dir
    build_dir = args.build_dir

    if not os.path.isdir(ly_dir):
        print('Could not find specified "ly_dir": "{}". Creating...'.
            format(ly_dir))
        os.mkdir(ly_dir)

    if not os.path.isdir(build_dir):
        print('Could not find specified "build_dir": "{}". Creating...'.
            format(build_dir))
        os.mkdir(build_dir)

    return ly_dir, build_dir


class CarolInfo():

    """Store info related to a single carol."""

    @classmethod
    def from_ly(cls, ly_filepath: str, pdf_dir: str):
        # TODO: this function is pretty expensive, could we cache this info?
        headers = utils.headers_from_file(ly_filepath)

        toc_entry = headers.get(TITLE)
        if headers.get(TOC_AS):
            # If file has a 'toc_as' header, use that as toc_entry instead
            toc_entry = headers[TOC_AS]

        see_also = headers.get(SEE_ALSO)

        filename_base = os.path.splitext(os.path.basename(ly_filepath))[0]
        pdf_filepath = os.path.join(pdf_dir, filename_base) + '.pdf'

        return cls(ly_filepath, pdf_filepath, toc_entry, see_also)

    def __init__(self, ly_filepath: str, pdf_filepath: str,
                 toc_entry: str=None, see_also: str=None):
        self.ly_filepath = ly_filepath
        self.pdf_filepath = pdf_filepath

        if toc_entry:
            self.toc_entry = utils.clean_title(toc_entry)
        else:
            # If we didn't get an explicit ToC entry, just use the name of the pdf :-/
            self.toc_entry = pdf_filepath

        self.see_also = see_also

    def build_if_needed(force_build=False):
        # TODO! (https://pypi.python.org/pypi/python-ly)

        # If pdf doesn't exist, build .ly file into .pdf. If pdf exists:
        # compare file age of .ly and .pdf. If .ly touched more recently, we
        # need to rebuild it. (If force_build flag is set, we always rebuild
        # the .ly file.)
        pass


class Document(pylatex.Document):

    """Subclass PyLaTeX Document to add our own methods.

    HACK: class must be called ``Document`` for pylatex to correctly insert
    ``begin{document}`` and ``end{document}`` tags in the .tex file.

    """

    def __init__(self, src_dir: str, dest_dir: str, mode: str, *args, **kwargs):
        """
        Args:
            src_dir (str): path to source directory (where .ly files live)
            dest_dir (str): path to destination directory (where we build .pdf's to)
            mode (str): mode to build the book in -- currently either 'handout'
                or 'booklet' (see argparser for details)
        """

        self.src_dir = src_dir
        self.dest_dir = dest_dir
        self.mode = mode

        super().__init__(*args, **kwargs)

    @classmethod
    def make_carol_book(cls, src_dir: str, dest_dir: str, mode: str='handout'):
        if mode not in MODES:
            raise ValueError("'mode' must be one of {} (user provided: {})".
                format(MODES, mode))

        doc = cls(
            src_dir, dest_dir, mode,
            documentclass='memoir',
            document_options=['twoside','10pt','openany','statementpaper']
        )

        doc.set_up()
        doc.populate()
        doc.end_matter()

        return doc

    def set_up(self):
        """Add packages, set preliminary settings for this doc."""
        # Add packages
        self.preamble.append(Package('hyperref'))
        self.preamble.append(Package('titlesec'))
        self.preamble.append(Package('pdfpages'))
        self.preamble.append(Package('graphicx'))
        self.preamble.append(Package('makeidx'))

        self.preamble.append(NoEscape(r'\makeindex'))

        # TODO: support 'mode'
        # We can compile either in booklet or in handout mode. curmode.tex
        # should be a symlink to one of those
        # self.preamble.append(NoEscape(r'\input{modes/curmode.tex}'))

        # self.preamble.append(NoEscape(r'\source{\magstep0}{5.5in}{8.5in}'))
        # self.preamble.append(NoEscape(r'\target{\magstep0}{11in}{8.5in}'))
        # self.preamble.append(NoEscape(r'\setpdftargetpages'))

        # self.preamble.append(NoEscape(r'\setulmarginsandblock{1.65cm}{1.65cm}{*}'))
        # self.preamble.append(NoEscape(r'\setlrmarginsandblock{1cm}{1cm}{*}'))
        # self.preamble.append(NoEscape(r'\checkandfixthelayout'))

        ### Custom commands

        # Use sections so that we can easily generate a TOC... but make them
        # invisible to keep things pretty.
        invis_section = UnsafeCommand('newcommand', '\invisiblesection', options=1,
                                      extra_arguments=r'\refstepcounter{section}'
                                                      r'\addcontentsline{toc}{section}{#1}'
                                                      r'\sectionmark{#1}'
                                     )
        self.append(invis_section)

        add_song = UnsafeCommand('newcommand', '\song', options=2,
                                 extra_arguments=r'\index{#1}'
                                                 r'\invisiblesection{#1}'
                                                 r'\includepdf[pagecommand=\thispagestyle{plain}]{#2}'
                                     )
        self.append(add_song)

        # Ignore chapter numbering in order for section numbering to be reasonable
        self.preamble.append(NoEscape(r'\renewcommand{\thesection}{\arabic{section}}'))

        # Title Info
        self.preamble.append(Command('title', 'Christmas Carols'))
        self.preamble.append(Command('author', 'compiled by Maia McCormick'))
        self.preamble.append(Command('date', NoEscape(r'\today')))

        ### Adding this stuff to the doc...

        # Ignore page numbers until we get to the actual body
        # self.append(NoEscape(r'\pagenumbering{gobble}'))

        self.append(NoEscape(r'\maketitle'))
        self.append(NoEscape(r'\clearpage'))
        self.append(NoEscape(r'\tableofcontents'))
        self.append(NoEscape(r'\clearpage'))

        # Okay, show page numbers again
        # self.append(NoEscape(r'\pagenumbering{arabic}'))

    def populate(self):
        ly_files = utils.ly_files_to_compile(self.src_dir)

        carols = []
        for f in ly_files:
            carols.append(CarolInfo.from_ly(f, self.dest_dir))

        fmtstr = '\\song{{{}}}{{{}}}' # ...I'm sorry.

        # TODO: sort by toc_entry (note that we need to ignore things that
        # start w/ punct. e.g. "'twas")
        # carols.sort(key=lambda c: c.toc_entry)
        for c in carols:
            # c.build_if_needed()

            # TODO: alphabetize all tocs and see_alsos.

            # For now, add the song to the doc with a single ToC entry; if
            # there's a see_also, we'll index by that as well.
            if c.see_also:
                self.append(NoEscape('\\index{{{}}}'.format(c.see_also)))
            self.append(NoEscape(fmtstr.format(c.toc_entry, c.pdf_filepath)))

    def end_matter(self):
        self.append(NoEscape(r'\clearpage'))
        self.append(NoEscape(r'\printindex'))


if __name__ == '__main__':
    parser = argument_parser()
    args = parser.parse_args()
    ly_dir, build_dir = validate_dirs(args)

    carol_book = Document.make_carol_book(ly_dir, build_dir, mode=args.mode)

    # TODO: actually support handout vs. booklet

    # NOTE: By using compiler 'latexmk', we ensure that we'll run LaTeX multiple
    # times if needed to make sure index/ToC are up to date.
    carol_book.generate_pdf('test', clean=False, clean_tex=False, silent=False,
        compiler='latexmk')
