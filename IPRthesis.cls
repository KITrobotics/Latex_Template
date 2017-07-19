%% LaTeX2e class for diploma theses
%% Based on wissdoc.cls by Roland Bless, 1996-2001
%% bless@telematik.informatik.uni-karlsruhe.de
%%
%% Adapted by: Timo Rohrberg, 2009
%% timo.rohrberg@student.kit.edu
%%
%% Additions by: Thorsten Haberecht, IPD - Chair Prof. Böhm, 2010
%% thorsten.haberecht@kit.edu
%%
%% Additions of multiple classes: Denis ¦togl, IAR-IPR Prof. Hein, 2017
%% denis.stogl@kit.edu
%% Ideas taken from: SDQ-Version by Erik Burger (v1.3, Dezember 2016)


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IPRthesis}
\newif\ifIPRthesis@german
\newif\ifIPRthesis@seminar
\newif\ifIPRthesis@bachelor
\newif\ifIPRthesis@master
\newif\ifIPRthesis@phd
\newif\ifIPRthesis@thesis
\newif\ifIPRthesis@techreport

\DeclareOption{german}{\IPRthesis@germantrue}
\DeclareOption{ngerman}{\IPRthesis@germantrue}

\DeclareOption{seminar}{\IPRthesis@seminartrue}
\DeclareOption{bachelor}{\IPRthesis@bachelortrue \IPRthesis@thesistrue}
\DeclareOption{master}{\IPRthesis@mastertrue \IPRthesis@thesistrue}
\DeclareOption{phd}{\IPRthesis@phdtrue \IPRthesis@thesistrue}
\DeclareOption{techreport}{\IPRthesis@techreporttrue}

\ProcessOptions\relax

\newcommand{\thesistype}{}
\ifIPRthesis@bachelor
  \renewcommand{\thesistype}{\iflanguage{ngerman}{Bachelorarbeit}{Bachelor Thesis}}
\fi
\ifIPRthesis@master
  \renewcommand{\thesistype}{\iflanguage{ngerman}{Masterarbeit}{Master Thesis}}
\fi
\ifIPRthesis@phd
  \renewcommand{\thesistype}{\iflanguage{ngerman}{Doktorarbeit}{PhD Thesis}}
\fi

%% ----------------------------------
%% |          Paper class           |
%% ----------------------------------
%% ---------------------------------------------------------------
%% | Based on KOMAscript by Markus Kohm http://www.komascript.de |
%% ---------------------------------------------------------------
\ifIPRthesis@german
  % English is also needed in German thesis for the abstract
  \usepackage[main=ngerman,english]{babel}
\else
  % German is also needed in English thesis for the abstract
  \usepackage[main=english,ngerman]{babel}
\fi

\ifIPRthesis@seminar
  \LoadClass[11pt,a4paper,titlepage]{scrartcl}
\fi
\ifIPRthesis@techreport
  \LoadClass[12pt,a4paper,titlepage]{scrartcl}
\fi
\ifIPRthesis@thesis
  \LoadClass[12pt,twoside,headsepline,a4paper,titlepage,DIV=15,BCOR=20mm]{scrbook}
\fi


%% -----------------------
%% | Headers and footers |
%% -----------------------
\RequirePackage[automark,headsepline]{scrpage2}

\clubpenalty=10000 %prevent orphans
\widowpenalty=10000 %prvent widows

\ifIPRthesis@seminar
  \lohead{\headmark}
  \chead{}
  \pagestyle{scrheadings}
\fi
\ifIPRthesis@techreport
  \lohead{\headmark}
  \chead{}
  \pagestyle{scrheadings}
\fi

%% ----------------------------------------
%% |         Setup of the document        |
%% ----------------------------------------
\input{document_setup}

