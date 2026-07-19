% ------------------------------------------------------------
% OSTERA Standards Track Document Class
% Template Copyright 2026 OSTERA
% Version 0.4 - draft
% ------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ostera-standards}[2026/07/05 v0.4 OSTERA Standards Track document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{iftex}
\ifPDFTeX
  \ClassError{ostera-standards}{This class requires XeLaTeX or LuaLaTeX}{%
    The document uses fontspec. Compile with XeLaTeX or LuaLaTeX.}%
\fi

\RequirePackage{fontspec}
\RequirePackage{setspace}
\RequirePackage[a4paper,margin=0.76in]{geometry}

\RequirePackage[export]{adjustbox}
\RequirePackage{amsmath}
\RequirePackage{array}
\RequirePackage{calc}
\RequirePackage{caption}
\RequirePackage{colortbl}
\RequirePackage{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{graphicx}
\RequirePackage{listings}
\RequirePackage{parskip}
\RequirePackage{ragged2e}
\RequirePackage{tabularx}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{xcolor}
% Load hyperref after the other formatting packages so the PDF navigation
% destinations and links are built correctly.  The links are deliberately
% unobtrusive: they retain the document's visual style while making the
% table of contents and lists of illustrations navigable in a PDF viewer.
\RequirePackage[unicode,bookmarksopen,bookmarksnumbered,hidelinks]{hyperref}
\RequirePackage{bookmark}
\hypersetup{linktoc=all}

\graphicspath{{images/}}

% ------------------------------------------------------------
% Colors
% ------------------------------------------------------------
\definecolor{DarkGray}{RGB}{102,102,102}
\definecolor{DarkBlue}{RGB}{30,56,76}
\definecolor{Gray}{RGB}{220,220,220}

% ------------------------------------------------------------
% Fonts, font sizes, and base typography
% ------------------------------------------------------------
% The fallbacks preserve the intended TeX Gyre/DejaVu fonts in TeX
% installations that register their family names without spaces.
\IfFontExistsTF{TeX Gyre Heros}{%
  \setmainfont{TeX Gyre Heros}%
}{%
  \setmainfont{TeXGyreHeros}%
}
\IfFontExistsTF{DejaVu Sans Mono}{%
  \setmonofont{DejaVu Sans Mono}%
}{%
  \setmonofont{DejaVuSansMono}%
}

% Paragraph spacing
\setstretch{1.2}
\setlength{\parindent}{0pt}
\setlength{\parskip}{12pt}

% Spacing for numbered and bulleted lists
\setlist[itemize]{topsep=2pt,itemsep=2pt,parsep=0pt}
\setlist[enumerate]{topsep=2pt,itemsep=2pt,parsep=0pt}

% Spacing for heading level / section headers
\titlespacing*{\section}{0pt}{36pt}{6pt}
\titlespacing*{\subsection}{0pt}{14pt}{6pt}
\titlespacing*{\subsubsection}{0pt}{10pt}{4pt}

% Set the font styles for each heading level / section headers
\newcommand{\headinglevelonefontstyle}{\bfseries\fontsize
  {16}{20}\selectfont\color{DarkBlue}}
\newcommand{\headingleveltwofontstyle}{\bfseries\fontsize
  {14}{18}\selectfont\color{DarkBlue}}
\newcommand{\headinglevelthreefontstyle}{\bfseries\fontsize
  {13}{15}\selectfont\color{DarkBlue}}



\newcommand{\NoParSkip}{\vspace{-\parskip}}

% ------------------------------------------------------------
% Define the formating for section numbering and navigation
% ------------------------------------------------------------
% The template deliberately uses different visible numbering 
% in the main body, annexes, and informational appendices. 
% Hyperref destinations must nevertheless remain globally 
% unique after section counters are reset.
\newcommand{\SetNormalAnchorNames}{%
  \renewcommand{\theHsection}{main.\arabic{section}}%
  \renewcommand{\theHsubsection}{main.\arabic{section}.\arabic{subsection}}%
  \renewcommand{\theHsubsubsection}{main.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}%
}
\newcommand{\SetAnnexAnchorNames}{%
  \renewcommand{\theHsection}{annex.\Alph{section}}%
  \renewcommand{\theHsubsection}{annex.\Alph{section}.\arabic{subsection}}%
  \renewcommand{\theHsubsubsection}{annex.\Alph{section}.\arabic{subsection}.\arabic{subsubsection}}%
}
\newcommand{\SetAppendixAnchorNames}{%
  \renewcommand{\theHsection}{appendix.\arabic{section}}%
  \renewcommand{\theHsubsection}{appendix.\arabic{section}.\arabic{subsection}}%
  \renewcommand{\theHsubsubsection}{appendix.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}%
}
\newcommand{\SetBackMatterAnchorNames}{%
  \renewcommand{\theHsection}{backmatter.\arabic{section}}%
  \renewcommand{\theHsubsection}{backmatter.\arabic{section}.\arabic{subsection}}%
  \renewcommand{\theHsubsubsection}{backmatter.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}%
}

% Define the numbering for normal in-document sections, aka 1.2.3
\newcommand{\UseNormalNumbering}{%
  \renewcommand{\thesection}{\arabic{section}}%
  \renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}%
  \renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}%
  \SetNormalAnchorNames
  \titleformat{\section}
    {\headinglevelonefontstyle}{\thesection}{1em}{}
  \titleformat{\subsection}
    {\headingleveltwofontstyle}{\thesubsection}{1em}{}
  \titleformat{\subsubsection}
    {\headinglevelthreefontstyle}{\thesubsubsection}{1em}{}
}

