\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}
% Based on the memoir class
\newif\ifthesis@univ
\newif\ifxetexorluatex

\DeclareOption{univ}{%
	\thesis@univtrue
	\PassOptionsToClass{a4paper,12pt,twoside,openright,openbib,final}{memoir}
}

\DeclareOption{nouniv}{%
	\thesis@univfalse
	\PassOptionsToClass{10pt,twoside,openright,openbib,final}{memoir}
}

%% What to do, if an unknown option is entered?
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{memoir}}
\PassOptionsToPackage{font=small,labelfont=bf}{caption}
\ExecuteOptions{univ} %default is univ
\ProcessOptions\relax

% Based on the memoir class
\LoadClass{memoir}

%\global\pdfobjcompresslevel=0
%\global\pdfminorversion=5
%\global\pdfinclusioncopyfonts=1
%\newcommand{\pdfapart}{3}        % PDF/A part
%\newcommand{\pdfaconformance}{U} % PDF/A conformance

\ifthesis@univ
	% \typeout{Foo!} % print to stdout
\else
	% \\typeout{NoFoo!} % print to stdout
	\setstocksize{240mm}{160mm}
    \paperheight=240mm \paperwidth=160mm
	\settrimmedsize{\stockheight}{\stockwidth}
    \setlrmarginsandblock{2cm}{2cm}{*}
    \setulmarginsandblock{2cm}{2cm}{*}
    \checkandfixthelayout
    \fixpdflayout
\fi

\RequirePackage{fix-cm}
\RequirePackage{etex} % increase register size
\RequirePackage{iftex}
\RequirePackage{etoolbox}
\RequirePackage[pdf15,a-3u,latxmp]{pdfx}
\providecommand{\pdfxopts}{a-3u}

\AtEndPreamble{%
    \makeatletter
    \hypersetup{ 
        pdfencoding 	= unicode,
        unicode     	= true,
%        pdfapart    	= {\pdfapart},
%        pdfaconformance = {\pdfaconformance},
        final       	= true,
        colorlinks  	= true,
        urlcolor    	= blue,
        citecolor   	= blue,
        linkcolor   	= MidnightBlue,
        unicode     	= true,
        linktoc     	= section,
        pdflang     	= fr-FR,
        pdfauthor   	= {\@author},
        pdfkeywords 	= {\@keywords},
        pdftitle    	= {\@title},
        pdflang     	= {fr},
        pdfsubject  	= {Genomic expert annotation}
    }
    \makeatother
}{}


% \immediate\write18{rm \jobname.xmpdata}
% \begin{filecontents*}{\jobname.xmpdata}
%     \pdfstringdef\inputTitle{\@title}
% \end{filecontents*}

\ifPDFTeX
    \typeout{pdftex latex engine!}
    \RequirePackage[T1]{fontenc}
	\RequirePackage[utf8]{inputenc}
	\RequirePackage{lmodern}
    \RequirePackage[pdftex]{pdflscape}
    \xetexorluatexfalse
\else
	\ifXeTeX
        \typeout{xetex latex engine!}
		\RequirePackage{xltxtra}
		\RequirePackage{fontspec}
        \RequirePackage[xetex]{hyperref}
        \RequirePackage[xetex]{pdflscape}
        \xetexorluatextrue
        
	\else
        \ifLuaTeX
            \typeout{lualatex latex engine!}
    		\RequirePackage{luatextra}
            \RequirePackage[pdftex]{hyperref}
            \RequirePackage[pdftex]{pdflscape}
            \xetexorluatextrue
        \else
            \typeout{Unknown latex engine!}
            \xetexorluatexfalse
	\fi
	\defaultfontfeatures{Ligatures=TeX}
\fi

