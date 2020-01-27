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
%% Version: 0.3 (22.02.2018)


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{KITthesis}


\newif\ifKITthesis@german
\newif\ifKITthesis@seminar
\newif\ifKITthesis@studien
\newif\ifKITthesis@bachelor
\newif\ifKITthesis@master
\newif\ifKITthesis@phd
\newif\ifKITthesis@thesis
\newif\ifKITthesis@techreport
\newif\ifKITthesis@final
\newif\ifKITthesis@declaration

\DeclareOption{german}{\KITthesis@germantrue}
\DeclareOption{ngerman}{\KITthesis@germantrue}

\DeclareOption{seminar}{\KITthesis@seminartrue}
\DeclareOption{studien}{\KITthesis@studientrue \KITthesis@thesistrue}
\DeclareOption{bachelor}{\KITthesis@bachelortrue \KITthesis@thesistrue}
\DeclareOption{master}{\KITthesis@mastertrue \KITthesis@thesistrue}
\DeclareOption{phd}{\KITthesis@phdtrue \KITthesis@thesistrue}
\DeclareOption{techreport}{\KITthesis@techreporttrue}
\DeclareOption{final}{\KITthesis@finaltrue}
\DeclareOption{declaration}{\KITthesis@declarationtrue}

\ProcessOptions\relax

\newcommand{\thesistype}{}
\ifKITthesis@studien
  \renewcommand{\thesistype}{\iflanguage{ngerman}{Studienarbeit}{Student Research Project}}
\fi
\ifKITthesis@bachelor
  \renewcommand{\thesistype}{\iflanguage{ngerman}{Bachelorarbeit}{Bachelor Thesis}}
\fi
\ifKITthesis@master
  \renewcommand{\thesistype}{\iflanguage{ngerman}{Masterarbeit}{Master Thesis}}
\fi
\ifKITthesis@phd
  \renewcommand{\thesistype}{\iflanguage{ngerman}{Doktorarbeit}{PhD Thesis}}
\fi

%% ----------------------------------
%% |          Paper class           |
%% ----------------------------------
%% ---------------------------------------------------------------
%% | Based on KOMAscript by Markus Kohm http://www.komascript.de |
%% ---------------------------------------------------------------
\ifKITthesis@german
  % English is also needed in German thesis for the abstract
  \usepackage[main=ngerman,english]{babel}
\else
  % German is also needed in English thesis for the abstract
  \usepackage[main=english,ngerman]{babel}
\fi

\ifKITthesis@seminar
  \LoadClass[11pt,a4paper,titlepage]{scrartcl}
\fi
\ifKITthesis@techreport
  \LoadClass[12pt,a4paper,titlepage]{scrartcl}
\fi
\ifKITthesis@thesis
  % TODO: Use bibtotoc option?
  \ifKITthesis@declaration
    \LoadClass[12pt,twoside,headsepline,a4paper,titlepage=firstiscover,DIV=15,BCOR=20mm]{scrbook}
	\renewcommand*{\coverpagetopmargin}{48mm}
% 	\renewcommand*{\coverpageleftmargin}{0mm}
	\renewcommand*{\coverpagerightmargin}{0mm}
	\renewcommand*{\coverpagebottommargin}{-10mm}
  \else
	\LoadClass[12pt,twoside,headsepline,a4paper,titlepage,DIV=15,BCOR=20mm]{scrbook}
  \fi
\fi


%% -----------------------
%% | Headers and footers |
%% -----------------------
\RequirePackage[automark,headsepline]{scrlayer-scrpage}

\clubpenalty=10000 %prevent orphans
\widowpenalty=10000 %prvent widows

\ifKITthesis@seminar
  \lohead{\headmark}
  \chead{}
  \pagestyle{scrheadings}
\fi
\ifKITthesis@techreport
  \lohead{\headmark}
  \chead{}
  \pagestyle{scrheadings}

  \KITthesis@declarationfalse
\fi

%% ----------------------------------------
%% |         Setup of the document        |
%% ----------------------------------------
\input{KIT_document_setup}

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
% TODO: Optimize this if needed
\ifKITthesis@techreport
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
% Chapter should be section in seminars and tech reports
\ifKITthesis@seminar
  \newcommand{\chapter}{\section}
\fi
\ifKITthesis@techreport
  \newcommand{\chapter}{\section}
