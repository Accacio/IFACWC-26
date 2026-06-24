\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{conf}[20240423 v0.1]

\RequirePackage{graphicx}
\RequirePackage{calc}
\graphicspath{{fig/}{img/}{./../img/}}

\RequirePackage{tikz}
\usetikzlibrary{babel}

\RequirePackage{lipsum}
\usetikzlibrary{decorations.text}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{bending}
\usetikzlibrary{positioning,hobby,calc,arrows,overlay-beamer-styles}
\usetikzlibrary{shapes.geometric, arrows}
\usetikzlibrary{hobby,arrows,overlay-beamer-styles}
\usetikzlibrary{spy,shadows,shapes.symbols,shapes.geometric}
\usetikzlibrary{decorations.pathreplacing}
\usetikzlibrary{mindmap}

\def\tikz@lib@spy@parse@opt[#1]{%
    \let\tikz@spy@next=\tikz@lib@spy@parse@opta%
    \ifnum\the\catcode`\;=\active\relax
     \let\tikz@spy@next=\tikz@lib@spy@parse@opta@activesemicolon
    \fi
  \pgfutil@ifnextchar x{\tikz@spy@next[#1]}{\tikz@spy@next[#1]}%]
}
{
\catcode`\;=\active
\gdef\tikz@lib@spy@parse@opta@activesemicolon[#1]on#2in node#3;{%
  \pgfutil@g@addto@macro\tikz@lib@spy@collection{\tikz@lib@spy@do{#1}{#2}{#3}}%
}
}

\LoadClass[aspectratio=169]{beamer}
%\LoadClass[]{beamer}

\definecolor{auditionWhite}{RGB}{255, 255, 255}
\definecolor{auditionPrimary}{RGB}{120,30,56}
\definecolor{auditionBlack}{RGB}{0, 0, 0}
\definecolor{auditionGray}{RGB}{231, 230, 230}

\definecolor{auditionPrimary}{RGB}{1, 63, 103}
% \definecolor{auditionPrimary}{RGB}{25, 136, 189}

\definecolor{polytech_dark_blue}{RGB}{1, 63, 103}
\definecolor{polytech_bright_blue}{RGB}{25, 136, 189}

\mode<presentation>
{
  \useoutertheme{split}
  \setbeamertemplate{navigation symbols}{}
%
 % \usecolortheme{whale}
%  \usecolortheme{orchid}
%  \setbeamerfont{block title}{size={}}
%
%  \useoutertheme{split}
%  \useinnertheme{circles}
  \usefonttheme[onlymath]{serif}
%

  \setbeamercolor{alert}{bg=auditionPrimary}
  \setbeamercolor{palette primary}{bg=auditionPrimary,fg=auditionBlack}
  \setbeamercolor{palette secondary}{bg=auditionBlack}
  \setbeamercolor{palette tertiary}{bg=auditionGray}
  \setbeamertemplate{blocks}[rounded][shadow=true]
  
\setbeamerfont{title}{series=\bfseries,size=\large}
\setbeamerfont{subtitle}{series=\mdseries,size=\normalsize}
\setbeamerfont{block title}{series=\bfseries,size=\normalsize}
\setbeamerfont{author}{series=\mdseries,size=\normalsize}
\setbeamercolor{title}{fg=white}
\setbeamercolor{author}{fg=white}
\setbeamercolor{block title}{fg=auditionPrimary,bg=auditionPrimary!10}
\setbeamercolor{block body}{fg=auditionBlack,bg=auditionPrimary!5}
\setbeamercolor{item}{fg=auditionPrimary}
\setbeamercolor{caption name}{fg=auditionPrimary}
\setbeamercolor{section in toc}{fg=auditionPrimary}
\setbeamerfont{section in toc}{series=\bfseries}

\newcommand{\conferenceLogo}[1]{\gdef\insertconferencelogo{#1}}
\newcommand{\conferenceLogoback}[1]{\gdef\insertconferencelogoback{#1}}
\conferenceLogo{}
\conferenceLogoback{none}

\renewcommand{\titlepage}[1][banque/Image18.jpg]{\gdef\inserttitlepagefig{#1}\usebeamertemplate*{title page}}

\usetikzlibrary{fit}
\tikzset{
  fitting node/.style={
    inner sep=0pt,
    fill=none,
    draw=none,
    reset transform,
    fit={(\pgf@pathminx,\pgf@pathminy) (\pgf@pathmaxx,\pgf@pathmaxy)}
  },
  reset transform/.code={\pgftransformreset}
}

\setbeamertemplate{title page}
{
  \begin{tikzpicture}[overlay,remember picture,inner sep=0,outer sep=0]
		% \node[anchor=north east] at (current page.north east) {%\includegraphics[width=.45\textwidth]{bgs/bg2.jpg}
    % };
        \draw[anchor=north west,white] (current page.north west) rectangle +(.01\paperwidth,-.01\paperwidth) node[fitting node] (rect) {} node[midway] (audition_center) {} node[] (point) {};
        \node[] at (audition_center) {
          % \includegraphics[width=.25\textwidth]{logos/audition_full.png}
        };
        \draw[fill,auditionPrimary] (point) rectangle ($(current page.south east)+(-0.01\paperwidth,1)$) node[fitting node] (big_orange) {};

  %       \begin{scope}
  %         \clip (point) rectangle (current page.south west);
  %         \ifx\inserttitlepagefig\@empty%
  %           \draw (point) rectangle (current page.south west)  node[midway] (title_figure) {\includegraphics[height=\paperheight]{banque/Image18.jpg}};
  %         \else
  %           \draw (point) rectangle (current page.south west)  node[midway] (title_figure) {\includegraphics[height=\paperheight]{\inserttitlepagefig}};
  %         \fi%%

  %       \end{scope}
        \draw[fill,auditionBlack] ($(point|-current page.south east) + (0,1)$) rectangle ($(current page.south east) + (-0.01\paperwidth,+0.01\paperwidth) $) node[midway] (center_black_target) {};

        \node[anchor=north east,inner sep = 0.5cm] at ($(current page.north east)$) {\includegraphics[height=.8cm]{logos/uangers.png}};

        \ifx\insertconferencelogo\@empty%
        \else
          \node[anchor=south east,yshift=.25cm,xshift=-.25cm,fill=\insertconferencelogoback,inner sep=.1cm] (conference_logo) at (big_orange.south east) {\includegraphics[height=1.5cm]{\insertconferencelogo}};
        \fi%%

        % \ifx\insertinstitute\@empty%
        % \else
        %   % \insertinstitute
        %   \node (institute) at ($(author)+(0,-1.5)$) {} node[anchor=north west, align=left,font=\color{white}] at (institute) {\insertinstitute};
        % \fi%%

        % \node (date) at ($(author)+(0,-2.75)$) {} node[anchor=north west,align=left,font=\color{white}\usebeamerfont{date}] at (date) {\insertdate};
    \end{tikzpicture}

    \vskip-.1cm
    \begin{minipage}[t]{.8\linewidth}
      \usebeamerfont{title}\usebeamercolor[fg]{title}\inserttitle
    \end{minipage}

    \vskip.7cm
    \usebeamercolor[fg]{author}\insertauthor

    \ifx\insertinstitute\@empty%
    \else
    \vskip.7cm
      \usebeamerfont{institute}\insertinstitute
    \fi%%

    \vskip0pt plus 1fill
    \usebeamerfont{date}\insertdate
    \vskip0pt plus 1fill
}

\setbeamertemplate{section in toc}
{\leavevmode\leftskip=0ex%
  \inserttocsectionnumber. \inserttocsection\par%
}

\setbeamertemplate{subsection in toc}
{\leavevmode\leftskip=2ex%
  \@Alph\inserttocsubsectionnumber. \inserttocsubsection\par%
}

\setbeamertemplate{headline}
{
}

\setbeamercolor{button}{bg=auditionPrimary}
\setbeamerfont{frametitle}{series=\bfseries,size=\LARGE}
\setbeamerfont{framesubtitle}{series=\mdseries,size=\normalsize}
\setbeamercolor{frametitle}{fg=auditionPrimary}
\setbeamertemplate{frametitle}
{
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]
    \node[anchor=north west]  at ($(current page.north west)+(.5,-.5)$) {\usebeamerfont*{frametitle}\insertframetitle} node (frametitle){};
    % \usebeamerfont*{frametitle}\insertframetitle%
    \ifx\insertframesubtitle\@empty%
    \else
    \node[anchor=north west] at ($(frametitle)+(0,-.75)$) {\usebeamerfont*{framesubtitle}\insertframesubtitle};
      % \par{\usebeamerfont*{framesubtitle}{\usebeamercolor[fg]{framesubtitle}\insertframesubtitle}\strut\par}%
    \fi%%
  \end{tikzpicture}
  \ifx\insertframesubtitle\@empty%
    \vspace{-1em}
  \else%
    \vspace{1em}
  \fi
}

\expandafter\let\csname beamer@@tmpop@background@default\endcsname\relax
\defbeamertemplate{background}{default}{%
  % \begin{tikzpicture}[overlay,remember picture,inner sep=0]
	% 	\node[anchor=north east] at (current page.north east) {\includegraphics[width=.45\textwidth]{bgs/bg1.jpg}};
  %   \end{tikzpicture}
}
% \AfterEndEnvironment{frame}{%
%   \setbeamertemplate{background}[default]%
% }


\defbeamertemplate{background}{vertical_watermark}{%
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]
		\node[anchor=north east] at (current page.north east) {\includegraphics[height=.7\paperheight]{bgs/bg3.jpg}};
    \end{tikzpicture}
}
\defbeamertemplate{background}{alternate_watermark}{%
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]
		\node[anchor=north east] at (current page.north east) {\includegraphics[width=.45\textwidth]{bgs/bg2.jpg}};
    \end{tikzpicture}
}
\defbeamertemplate{background}{big_image_right}[1]
{%
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]
    % \clip (current page.north east) rectangle ($(current page.south east) +(0,0)$);
    \def\size{.35\paperwidth}
    \clip (current page.north east) rectangle ($(current page.south east) +(-\size,0)$);
    \node[yshift=.5ex] at ($(current page.east) +(-0.5*\size,0)$) {\includegraphics[height=\paperheight-1.5ex]{#1}};
  \end{tikzpicture}
}

\define@key{beamerframe}{default}[true]{%
  \setbeamertemplate{background}[default]%
  \setbeamertemplate{footline}[default]%
}
\define@key{beamerframe}{vertical_watermark}[true]{%
  \setbeamertemplate{background}[vertical_watermark]%
  \setbeamertemplate{footline}[default]%
}
\define@key{beamerframe}{alternate_watermark}[true]{%
  \setbeamertemplate{background}[alternate_watermark]%
  \setbeamertemplate{footline}[default]%
}
\define@key{beamerframe}{big_image_right}[true]{%
  \setbeamertemplate{background}[big_image_right]{#1}%
  \setbeamertemplate{footline}[big_image_right]
}

\setbeamertemplate{background}[default]
% \setbeamertemplate{background}[vertical_watermark]

\def\endpage{\usebeamertemplate*{end page}}

\setbeamertemplate{end page}
{
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]

        % \draw[anchor=north west,fill,auditionPrimary] (current page.north west) rectangle ++(0.3\paperwidth,-2.) node[midway] (audition_center) {} node (point) {};
        % \node[] at (audition_center) {\includegraphics[width=.25\textwidth]{logos/audition_full.png}};
        \draw[fill,auditionPrimary] (current page.north west) rectangle (current page.south east);

        \draw[fill,auditionBlack] ($(current page.north west) + (0,-1.5)$) rectangle (current page.north east) node[midway] (center_black_target) {};
        \node[anchor=east,inner sep=.2cm] (ua_logo) at (center_black_target-|current page.south east) {\includegraphics[height=0.8cm]{logos/uangers.png}};

        % \node[anchor=south east] (audition_logo) at ($(current page.south east) +(-0.5,0.5)$) {\includegraphics[height=0.5cm]{logos/audition.png}} ;

        \node[anchor=south west,align=left,font=\color{auditionWhite}\mdseries\scriptsize] at ($(current page.south west) +(0.5,0.5)$) { UNIVERSITÉ D'ANGERS\\40, rue de Rennes - BP 73532\\ 49035 - ANGERS cedex 01\\~\\ +33 (0)2 41 96 23 23\\webmaster at univ-angers.fr} node (UA_adress) {};

        \ifx\insertconferencelogo\@empty%
        \else
          \node[left=.5cm of audition_logo] (conference_logo) {\includegraphics[height=1.3cm]{\insertconferencelogo}};
        \fi%%

        \node[anchor=west] (audition_link) at ($(center_black_target-|current page.south west) + (0.5,0)$) {\usebeamercolor[bg]{auditionWhite}\url{https://laris.univ-angers.fr/}};


    \end{tikzpicture}
}


%  % \setbeamercolor{block title}{bg=red!50!black!70}
%  \setbeamercolor{block title}{bg=auditionBlack}
%  \setbeamercolor{block title example}{bg=gray!90!black!90}
%  \setbeamercolor{block title example}{bg=gray!90!black!90}
%
%  \setbeamercolor{block title example}{bg=supelecPurple!90}
%  \setbeamercolor{block title example}{bg=supelecPurple!90}
%  \setbeamercolor{palette quaternary}{bg=supelecPurple!90}
%
%  % \setbeamercolor{item}{fg=red!50!black!80}
%  \setbeamercolor{item}{fg=auditionBlack}
%  \setbeamercolor{section in toc}{fg=red!50!black!80}
%  % \setbeamercolor{frametitle}{fg=auditionBlack!90,bg=white}
%  \setbeamercolor{framesubtitle}{fg=white,bg=ietrbrightRed!90}
%  \setbeamercolor{framesubtitle}{fg=auditionBlack,bg=ietrRed!10}
%  % \setbeamercolor{framesubtitle}{fg=auditionBlack,bg=auditionBlack!10}
%
%  % \setbeamercolor{section in head}{bg=auditionBlack!20}
%
%  % \setbeamercolor{bibliography entry author}{fg=red!50!black!80}
%  \setbeamercolor{bibliography entry author}{fg=auditionBlack}
%  % \setbeamercolor{bibliography entry location}{fg=red!50!black!40}
%  \setbeamercolor{bibliography entry location}{fg=auditionBlack!70}
%
%  \setbeamercolor{button}{bg=auditionBlack}
%  % \setbeamercolor{author in head/foot}{bg=grey!60}
%  % \setbeamercovered{transparent}

%  \makeatletter
%  \protected\def\protectedempty{}
\setbeamertemplate{page number in head/foot}[appendixframenumber]
%
\expandafter\let\csname beamer@@tmpop@footline@default\endcsname\relax
\defbeamertemplate{footline}{default}
{
  \leavevmode%
  \hbox{
    \begin{beamercolorbox}[wd=.5\paperwidth,ht=2.25ex,dp=1.125ex,leftskip=.3cm,rightskip=.3cm plus1fil]{author in head/foot}%
    \end{beamercolorbox}
  }%
  \vskip0pt%
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]
    % \node[anchor=south east] (audition_logo) at ($(current page.south east) +(-0.5,0.5)$) {\includegraphics[height=0.5cm]{logos/audition_orange.png}} ;

    \node[font=\color{auditionPrimary}] (audition_logo) at ($(0,0) +(0.5,0.5)$) {\insertframenumber/\inserttotalframenumberbypart} ;
    \draw[fill=auditionPrimary,auditionPrimary] (current page.south west) rectangle ($(current page.south east) + (0,2.25ex)$);

    \ifx\inserttotalframenumberbypart\empty
    \else
    \ifnum\inserttotalframenumberbypart=0
    \else
      \draw[fill=auditionBlack] ($(-1\paperwidth/\inserttotalframenumberbypart+\paperwidth*\insertframenumber/\inserttotalframenumberbypart,0.0)$) rectangle +(\paperwidth/\inserttotalframenumberbypart,2.25ex);
    \fi
    \fi
  \end{tikzpicture}

 }

\defbeamertemplate{footline}{big_image_right}
{%
  \leavevmode%
  \hbox{
    \begin{beamercolorbox}[wd=.5\paperwidth,ht=2.25ex,dp=1.125ex,leftskip=.3cm,rightskip=.3cm plus1fil]{author in head/foot}%
    \end{beamercolorbox}
  }%
  \vskip0pt%
  \begin{tikzpicture}[overlay,remember picture,inner sep=0]
    % \node[anchor=south east] (audition_logo) at ($(current page.south east) +(-0.5,0.5)$) {\includegraphics[height=0.5cm]{logos/audition_orange.png}} ;

    \node[font=\color{auditionPrimary}] (audition_logo) at ($(0,0) +(0.5,0.5)$) {\insertframenumber/\inserttotalframenumberbypart} ;
    \draw[fill=auditionPrimary,auditionPrimary] (current page.south west) rectangle ($(current page.south east) + (0,2.25ex)$);

    \ifx\inserttotalframenumberbypart\empty
    \else
    \ifnum\inserttotalframenumberbypart=0
    \else
      \draw[fill=auditionBlack] ($(-1\paperwidth/\inserttotalframenumberbypart+\paperwidth*\insertframenumber/\inserttotalframenumberbypart,0.0)$) rectangle +(\paperwidth/\inserttotalframenumberbypart,2.25ex);
    \fi
    \fi
  \end{tikzpicture}
}

 \setbeamertemplate{background}[default]
\setbeamertemplate{footline}[default]

%
%  \setbeamertemplate{note page}{
%    \vfill
%    \insertnote
%    \vfill
%  }
%
%  \setbeamersize{text margin right=1.5cm}
%  \setbeamersize{text margin left=1.5cm}
%
%  \setbeamertemplate{sidebar right}{
%    % \vskip1.3cm%
%    % \llap{\tikz{\draw[fill=black] (.75,0) circle [radius=.75cm]}\hskip0.2cm}%
%    \vfill%
%    \llap{\insertlogo\hskip0.2cm}%
%    \vskip3pt%
%  }
%  \setbeamertemplate{sidebar left}{
%    \vfill%
%    \ifwebcast{\hspace{3pt}\tikz{\draw[fill=pink,draw=pink] (.6,0) circle [radius=.6cm]}}%
%    \else%
%    % \hspace{3pt}\tikz{\draw[fill=white,draw=white] (.6,0) circle [radius=.6cm]}%
%    \fi
%    \vskip3pt%
%  }
%
%  \setbeamertemplate{headline}
%  {%
%    % \leavevmode%
%    \ifx\secname{}\@empty%
%    \else%
%    \hbox{%
%      \begin{beamercolorbox}[wd=.5\paperwidth,ht=2.25ex,dp=1ex,center]{section in head/foot}%
%        \centering
%        \usebeamerfont{author in head/foot}\strut\insertsectionhead\strut\par%
%      \end{beamercolorbox}%
%      \begin{beamercolorbox}[wd=.5\paperwidth,ht=2.25ex,dp=1ex,right]{subsection in head/foot}%
%        \centering
%        \insertsubsection{}
%      \end{beamercolorbox}%
%    }
%    \fi
%    \vskip0pt%
%  }
%
%  \setbeamertemplate{caption}[numbered]
%  % or whatever (possibly just delete it)
}
%\mode
%<all>



\newcommand{\tikzmark}[1]{\tikz[baseline={(#1.base)},overlay,remember picture] \node[outer sep=0pt, inner sep=0pt] (#1) {\phantom{A}};}
\newcommand{\tikzmarktext}[2]{\tikz[baseline={(#1.base)},remember picture] \node[inner sep=1.5pt,outer sep=0pt] (#1) {#2};}

\usepackage{chngcntr}

\counterwithin{framenumber}{part}% Number frames within \section

\let\oldpart\part
\renewcommand{\part}{% Store current \section's frame count
  \immediate\write\@auxout{\global\noexpand\@namedef{s@totalpartframes-\arabic{part}}{\arabic{framenumber}}}%
  \oldpart
}
\AtEndDocument{% Store final \section's frame count
  \immediate\write\@auxout{\global\noexpand\@namedef{s@totalpartframes-\arabic{part}}{\arabic{framenumber}}}%
}
\newcommand{\inserttotalframenumberbypart}{\csname s@totalpartframes-\arabic{part}\endcsname}%
