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
MODE_INVOCATION_MAGIC_KEY = 'ITS_THE_MODE!!!'

HANDOUT_DOC_CLASS = Command('documentclass',
    arguments='memoir', options=['twoside', '10pt', 'openany', 'letterpaper'])
HANDOUT_PKG = NoEscape('\\usepackage[noprint,1to1]{{booklet}} %{}'.
    format(MODE_INVOCATION_MAGIC_KEY))
BOOKLET_DOC_CLASS = Command('documentclass',
    arguments='memoir', options=['twoside', '10pt', 'openany', 'statementpaper'])
BOOKLET_PKG = NoEscape(r'\usepackage[print,1to1]{booklet}')

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


def validate_dirs(user_args):
    ly_dir = user_args.ly_dir
    build_dir = user_args.build_dir

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

        doc = cls(src_dir, dest_dir, mode)

        doc.set_up()
        doc.populate()
        doc.end_matter()

        return doc

    def set_up(self):
        """Add packages, set preliminary settings for this doc."""
        # Add packages
        self.preamble.append(Package('titlesec'))
        self.preamble.append(Package('pdfpages'))
        self.preamble.append(Package('graphicx'))
        self.preamble.append(Package('makeidx'))

        if self.mode == HANDOUT:
            # Presumably we don't care about clickable links in booklet mode, only
            # bother with 'hyperref' (i.e. clickable index/ToC) in HANDOUT mode.
            self.preamble.append(Package('hyperref'))

        self.preamble.append(NoEscape(r'\makeindex'))

        # Even if user specified BOOKLET mode, build first in HANDOUT mode to
        # get page numbers for index/ToC right.
        self.preamble.append(HANDOUT_PKG)

        self.preamble.append(NoEscape(r'\source{\magstep0}{5.5in}{8.5in}'))
        self.preamble.append(NoEscape(r'\target{\magstep0}{11in}{8.5in}'))
        self.preamble.append(NoEscape(r'\setpdftargetpages'))

        self.preamble.append(NoEscape(r'\setulmarginsandblock{1.65cm}{1.65cm}{*}'))
        self.preamble.append(NoEscape(r'\setlrmarginsandblock{1cm}{1cm}{*}'))
        self.preamble.append(NoEscape(r'\checkandfixthelayout'))

        self.preamble.append(NoEscape(r'\makeindex'))

        ### Custom commands

        # Use sections so that we can easily generate a TOC... but make them
        # invisible to keep things pretty.
        invis_section = UnsafeCommand('newcommand', '\invisiblesection', options=1,
                                      extra_arguments=r'\refstepcounter{section}'
                                                      r'\sectionmark{#1}'
                                                      r'\addcontentsline{toc}{section}{#1}'
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

        # Ignore page numbers until we get to the actual body
        self.append(NoEscape(r'\pagenumbering{gobble}'))

        self.append(NoEscape(r'\maketitle'))
        self.append(NoEscape(r'\clearpage'))
        self.append(NoEscape(r'\tableofcontents'))
        self.append(NoEscape(r'\clearpage'))

        # Okay, show page numbers again
        self.append(NoEscape(r'\pagenumbering{arabic}'))

    def set_booklet_mode(self, magic_key=MODE_INVOCATION_MAGIC_KEY):
        """
        Hack: for booklet mode, we need to build first in handout mode, and thus
        need to swap out the package invocation for 'handout' with that for
        'booklet'. So: find the line of the preamble where we set HANDOUT mode
        (identified by a distinct comment string (MAGIC_KEY) at the end) and
        replace it with the invocation for BOOKLET mode.
        """
        index = -1
        for i, line in enumerate(self.preamble):
            # import pdb; pdb.set_trace()
            # We know the line we're looking for is of type: NoEscape
            if isinstance(line, NoEscape):
                if magic_key in line:
                    index = i
                    break

        if index == -1:
            raise Exception('Couldn\'t find current mode invocation to replace.')

        # Replace current mode invocation with invocation for BOOKLET
        self.preamble[index] = BOOKLET_PKG


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

    # NOTE: by default, pyLaTeX will compile the doc multiple times if needed to
    # make sure index/ToC are up to date.
    carol_book.documentclass = HANDOUT_DOC_CLASS
    carol_book.generate_pdf('test', clean=False, clean_tex=False, silent=False)

    if carol_book.mode == BOOKLET:
        # Now that we've built the book once in HANDOUT mode to get the
        # index/ToC right, build for real in BOOKLET mode.
        carol_book.documentclass = BOOKLET_DOC_CLASS
        carol_book.set_booklet_mode()
        carol_book.generate_pdf('test', clean=False, clean_tex=False, silent=False,
            compiler='pdflatex')
