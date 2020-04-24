%let draft = True
%let anon  = False
%let appendix = True

%if anon
\documentclass[sigplan,review,anonymous,fleqn]{acmart}
\settopmatter{printfolios=true,printccs=false,printacmref=false}
%else
\documentclass[sigplan,authorversion,preprint,fleqn]{acmart}
%\settopmatter{printfolios=true,printccs=true,printacmref=false}
%endif

%% Journal information
%% Supplied to authors by publisher for camera-ready submission;
%% use defaults for review submission.
\acmJournal{PACMPL}
\acmVolume{1}
\acmNumber{ICFP} % CONF = POPL or ICFP or OOPSLA
\acmArticle{55}
\acmYear{2018}
\acmMonth{1}
\acmDOI{} % \acmDOI{10.1145/nnnnnnn.nnnnnnn}
\startPage{1}

%% Copyright information
%% Supplied to authors (based on authors' rights management selection;
%% see authors.acm.org) by publisher for camera-ready submission;
%% use 'none' for review submission.
\setcopyright{none}
%\setcopyright{acmcopyright}
%\setcopyright{acmlicensed}
%\setcopyright{rightsretained}
%\copyrightyear{2018}           %% If different from \acmYear

%% Bibliography style
\bibliographystyle{ACM-Reference-Format}
%% Citation style
%% Note: author/year citations are required for papers published as an
%% issue of PACMPL.
\citestyle{acmauthoryear}   %% For author/year citations

\usepackage{xspace}