%% -------------------------------
%% |         New commands        |
%% -------------------------------
\newcommand{\changefont}[3]{\fontfamily{#1} \fontseries{#2} \fontshape{#3} \selectfont}
%\renewcommand*{\headfont}{\slshape}
%\newcommand{\captionfont}{}
\newcommand{\chapterheadfont}{}
\newcommand{\blankpage}{
 \clearpage{\pagestyle{empty}\cleardoublepage}
}
%% --- End of New Commands ---



%% -------------------------------
%% |      Globale Settings       |
%% -------------------------------
\ifIPRthesis@techreport
  \setcounter{secnumdepth}{0} % Numbering also for \subsubsections
\else
  \setcounter{secnumdepth}{3} % Numbering also for \subsubsections
\fi
\setcounter{tocdepth}{3}    % Register \subsubsections in content directory

\setpapersize{A4}
\setmarginsrb{3cm}{1cm}{3cm}{1cm}{6mm}{7mm}{5mm}{15mm}

\parindent 0cm                     % Do not indent beginning of paragraph
\parskip1.5ex plus0.5ex minus0.5ex % Margin between paragraphs
%% --- End of global Settings ---



%% -------------------------------
%% |      Style of captions      |
%% -------------------------------
\ifIPRthesis@seminar
  \newcommand{\chapter}{\section}
\fi
\ifIPRthesis@techreport
  \newcommand{\chapter}{\section}
\fi
%% --- End of captions style ---



%% ----------------------------------
%% |  Style of appendix numbering   |
%% ----------------------------------
% appendix
\RequirePackage[toc,title,header]{appendix}
\noappendicestocpagenum

 \renewcommand\appendix{\par 
   \setcounter{section}{0}% 
   \setcounter{subsection}{0}% 
   \setcounter{figure}{0}%
   \renewcommand\thesection{\Alph{section}}% 
   \renewcommand\thefigure{\Alph{section}.\arabic{figure}} 
   \renewcommand\thetable{\Alph{section}.\arabic{table}}}
%% --- End of appenix numbering style ---


%% ----------------------
%% | Title page options |
%% ----------------------
% Logos
\newcommand{\thegrouplogo}{iirob.png}
\newcommand{\grouplogo}[1]{\renewcommand{\thegrouplogo}{#1}}
\newcommand{\printgrouplogo}{\includegraphics[width=5cm,height=1.8cm,keepaspectratio]{Logos/\thegrouplogo}}
\newcommand{\nogrouplogo}{\renewcommand{\printgrouplogo}{}}

\ifIPRthesis@seminar
\else
  \nogrouplogo
\fi

\titlehead{%

% BG shape
\newcommand{\diameter}{20}
\newcommand{\xone}{-15}
\newcommand{\xtwo}{160}
\newcommand{\yone}{15}
\newcommand{\ytwo}{-253}
% bg shape
\begin{tikzpicture}[overlay]
\draw[color=gray]
 		 (\xone mm, \yone mm)
  -- (\xtwo mm, \yone mm)
 arc (90:0:\diameter pt)
  -- (\xtwo mm + \diameter pt , \ytwo mm)
	-- (\xone mm + \diameter pt , \ytwo mm)
 arc (270:180:\diameter pt)
	-- (\xone mm, \yone mm);
\end{tikzpicture}

% KIT logo german/english
\iflanguage{ngerman}
{\includegraphics[height=1.8cm]{Logos/kitlogo_de_cmyk}}
{\includegraphics[height=1.8cm]{Logos/kitlogo_en_cmyk}}
\hfill
% Institute/Group logo
\printgrouplogo

\begin{textblock}{10}[0,0](3.5,16.8)
  \tiny{
	\iflanguage{ngerman}
		{KIT -- Universit\"at des Landes Baden-W\"urttemberg und nationales Forschungszentrum in der Helmholtz-Gemeinschaft}
		{KIT -- University of the State of Baden-Wuerttemberg and National Research Center of the Helmholtz Association}
  }
\end{textblock}
\begin{textblock}{10}[0,0](15,16.75)
  \large{
	\textbf{www.kit.edu}
  }
\end{textblock}

\newcommand{\titlepreamble}{}
\ifIPRthesis@seminar
  \renewcommand{\titlepreamble}{Seminar \thethesistype}
\fi
\ifIPRthesis@techreport
  \renewcommand{\titlepreamble}{\thethesistype}
\fi

\ifthenelse{\equal{\titlepreamble}{}}
{}
{
  \begin{center}
    \vspace*{1cm}
    \Huge{
      {\changefont{phv}{m}{n}\selectfont \titlepreamble }
    }
  \end{center}
}
}

\ifIPRthesis@techreport
  \setkomafont{title}{\Huge\changefont{phv}{m}{n}}
  \setkomafont{subtitle}{\large\changefont{phv}{m}{n}}
  \setkomafont{author}{\Large\changefont{phv}{m}{n}}
\else
  \setkomafont{title}{\Huge\changefont{phv}{m}{n}}
  \setkomafont{subtitle}{\large\changefont{phv}{m}{n}}
  \setkomafont{author}{\huge\changefont{phv}{m}{n}}
\fi

\uppertitleback{Karlsruher Institut für Technologie\\ Fakultät für Informatik\\ Postfach 6980\\ 76128 Karlsruhe}

\newcommand{\theinstitute}{
  \iflanguage{ngerman}
   {Institut f\"ur Anthropomatik und Robotik (IAR) -\\ Intelligente Prozessautomation and Robotik (IPR)}
   {Institute for Anthropomatics and Robotics (IAR) -\\ Intelligent Process Control and Robotics (IPR)}
  }
\newcommand{\myinstitute}[1]{\renewcommand{\theinstitute}{#1}}

\newcommand{\thereviewerone}{}
\newcommand{\reviewerone}[1]{\renewcommand{\thereviewerone}{#1}}
\newcommand{\thereviewertwo}{}
\newcommand{\reviewertwo}[1]{\renewcommand{\thereviewertwo}{#1}}
\newcommand{\theadvisorone}{}
\newcommand{\advisorone}[1]{\renewcommand{\theadvisorone}{#1}}
\newcommand{\theadvisortwo}{}
\newcommand{\advisortwo}[1]{\renewcommand{\theadvisortwo}{#1}}

\newcommand{\theeditstart}{}
\newcommand{\theeditend}{}

\newcommand{\editingtime}[2]{%
\renewcommand{\theeditstart}{#1}%
\renewcommand{\theeditend}{#2}%
%% do not show the date
\date{}
}

\newcommand{\thekeywords}{}
\newcommand{\keywords}[1]{\renewcommand{\thekeywords}{#1}}

%% Thesis type handling
\newcommand{\thethesistype}{}
\ifIPRthesis@seminar
  \newcommand{\studyprogram}[1]{
      \subtitle{\vspace*{1cm}  \Large{\iflanguage{ngerman}{Seminararbeit von}{Seminar work of}}
      }
      \renewcommand{\thethesistype}{#1}
  }
\fi
\ifIPRthesis@thesis
  \newcommand{\studyprogram}[1]{\subtitle{\vspace*{1.5cm} \iflanguage{ngerman}{\thesistype\\ im Studiengang #1\\von}{\thesistype\\ in #1\\of}}
  \renewcommand{\thethesistype}{#1}}
\fi
\ifIPRthesis@techreport
  \newcommand{\studyprogram}[1]{\subtitle{\vspace*{1.5cm} \iflanguage{ngerman}{geschrieben von}{written by}}
  \renewcommand{\thethesistype}{#1}}
\fi

\newcommand{\settitle}{
  \publishers{
    {\changefont{phv}{m}{n}\selectfont
    \ifIPRthesis@seminar
      \Large
    \else
      \large
    \fi
    \iflanguage{ngerman}{An der Fakult\"at f\"ur Informatik}{At the Department of Informatics}
    \\
    \theinstitute

    \vspace*{1cm}

    \begin{tabular}{l c l}
      \ifIPRthesis@seminar
	\iflanguage{ngerman}{Betreuender Mitarbeiter}{Advisor}: & \hfill & \theadvisorone \\
      \fi
      \ifIPRthesis@thesis
	\ifthenelse{\equal{\thereviewertwo}{}}{
	  \iflanguage{ngerman}{Gutachter}{Reviewer}: & \hfill  & \thereviewerone \\
	}{
	  \iflanguage{ngerman}{Erstgutachter}{First reviewer}: & \hfill & \thereviewerone \\
	  { }\iflanguage{ngerman}{Zweitgutachter}{Second reviewer}: & \hfill & \thereviewertwo \\
	}
	\ifIPRthesis@phd
	\else
	  \ifthenelse{\equal{\theadvisortwo}{}}{
	    \iflanguage{ngerman}{Betreuender Mitarbeiter}{Advisor}: & \hfill & \theadvisorone \\
	  }{
	    \iflanguage{ngerman}{Erster betreuender Mitarbeiter}{First advisor}: & \hfill & \theadvisorone \\
	    { }\iflanguage{ngerman}{Zweiter betreuender Mitarbeiter}{Second advisor}: & \hfill & \theadvisortwo \\
	  }
	\fi
      \fi
    \end{tabular}

    \vspace{4cm}
    \normalsize{
      \ifIPRthesis@techreport
	\today
      \else
	\theeditstart{} -- \theeditend
      \fi
      }
    }
  }
}

\newcommand{\includedeclaration}{}
\ifIPRthesis@techreport
  \thispagestyle{empty}
  \pagebreak
\else
  \renewcommand{\includedeclaration}{\input{Content/0-Declaration.tex}}
\fi

%% -----------------------------
%% | Abstract/Acknowledgements |
%% -----------------------------
\newcommand{\includeabstract}{}

\ifIPRthesis@techreport
  \newcommand{\Abstract}[1][\iflanguage{ngerman}{\abstractname}{Executive Summary}]{\chapter*{#1}}
  \renewcommand{\includeabstract}{
  \iflanguage{ngerman}{
    \include{Content/0-Abstract_DE}
  }{
    \include{Content/0-Abstract_EN}
  }
  }
\fi

\ifIPRthesis@thesis
  \newcommand{\abstract}[1][\abstractname]{\chapter*{#1}}
  \newcommand{\Abstract}[1][\abstractname]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}}

  % \def\ackname{Acknowledgments}
  % \def\abstractname{Abstract}
  % \def\switcht@deutsch{\svlanginfo
  % 	\def\ackname{Danksagung}
  % 	\def\abstractname{Kurzfassung}
  % }
  % \def\switcht@english{\svlanginfo
  % 	\def\ackname{Acknowledgements}
  % 	\def\abstractname{Abstract}
  % }

  \renewcommand{\includeabstract}{
  \iflanguage{ngerman}{
  % include German and English abstracts
  \include{Content/0-Abstract_DE}
  \begin{otherlanguage}{english}
  \include{Content/0-Abstract_EN}
  \end{otherlanguage}
  }{
  % include English and German abstracts
  \include{Content/0-Abstract_EN}
  \begin{otherlanguage}{ngerman}
  \include{Content/0-Abstract_DE}
  \end{otherlanguage}
  }
  }
\fi

%% ------------------------------------------
%% | Tables of Contents, Figures and Tables |
%% ------------------------------------------
\newcommand{\inculdetableofcontents}{}
\ifIPRthesis@seminar
  \renewcommand{\inculdetableofcontents}{
    \tableofcontents
    \pagebreak
    }
\fi
\ifIPRthesis@techreport
  \renewcommand{\inculdetableofcontents}{
    \tableofcontents
    \pagebreak
    }
\fi
\ifIPRthesis@thesis
  \renewcommand{\inculdetableofcontents}{
    \tableofcontents
    \listoffigures \addcontentsline{toc}{chapter}{\listfigurename}
    \listoftables \addcontentsline{toc}{chapter}{\listtablename}
    \pagebreak
    }
\fi

%% ------------
%% | Appendix |
%% ------------
\ifIPRthesis@thesis
  \newcommand{\Appendix}[1][\appendixname]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1} \appendix \setcounter{figure}{0}}
\else
  \newcommand{\Appendix}[1][\appendixname]{\chapter*{#1}\addcontentsline{toc}{section}{#1} \appendix \setcounter{figure}{0}}
\fi

% \appendix

% \iflanguage{english}
% {\addchap{Appendix}}	% english style
% {\addchap{Anhang}}	% german style

%% -----------------------------
%% | Bibliography |
%% -----------------------------¨


\ifIPRthesis@thesis
  \newcommand{\Bibliography}[1]{\addcontentsline{toc}{chapter}{\bibname} \bibliography{#1}}
\else
  \newcommand{\Bibliography}[1]{\addcontentsline{toc}{section}{\bibname} \bibliography{#1}}
\fi

\iflanguage{ngerman}
  {\bibliographystyle{unsrtdin}}	% german style
  {\bibliographystyle{IEEEtran}}	% english style

% \usepackage[fixlanguage]{babelbib}	% sets german style for literature entries
% \selectbiblanguage{ngerman}			% for \bibliographystyle{babalpha}


%% ---------------------------------
%% | ToDo Marker - only for draft! |
%% ---------------------------------
% Remove this section for final version!
\setlength{\marginparwidth}{20mm}

\newcommand{\margtodo}
{\marginpar{\textbf{\textcolor{red}{ToDo}}}{}}

\newcommand{\todo}[1]
{{\textbf{\textcolor{red}{(\margtodo{}#1)}}}{}}


%% --------------------------------
%% | Old Marker - only for draft! |
%% --------------------------------
% Remove this section for final version!
\newenvironment{deprecated}
{\begin{color}{gray}}
{\end{color}}

%% **** END OF CLASS ****
