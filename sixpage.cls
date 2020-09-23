%! Class = CLASS_NAME
%! Author = liuzheng
%! Date = 2020/9/21

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{sixpage}[liuzheng's Document Class]
\LoadClass[10.5pt,twoside,a4paper]{article}


\RequirePackage{float}
\RequirePackage[iso,german]{isodate}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% lineno settings
%% 前置行号设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath}
\RequirePackage[mathlines]{lineno}
\RequirePackage{etoolbox} %% &lt;- for \pretocmd, \apptocmd and \patchcmd
\newcommand*\linenomathpatchAMS[1]{%
\expandafter\pretocmd\csname #1\endcsname {\linenomathAMS}{}{}%
\expandafter\pretocmd\csname #1*\endcsname{\linenomathAMS}{}{}%
\expandafter\apptocmd\csname end#1\endcsname {\endlinenomath}{}{}%
\expandafter\apptocmd\csname end#1*\endcsname{\endlinenomath}{}{}%
}

%% Definition of \linenomathAMS depends on whether the mathlines option is provided
\expandafter\ifx\linenomath\linenomathWithnumbers
\let\linenomathAMS\linenomathWithnumbers
%% The following line gets rid of an extra line numbers at the bottom:
\patchcmd\linenomathAMS{\advance\postdisplaypenalty\linenopenalty}{}{}{}
\else
\let\linenomathAMS\linenomathNonumbers
\fi

% \linenomathpatch{equation} %% &lt;- unnecessary, equation is already patched
\linenomathpatchAMS{gather}
\linenomathpatchAMS{multline}
\linenomathpatchAMS{align}
\linenomathpatchAMS{alignat}
\linenomathpatchAMS{flalign}

\renewcommand\linenumberfont{\normalfont\bfseries\tiny}

