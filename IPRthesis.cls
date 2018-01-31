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
%% Additions of multiple classes: Denis Štogl, IAR-IPR Prof. Hein, 2017
%% denis.stogl@kit.edu
%% Some ideas taken from: SDQ-Version by Erik Burger (v1.3, Dezember 2016)
%%
%% Version: 0.2 (31.01.2018)


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IPRthesis}
\newif\ifIPRthesis@german
\newif\ifIPRthesis@seminar
\newif\ifIPRthesis@studien
\newif\ifIPRthesis@bachelor
\newif\ifIPRthesis@master
\newif\ifIPRthesis@phd
\newif\ifIPRthesis@thesis
\newif\ifIPRthesis@techreport
\newif\ifIPRthesis@final
\newif\ifIPRthesis@declaration

\DeclareOption{german}{\IPRthesis@germantrue}
\DeclareOption{ngerman}{\IPRthesis@germantrue}

\DeclareOption{seminar}{\IPRthesis@seminartrue}
\DeclareOption{studien}{\IPRthesis@studientrue \IPRthesis@thesistrue}
\DeclareOption{bachelor}{\IPRthesis@bachelortrue \IPRthesis@thesistrue}
\DeclareOption{master}{\IPRthesis@mastertrue \IPRthesis@thesistrue}
\DeclareOption{phd}{\IPRthesis@phdtrue \IPRthesis@thesistrue}
\DeclareOption{techreport}{\IPRthesis@techreporttrue}
\DeclareOption{final}{\IPRthesis@finaltrue}
\DeclareOption{declaration}{\IPRthesis@declarationtrue}

\ProcessOptions\relax

\newcommand{\thesistype}{}
\ifIPRthesis@studien
  \renewcommand{\thesistype}{\iflanguage{ngerman}{Studienarbeit}{Student Research Project}}
\fi
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

  \IPRthesis@declarationfalse
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
% \newcommand{\insertemptypage}{\vspace*{\fill}\thispagestyle{empty}\newpage}
}
%% --- End of New Commands ---



%% -------------------------------
%% |      Globale Settings       |
%% -------------------------------
% TODO: Optimize this if needed
\ifIPRthesis@techreport
  \setcounter{secnumdepth}{3} % Numbering also for \subsubsections
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