% Define the numbering for Annex sections, aka Annex A, A.1.2
\newcommand{\UseAnnexNumbering}{%
  \renewcommand{\thesection}{Annex \Alph{section}}%
  \renewcommand{\thesubsection}{\Alph{section}.\arabic{subsection}}%
  \renewcommand{\thesubsubsection}{\Alph{section}.\arabic{subsection}.\arabic{subsubsection}}%
  \SetAnnexAnchorNames
  \titleformat{\section}
    {\headinglevelonefontstyle}{\thesection}{1em}{}
  \titleformat{\subsection}
    {\headingleveltwofontstyle}{\thesubsection}{1em}{}
  \titleformat{\subsubsection}
    {\headinglevelthreefontstyle}{\thesubsubsection}{1em}{}
}

% Define the numbering for Appendix sections, aka Appendix 1
% This one is unique because the heading levels 2 and 3 does
% not have a number and thus needs to be flushed left, aka have
% the space removed that would normally be reserved for the number.
\newcommand{\UseAppendixNumbering}{%
  \renewcommand{\thesection}{Appendix \arabic{section}}%
  \renewcommand{\thesubsection}{}%
  \renewcommand{\thesubsubsection}{}%
  \SetAppendixAnchorNames
  \titleformat{\section}
    {\headinglevelonefontstyle}{\thesection}{1em}{}
  \titleformat{\subsection}
    {\headingleveltwofontstyle}{\thesubsection}{0em}{}
  \titleformat{\subsubsection}
    {\headinglevelthreefontstyle}{\thesubsubsection}{0em}{}
}

% Define the numbering for the Bibliography section
% Same as the Appendix section.
\newcommand{\UseUnlabeledNumbering}{%
  \renewcommand{\thesection}{}%
  \renewcommand{\thesubsection}{}%
  \renewcommand{\thesubsubsection}{}%
  \SetBackMatterAnchorNames
  \titleformat{\section}
    {\headinglevelonefontstyle}{\thesection}{1em}{}
  \titleformat{\subsection}
    {\headingleveltwofontstyle}{\thesubsection}{0em}{}
  \titleformat{\subsubsection}
    {\headinglevelthreefontstyle}{\thesubsubsection}{0em}{}
}