\linenumbers

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% hyperref settings
%% 超链接设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
bookmarksnumbered,
colorlinks,
linkcolor={black},
citecolor={black},
urlcolor={black}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% color settings
%% 颜色设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{color}
\RequirePackage[dvipsnames,svgnames]{xcolor}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{diffstart}{named}{Grey}
\definecolor{diffincl}{named}{Green}
\definecolor{diffrem}{named}{DarkRed}
\definecolor{lightgray}{rgb}{0.95, 0.95, 0.95}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% graphicx settings
%% 图片设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
\RequirePackage{graphbox}
\RequirePackage{wrapfig}
\graphicspath{{./figs/}{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% geometry settings
%% 页面设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}
\geometry{left=2.3cm,right=2cm,bottom=2cm,top=2.3cm}
\setlength{\baselineskip}{18pt}
\RequirePackage{fancyhdr}           % 页眉页脚
\RequirePackage{lastpage}           % LastPage
\pagestyle{fancy}
\fancyhf{} % --- clear all fields
\fancyhead[RO,LE]{{\@author \hfill  \@date}}
\fancyfoot[C]{Page \thepage ~of \pageref{LastPage}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% fonts settings
%% 字体设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fontspec}
\RequirePackage[boldfont]{xeCJK}                % CJK字体宏包
\RequirePackage{ctex}
%\RequirePackage[type1]{cabin}
%\setmainfont[ExternalLocation=fonts/calibri/]{Calibri Regular.ttf}[
%Ligatures=TeX,
%BoldFont=Calibri Bold.TTF,
%ItalicFont=Calibri Italic.ttf,
%BoldItalicFont=Calibri Bold Italic.ttf] % 设定 Calibri 字体

%%% font hack
\newfontfamily\fontHackRegular[Path="fonts/Hack-v3.003-ttf/"]{Hack-Regular.ttf} % font hack Regular
\newfontfamily\fontHackBold[Path="fonts/Hack-v3.003-ttf/"]{Hack-Bold.ttf} % font hack Blod
\newfontfamily\fontHackItalic[Path="fonts/Hack-v3.003-ttf/"]{Hack-Italic.ttf} % font hack Italic
\newfontfamily\fontHackBoldItalic[Path="fonts/Hack-v3.003-ttf/"]{Hack-BoldItalic.ttf} % font hack BlodItalic


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% table settings
%% 表格设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{longtable} %跨页表格
\usepackage{caption} %解决表格标题与下方表格过近
\usepackage[mode=text]{siunitx} %实现表格中数字按小数点对齐 %mode:math(正文数字old),text(正文数字非old),主要针对表格


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% global settings
%% 以下是全局格式设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\linespread{1.2} % 行距
\RequirePackage{indentfirst}
\setlength{\parindent}{0em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% lstlisting
%% 代码样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{listings}           % 代码宏包
\RequirePackage{caption}
\DeclareCaptionFont{white}{\color{white}}
\DeclareCaptionFormat{listing}{%
\hspace*{-3.4pt}\colorbox{gray}{\parbox{\dimexpr\textwidth-2\fboxsep+6.8pt\relax}{#1#2#3}}}
\captionsetup[lstlisting]{format=listing,labelfont=white,textfont=white}

\lstset{
language=TeX,            % 设定默认语言为 TeX
keywordstyle=\color{blue},  % 关键词为蓝色
commentstyle=\color{dkgreen},       % 注释为绿色
stringstyle=\color{red},    % 字符串为红色
basicstyle=\fontHackRegular, % 基本字体的字号
breaklines=true,            % 自动将长代码行换行排版
breakatwhitespace=true,     % 断行只在空格处
extendedchars=false,        % 解决代码跨页时，章节标题页眉等汉字不显示问题
showspaces=false,           % 不显示空格
showstringspaces=true,      % 字符串中显示空格
showtabs=false,             % 不显示TAB键
tabsize=4,                  % TAB被当成4个空格
frame=l,                    % 显示边框
numbers=none,               % 显示行号
keywordstyle=\color{blue}\bfseries, % 特殊代码高亮蓝色加粗
backgroundcolor=\color{white},      % 背景色 需要 \usepackage{color}
escapeinside={(*@}{@*)},     % 添加注释，暂时离开
}
\renewcommand\lstlistingname{Code Listing}

\lstdefinestyle{diff}{
morecomment=[f][\color{diffstart}]{@},
morecomment=[f][\color{diffincl}]{+},
morecomment=[f][\color{diffrem}]{-},
morecomment=[f][\color{magenta}]{---}, % Diff header lines (must appear after +,-)
morecomment=[f][\color{magenta}]{+++},
}

\lstdefinelanguage{yaml}
{
keywords={true,false,null,y,n},
keywordstyle=\color{darkgray}\bfseries,
basicstyle=\color{black}\fontHackBold,                                 % assuming a key comes first
sensitive=false,
breaklines=true,            % 自动将长代码行换行排版
breakatwhitespace=true,     % 断行只在空格处
extendedchars=false,        % 解决代码跨页时，章节标题页眉等汉字不显示问题
showspaces=false,           % 不显示空格
showstringspaces=true,      % 字符串中显示空格
showtabs=false,             % 不显示TAB键
tabsize=4,                  % TAB被当成4个空格
frame=single,                    % 显示边框
backgroundcolor=\color{lightgray},      % 背景色 需要 \usepackage{color}
comment=[l]{\#},
morecomment=[s]{/*}{*/},
commentstyle=\color{purple}\fontHackRegular,
stringstyle=\color{blue}\fontHackRegular,
moredelim=[l][\color{orange}]{\&},
moredelim=[l][\color{magenta}]{*},
moredelim=**[il][\color{red}\fontHackRegular{:}\color{blue}\fontHackRegular]{:},   % switch to value style at :
morestring=[b]',
morestring=[b]",
literate =    {---}{{{\color{cyan}\mdseries-{-}-}}}3
{>}{{\textcolor{red}\textgreater}}1
{|}{{\textcolor{red}\textbar}}1
{\ -\ }{{\mdseries\ -\ }}3,
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% title format
%% 标题样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\subtitle}[1]{\def\thesubtitle{#1}}
\renewcommand\maketitle
{\noindent
\zihao{5}\underline{\textbf{\@title}}\\
\zihao{5}\underline{\thesubtitle}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% section format
%% 节样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{longfbox}
\titleformat{\section}{\bfseries}{}{0pt}{\colorsection}
\titlespacing{\section}{0pt}{\baselineskip}{0.3\baselineskip}
\newcommand{\colorsection}[1]{
\lfbox[
border-top-width=1pt,border-bottom-width=1pt,border-left-width=0pt,border-right-width=0pt,
padding={0pt,-4pt}]{
\colorbox{gray!30}{
\parbox{\dimexpr\textwidth-2\fboxsep}{\thesection )~~~#1}}
}}
\titleformat{\subsection}{\bfseries}{\thesubsection ) }{0pt}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% chinese format
%% 中文风格
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\imchinese}{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Chinese names
%% 中文名称
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\contentsname}{目\hspace{1em}录}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\partname}{部分}
\renewcommand{\listfigurename}{插图目录}
\renewcommand{\listtablename}{表格目录}
%\renewcommand{\bibname}{参考文献}
\renewcommand{\appendixname}{附录}
\renewcommand{\indexname}{索引}
% listings
%\renewcommand{\lstlistingname}{代码}
%\renewcommand{\lstlistlistingname}{\lstlistingname 列表}

\setlength{\parindent}{2em} % 添加首行缩进，两个字符
}
