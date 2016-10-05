\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}

% Based on the memoir class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions
\LoadClass{memoir}

\RequirePackage{fix-cm}
\RequirePackage{etex} % increase register size
\RequirePackage{iftex}

\ifPDFTeX
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\else
\ifXeTeX
\RequirePackage{xltxtra}
\RequirePackage{fontspec}
\else 
\RequirePackage{luatextra}
\fi
\defaultfontfeatures{Ligatures=TeX}
\fi

\RequirePackage{geometry}
\RequirePackage[xetex]{hyperref}
\RequirePackage{memhfixc}
\RequirePackage{graphicx}
\RequirePackage[usenames,dvipsnames,svgnames]{xcolor}
\RequirePackage[framemethod=default]{mdframed}
\RequirePackage{tikz}
\RequirePackage[autostyle=true,english=american,french=guillemets]{csquotes}
%\RequirePackage{cleveref}
\RequirePackage{polyglossia}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage[backend=biber, style=numeric, citestyle=numeric, sorting=none]{biblatex}
\RequirePackage{booktabs}
\RequirePackage[noredefwarn,acronym]{glossaries}
\RequirePackage{titletoc}
\RequirePackage{etoolbox}
\RequirePackage{kpfonts}
\RequirePackage{arrayjob}
\RequirePackage{microtype}

%\RequirePackage{natbib}
%\DisemulatePackage{tocbibind}
%\let\bibsection\relax
%\RequirePackage[nottoc]{tocbibind}

%\usepackage[final]{changes}
%\usepackage{changes}
% \added[remark={blabla}]{voici ce que je rajoute}
% \replaced[remark={blabla}]{voici comment le dire}{ce qui est mal dit}
% \deleted[remark={blabla}]{le texte a enlever}

\RequirePackage{todonotes}
% \todo[prepend]{mon avis}

\setlength{\TPHorizModule}{1cm} %controls horizontal movements
\setlength{\TPVertModule}{1cm}  %controls vertical movements

\setdefaultlanguage{french}
% affiche dans la colonne les changements si l'ioption draft est fournie
\changemarks

\addbibresource{references.bib}

% Supprime l'hyphenation
\pretolerance=10000
\tolerance=2000 
\emergencystretch=10pt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%         Couleurs        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{nicered}{rgb}{.647,.129,.149}
\definecolor{psviolet}{HTML}{62003C}
\definecolor{jaune}{rgb}{1,1,0}
\definecolor{orange}{rgb}{1,0.78,0}
\definecolor{rouge}{rgb}{1,0,0}
\definecolor{rouge_clair}{rgb}{0.75,0,0}
\definecolor{violet}{rgb}{0.62,0.12,0.94}
\definecolor{bleu_marin}{rgb}{0,0,0.75}
\definecolor{bleu}{rgb}{0.11,0.56,0.98}
\definecolor{vert_clair}{rgb}{0,0.5,0}
\definecolor{vert}{rgb}{0.13,0.54,0.13}
\definecolor{marron}{rgb}{0.64,0.16,0.16}
\definecolor{gris_clair}{rgb}{0.9,0.9,0.9}
\definecolor{noir}{rgb}{1,1,1}
\definecolor{bluegray}{HTML}{90C3D4}
\colorlet{Random1}{cyan}
\colorlet{Random2}{yellow}
\colorlet{Random3}{red}
\colorlet{Random4}{green}

% Les commandes permettant de définir la date, le lieu, etc.
\def\date#1{\def\@date{#1}}
\let\@date\@empty

\def\author#1{\def\@author{#1}}
\let\@author\@empty

\def\title#1{\def\@title{#1}}
\let\@title\@empty

\def\keywords#1{\def\@keywords{#1}}
\let\@keywords\@empty

\def\subtitle#1{\def\@subtitle{#1}}
\let\@subtitle\@empty

\def\location#1{\def\@location{#1}}
\let\@location\@empty

\def\thesisdirector#1{\def\@thesisdirector{#1}}
\let\@thesisdirector\@empty

\def\thesiscodirector#1{\def\@thesiscodirector{#1}}
\let\@thesiscodirector\@empty

\def\discipline#1{\def\@discipline{#1}}
\let\@discipline\@empty

