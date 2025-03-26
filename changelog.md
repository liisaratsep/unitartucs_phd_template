# Changelog

All notable changes to this project will be documented in this file.

## March 2024 - Liisa Rätsep
- Light restructuring to order main content chapters and separate them from non-content chapters for easier writing. Added background chapter.

## Dec 2024 - Liisa Rätsep

- Fixed compilation errors regarding bibliography and reference handling, added the author-year citation option.
- Separated `glossary.sty` from `phdstyle.sty` for more convenient glossary editing
- Updated the sample content to include more usage examples and information about the thesis format. Moved a lot of the information from the readme to the template as Overleaf displays markdown files as plain text.
- Minor typo and other fixes.
- Automatically add empty pages before publication PDFs when needed depending on whether the current page number is odd or even.


## Jan 2021 - Novin Shahroudi

- improved the functionality of the ati phd template by introducing sets of commands, organizing the latex codes better and restructuring the directories.
- all the formats, typography, margins, numbering, etc. remains in-tacked as the original version. 
- monograph and collection are both integrated into same template and one could be chosen by setting a flag in the beginning of main.tex
- split the styles and class related matters into .cls and .sty
- separated the .bib file as it is a more convenient way to add the references
- all the thesis details were put into series of commands that must be set from main.tex, minimizing unintentional formatting changes as well as better readability
- restructured the chapters and sections of the document by breaking it into a separate directory and giving easier and better control over activating or deactiving each section from the main.tex
- created a directory for the figures which university logo resides in by default
- added a user defined macros in the phdstyle.sty that is adopted from [this template](https://github.com/martinhelso/phduio)