\RequirePackage{geometry}
\RequirePackage{memhfixc}
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage[usenames,dvipsnames,svgnames]{xcolor}
\RequirePackage[framemethod=default]{mdframed}
\RequirePackage[skins,most,listings,skins]{tcolorbox}
\RequirePackage{tikz}
\RequirePackage{tkz-euclide}
\RequirePackage{forest} 
\RequirePackage{polyglossia}
\RequirePackage[autostyle=true,english=american,french=guillemets]{csquotes}
\RequirePackage{pifont} 
\RequirePackage{float}
\RequirePackage[noabbrev]{cleveref}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{notoccite}
\RequirePackage[backend=biber,bibencoding=utf8,defernumbers=true,backref=true,style=nature,citestyle=science,sorting=none]{biblatex}
\RequirePackage[nomain,noredefwarn,acronym]{glossaries}
\RequirePackage{titletoc}
\RequirePackage{kpfonts}
\RequirePackage{arrayjobx}
\RequirePackage{microtype}
\RequirePackage{xargs}                      % Use more than one optional parameter in a new commands
\RequirePackage{romanbar}                % Use more than one optional parameter in a new commands
\RequirePackage{emptypage}
\RequirePackage{needspace}
\RequirePackage{multirow}
\RequirePackage{amsmath}
\RequirePackage{mathtools}
\RequirePackage{enumitem}
\RequirePackage{colortbl}
\RequirePackage{multicol}
\RequirePackage[final]{pdfpages}
\RequirePackage{verbatim}
\RequirePackage{tasks}
\RequirePackage{adjustbox}
%\RequirePackage[none]{hyphenat}
%\RequirePackage{natbib}
%\DisemulatePackage{tocbibind}
%\let\bibsection\relax
%\RequirePackage[nottoc]{tocbibind}

%\usepackage[final]{changes}
%\usepackage{changes}
% \added[remark={blabla}]{voici ce que je rajoute}
% \replaced[remark={blabla}]{voici comment le dire}{ce qui est mal dit}
% \deleted[remark={blabla}]{le texte a enleàver}