\def\doctoralschool#1{\def\@doctoralschool{#1}}
\let\@doctoralschool\@empty

\def\doctoralschoolnumber#1{\def\@doctoralschoolnumber{#1}}
\let\@doctoralschoolnumber\@empty

\def\nationalthesisnumber#1{\def\@nationalthesisnumber{#1}}
\let\@nationalthesisnumber\@empty


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Police          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\setmainlanguage{french}
\frenchspacing
\setotherlanguage{english}
\MakeOuterQuote{"}

% For source code
\setmonofont[Path=fonts/,Extension=.otf]{SourceCodePro-Light}
% Normal font
%\setsansfont[]{Fira Sans}
% Normal font
\setmainfont[
Path=fonts/,
Extension=.otf,
Numbers=OldStyle,
BoldFont=FiraSans-Medium,
ItalicFont=FiraSans-LightItalic,
BoldItalicFont=FiraSans-MediumItalic
]{FiraSans-Light}
\newfontfamily{\normalFont}{fonts/FiraSans-Book.otf}
%\newfontfamily{\sectionNumberFont}{fonts/Canter-Bold-3D.otf}
\newfontfamily{\secNumFont}[Path=fonts/,Extension=.ttf]{Oswald-MediumItalic}
\newfontfamily{\secnameFont}[Path=fonts/,Extension=.otf]{Canter-Bold}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%      Utilitaires        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareDocumentCommand{\isOddPage}{mm}{%
	\strictpagechecktrue%
	\checkoddpage%
	\ifoddpage%
	#1%
	\else%
	#2%
	\fi%
}

\newcommand\Circle[1]{
    \tikz[overlay,remember picture] 
    \node[draw=MidnightBlue, fill=MidnightBlue,circle, text=white, text width=18pt,line width=1pt,align=center,yshift=.25cm] {#1};
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%      Page de garde      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\maketitle{
    \thispagestyle{empty}
    
    \newgeometry{left=1.5cm,right=1.5cm,top=4cm,bottom=0.1cm}
    \begin{textblock}{3}(1,0.7)
        \includegraphics[height=2cm]{img/universite_paris_saclay.png}
    \end{textblock}
    
    %\begin{textblock}{2.5}(8,0.7)
    %    \includegraphics[height=3cm]{img/universite_paris_sud_2.png}
    %\end{textblock}
    
    \begin{textblock}{3}(15,0.7)
        \includegraphics[height=3cm]{img/universite_evry_val_essonne.png}
    \end{textblock}
    
    %\begin{textblock}{2}(17,0.7)
        %\includegraphics[height=2cm]{img/labgem.png} 
    %\end{textblock}
    %\vspace{0.2cm}
    
    \begin{mdframed}[linecolor=psviolet, linewidth=2pt, innerleftmargin=10, innerrightmargin=30, innertopmargin=10, innerbottommargin=50]
    
    \begin{center}
        {\huge \textcolor{psviolet}{THÈSE DE DOCTORAT}}\\
        {\huge \textcolor{psviolet}{DE L'UNIVERSITÉ PARIS SACLAY}}\\
        {\Large \textcolor{psviolet}{préparée à }} \\
        {\Large \textcolor{psviolet}{l'Université d'Évry Val d'Essonne}} \\
        \vspace{\baselineskip}
        \vspace{\baselineskip}
    	{\Large ÉCOLE DOCTORALE N°\@doctoralschoolnumber} \\
    	{\Large \@doctoralschool}\\
        \vspace{\baselineskip}
        {\Large Spécialité de doctorat : Sciences de la Vie et de la Santé } \\
    	{\Large Discipline : \@discipline}\\
        \vspace{\baselineskip}
        \vspace{\baselineskip}
        {\Large Par}\\
        \vspace{\baselineskip}
        \vspace{\baselineskip}
        {\Huge{\textbf{\@author}}}\\
        \vspace{\baselineskip}
        \vspace{\baselineskip}
        {\huge\textbf{\@title}}\\
    \end{center}
    
    \begin{flushright}
		{\bfseries{\@subtitle}}
        \vspace{\baselineskip}
    \end{flushright}
    
    
    \begin{center}
        {\large Numéro national de thèse: \@nationalthesisnumber}\\
        \vspace{\baselineskip}
    \end{center}
    
    \begin{flushleft}
        {\large \textbf{Thèse présenté et soutenue à \@location le \@date}}\\
        \vspace{\baselineskip}
        \vspace{\baselineskip}
        \begin{tabular}{p{5cm} p{5cm} p{5.4cm} }
        	\footnotesize\bfseries{Directrice de thèse} :           & Mme. \@thesisdirector   & \footnotesize{DR (CNRS)} \\
        	\footnotesize\bfseries{Co-directeur de thèse} :         & M.   \@thesiscodirector & \footnotesize{CR (CEA)} \\
        	                                                        &                         &\\
        	\footnotesize\textbf{\underline{Composition du jury :}} &                         &\\
        	\footnotesize{Président du jury} :                      & .......                 & \footnotesize{..... (......)} \\
        	\footnotesize{Rapporteurs} :                            & .......                 & \footnotesize{..... (......)} \\
                                                                    & .......                 & \footnotesize{..... (......)} \\
            \footnotesize{Examinateurs} :                           & .......                 & \footnotesize{..... (......)} \\
                                                                    & .......                 & \footnotesize{..... (......)} \\
        	\footnotesize{Invités} :                                & .......                 & \footnotesize{..... (......)} \\
        \end{tabular}
    \end{flushleft}
    
    
    \end{mdframed}
    \clearpage
    \restoregeometry
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mise en forme des titres %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newarray\dnaletters
\readarray{dnaletters}{A&C&G&T}

\maxtocdepth{subsubsection}
\setsecnumdepth{subsubsection}


\setlength{\headheight}{15pt}

\renewcommand{\thechapter}{\Roman{chapter}}
%\renewcommand{\thesection}{\Roman{chapter}.\arabic{section}}
\renewcommand{\thesection}{\arabic{section}}
%\renewcommand{\thesubsection}{\Roman{chapter}.\arabic{section}.\alph{subsection}}
\renewcommand{\thesubsection}{\arabic{subsection}}
\renewcommand{\thesubsubsection}{\alph{subsubsection}}

\def\barroman#1{
    \sbox0{#1}\dimen0=\dimexpr\wd0+1pt\relax
    \makebox[\dimen0]{\rlap{\vrule width\dimen0 height 0.06ex depth 0.06ex}%
    \rlap{\vrule width\dimen0 height\dimexpr\ht0+0.03ex\relax 
            depth\dimexpr-\ht0+0.09ex\relax}%
    \kern.5pt#1\kern.5pt}
}

\makepagestyle{thesisStyle}
\makeheadfootruleprefix{thesisStyle}{}{\color{MidnightBlue}}
\makefootrule{thesisStyle}{\textwidth}{\normalrulethickness}{\footruleskip}
\makeevenfoot{thesisStyle}{\itshape\leftmark}{}{\thepage}
\makeoddfoot{thesisStyle}{\itshape\leftmark}{}{\thepage}
\makepsmarks{thesisStyle}{
  \createmark{chapter}{left}{shownumber}{\@chapapp\ }{.\ }
}

\copypagestyle{chapter}{thesisStyle}

\makechapterstyle{thesisStyle}{
    \renewcommand{\chapternamenum}{}
    \renewcommand{\chapnumfont}{\normalfont\Huge\bfseries}
    \renewcommand{\printchapternum}{}
    \renewcommand{\printchaptername}{}
    \renewcommand\printchaptertitle[1]{
        \begin{tikzpicture}[remember picture,overlay,shift={(current page.north west)},yshift=-3cm]
            \path[fill=Black] (0,0) rectangle(\paperwidth,3cm);
            \foreach \x in {0,1, ..., 70}{
                \foreach \y in {0, ...,7} 
                    \pgfmathsetmacro\Random{random(1,4)}
                \node[draw=none,color=Random\Random,anchor=south west,font=\tiny,xshift=-.05cm] at (\x*.3cm,\y*.33cm) {\dnaletters(\Random)};
            };
            \node[anchor=east,xshift=.9\paperwidth,rectangle, rounded corners=20pt,inner sep=11pt, fill=MidnightBlue] {
                \ifnum\value{chapter}>0
                    \normalfont\Huge\bfseries\color{white}\barroman{\thechapter}~##1
                \else
                    \normalfont\Huge\bfseries\color{white}##1
                \fi
            };
        \end{tikzpicture}
    }
    \renewcommand{\afterchapternum}{}
}


\makeheadstyles{thesisStyle}{
    \chapterstyle{thesisStyle}
    
    %\setbeforesecskip{\onelineskip}
    \setsecheadstyle{\normalfont\Huge}
    \setaftersecskip{2\onelineskip}
    
    \setsubsecheadstyle{\normalfont\large}
}

\setbeforesecskip{1cm}
\setsecnumformat{\csname #1secnumformat\endcsname}
\newcommand\sectionsecnumformat{{\secNumFont\fontsize{2cm}{3.5cm}\selectfont\color{bluegray!30}\raisebox{-3mm}[1pt][1pt]{\thesection}}\hspace{-4mm}}
\newcommand\subsectionsecnumformat{\thesubsection\quad}

\headstyles{thesisStyle}

% sommaire style
\renewcommand\chapternumberline[1]{
    \begin{tikzpicture}[remember picture, overlay]
        \draw[fill=MidnightBlue,draw=MidnightBlue, rounded corners=10pt] (-2,-.1) rectangle (1.5,.6);
        \pgftext[left,x=-1.7cm,y=0.2cm]{\color{white}\Large\textsc\bfseries \@chapapp\ #1\thecontentslabel};
    \end{tikzpicture}\color{MidnightBlue}\large\textsc\bfseries\hspace{1.8cm}
}
\contentsmargin{0cm}
\titlecontents{chapter}[0cm]{
    \addvspace{30pt}
    \def\@chapapp{Chapitre}
}
{}
{}
{
    %\color{MidnightBlue}\large\textsc\bfseries\;\titlerule\;\large\textsc\bfseries Page \thecontentspage
}

\titlecontents{section}[3.5cm]
{\addvspace{1pt}}
{\contentslabel[\thecontentslabel]{0.5cm}}
{}
{\hfill\small \thecontentspage}
[]

\titlecontents{subsection}[4.5cm]
{\addvspace{1pt}}
{\contentslabel[\thecontentslabel]{0.5cm}}
{}
{\hfill\small \thecontentspage}
[]

\titlecontents{subsubsection}[5cm]
{\addvspace{1pt}}
{\contentslabel[\thecontentslabel]{0.5cm}}
{}
{\hfill\small \thecontentspage}
[]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Glossaire         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeglossaries
\input{glossaires}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Sommaire         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\let\oldtableofcontents\tableofcontents
\def\tableofcontents{\@ifstar{\oldtableofcontents*}{\oldtableofcontents*}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Autres commandes        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\warning}[1]{
    \vspace*{1em}
    \fcolorbox{White}{PeachPuff}{
        \parbox{\textwidth}{
            \Huge{\ding{43}} \large{\textbf{Attention}}: \newline
            \setstretch{1} \normalsize{#1}
            }
    }
}

\newcommand{\note}[1]{
    \vspace*{1em}
    \fcolorbox{White}{LightYellow}{
        \parbox{\textwidth}{
            \Huge{\ding{46}} \large{\textbf{Note}}: \newline
            \setstretch{1} \normalsize{#1}
        }
    }
}

\newcommand{\information}[1]{
    \vspace*{1em}
    \fcolorbox{White}{PaleGreen}{
        \parbox{\textwidth}{
            \Huge{\ding{52}} \large{\textbf{Information}}: \newline
            \setstretch{1} \normalsize{#1}
        }
    }
}

% citation arg1 => vitation arg 2 => auteur
\renewcommand{\citation}[2]{
    { \raggedleft {\fontsize{24}{0}\selectfont{\og}} \emph{#1} {\fontsize{24}{0}\selectfont{\fg}} \par }
    { \raggedleft #2 \par }
}


%% Terminal
\newcommand{\terminal}[1]{
    \begin{minipage}{\textwidth}
    Sortie dans le terminal:

        \fcolorbox{White}{gris_clair}{
            \parbox{\textwidth}{
                    \setstretch{1} \scriptsize{#1}
            }
        }
    \end{minipage}
}