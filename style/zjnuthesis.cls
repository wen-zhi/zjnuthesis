\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{test}
    [Zhejiang normal university thesis template, v1.0, jiwen.life@gmail.com]


% process key-value options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=test,
    prefix=,
}
\DeclareStringOption{StudentName}
\DeclareStringOption{StudentNameEng}
\DeclareStringOption{StudentID}
\DeclareStringOption{Advisor}
\DeclareStringOption{AdvisorEng}
\DeclareStringOption{Grade}
\DeclareStringOption{Major}
\DeclareStringOption{MajorEng}
\DeclareStringOption{Title}
\DeclareStringOption{TitleEng}
\DeclareStringOption{SubmitDate}
\DeclareStringOption{SubmitMonEng}
\DeclareStringOption{ChLibID}
\DeclareStringOption{ResearchType}
\ProcessKeyvalOptions*


% basic config
\PassOptionsToPackage{AutoFakeBold=2}{xeCJK}
\LoadClass[zihao=-4, heading=true, UTF8, oneside]{ctexrep}


% packages
\usepackage{graphicx}
\usepackage{geometry}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{multirow}
\usepackage{makecell}
\usepackage{tabularx}
\usepackage{caption}
\usepackage{subcaption}
\usepackage{ulem} %underline, etc.
\usepackage{tocloft}
\usepackage[style=numeric,
            sorting=none,
            bibstyle=gb7714-2015,
            citestyle=gb7714-2015]{biblatex}
\usepackage{fancyhdr}


%font
\setmainfont{Times New Roman}


% paths
\graphicspath{{figures/}}
\addbibresource{./bib/ref.bib}


% layout
\geometry{
    a4paper,
    marginpar=0pt,
    includeheadfoot,
    vmargin={2.54cm, 2.54cm},
    hmargin={2.6cm, 2.4cm},
    headsep=5mm
}


% line-skip
\linespread{1.5}


% header and footer
\fancypagestyle{headofffootoff}
{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
}
\fancypagestyle{headofffooton}
{
    \fancyhf{}
    \cfoot{\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0pt}
}
\fancypagestyle{headonfooton}
{
    \fancyhf{}
    \chead{\zihao{-5}\leftmark}
    \cfoot{\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0.6pt}
}

\newcommand{\coverstyle}{
    \pagestyle{headofffootoff}
}
\newcommand{\prevstyle}{
    \clearpage
    \pagestyle{headofffooton}
    \pagenumbering{Roman}
}
\newcommand{\bodystyle}{
    \clearpage
    \thispagestyle{headofffooton}
    \pagestyle{headonfooton}
    \pagenumbering{arabic}
}
\newcommand{\poststyle}{
    \clearpage
    \pagestyle{headofffooton}
}


% heading
\setcounter{secnumdepth}{3}
\ctexset
{
    chapter =
    {
        format=\centering\zihao{3}\heiti,
        name={},
        number=\arabic{chapter},
        beforeskip=8pt,
        afterskip=30pt,
        pagestyle=headofffooton,
        fixskip=true
    },
    section =
    {
        format=\raggedright\zihao{-3}\heiti,
        name={},
        number=\arabic{chapter}.\arabic{section},
        beforeskip=24pt,
        afterskip=24pt,
        fixskip=true
    },
    subsection =
    {
        format=\raggedright\zihao{4}\heiti,
        name={},
        number=\arabic{chapter}.\arabic{section}.\arabic{subsection},
        beforeskip=12pt,
        afterskip=12pt,
        fixskip=true
    },
    subsubsection =
    {
        format=\raggedright\zihao{-4}\heiti,
        name={},
        aftername=~,
        numbering=true,
        number=\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection},
        beforeskip=0pt,
        afterskip=0pt
    }
}


%% toc
% toc title
\renewcommand{\contentsname}{目{\quad}录}
\renewcommand{\cfttoctitlefont}{\hfill\zihao{3}\heiti}
\renewcommand{\cftaftertoctitle}{\hfill}
% toc thispagestyle
\tocloftpagestyle{headofffooton}
% skip
\setlength{\cftbeforetoctitleskip}{0em}
\setlength{\cftaftertoctitleskip}{2em}
\setlength{\cftbeforechapskip}  {0em}
% toc fonts
\renewcommand{\cftchapfont}         {\zihao{-4}}
\renewcommand{\cftchapleader}       {\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchappagefont}     {\zihao{-4}}
\renewcommand{\cftsecfont}          {\zihao{-4}}
\renewcommand{\cftsubsecfont}       {\zihao{-4}}
\renewcommand{\cftsubsubsecfont}    {\zihao{-4}}
% toc dot sep
\renewcommand{\cftchapdotsep}       {0.5}
\renewcommand{\cftsecdotsep}        {0.5}
\renewcommand{\cftsubsecdotsep}     {0.5}
\renewcommand{\cftsubsubsecdotsep}  {0.5}
\renewcommand{\cftchapnumwidth}       {1.5em}
\renewcommand{\cftsecnumwidth}        {1.5em}
\renewcommand{\cftsubsecnumwidth}     {1.5em}
\renewcommand{\cftsubsubsecnumwidth}  {1.5em}
% toc indent
\setlength{\cftchapindent}      {0em}
\setlength{\cftsecindent}       {2em}
\setlength{\cftsubsecindent}    {4em}
\setlength{\cftsubsubsecindent} {6em}


% caption
\DeclareCaptionFont{captionfont}{\zihao{5}\kaishu}
\captionsetup{font=captionfont}
\captionsetup{labelsep=space}
\captionsetup{position=bottom} % pos of skip, not caption itself


% utils
\def\mysplit#1-#2-#3\endsplit{%
    \def\SubmitYear{#1}
    \def\SubmitMonth{#2}
    \def\SubmitDay{#3}
}
\def\splitdate#1{\expandafter\mysplit#1\endsplit}
\splitdate{\SubmitDate}


%% abstract env
% chinese abstract
\newenvironment{abstract-zh}
{\clearpage

    \begin{center}
        \zihao{3}\heiti \Title
    \end{center}

    \vspace{1em}

    \phantomsection
    \addcontentsline{toc}{chapter}{摘要}
    \begin{center}
        \zihao{-3}\heiti 摘要
    \end{center}

}
{\vskip\baselineskip}
\newenvironment{keywords-zh}{{\zihao{4}\heiti 关键词：}}{}
% english abstract
\newenvironment{abstract-en}
{\clearpage

    \begin{center}
        \zihao{3}\MakeUppercase{\TitleEng}
    \end{center}

    \vspace{1em}

    \phantomsection
    \addcontentsline{toc}{chapter}{ABSTRACT}
    \begin{center}
        \zihao{-3} ABSTRACT
    \end{center}

}
{\vskip\baselineskip}
\newenvironment{keywords-en}{{\zihao{4} KEY WORDS: }}{}


% customization
\input{./style/customize}


% hyperref
% (for compatible, load it in the last)
\usepackage{hyperref}
\hypersetup{hidelinks}
