\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phdunitartu}[2024/12/03 v1.4]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[a4paper,11pt]{report}

%%% Packages
\RequirePackage{graphicx}
\RequirePackage{xifthen}

%%% Utilities

%% thesis type selector, the command \ThesisType needs to be set before
\newcommand{\ThesisType}[1]{\def \phdunitartu@ThesisType{#1}}

\DeclareRobustCommand{\IfThesisTypeIsCollection}[2]{%
  \ifthenelse{\equal{\phdunitartu@ThesisType}{COLLECTION}}{#1}{%
    \ifthenelse{\equal{\phdunitartu@ThesisType}{MONOGRAPH}}{#2}{\centering Undefined Thesis Type (Avail types: MONOGRAPH, COLLECTION)}}}

%% Specify dissertation series number
\newcommand{\dissertationseriesname}[1]{ \def \phdunitartu@dissertationseriesname{#1} }
\newcommand{\dissertationseriesnumber}[1]{ \def \phdunitartu@dissertationseriesnumber{#1} }
\dissertationseriesname{}
\dissertationseriesnumber{}

%% Specify International Standard Serial/Book Number
\newcommand{\ISSN}[1]{ \def \phdunitartu@ISSN{ISSN\space#1}}
\newcommand{\ISBNPRINT}[1]{ \def \phdunitartu@ISBNA{ISBN\space#1\space(print)}}
\newcommand{\ISBNPDF}[1]{ \def \phdunitartu@ISBNB{ISBN\space#1\space(PDF)}}
\ISSN{Do not forget the ISSN}
\ISBNPRINT{Do not forget to insert the ISBN}
\ISBNPDF{Do not forget to insert the ISBN}


%% Specify affiliation
% TODO: to follow UT's Organizational Structure make it possible to use \college instead of \institute 
\newcommand{\institute}[1]{ \def \phdunitartu@inst{#1} }
\newcommand{\faculty}[1]{ \def \phdunitartu@faculty{#1} }
\newcommand{\affiliation}[1]{ \def \phdunitartu@affiliation{#1} }
\institute{} 
\faculty{}
\affiliation{}

%% Thesis submission details
% TODO: to follow UT's Organizational Structure make it possible to use \college instead of \institute 
\newcommand{\thesisfield}[1]{ \def \phdunitartu@thesisfield{#1} }
\newcommand{\commencementdate}[1]{ \def \phdunitartu@commencementdate{#1} }
\newcommand{\defensedate}[1]{ \def \phdunitartu@defensedate{#1} }
\newcommand{\defensetime}[1]{ \def \phdunitartu@defensetime{#1} }
\newcommand{\defenseloc}[1]{ \def \phdunitartu@defenseloc{#1} }
\newcommand{\addSup}[2]{ \def \phdunitartu@supTitle{#1} \def \phdunitartu@supDetail{#2} }
\newcommand{\addOpp}[2]{ \def \phdunitartu@oppTitle{#1} \def \phdunitartu@oppDetail{#2} }
\thesisfield{}
\commencementdate{}
\defensedate{}
\defensetime{}
\defenseloc{}
\addSup{}{}
\addOpp{}{}

%%% Title
\renewcommand*{\maketitle}
{
    \begin{titlepage}
        % == title pages ==
        \def\seriesname{\phdunitartu@dissertationseriesname}
        \def\seriesnumber{\phdunitartu@dissertationseriesnumber}
        \pagestyle{empty}\begingroup\centering\sffamily
        \vbox{\small\MakeUppercase{\seriesname}}
        \vbox{\bfseries\small\seriesnumber}
        \vfill\newpage\null\newpage
        \vbox{\small\MakeUppercase{\seriesname}}
        \vbox{\bfseries\small\seriesnumber}
        \vskip52mm
        \vbox{\bfseries\LARGE\MakeUppercase{\@author}}
        \vskip12mm
        \vbox{\LARGE{\@title}}
        \vfill
        \vbox{\MakeUppercase{Tartu \the\year}}
        \endgroup\newpage
        
        % == reverse of title page ==
        \begingroup\setlength\parindent{0pt}\setlength\parskip\baselineskip
        \phdunitartu@inst, \phdunitartu@faculty, \phdunitartu@affiliation, Estonia.
        
        Dissertation has been accepted for the commencement of the degree of
        Doctor of Philosophy (PhD) in {\phdunitartu@thesisfield} on {\phdunitartu@commencementdate} by the Council of
        the {\phdunitartu@inst}, {\phdunitartu@affiliation}.
        
        % supervisor(s)
        \emph{\phdunitartu@supTitle}
        
        \begin{tabular}{p{20mm}l}
            \phdunitartu@supDetail
        \end{tabular}
        
        % opponents
        \emph{\phdunitartu@oppTitle}
        
        \begin{tabular}{p{20mm}l}
            \phdunitartu@oppDetail
        \end{tabular}
        
        The public defense will take place on {\phdunitartu@defensedate} at {\phdunitartu@defensetime} in {\phdunitartu@defenseloc{}}.
        
        The publication of this dissertation was financed by the {\phdunitartu@inst}, {\phdunitartu@affiliation}.
        
        \vfill
        Copyright \textcopyright\ \the\year\ by \@author
        
        % International Standard Serial/Book Number 
        % TODO: if empty then do not print anything without issuing a warning perhaps!
        \phdunitartu@ISSN\\
        \phdunitartu@ISBNA\\
        \phdunitartu@ISBNB
        
        University of Tartu Press\\
        \url{http://www.tyk.ee/}
        \endgroup
    \end{titlepage}
}

%%% Parts
\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >-2\relax
    \refstepcounter{part}%
    \addcontentsline{toc}{part}{\thepart. #1}%
  \else
    \addcontentsline{toc}{part}{#1}%
  \fi
  \markboth{}{}%
  {\centering
   \interlinepenalty \@M
   \normalfont
   \ifnum \c@secnumdepth >-2\relax
     \huge\sffamily\bfseries \partname\nobreakspace\thepart
     \par
     \vskip 20\p@
   \fi
   \Huge\sffamily\bfseries #2\par}%
  \@endpart}
\def\@spart#1{%
  {\centering
   \interlinepenalty \@M
   \normalfont
   \Huge\sffamily\bfseries #1\par}%
  \@endpart}

%%% Chapters

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \@makechapterhead{#2}%
                    \@afterheading}
\def\@makechapterhead#1{%
  \vspace*{-12\p@}%
  {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \Large\sffamily\bfseries \thechapter.
    \fi
    \interlinepenalty\@M
    \Large\sffamily\bfseries\MakeUppercase{#1}\par\nobreak
    \vskip 10pt
  }}
\def\@makeschapterhead#1{%
  \vspace*{-12\p@}%
  {\parindent \z@ \centering
    \normalfont
    \interlinepenalty\@M
    \Large\sffamily\bfseries \MakeUppercase{#1}\par\nobreak
    \vskip 10pt
  }}

\renewcommand \thechapter{\@arabic\c@chapter}

%%% Sections

\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}{#2}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
          \hskip #3\relax\@svsec
            \interlinepenalty \@M #8\ifnum#2>2.\fi\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8\ifnum#2>2.\fi}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
        \hskip #1%
          \interlinepenalty \@M #5 \ifdim#1>\z@.\fi\@@par}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5.}}%
  \fi
  \@xsect{#3}}

\def\@seccntformat#1#2{\csname the#1\endcsname\ifnum#2<3.\fi\ }
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {1.8ex \@plus.2ex}%
                                   {\centering\sffamily\large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\parindent}%
                                   {-2.3ex \@plus -0.5ex \@minus -.2ex}%
                                   {1.2ex \@plus.2ex}%
                                     {\centering\sffamily\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\parindent}%
                                     {\parskip}%
                                     {-0.4em}%
                                     {\normalfont\normalsize\itshape}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\parindent}%
                                     {\parskip}%
                                     {-0.4em}%
                                     {\normalfont\normalsize\itshape}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                     {\parskip}%
                                     {-0.4em}%
                                     {\normalfont\normalsize\itshape}}

\renewcommand \thesection{\@arabic\c@chapter.\@arabic\c@section}
\renewcommand \thesubsection{\thesection.\@arabic\c@subsection}
\renewcommand \thesubsubsection{\@alph\c@subsubsection)}
\renewcommand \theparagraph{\@arabic\c@paragraph)}
\renewcommand \thesubparagraph{\@arabic\c@paragraph\@alph\c@subparagraph)}

%%% Appendices

\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\thechapter{\appendixname\ \@Alph\c@chapter}%
  \gdef\thesection{\Alph{chapter}.\arabic{section}}%
  \gdef\theequation{\@Alph\c@chapter.\@arabic\c@equation}}

%%% Bibliography

\def\@openbib@code{\addcontentsline{toc}{chapter}{Bibliography}}

%%% Lists

\def\@listi{\leftmargin\leftmargini
              \labelwidth\leftmarginii
    \topsep   2\p@   \@plus  0.5\p@ \@minus0.5\p@
    \partopsep0.5\p@   \@plus0.5\p@   \@minus0.5\p@
    \parsep   1\p@   \@plus0.5\p@
    \itemsep  1\p@ \@plus0.5\p@ \@minus0.5\p@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus0.5\p@ \@minus0.5\p@
              \partopsep 0.5\p@   \@plus0.5\p@   \@minus0.5\p@
              \parsep    1\p@   \@plus0.5\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    1\p@ \@plus0.5\p@\@minus0.5\p@
              \partopsep 0.5\p@ \@plus\z@ \@minus0.5\p@
              \parsep    \z@
              \itemsep   \topsep}

%%% Formulas

\renewcommand\theequation
    {\@arabic\c@chapter.\@arabic\c@equation}

%%% Floats

\setlength\abovecaptionskip{4\p@}
\setlength\belowcaptionskip{6\p@}
\renewcommand\topfraction{.9}
\renewcommand\dbltopfraction{.9}
\setcounter{bottomnumber}{3}
\renewcommand\bottomfraction{.95}
\setlength\floatsep       {4.5\p@ \@plus 1\p@ \@minus 2.5\p@}
\setlength\textfloatsep   {4.5\p@ \@plus 1\p@ \@minus 2.5\p@}
\setlength\intextsep      {4.5\p@ \@plus 1\p@ \@minus 2.5\p@}
\setlength\dblfloatsep    {4.5\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\dbltextfloatsep{4.5\p@ \@plus 1\p@ \@minus 2\p@}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\small\bfseries #1. \normalfont #2}%
  \ifdim \wd\@tempboxa >\hsize
    \small\bfseries #1. \normalfont #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\providecommand{\@removefromreset}[2]{{%
  \expandafter\let\csname c@#1\endcsname\@removefromreset
  \def\@elt##1{%
    \expandafter\ifx\csname c@##1\endcsname\@removefromreset
    \else
      \noexpand\@elt{##1}%
    \fi}%
  \expandafter\xdef\csname cl@#2\endcsname{%
    \csname cl@#2\endcsname}}}
\@removefromreset{figure}{chapter}
\def\thefigure{\@arabic\c@figure}
\def\l@figure{\@dottedtocline{1}{1.0em}{1.9em}}
\@removefromreset{table}{chapter}
\def\thetable{\@arabic\c@table}
\let\l@table\l@figure

%%% Table of contents

\setcounter{tocdepth}{2}
\renewcommand\@pnumwidth{1.85em}
\def\numberline#1{\ifdim\@tempdima>\z@\hb@xt@\@tempdima{\hfil#1.\ }%
    \else{#1.\ }\fi}
\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{0em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 0.8em \@plus\p@
    \setlength\@tempdima{0em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@section{\@dottedtocline{1}{0.6em}{2.4em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2.8em}{3.0em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{4.0em}{1.8em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{5.4em}{1.9em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{7.1em}{2.8em}}

%%% Main text

\setlength{\parindent}{5mm}
\everymath{\displaystyle}
\raggedbottom

\endinput