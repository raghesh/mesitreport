%% -*- Latex -*- 
%% 
%% iesreport.cls - standard institute of electronic systems report class
%% 
%% Copyright (C) 1999 Flemming Kjær Jensen <fkj@kom.auc.dk>
%% 
%% $Id: $
%% 
%% Author          : Flemming Kjær Jensen
%% Created On      : Wed Oct 20 23:13:47 1999
%% Last Modified By: Flemming Kjaer Jensen
%% Last Modified On: Sat Mar 10 14:19:22 2001
%% Update Count    : 151
%% 

\NeedsTeXFormat{LaTeX2e}[1995/12/01]            % Needs December 95 release

\ProvidesClass{iesreport}[1999/10/13 v1.0 LaTeX Rapport Class udkast]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions

\LoadClass[12pt,a4paper]{report}

\RequirePackage{t1enc}
\RequirePackage[danish,english]{babel}
%\RequirePackage[dvips]{graphicx}

% here is a list of packages that is normally used to create
% an advanced report class. To use the packages comment in the packages
% and find the relevant package customisation below the list of
% packages.
%
\RequirePackage{fancyhdr}
\RequirePackage{fancybox}
\RequirePackage{amsmath}
\RequirePackage{float}
\RequirePackage{subfigure}
\RequirePackage{lastpage}
\RequirePackage{program}
\RequirePackage[hang,bf,small]{caption}
\RequirePackage{verbatim}
\RequirePackage{multirow}
\RequirePackage{array}
\RequirePackage{alltt}
\RequirePackage{delarray}
\RequirePackage{boxedminipage}
\RequirePackage{setspace}
\RequirePackage{sectsty}
\RequirePackage[square,longnamesfirst]{natbib}
\RequirePackage{url}
\RequirePackage{layout}
\RequirePackage{geometry}
\RequirePackage{booktabs}
\RequirePackage{rcs}
\RequirePackage{bm}
\RequirePackage{lastpage}
\RequirePackage{psfrag}
\RequirePackage{picinpar}
\RequirePackage{longtable}
\RequirePackage{acronym}
\RequirePackage[chapter]{tocbibind}

\RequirePackage{times}
\RequirePackage{mathptm}

% page layout
%
\geometry{verbose,dvips,a4paper}
%\geometry{twoside}
\geometry{includemp=false}
\geometry{hscale=0.7}
\geometry{head=16.0pt}
%\geometry{scale={0.7,0.8}}
%\geometry{nofoot}

\setlength{\parindent}{0mm}        % paragraph setup
\setlength{\parskip}{.4\baselineskip plus .2\baselineskip minus .1\baselineskip}
\renewcommand{\baselinestretch}{1.225}
%\setlength{\captionmargin}{1cm}
%\setlength{\abovecaptionskip}{5mm}
%\setlength{\belowcaptionskip}{3mm}


% setting the correct space
%
\setstretch{1}                                          % setspace

% helvetica 
%
\allsectionsfont{\sffamily}                             % sectsty

% for nicer looking algorithms, remember to comment in "program" package
%
\NumberProgramstrue                                     % program
%\sfvariables                                            % program
\def\RETURN{\keyword{return}\ }                         % program
\newtheorem{algorithm}{Algorithm}[chapter]              % program

% for nicer looking captions on figures and tables, remember to 
% comment in "caption" package and also the "subfigure" package
%
\renewcommand{\captionfont}{\normalfont\sffamily\small} % caption
\renewcommand{\captionlabelfont}{\bfseries\normalsize}  % caption
\renewcommand{\subcapsize}{\captionfont}                % subfigure

% for customising ``floating'' of figures and tables, remember to
% comment in "float" package
%
\floatplacement{figure}{htbp}                           % float
\floatplacement{table}{htbp}                            % float
\floatstyle{plain}                                      % float
\restylefloat{figure}                                   % float
\restylefloat{table}                                    % float

% for setting up alternative directory paths to graphics files,
% remember to comment in "graphics" package
%
\graphicspath{{./eps/}{./tiff/}{./jpg/}{./fig/}{./dia/}{./gnuplot/}{./png/}}