\RequirePackage[colorinlistoftodos,prependcaption,obeyFinal,textsize=tiny]{todonotes}
% \todo[prepend]{mon avis}
%\newcommand{\note}[1]{\todo[prepend]{#1}}
\newcommandx{\unsure}[2][1=]{\todo[caption={Incertain},linecolor=red,backgroundcolor=red!25,bordercolor=red,#1]{#2}}
\newcommand{\change}[2]{\todo[caption={#1},linecolor=blue,backgroundcolor=blue!25,bordercolor=blue]{#2}}
\newcommandx{\info}[2][1=]{\todo[caption={Info},linecolor=OliveGreen,backgroundcolor=OliveGreen!25,bordercolor=OliveGreen,#1]{#2}}
\newcommandx{\improvement}[2][1=]{\todo[caption={Amélioration},linecolor=Plum,backgroundcolor=Plum!25,bordercolor=Plum,#1]{#2}}
\newcommandx{\thiswillnotshow}[2][1=]{\todo[disable,#1]{#2}}


% Other

\setlength{\TPHorizModule}{1cm} %controls horizontal movements
\setlength{\TPVertModule}{1cm}  %controls vertical movements

\setdefaultlanguage{french}
\setmainlanguage{french}
\setotherlanguage{english}
% affiche dans la colonne les changements si l'option draft est fournie
\changemarks

% Supprime l'hyphenation
\pretolerance=5000
\tolerance=5000 
\emergencystretch=10em
\raggedbottom
\hyphenpenalty=10000

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}


% macro à utiliser vant une énumération pour empécher que la liste se trouve sur une nouvelle page sans le texte qui le précède sur la même page.
%\newcommand{\nolisttopbreak}{\vspace{\topsep}\nobreak\@afterheading}
\newcommand\nolisttopbreak{\par\nobreak\@afterheading} 

\usetikzlibrary{backgrounds,shadows,arrows,decorations.markings,positioning}
%\usetikzlibrary{arrows.meta, shapes.geometric, calc, shadows}

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
\definecolor{secnum}{RGB}{13,151,225}
\definecolor{ptcbackground}{RGB}{212,237,252}
\definecolor{ptctitle}{RGB}{0,177,235}
\definecolor{aliceblue}{rgb}{0.94, 0.97, 1.0}
\definecolor{babyblue}{rgb}{0.54, 0.81, 0.94}
\definecolor{beaublue}{rgb}{0.74, 0.83, 0.9}
\definecolor{bleudefrance}{rgb}{0.19, 0.55, 0.91}
\definecolor{cornflowerblue}{rgb}{0.39, 0.58, 0.93}
\definecolor{mediumelectricblue}{rgb}{0.01, 0.31, 0.59}
\colorlet{Random1}{cyan}
\colorlet{Random2}{yellow}
\colorlet{Random3}{red}
\colorlet{Random4}{green}

% Les commandes permettant de définir la date, le lieu, etc.
\def\date#1{\def\@date{#1}}
\let\@date\@empty

\def\author#1{\def\@author{#1}}
\let\@author\@empty

\def\org#1{\def\@org{#1}}
\let\@org\@empty

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

\ifxetexorluatex
%    \RequirePackage{hyperxmp}
%    
%    %\global\pdfcompresslevel=9
%    
%    \edef\pwpt{\strip@pt\dimexpr0.996264009963\paperwidth\relax} %paper width in PS points
%    \edef\phpt{\strip@pt\dimexpr0.996264009963\paperheight\relax} %paper height in PS points
%    
%    \pdfpageattr{
%        /MediaBox [0 0 \pwpt \phpt]^^J
%        /BleedBox [0.00000 0.00000 \pwpt \phpt]^^J
%        /CropBox [0 0 \pwpt \phpt]^^J
%        /TrimBox [0.00000 0.00000 \pwpt \phpt]
%    }
%
%    \pdfinfo{ 
%        /Title (\@title)
%        /Author(\@author)
%        /Keywords(\@keywords)
%        /GTS_PDFXVersion (PDF/A-3:2012)
%        /GTS_PDFXConformance (PDF/A-3u:2012)
%    }
%    \immediate\pdfobj stream attr{/N 4^^J/Alternate/DeviceCMYK} file{coated_FOGRA39L_argl.icc}
%    \pdfcatalog{
%        /PageMode /UseNone
%        /OutputIntents [ <<
%        /Type /OutputIntent
%        /S /GTS_PDFA3
%        /DestOutputProfile \the\pdflastobj\space 0 R
%        /OutputConditionIdentifier (Coated FOGRA39)
%        /RegistryName (http://www.argyllcms.com/)
%        /Info(FOGRA39 (ISO Coated v2 300\% (ECI)))
%        >> ]
%    }%
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Police          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewcommand{\baselinestretch}{1.5}
\linespread{1.5}
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
\newfontfamily{\normalFont}[Path=fonts/,Extension=.otf]{FiraSans-Book}
%\newfontfamily{\sectionNumberFont}{fonts/Canter-Bold-3D.otf}
\newfontfamily{\secNumFont}[Path=fonts/,Extension=.ttf]{Oswald-MediumItalic}
\newfontfamily{\secnameFont}[Path=fonts/,Extension=.otf]{Canter-Bold}
%\newfontfamily{\handwritingFont}[Path=fonts/,Extension=.otf]{GrandHotel-Regular}
\newfontfamily{\handwritingFont}[Path=fonts/,Extension=.ttf]{IndieFlower}
\newfontfamily{\noteFont}[Path=fonts/,Extension=.ttf]{IndieFlower}
\newfontfamily{\greekFont}[Path=fonts/,Extension=.otf]{GFSArtemisiaIt}
\newfontfamily{\referenceFont}[Path=fonts/,Extension=.otf]{CherrySwash-Bold}
%\newfontfamily{\noteFont}[Path=fonts/,Extension=.otf]{CherrySwash-Regular}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%      Utilitaires        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\siecle}[1]{\uppercase\expandafter{\romannumeral #1\relax}$^{ème}$ siècle}

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
	
	\ifthesis@univ
    \begin{SingleSpace}
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
                {\huge{\textbf{\@author}}}\\
                \vspace{\baselineskip}
                \vspace{\baselineskip}
                {\Huge\emph{\textbf{\color{psviolet}\@title}}}\\
            \end{center}
            
    %        \begin{flushright}
    %    		{\bfseries{\@subtitle}}
    %            \vspace{\baselineskip}
    %        \end{flushright}
            
            
            \begin{center}
                {\large Numéro national de thèse: \@nationalthesisnumber}\\
                \vspace{\baselineskip}
            \end{center}
            
            \begin{flushleft}
                {\large \textbf{Thèse présentée et soutenue à \@location~le \@date}}
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
        
    \end{SingleSpace}
	\fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 4eme de couverture %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mise en forme des titres %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newarray\dnaletters
\readarray{dnaletters}{A&C&G&T}


\maxtocdepth{paragraph}
\setsecnumdepth{paragraph}
%\setlength\cftpartnumwidth{3em}

\setlength{\headheight}{15pt}

\renewcommand{\thechapter}{\Roman{chapter}}
%\renewcommand{\thesection}{\Roman{chapter}.\arabic{section}}
\renewcommand{\thesection}{\arabic{section}}
%\renewcommand{\thesubsection}{\Roman{chapter}.\arabic{section}.\alph{subsection}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\alph{subsubsection}}
\renewcommand{\theparagraph}{-}

\newrobustcmd{\icon}[1]{\includegraphics[height=2cm]{#1}}

\defbibheading{subbibliography}{
    \clearpage    
    \section*{\icon{img/references.png}\hspace{1cm}\handwritingFont{Références}} %#1 <-- écrit Bibliographie, donc écriture en dure de Références
    \markright{\itshape #1}
}

\makepagestyle{thesisStyle}
\makeheadfootruleprefix{thesisStyle}{}{\color{MidnightBlue}}
\makefootrule{thesisStyle}{\textwidth}{\normalrulethickness}{\footruleskip}
\makeevenfoot{thesisStyle}{\thepage}{}{\itshape\leftmark}
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
            \path[fill=Black] (0,0) rectangle(1.1\paperwidth,3cm);
            \foreach \x in {0,1, ..., 70}{
                \foreach \y in {0, ...,7} 
                    \pgfmathsetmacro\Random{random(1,4)}
                \node[draw=none,color=Random\Random,anchor=south west,font=\tiny,xshift=-.05cm] at (\x*.3cm,\y*.33cm) {\dnaletters(\Random)};
            };
            \node[anchor=east,xshift=0.95\paperwidth] {
            	\begin{tcolorbox}[colframe=MidnightBlue, colback=MidnightBlue,opacityframe=0.65, opacityback=0.65,arc=20pt,left=5em,width=\paperwidth]
            		\ifnum\value{chapter}>0
            		  \normalfont\Huge\bfseries\color{white}\Romanbar{\thechapter}~##1
            		\else
            		  \normalfont\Huge\bfseries\color{white}##1
            		\fi
            	\end{tcolorbox}
            };
        \end{tikzpicture}
    }
    \renewcommand{\afterchapternum}{}
}

\newcommand{\ruledsec}[1]{%
	\needspace{5\baselineskip}
    \vskip 1em
    {\color{MidnightBlue}\hrule}
    \vskip 1em
    {\normalfont\Large\bfseries#1}
    \vskip 1em
    {\color{MidnightBlue}\hrule}
}

\newtcbox{\mybox}{
    nobeforeafter,
    colframe=bluegray!40,
    colback=bluegray!40,
    colupper=white,
    boxrule=0.5pt,
    arc=4pt,
    boxsep=0pt,
    right=6pt,
    top=6pt,
    bottom=6pt,
    box align=center
}

\makeheadstyles{thesisStyle}{
    \chapterstyle{thesisStyle}
    
    \setsecheadstyle{\ruledsec}
    \setaftersecskip{2\onelineskip}
    
    \setsubsecheadstyle{\normalfont\large}
    \setsubsubsecheadstyle{\normalfont\color{MidnightBlue}}
}

\setbeforesecskip{1cm}
\setsecnumformat{\csname #1secnumformat\endcsname} % numbering format
%\newcommand\sectionsecnumformat{{\secNumFont\fontsize{2cm}{3.5cm}\selectfont\color{bluegray!30}\raisebox{-3mm}[1pt][1pt]{\thesection}}\hspace{-2mm}}
\newcommand\sectionsecnumformat{
    \hspace{-5mm}
    \mybox{\secNumFont\fontsize{2cm}{3.5cm}\selectfont\thesection}
    \hspace{-2mm}
}


\newcommand\subsectionsecnumformat{\thesubsection\quad}         % number subsection style
\newcommand\subsubsectionsecnumformat{\thesubsubsection\quad}   % number subsubsection style
\newcommand\paragraphsecnumformat{\theparagraph\quad}           % number paragraph style

\headstyles{thesisStyle}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mise en forme des figures %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironmentx{shadedfigure}[1][1=!ht]{
    \begin{figure}[#1] %[!ht]
        \begin{tcolorbox}[colback=gris_clair,colframe=gris_clair,coltext=white]
}{
        \end{tcolorbox}
    \end{figure}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mise en forme du sommaire %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter

\renewcommand\chapternumberline[1]{
    \begin{tikzpicture}[remember picture, overlay]
        \draw[fill=bluegray,draw=bluegray, rounded corners=10pt] (-2,-.2) rectangle (1.6,.7);
        \pgftext[left,x=-1.7cm,y=0.2cm]{\color{white}\Large\textsc\bfseries \@chapapp\ \Romanbar{#1}\thecontentslabel};
    \end{tikzpicture}\color{MidnightBlue}\large\textsc\bfseries\hspace{1.8cm}
}
\contentsmargin{0cm}

\newcommand\coloredBox[1]%
{
	\needspace{2\baselineskip}
	\begin{tcolorbox}[colframe=mediumelectricblue, colback=mediumelectricblue,fontupper=\color{white}, left=2em,right=2em]
		\contentslabel{0.5cm}~#1\hfill\contentspage
	\end{tcolorbox}
}

\titlecontents{chapter}[0cm]{
    \addvspace{30pt}
    \def\@chapapp{Chapitre}
}
{}
{}
{
    %\color{MidnightBlue}\large\textsc\bfseries\;\titlerule\;\large\textsc\bfseries Page \thecontentspage
}

\titlecontents{section}[0.5cm]
{\addvspace{1em}}
{\coloredBox}
{}
{}

\titlecontents{subsection}[2.5cm]
{\addvspace{0.5em}}
{\contentslabel{1cm}~}
{}
{\hfill\contentspage}

\titlecontents{subsubsection}[3.5cm]
{}
{\contentslabel{1.4cm}~}
{}
{\hfill\contentspage}


\titlecontents{paragraph}[3.5cm]
{}
{\contentslabel{0.6cm}~}
{}
{\hfill\contentspage}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Glossaire         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\loadglsentries[main]{glossaires}
\makeglossaries
\makeindex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Sommaire         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\let\oldtableofcontents\tableofcontents
\def\tableofcontents{\@ifstar{\oldtableofcontents*}{\oldtableofcontents*}}
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    bibliographie        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\DeclareCiteCommand{\citeyear}
{}
{\bibhyperref{\printfield{year}}}
{\multicitedelim}
{}

\DeclareCiteCommand{\citeyearpar}
{}
{\mkbibparens{\bibhyperref{\printfield{year}}}}
{\multicitedelim}
{}

\renewcommand*{\bibfont}{\footnotesize}

\DefineBibliographyStrings{french}{
	backrefpage  = {page \adddot},
	backrefpages = {pages\adddot},
}

\newcommand{\subbibliography}{
	\begin{SingleSpace}
		\setlength\bibitemsep{0.5em}
		\printbibliography[segment=\therefsegment,heading=subbibliography]
	\end{SingleSpace}
}

\DeclareCiteCommand{\citetitle}
{\boolfalse{citetracker}%
	\boolfalse{pagetracker}%
	\usebibmacro{prenote}}
{\ifciteindex
	{\indexfield{indextitle}}
	{}%
	\printtext[bibhyperref]{\printfield[citetitle]{labeltitle}}}
{\multicitedelim}
{\usebibmacro{postnote}}
\addbibresource{references.bib}

\defbibheading{subbibliography}{
	\clearpage    
	\section*{\icon{img/books.jpg}\hspace{1cm}\referenceFont{\textcolor{MidnightBlue}{Références}}} %#1 <-- écrit Bibliographie, donc écriture en dure de Références
	\markright{\itshape #1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    Numerotation         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\renewcommand\@memmain@floats{%
	\counterwithin{lstlisting}{part}
	\counterwithin{figure}{part}
	\counterwithin{table}{part}}
\makeatother
%\renewcommand{\thelstlisting}{\arabic{lstlisting}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Autres commandes        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{typewriter}{\ttfamily\small}{\par}

\newcommand{\warning}[1]{
    \vspace*{1em}
    \begin{tcolorbox}[colframe=PeachPuff, colback=PeachPuff,arc=10pt]
        \Huge{\ding{43}} \large{\textbf{Attention}}: \newline
        \normalsize{#1}
    \end{tcolorbox}\bfseries
    \needspace{3\baselineskip}
}
\newcommand{\note}[1]{
   	%\vfill
   	\vspace*{1em}
   	\begin{tcolorbox}[colframe=LightYellow, colback=LightYellow,arc=10pt]
   		\begin{SingleSpace}
   		\Huge{\ding{46}} \large{\textbf{Note}}:~
           \noteFont{\small{#1}}\par
       \end{SingleSpace}
   	\end{tcolorbox}
   \needspace{3\baselineskip}
   	%\clearpage
}

\newcommand{\information}[1]{
    \vspace*{1em}
    \fcolorbox{White}{PaleGreen}{
        \parbox{\textwidth}{
            \Huge{\ding{52}} \large{\textbf{Information}}: \newline
            \normalsize{#1}
        }
    }
    \needspace{3\baselineskip}
}

% citation arg1 => citation arg 2 => auteur
\renewcommandx{\citation}[3][3=]{
	\vspace*{1em}
	\begin{tcolorbox}[colframe=AntiqueWhite, colback=AntiqueWhite,arc=10pt]
		\begin{SingleSpace}
			\raisebox{-1em}{\fontsize{36pt}{0}\selectfont ``} {\handwritingFont{\emph{#1}}}   \raisebox{-1em}{\fontsize{36pt}{0}\selectfont ''} \par
			\vspace{0.2em}
			{ \raggedleft \textit{#2}\par }
			{ \raggedleft {\tiny#3} \par }
		\end{SingleSpace}
	\end{tcolorbox}
	\vspace*{1em}
    \needspace{3\baselineskip}
}


%% Terminal

%\newtcblisting{commandshell}{
%    colback=black,colupper=white,colframe=black,
%    listing only,listing options={language=sh},
%    every listing line={\textcolor{green}{\small\ttfamily\bfseries Linux \$> }}
%}

\newcommand{\console}[2]{
    \vspace*{1em}
    \begin{tcolorbox}[colframe=black, colback=black,colupper=white,arc=10pt]
        \begin{SingleSpace}
             \tiny\ttfamily\bfseries\textcolor{green}{ Linux \$ }#1 \par
             #2
        \end{SingleSpace}
    \end{tcolorbox}
    \vspace*{1em}
    \needspace{3\baselineskip}
}

\newcommand{\terminal}[1]{
    \begin{minipage}{\textwidth}
    Sortie dans le terminal:

        \fcolorbox{White}{gris_clair}{
            \parbox{\textwidth}{
                \setstretch{1.0} \scriptsize{#1}
            }
        }
    \end{minipage}
}

\newcommand{\gsl}[1]{\acrshort{#1} (\acrlong{#1})}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tableaux commandes      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcommand{\specialcell}[2][l]{%
    \begin{tabular}[#1]{@{}l@{}}#2\end{tabular}}
\newcommand{\rowstyle}[1]{\gdef\currentrowstyle{#1}%
    #1\ignorespaces
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%        Listings         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\lstlistingname}{Code}
\lstdefinelanguage{drl}{
    morestring  =[b]",
    keywords    =[1]{rule,when,then,end},
    keywords    =[2]{from,collect,accumulate,forall,memberOf,modify}
}

\lstdefinestyle{drl-style}{basicstyle=\tiny\normalfont\ttfamily,language=drl,keywordstyle=[1]\color{blue},keywordstyle=[2]\color{red},stringstyle=\color{psviolet},escapechar=@}
\lstdefinestyle{python-style}{basicstyle=\tiny\normalfont\ttfamily,language=python,commentstyle=\color{green},stringstyle=\color{orange},keywordstyle=\color{blue}}
\endinput