% TODO: Add this for title??
\def\@author{}
\renewcommand{\author}[1]{\def\@author{#1}}

\newcommand{\theinstitute}{
  \iflanguage{ngerman}
   {Institut f\"ur Anthropomatik und Robotik (IAR) -\\ Intelligente Prozessautomation und Robotik (IPR)}
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
}
% TODO: Check if this is correct for seminar
%% do not show the date
\date{}

\newcommand{\thetitleotherlanguage}{}
\newcommand{\titleotherlanguage}[1]{\renewcommand{\thetitleotherlanguage}{#1}}
\newcommand{\thekeywords}{}
\newcommand{\keywords}[1]{\renewcommand{\thekeywords}{#1}}
\newcommand{\thekeywordsotherlanguge}{}
\newcommand{\keywordsotherlanguge}[1]{\renewcommand{\thekeywordsotherlanguge}{#1}}

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
    \newcommand{\studyprogram}[1]{
      \ifx\@author\empty
      \else
	\subtitle{\vspace*{1.5cm} \iflanguage{ngerman}{geschrieben von}{written by}}
      \fi
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
    \iflanguage{ngerman}{An der Fakult\"at f\"ur Informatik}{At the Department of Computer Science}
    \\
    \theinstitute

    \vspace*{1cm}

    \begin{tabular}{l c l}
      \ifIPRthesis@seminar
	\iflanguage{ngerman}{Betreuender Mitarbeiter}{Advisor}: & \hfill & \theadvisorone \\
      \fi
      \ifIPRthesis@techreport
	\ifthenelse{\equal{\thereviewertwo}{}}{
	  \iflanguage{ngerman}{Gutachter}{Reviewer}: & \hfill  & \thereviewerone \\
	}{
	  \iflanguage{ngerman}{Erstgutachter}{First reviewer}: & \hfill & \thereviewerone \\
	  { }\iflanguage{ngerman}{Zweitgutachter}{Second reviewer}: & \hfill & \thereviewertwo \\
	}
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

	\ifIPRthesis@declaration \vspace{1.2cm} \else \vspace{4cm} \fi
    \normalsize{
      \ifIPRthesis@techreport
	\today
      \else
	\theeditstart{} -- \theeditend
      \fi
    }
    }
\ifIPRthesis@declaration
	\par\vspace*{1cm}
    \begin{minipage}{\textwidth}
    \normalsize{
	\hbox to \textwidth{\hrulefill}
	\par\vspace{0.2cm}
    \iflanguage{ngerman}
	{Ich versichere wahrheitsgem\"a\ss, die Arbeit selbstst\"andig angefertigt, alle benutzten Hilfsmittel vollst\"andig und genau angegeben und alles kenntlich gemacht zu haben, was aus Arbeiten anderer unver\"andert oder mit Ab\"anderungen entnommen wurde.}
	{I declare that I have developed and written the enclosed thesis completely by myself, and have not used sources or means without declaration in the text.}

	\vspace{0.4cm}
	\textbf{Karlsruhe, \today}
	\vspace{1cm}

	\dotfill\hspace*{8.0cm}\\
	\hspace*{2.0cm}(\textbf{\theauthor}) %center name with hspace
	}
	\end{minipage}
	\stop
\fi
  }
}

\uppertitleback{Karlsruher Institut f\"ur Technologie\\ Fakultät f\"ur Informatik\\ Postfach 6980\\ 76128 Karlsruhe}

%% ------------
%% | Todos    |
%% ------------

\newcommand{\includelistoftodos}{}
\renewcommand{\includelistoftodos}{\ifIPRthesis@final \else \newpage \listoftodos \newpage \fi}

\newcommand{\includedeclaration}{}
\ifIPRthesis@techreport
  \thispagestyle{empty}
  \pagebreak
\else
    \renewcommand{\includedeclaration}{\input{Content/0-Declaration.tex}\blankpage}
\fi

%% ------------
%% | Abstract |
%% ------------
\newcommand{\includeabstract}{}

\ifIPRthesis@techreport
  \newcommand{\Abstract}[1]{\chapter*{\iflanguage{ngerman}{\abstractname}{Executive Summary}} #1 \vspace{0.7cm}
    \textbf{\iflanguage{ngerman}{Stichw\"orter}{Keywords}:} \emph{\thekeywords}}
  \renewcommand{\includeabstract}{
  \iflanguage{ngerman}{
    \include{Content/0-Abstract_DE}
  }{
    \include{Content/0-Abstract_EN}
  }
  }
\fi

\ifIPRthesis@thesis

  \newcommand{\theAbstract}{}
  \newcommand{\abstract}{}
  \newcommand{\Abstract}{}

  \renewcommand{\includeabstract}{
  \iflanguage{ngerman}{
    % include German and English abstracts
    \renewcommand{\abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname} ##1}}
    \renewcommand{\Abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname}\addcontentsline{toc}{chapter}{\abstractname} {\Large\changefont{phv}{b}{n}\centering{\thetitle}\\\vspace{0.7cm}} ##1}}
    \include{Content/0-Abstract_DE}
    \theAbstract
    \vspace{0.7cm}
    \textbf{Stickw\"orter:} \emph{\thekeywords}

    \begin{otherlanguage}{english}
      \renewcommand{\abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname} ##1}}
      \renewcommand{\Abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname}\addcontentsline{toc}{chapter}{\abstractname} {\Large\changefont{phv}{b}{n}\centering{\thetitleotherlanguage}\\\vspace{0.7cm}} ##1}}
      \include{Content/0-Abstract_EN}
      \theAbstract
      \vspace{0.7cm}
      \textbf{Keywords:} \emph{\thekeywordsotherlanguge}
    \end{otherlanguage}
  }{
    % include English and German abstracts
    \renewcommand{\abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname} ##1}}
    \renewcommand{\Abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname}\addcontentsline{toc}{chapter}{\abstractname} {\Large\changefont{phv}{b}{n}\centering{\thetitle}\\\vspace{0.7cm}} ##1}}
    \include{Content/0-Abstract_EN}
      \theAbstract
      \vspace{0.7cm}
      \textbf{Keywords:} \emph{\thekeywords}
    \begin{otherlanguage}{ngerman}
      \renewcommand{\abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname} ##1}}
      \renewcommand{\Abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname}\addcontentsline{toc}{chapter}{\abstractname} {\Large\changefont{phv}{b}{n}\centering{\thetitleotherlanguage}\\\vspace{0.7cm}} ##1}}
      \include{Content/0-Abstract_DE}
      \theAbstract
      \vspace{0.7cm}
      \textbf{Stickw\"orter:} \emph{\thekeywordsotherlanguge}
    \end{otherlanguage}
  }
  }
\fi

%% --------------------
%% | Acknowledgements |
%% --------------------

\newcommand{\includeacknowledgments}{}
\ifIPRthesis@thesis
  \renewcommand{\includeacknowledgments}{\newpage\thispagestyle{empty}\vspace*{\fill}\begin{center}\emph{\input{Content/0-Acknowledgments.tex}}\end{center}\vspace*{\fill}}
\else
  \thispagestyle{empty}
  \pagebreak
\fi

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
  }
\fi

\newcommand{\setmainpart}{
  \blankpage
  \setcounter{page}{1}
  \pagenumbering{arabic}
}

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
%% | Bibliography              |
%% -----------------------------


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


%% **** END OF CLASS ****