%include format.fmt
%\newcommand{\keyword}[1]{\mathbf{#1}}
%\renewcommand{\Varid}[1]{\mathsfsl{#1}}
%\renewcommand{\Conid}[1]{\mathsfsl{#1}}

% code formatting style for use in type rules
\newenvironment{inlinemathhscode}%
  {\def\column##1##2{}%
   \let\>\undefined\let\<\undefined\let\\\undefined
   \newcommand\>[1][]{}\newcommand\<[1][]{}\newcommand\\[1][]{}%
   \def\fromto##1##2##3{##3}%
   \def\nextline{}}{}%

\newcommand{\inlinemathhs}{\sethscode{inlinemathhscode}}

\usepackage{xspace}

% change inferrule macro to actually have three arguments
\newcommand\labelledinferrule[3]{\inferrule{#1}{#2}~\text{\textsc{#3}}}
% rule/judgement types
\newcommand\ruletype[1]{\center\boxed{#1}}

\newcommand\spacecorrectsep{%
  \spacecorrectnosep
  \vskip\blanklineskip\relax
}
\newcommand\spacecorrectnosep{%
  \vskip-\belowdisplayskip\relax
  \vskip-\abovedisplayskip\relax
}

% Rule names

\newcommand{\VVar}{\textsc{V\_Var}\xspace}

\newcommand{\highlight}[2]{\ensuremath{\mathchoice%
  {\colorbox{#1}{\(\displaystyle#2\)}}%
  {\colorbox{#1}{\(\textstyle#2\)}}%
  {\colorbox{#1}{\(\scriptstyle#2\)}}%
  {\colorbox{#1}{\(\scriptscriptstyle#2\)}}}}%

\newcommand{\ghl}[1]{\highlight{gray!25}{#1}}

%if not draft
\newcommand{\ponders}[3]{\ignorespaces}
% \newcommand{\TODO}[1]{\errmessage{TODO remaining!}}
\newcommand{\TODO}[1]{}
%else
\makeatletter
\patchcmd{\@@addmarginpar}{\ifodd\c@@page}{\ifodd\c@@page\@@tempcnta\m@@ne}{}{}
\makeatother
\reversemarginpar
\newcommand{\ponders}[3]{\marginpar{\tiny\itshape\raggedright\textcolor{#2}{\textbf{#1:} #3}}\ignorespaces}
\marginparwidth=1.6cm \marginparsep=0cm
\newcommand{\TODO}[1]{{\color{red}#1}}
%endif
\newcommand{\ck}[1]{\ponders{CK}{blue}{#1}}
\newcommand{\nw}[1]{\ponders{NW}{orange}{#1}}
\newcommand{\matt}[1]{\ponders{MP}{green}{#1}} % \mp already defined


\usepackage{fancyvrb}
\usepackage{mathpartir}

\renewenvironment{verbatim}{\begin{Verbatim}[xleftmargin=\mathindent]}{\end{Verbatim}}
\DefineVerbatimEnvironment%
  {core}{Verbatim}
  {xleftmargin=\mathindent}

\usepackage{subcaption}
\usepackage{caption}
\usepackage{tikz}
\usepackage{tikz-cd}
\usepackage{csvsimple,booktabs, siunitx, array}
\usepackage{sansmath}


%include format.fmt
\newcommand{\keyword}[1]{\mathsfbf{#1}}
\renewcommand{\Varid}[1]{\mathsfsl{#1}}
\renewcommand{\Conid}[1]{\mathsfsl{#1}}


\begin{document}

\title{Cross-Stage Persistence}
%% Author with single affiliation.
\author{Matthew Pickering}
%\authornote{with author1 note}          %% \authornote is optional;
                                        %% can be repeated if necessary
%\orcid{nnnn-nnnn-nnnn-nnnn}             %% \orcid is optional
\affiliation{
%  \position{Position1}
  \department{Department of Computer Science}              %% \department is recommended
  \institution{University of Bristol}            %% \institution is required
%  \streetaddress{Street1 Address1}
%  \city{City1}
%  \state{State1}
%  \postcode{Post-Code1}
  \country{United Kingdom}                    %% \country is recommended
}
\email{matthew.pickering@@bristol.ac.uk}          %% \email is recommended
\author{Nicolas Wu}
%\authornote{with author1 note}          %% \authornote is optional;
                                        %% can be repeated if necessary
%\orcid{nnnn-nnnn-nnnn-nnnn}             %% \orcid is optional
\affiliation{
%  \position{Position1}
  \department{Department of Computer Science}              %% \department is recommended
  \institution{University of Bristol}            %% \institution is required
%  \streetaddress{Street1 Address1}
%  \city{City1}
%  \state{State1}
%  \postcode{Post-Code1}
  \country{United Kingdom}                    %% \country is recommended
}
\email{nicolas.wu@@bristol.ac.uk}          %% \email is recommended


\begin{abstract}
\end{abstract}

%% 2012 ACM Computing Classification System (CSS) concepts
%% Generate at 'http://dl.acm.org/ccs/ccs.cfm'.
\begin{CCSXML}
<ccs2012>
<concept>
<concept_id>10011007.10011006.10011008</concept_id>
<concept_desc>Software and its engineering~General programming languages</concept_desc>
<concept_significance>500</concept_significance>
</concept>
<concept>
<concept_id>10003456.10003457.10003521.10003525</concept_id>
<concept_desc>Social and professional topics~History of programming languages</concept_desc>
<concept_significance>300</concept_significance>
</concept>
</ccs2012>
\end{CCSXML}

\ccsdesc[500]{Software and its engineering~General programming languages}
\ccsdesc[300]{Social and professional topics~History of programming languages}
%% End of generated code



%% Keywords
%% comma separated list
\keywords{generics, traversals, lenses}  %% \keywords are mandatory in final camera-ready submission


%% \maketitle
%% Note: \maketitle command must come after title commands, author
%% commands, abstract environment, Computing Classification System
%% environment and commands, and keywords command.
\maketitle



%if style == newcode
\begin{code}
{-# LANGUAGE TypeInType #-}
{-# LANGUAGE DuplicateRecordFields #-}
module Main where

main = return ()

\end{code}
%endif

%if style == poly

%include Introduction.lhs
%include Formalism.lhs
%endif

\bibliography{staging}
\clearpage


\end{document}