\fi
% Part is only enables if phd thesis
\ifKITthesis@phd
\else
  \renewcommand{\part}[1]{}
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
\newcommand{\theinstitutelogo}{\iflanguage{ngerman}{KIT-Departments/IPRLogo_de}{KIT-Departments/IPRLogo_en}}
\newcommand{\institutelogo}[1]{\renewcommand{\theinstitutelogo}{#1}}
\newcommand{\printinstitutelogo}{\includegraphics[width=5cm,height=1.8cm,keepaspectratio]{Logos/\theinstitutelogo}}
\newcommand{\noinstitutelogo}{\renewcommand{\printinstitutelogo}{}}
\newcommand{\thegrouplogo}{KIT-Departments/iirob.png}
\newcommand{\grouplogo}[1]{\renewcommand{\thegrouplogo}{#1}}
\newcommand{\printgrouplogo}{~\\  \hspace*{\fill} \includegraphics[width=3cm,height=1.8cm,keepaspectratio]{Logos/\thegrouplogo}}
\newcommand{\nogrouplogo}{\renewcommand{\printgrouplogo}{}}

\ifKITthesis@seminar
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
\printinstitutelogo     \ifKITthesis@declaration \else \\ \fi
\printgrouplogo

\begin{textblock}{10}[0,0](3.5,16.8)
  \tiny{
	\iflanguage{ngerman}
		{KIT -- Die Forschungsuniversit\"at in der Helmholtz-Gemeinschaft}
		{KIT -- The Research University in the Helmholtz Association}
  }
\end{textblock}
\begin{textblock}{10}[0,0](15,16.75)
  \large{
	\textbf{www.kit.edu}
  }
\end{textblock}

\newcommand{\titlepreamble}{}
\ifKITthesis@seminar
  \renewcommand{\titlepreamble}{Seminar \thethesistype}
\fi
\ifKITthesis@techreport
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

\ifKITthesis@techreport
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
   {Institute for Anthropomatics and Robotics (IAR) -\\ Intelligent Process Automation and Robotics Lab (IPR)}
  }
\newcommand{\institute}[1]{\renewcommand{\theinstitute}{#1}}

\newcommand{\theinstitutefaculty}{
  \iflanguage{ngerman}
   {KIT-Fakult\"at f\"ur Informatik}
   {KIT Department of Informatics}
  }
\newcommand{\KITfaculty}[1]{\renewcommand{\theinstitutefaculty}{#1}}

\newcommand{\theinstituteaddress}{
  Engler-Bunte-Ring 8
  }
\newcommand{\instituteaddress}[1]{\renewcommand{\theinstituteaddress}{#1}}

\newcommand{\theinstitutecity}{
  76131 Karlsruhe
  }
\newcommand{\institutecity}[1]{\renewcommand{\theinstitutecity}{#1}}

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

\newcommand{\theaddress}[1]{}
\newcommand{\address}[1]{\renewcommand{\theaddress}{#1}}
\newcommand{\thecity}[1]{}
\newcommand{\city}[1]{\renewcommand{\thecity}{#1}}
\newcommand{\theemail}[1]{}
\newcommand{\email}[1]{\renewcommand{\theemail}{#1}}

\newcommand{\thetitleotherlanguage}{}
\newcommand{\titleotherlanguage}[1]{\renewcommand{\thetitleotherlanguage}{#1}}
\newcommand{\thekeywords}{}
\newcommand{\keywords}[1]{\renewcommand{\thekeywords}{#1}}
\newcommand{\thekeywordsotherlanguge}{}
\newcommand{\keywordsotherlanguge}[1]{\renewcommand{\thekeywordsotherlanguge}{#1}}

%% Thesis type handling
\newcommand{\thethesistype}{}
\ifKITthesis@seminar
  \newcommand{\studyprogram}[1]{
      \subtitle{\vspace*{1cm}  \Large{\iflanguage{ngerman}{Seminararbeit von}{Seminar work of}}
      }
      \renewcommand{\thethesistype}{#1}
  }
\fi
\ifKITthesis@thesis
%   \newcommand{\studyprogram}[1]{\subtitle{\vspace*{1.5cm} \iflanguage{ngerman}{\thesistype\\ im Studiengang #1\\von}{\thesistype\\ in #1\\of}}
  \newcommand{\studyprogram}[1]{\subtitle{\vspace*{1cm} \iflanguage{ngerman}{\thesistype\\ ~\\von}{\thesistype\\ ~\\of}}
  \renewcommand{\thethesistype}{#1}}
\fi
\ifKITthesis@techreport
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
    \ifKITthesis@seminar
      \Large
    \else
      \large
    \fi
    \iflanguage{ngerman}{An der Fakult\"at f\"ur Informatik}{At the Department of Computer Science}
    \\
    \theinstitute

    \ifKITthesis@declaration \vspace*{1cm} \else \vspace*{2cm} \fi

    \begin{tabular}{l c l}
      \ifKITthesis@seminar
		\iflanguage{ngerman}{Betreuender Mitarbeiter}{Advisor}: & \hfill & \theadvisorone \\
      \fi
      \ifKITthesis@techreport
		\ifthenelse{\equal{\thereviewertwo}{}}{
	  \iflanguage{ngerman}{Gutachter}{Reviewer}: & \hfill  & \thereviewerone \\
	}{
	  \iflanguage{ngerman}{Erstgutachter}{First reviewer}: & \hfill & \thereviewerone \\
	  { }\iflanguage{ngerman}{Zweitgutachter}{Second reviewer}: & \hfill & \thereviewertwo \\
	}
      \fi
      \ifKITthesis@thesis
	\ifthenelse{\equal{\thereviewertwo}{}}{
	  \iflanguage{ngerman}{Gutachter}{Reviewer}: & \hfill  & \thereviewerone \\
	}{
	  \iflanguage{ngerman}{Erstgutachter}{First reviewer}: & \hfill & \thereviewerone \\
	  { }\iflanguage{ngerman}{Zweitgutachter}{Second reviewer}: & \hfill & \thereviewertwo \\
	}
	\ifKITthesis@phd
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

	\ifKITthesis@declaration \vspace{1cm} \else \vspace{4cm} \fi
    \normalsize{
      \ifKITthesis@techreport
	\today
      \else
	\theeditstart{} -- \theeditend
      \fi
    }
    }
\ifKITthesis@declaration
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
	\vspace{1.2cm}

	\dotfill\hspace*{8.0cm}\\
	\hspace*{2.0cm}(\textbf{\theauthor}) %center name with hspace
	}
	\end{minipage}
\fi
  }
  \pagenumbering{roman}
}

\uppertitleback{\theinstitute \\ \theinstitutefaculty \\ \iflanguage{ngerman}{Karlsruher Institut f\"ur Technologie}{Karlsruhe Institute of Technology}\\ \theinstituteaddress \\ \theinstitutecity }
\ifKITthesis@techreport
\else
  \lowertitleback{\theauthor \\ \theaddress \\ \thecity \\ \theemail}
\fi
\newcommand{\includetitle}{\maketitle \ifKITthesis@declaration \stop \fi}

%% ------------
%% | Todos    |
%% ------------

\newcommand{\includelistoftodos}{}
\renewcommand{\includelistoftodos}{\ifKITthesis@final \else \newpage \listoftodos \newpage \fi}

\newcommand{\includedeclaration}{}
\ifKITthesis@techreport
  \thispagestyle{empty}
  \pagebreak
\else
    \renewcommand{\includedeclaration}{\input{Content/0-Declaration.tex}\blankpage}
\fi

%% ------------
%% | Abstract |
%% ------------
\newcommand{\includeabstract}{}

\ifKITthesis@techreport
  \newcommand{\Abstract}[1]{\chapter*{\iflanguage{ngerman}{\abstractname}{Executive Summary}} #1 \vspace{0.7cm}
    \textbf{\iflanguage{ngerman}{Stichw\"orter}{Keywords}:} \emph{\thekeywords}}
  \renewcommand{\includeabstract}{
  \iflanguage{ngerman}{
    \include{Content/0-Abstract_DE}
  }{
    \include{Content/0-Abstract_EN}
  }
  }
\fi\thispagestyle{empty}

\ifKITthesis@thesis

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
    \textbf{Stichw\"orter:} \emph{\thekeywords}

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
      \textbf{Stichw\"orter:} \emph{\thekeywordsotherlanguge}
    \end{otherlanguage}
  }
  }
\fi

%% --------------------
%% | Acknowledgements |
%% --------------------

\newcommand{\includeacknowledgments}{}
\ifKITthesis@thesis
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
\ifKITthesis@seminar
  \renewcommand{\inculdetableofcontents}{
    \tableofcontents
    \pagebreak
    }
\fi
\ifKITthesis@techreport
  \renewcommand{\inculdetableofcontents}{
    \tableofcontents
    \pagebreak
    }
\fi
\ifKITthesis@thesis
  \renewcommand{\inculdetableofcontents}{
    \tableofcontents
    \blankpage
  }
\fi

\newcommand{\includeglossary}{}
\renewcommand{\includeglossary}{
    \glsaddall
    \printglossary %\addcontentsline{toc}{chapter}{\listfigurename}
}
\newcommand{\includeacronyms}{}
\renewcommand{\includeacronyms}{
    \glsaddall
    \printacronyms %\addcontentsline{toc}{chapter}{\listfigurename}
}
% TODO: Check this if its needed in the future...
\newcommand{\includeglossaries}{}
\renewcommand{\includeglossaries}{
    \glsaddall
    \printglossaries %\addcontentsline{toc}{chapter}{\listfigurename}
}
%%%
\newcommand{\inculdelistoffigures}{}
\renewcommand{\inculdelistoffigures}{
    \listoffigures \addcontentsline{toc}{chapter}{\listfigurename}
}
\newcommand{\inculdelistoftables}{}
\renewcommand{\inculdelistoftables}{
    \listoftables \addcontentsline{toc}{chapter}{\listtablename}
}
\newcommand{\inculdelistoflistings}{}
\renewcommand{\inculdelistoflistings}{
    \lstlistoflistings \addcontentsline{toc}{chapter}{\lstlistlistingname}
}
\newcommand{\inculdelistofalgoritms}{}
\renewcommand{\inculdelistofalgoritms}{
    \listofalgorithms  \addcontentsline{toc}{chapter}{\listalgorithmname}
}

\newcommand{\setmainpart}{
  \setcounter{page}{1}
  \pagenumbering{arabic}
}

%% ------------
%% | Appendix |
%% ------------
\ifKITthesis@thesis
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


\ifKITthesis@thesis
  \newcommand{\Bibliography}[1]{\addcontentsline{toc}{chapter}{\bibname} \bibliography{#1}}
\else
  \newcommand{\Bibliography}[1]{\addcontentsline{toc}{section}{\bibname} \bibliography{#1}}
\fi

% \iflanguage{ngerman}
% %   {\bibliographystyle{unsrtdin}}	% german style
%   {\bibliographystyle{IEEEtran}}
%   {\bibliographystyle{IEEEtran}}	% english style

%% Use plainnat to work nicely with natbib.
\bibliographystyle{plainnat}

% Provide support for the control entries of IEEEtran.bst V1.00 and later.
\def\bstctlcite#1{\@bsphack
  \@for\@citeb:=#1\do{%
    \edef\@citeb{\expandafter\@firstofone\@citeb}%
    \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi}%
  \@esphack}

% \usepackage[fixlanguage]{babelbib}	% sets german style for literature entries
% \selectbiblanguage{ngerman}			% for \bibliographystyle{babalpha}

%% -----------------------------
%% | My Bibliography - Entry   |
%% -----------------------------
\newcommand{\addmybibentry}{}
\ifKITthesis@thesis
  \renewcommand{\addmybibentry}{
    \newpage
    \thispagestyle{empty}
    \section*{\iflanguage{ngerman}{BibTex Eintrag für dieser Arbeit}{BibTex Entry of this Thesis}}
%     Referencing this work: \\ \\
    @mastersthesis\{\theauthor\_\theeditend, 	\\
	\tab author = \{\theauthor\},		\\
	\tab editor = \{\theadvisorone, \theadvisortwo\},	\\
	\tab ipr-thesis = \thesistype,		\\
	\tab keywords = \{\thekeywords\},		\\
	\tab location = \{Karlsruhe, Germany\},	\\
	\tab month = ,				\\
	\tab pages = ,				\\
	\tab school = \{Karlsruhe Institute of Technology\},	\\
	\tab title = \{\thetitle\},			\\
	\tab year = \{\theeditend\}			\\
    \}
  }
\fi

\newcommand{\includehowtouse}{}
\ifKITthesis@final
\else
    \renewcommand{\includehowtouse}{
        \renewcommand\thesection{\arabic{chapter}}%
        \include{Content/0-How-to-Use}
    }
\fi


%% **** END OF CLASS ****