%  header and footer including the contents
%
\pagestyle{fancy}%
\renewcommand{\headrulewidth}{0.3pt}
\renewcommand{\footrulewidth}{0.3pt}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}{}}
\fancyhf{}
\fancyhead[L]{\sffamily\bfseries ExLat}
%\fancyhead[L]{\sffamily\bfseries\thepage}
\fancyhead[R]{\sffamily\bfseries \textsl {Mini Project Report 2012}}

%\fancyhead[]{\sffamily\bfseries\leftmark}
\fancyfoot{}
%\fancyfoot[R]{\sffamily\bfseries Automatic License Plate Recognition}
\fancyfoot[R]{\sffamily\bfseries MESCE, Kuttippuram}
\fancyfoot[L]{\sffamily\bfseries Department of IT}
\fancyfoot[C]{\sffamily\bfseries\thepage}
\fancypagestyle{plain}{%
  \fancyhead{} % get rid of headers
  \renewcommand{\headrulewidth}{0pt} % and the head line
}


% for two-sided report you want to start a new chapter on a page to 
% the right and have an empty page on the left of the new chapter.
% (no packages needed, this is a LaTeX macro).
%
% To use it:
%   
%    ...end of sentence.
%    \clearemptydoublepage
%    \chapter{Name of new chapter}
%    \label{cha:newchapter}
%
\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}%
  \cleardoublepage{}}}

% set the level of table of contents
%
\setcounter{tocdepth}{2}


% macro definition
%
\newcommand{\rapportindhold}[1]{%
  \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}}
\newcommand{\appendixindhold}[1]{%
  \addtocontents{toc}%
  {\protect\contentsline{chapter}{\protect\numberline{\thechapter}#1}{\ }}%
  \addtocontents{loa}%
  {\protect\contentsline{chapter}{\protect\numberline{\thechapter}#1}{\ }}}
\newcommand\kapitelindhold\rapportindhold

% setup of bibliography
%
\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname
        \@mkboth{\bibname}{\bibname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

% setup of table of contents
%
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{\contentsname}{\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }

% setup of list of figures
%
\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename
      \@mkboth{\listfigurename}%
              {\listfigurename}}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }

% setup of list of tables
%
\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename
      \@mkboth{\listtablename}{\listtablename}}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }



% setup of titlepage
%
\def\maketitle{%
  \begin{titlepage}
\selectlanguage{english}
\special{ps: gsave .7 setgray}%
\noindent\rule{\hsize}{2pt}
\special{ps: grestore}\\
\centerline{\textsc{\fontsize{18}{21}\fontsize{18}{21}\usefont{T1}{ppl}{m}{n}\selectfont%
  \scshape ExLat}}\\[5mm]
\special{ps: gsave .7 setgray}%
\noindent\rule{\hsize}{1.2pt}
\special{ps: grestore}\\
\center{Project Group VI, 2012}\\[3mm]
\center{Swathy V S, Hasna, Salin Rosna T V, Sonima}\linebreak 
\center{\textbf{Guided By:}}\linebreak{Mr. Raghesh A}\linebreak \fontsize{8}{9}{Asst. Professor}\linebreak\fontsize{8}{9}{Department of IT}
% {\fontsize{8}{10}\usefont{T1}{phv}{mc}{n}\selectfont%
%   \hfill\hbox{}\llap{Revision \RCSRevision}}\\[-9mm]

% {\fontsize{8}{10}\usefont{T1}{phv}{mc}{n}\selectfont%
 %  \hfill\hbox{}\llap{\RCSDate}}
\vspace*{0.75in}
\centerline{\includegraphics[scale=0.75]{mes1.eps}}

\vfill
{\fontsize{10}{10}\usefont{T1}{ppl}{mm}{n}\selectfont%
\hfill\hbox{}{\scshape \center MES College of Engineering}\\[-9mm]
\hfill\hbox{}{\center Department of Information Technology}\\[-12.5mm]
%\hfill\hbox{}\llap{\scshape Department of Medical Informatics}
}
\special{ps: gsave .7 setgray}%
\noindent\rule{\hsize}{2pt}
\special{ps: grestore}\\
\end{titlepage}}

%%% Local Variables: 
%%% mode: latex
%%% TeX-master: t
%%% End: 