% ------------------------------------------------------------
% Helper functions to start the various sections
% ------------------------------------------------------------
\newcommand{\BeginContent}{%
  \UseNormalNumbering
}
\newcommand{\BeginAnnexes}{%
  \UseAnnexNumbering
  % Add extra space to the ToC since the term "Annex" is longer
  \addtocontents{toc}{\protect\setlength{\protect\cftsecnumwidth}{5.1em}}%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
}
\newcommand{\BeginAppendices}{%
  \UseAppendixNumbering
  % Add extra space to the ToC since the term "Appendix" is longer
  \addtocontents{toc}{\protect\setlength{\protect\cftsecnumwidth}{6.5em}}%
  \addtocontents{toc}{\protect\cftsetindents{subsection}{1.5em}{0pt}}%
  \addtocontents{toc}{\protect\cftsetindents{subsubsection}{3em}{0pt}}%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
}
\newcommand{\BeginBibliography}{%
  \UseUnlabeledNumbering
  % Reset the TOC spacing
  \addtocontents{toc}{\protect\setlength{\protect\cftsecnumwidth}{1.5em}}% 
  \addtocontents{toc}{\protect\cftsetindents{subsection}{1.5em}{2.3em}}%
  \addtocontents{toc}{\protect\cftsetindents{subsubsection}{3.8em}{3.2em}}%
}
\newcommand{\AnnexSection}[1]{%
  \clearpage
  \section{#1}%
  \OTTAnnexNote
}
\newcommand{\AppendixSection}[1]{%
  \clearpage
  \section{#1}%
  \OTTAppendixNote
}
\newcommand{\UnnumberedSection}[1]{%
  \clearpage
  \section*{#1}%
  \phantomsection
  \addtocontents{toc}{\protect\setlength{\protect\cftsecnumwidth}{0pt}}%
  \addcontentsline{toc}{section}{#1}%
  \addtocontents{toc}{\protect\setlength{\protect\cftsecnumwidth}{1.5em}}%
}

% ------------------------------------------------------------
% Table of contents
% ------------------------------------------------------------
\renewcommand{\contentsname}{{\headinglevelonefontstyle Table of Contents}}
\renewcommand{\cftsubsecdotsep}{\cftnodots}
\renewcommand{\cftsubsubsecdotsep}{\cftnodots}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftbeforesubsubsecskip}{0pt}

% ------------------------------------------------------------
% Lists of illustrations: equations, listings, code, tables,
% and figures.
% ------------------------------------------------------------
\newlistof{myequation}{loe}{List of Equations}
\newcommand{\listofequations}{\listofmyequation}

\newcounter{listingcount}
\newlistof{mylisting}{lol}{List of Listings}
\newcommand{\listoflisting}{\listofmylisting}

\newcounter{codecount}
\newlistof{mycode}{loc}{List of Code}
\newcommand{\listofcode}{\listofmycode}

\newcommand{\listoftitlefontstyle}{\bfseries\fontsize
  {10}{12}\selectfont\color{DarkBlue}}
\renewcommand{\cftlottitlefont}{\listoftitlefontstyle}
\renewcommand{\cftloftitlefont}{\listoftitlefontstyle}
\renewcommand{\cftloltitlefont}{\listoftitlefontstyle}
\renewcommand{\cftloetitlefont}{\listoftitlefontstyle}
\renewcommand{\cftloctitlefont}{\listoftitlefontstyle}
\renewcommand{\cftafterlottitle}{\hfill\listoftitlefontstyle Page}
\renewcommand{\cftafterloftitle}{\hfill\listoftitlefontstyle Page}
\renewcommand{\cftafterloltitle}{\hfill\listoftitlefontstyle Page}
\renewcommand{\cftafterloetitle}{\hfill\listoftitlefontstyle Page}
\renewcommand{\cftafterloctitle}{\hfill\listoftitlefontstyle Page}

\newcommand{\listofbodyfontstyle}{\fontsize{10}{10}\selectfont}
\renewcommand{\cftfigfont}{\listofbodyfontstyle}
\renewcommand{\cfttabfont}{\listofbodyfontstyle}
\renewcommand{\cftmylistingfont}{\listofbodyfontstyle}
\renewcommand{\cftmyequationfont}{\listofbodyfontstyle}
\renewcommand{\cftmycodefont}{\listofbodyfontstyle}
\renewcommand{\cftfigpagefont}{\listofbodyfontstyle}
\renewcommand{\cfttabpagefont}{\listofbodyfontstyle}
\renewcommand{\cftmylistingpagefont}{\listofbodyfontstyle}
\renewcommand{\cftmyequationpagefont}{\listofbodyfontstyle}
\renewcommand{\cftmycodepagefont}{\listofbodyfontstyle}

\setlength{\cfttabindent}{0pt}
\setlength{\cftfigindent}{0pt}

\newcommand{\applylistspacing}{%
  \setlength{\baselineskip}{13pt}%
  \setlength{\cftafterlottitleskip}{1pt}%
  \setlength{\cftafterloftitleskip}{1pt}%
  \setlength{\cftafterloltitleskip}{1pt}%
  \setlength{\cftafterloetitleskip}{1pt}%
  \setlength{\cftafterloctitleskip}{1pt}%
}

\newcommand{\listLabelWidth}{7em}

\renewcommand{\cfttabpresnum}{Table~}
\renewcommand{\cfttabaftersnum}{:\ }
\setlength{\cfttabnumwidth}{\listLabelWidth}
\counterwithin{table}{section}
\renewcommand{\thetable}{\thesection.\arabic{table}}
\renewcommand{\cfttableader}{\hfill}

\renewcommand{\cftfigpresnum}{Figure~}
\renewcommand{\cftfigaftersnum}{:\ }
\setlength{\cftfignumwidth}{\listLabelWidth}
\counterwithin{figure}{section}
\renewcommand{\thefigure}{\thesection.\arabic{figure}}
\renewcommand{\cftfigleader}{\hfill}

\renewcommand{\cftmylistingpresnum}{Listing~}
\renewcommand{\cftmylistingaftersnum}{:\ }
\setlength{\cftmylistingnumwidth}{\listLabelWidth}
\renewcommand{\themylisting}{\arabic{mylisting}}
\renewcommand{\cftmylistingleader}{\hfill}

\renewcommand{\cftmyequationpresnum}{Equation~}
\renewcommand{\cftmyequationaftersnum}{:\ }
\setlength{\cftmyequationnumwidth}{\listLabelWidth}
\renewcommand{\themyequation}{\arabic{myequation}}
\renewcommand{\cftmyequationleader}{\hfill}

\renewcommand{\cftmycodepresnum}{Code~}
\renewcommand{\cftmycodeaftersnum}{:\ }
\setlength{\cftmycodenumwidth}{\listLabelWidth}
\renewcommand{\themycode}{\arabic{mycode}}
\renewcommand{\cftmycodeleader}{\hfill}

% ------------------------------------------------------------
% Figures, tables, equations, listings, code, and examples
% ------------------------------------------------------------
\newcounter{examplecount}
\newcommand{\examplelabel}[1]{%
  \stepcounter{examplecount}%
  \vspace{-\dimexpr\parskip/2\relax}%
  {\textit{Example~\thesection.\arabic{codecount}.\arabic{examplecount} - #1}}%
}

\captionsetup[figure]{
  labelfont={bf},
  labelformat=simple,
  labelsep=period,
  name=Fig.,
  justification=raggedright,
  singlelinecheck=false,
  skip=4pt,
}
\newcommand{\figuretitle}[1]{%
  \refstepcounter{figure}%
  {\centering\textbf{Figure~\thefigure\ - #1}\par\vspace{6pt}}%
}
\newcommand{\figurecaption}[1]{%
  \addtocounter{figure}{-1}%
  \caption{#1}%
}

\captionsetup[table]{
  labelfont={bf},
  labelformat=simple,
  labelsep=colon,
  name=Table,
  justification=raggedright,
  singlelinecheck=false,
  skip=4pt,
  position=below,
}
\newcommand{\tabletitle}[1]{%
  \refstepcounter{table}%
  {\centering\textbf{Table~\thetable\ - #1}\par\vspace{6pt}}%
}
\newcommand{\tablesubtitle}[1]{%
  \vspace{-\dimexpr\parskip/2\relax}%
  {\centering#1\par\vspace{6pt}}%
}
\newcommand{\tablecaption}[1]{%
  \addtocounter{table}{-1}%
  \caption{#1}%
}
\newcommand{\hcell}[1]{\textbf{#1}}
\newcommand{\rcell}[1]{\textbf{#1}}

\counterwithin{listingcount}{section}
\providecommand{\theHlistingcount}{}
\renewcommand{\theHlistingcount}{\theHsection.\arabic{listingcount}}
\renewcommand{\thelistingcount}{Listing~\thesection.\arabic{listingcount}}
\newcommand{\listinglabel}[1]{%
  \refstepcounter{listingcount}%
  {\textbf{\thelistingcount\ - #1}}\par\vspace{-\dimexpr\parskip/3\relax}%
  \addcontentsline{lol}{mylisting}{\protect\numberline{\thesection.\arabic{listingcount}}#1}%
  \ignorespaces
}

\numberwithin{equation}{section}
\renewcommand{\theequation}{Eq.~\thesection.\arabic{equation}}
\newcommand{\eqlabel}[1]{%
  \refstepcounter{myequation}%
  \addcontentsline{loe}{myequation}{\protect\numberline{\thesection.\arabic{equation}}#1}%
}

\counterwithin{codecount}{section}
\providecommand{\theHcodecount}{}
\renewcommand{\theHcodecount}{\theHsection.\arabic{codecount}}
\renewcommand{\thecodecount}{Code~\thesection.\arabic{codecount}}
\newcommand{\codelabel}[1]{%
  \refstepcounter{codecount}%
  {\textbf{\thecodecount\ - #1}}\par\vspace{-\dimexpr\parskip/3\relax}%
  \addcontentsline{loc}{mycode}{\protect\numberline{\thesection.\arabic{codecount}}#1}%
  \ignorespaces
}
\counterwithin{examplecount}{codecount}

% ------------------------------------------------------------
% Listings and supported language definitions
% ------------------------------------------------------------
\lstset{
  basicstyle=\ttfamily\selectfont,
  breaklines=true,
  frame=none,
  columns=flexible,
  keepspaces=true,
}

\lstdefinelanguage{json}{
  basicstyle=\ttfamily\selectfont,
  showstringspaces=false,
  breaklines=true,
  frame=none,
  stringstyle=\color{DarkBlue},
  commentstyle=\color{DarkGray},
}
\lstdefinelanguage{go}{
  basicstyle=\ttfamily\selectfont,
  showstringspaces=false,
  breaklines=true,
  frame=none,
  stringstyle=\color{DarkBlue},
  commentstyle=\color{DarkGray},
}
\lstdefinelanguage{pseudocode}{
  basicstyle=\ttfamily\selectfont\itshape,
  showstringspaces=false,
  breaklines=true,
  frame=none,
  stringstyle=\color{DarkBlue},
  commentstyle=\color{DarkGray},
}

% ------------------------------------------------------------
% Helper commands to create front and end matter sections
% ------------------------------------------------------------
\newcommand{\OSTMetaLabel}[1]{{\color{DarkBlue}\textbf{#1}}}
\newcommand{\OSTFrontMatterHeading}[1]{{\bfseries\fontsize{10}{12}\selectfont\color{DarkBlue}#1}\\}

\newcommand{\BeginStandardsTrackDocument}{%
  \begin{titlepage}
  {\setlength{\parskip}{0pt}%
   \setlength{\baselineskip}{0pt}%
   \begin{flushright}
     \includegraphics[height=0.75in,keepaspectratio,right]{ostera-logo}

     \fontsize{18pt}{22pt}\selectfont\color{DarkGray}{\DocType}

     \vspace{50pt}

     \fontsize{24pt}{28pt}\selectfont\color{DarkBlue}\textbf{\DocTitle}

     \vspace{12pt}

     \fontsize{16pt}{20pt}\selectfont\color{DarkBlue}\textbf{Version \DocVersion}
   \end{flushright}%
  }

  \vspace{30pt}

  % Table of meta data on the title page 
  \setlength{\extrarowheight}{2pt}
  \begin{tabularx}{\textwidth}{@{}
    >{\raggedright\arraybackslash}m{5cm}
    >{\raggedright\arraybackslash}X @{} }
  \hline\noalign{\vspace{6pt}}
  \OSTMetaLabel{Category} & \DocCategory \\
  \OSTMetaLabel{Publication Date} & \DocPublicationDate \\
  \OSTMetaLabel{Working Group} & \DocWG \\
  \OSTMetaLabel{Authors} &
    \begin{tabular}[t]{@{}l@{}}\DocAuthors\end{tabular} \\
  \OSTMetaLabel{Supplement To} &
    \begin{tabular}[t]{@{}l@{}}\DocSupplementTo\end{tabular} \\
  \OSTMetaLabel{Updates} &
    \begin{tabular}[t]{@{}l@{}}\DocUpdates\end{tabular} \\
  \OSTMetaLabel{Obsoletes} &
    \begin{tabular}[t]{@{}l@{}}\DocObsoletes\end{tabular} \\
  \OSTMetaLabel{Citation} & \DocCitation \\
  \OSTMetaLabel{Abstract} & \DocAbstract \\
  \OSTMetaLabel{Keywords} & \DocKeywords \\
  \noalign{\vspace{6pt}}\hline
  \end{tabularx}

  \vspace{12pt}

  \OSTFrontMatterHeading{Document Status}
  \OTTDocumentStatus

  \OSTFrontMatterHeading{Copyright}
  \OTTCopyright

  \OSTFrontMatterHeading{Notice}
  \OTTNotice
  \end{titlepage}%
}

\newcommand{\BeginToC}{%
  \clearpage
  \tableofcontents
}

\newcommand{\BeginLoI}{%
  \clearpage
  {\headinglevelonefontstyle Lists of Illustrations}
  \applylistspacing
}

\newcommand{\EndOfDocumentMarker}{%
  \vspace{24pt}
  \begin{center}
    \rule{0.4\textwidth}{0.4pt}
  \end{center}%
}

\endinput
