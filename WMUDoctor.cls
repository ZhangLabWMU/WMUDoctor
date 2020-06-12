\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{WMUDoctor}[2020/06/11 V1.0 Thesis for WMUer]
\LoadClass[a4paper,UTF8,openany,oneside]{ctexbook}
\AtEndOfPackage{\input{WMU.cfg}}%很关键配置文件
%%=======论文页边距一般要求：上边距2.54cm、下边距2.54cm,左右边距3.00cm,页眉1.50cm,页脚1.75cm
\RequirePackage[top=2.54cm, bottom=2.54cm, outer=3.00cm, inner=3.00cm, headheight=1.5 cm, footskip=1.75cm, heightrounded]{geometry}
%======连续参考文献连接起来
\RequirePackage[numbers,sort&compress]{natbib}
%=======参考文献上标
\newcommand{\upcite}[1]{{\setcitestyle{square,super}\cite{#1}}}
%========尾注
\RequirePackage[perpage, bottom]{footmisc}
%========常用宏包
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{mathptmx}%Times New Roman字体
\RequirePackage{float}%控制图片位置
\RequirePackage[T1]{fontenc}
\RequirePackage{booktabs}
\RequirePackage{setspace}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{multirow}
\RequirePackage{fancyhdr}%Needed to define custom headers/footers
\RequirePackage{lastpage}%Number of pages in the document
\RequirePackage{etoolbox}
\RequirePackage[titles,subfigure]{tocloft}%控制生成的表格和图片的目录格式
\RequirePackage{titlesec}
\RequirePackage{array}
\RequirePackage{makecell}
\RequirePackage{forloop}
\RequirePackage{xstring}
\RequirePackage[unicode,psdextra]{hyperref}%Required for hyperlinks
\RequirePackage[nameinlink]{cleveref}
\RequirePackage{enumitem}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{caption}
\pagestyle{fancy}% Enables the custom headers/footers
\fancypagestyle{frontmatterstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot{} % clear all footer fields
    \fancyfoot[C]{\thepage} %
    \renewcommand{\thepage}{\Roman{page}}
}
\appto\frontmatter{\pagestyle{frontmatterstyle}}
\ProcessOptions\relax

\fancypagestyle{mainmatterstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot{} % clear all footer fields
    \fancyfoot[C]{\thepage} %
}

\appto\mainmatter{\pagestyle{mainmatterstyle}}
\appto\mainmatter{\linespread{1.3889}\selectfont}   %行距
\fancypagestyle{plain}{
    \thispagestyle{mainmatterstyle}
}
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{frontmatterstyle}}}
%=======修改章节样式
%\newcommand\prechaptername{}
%\newcommand\postchaptername{}
%=======标题样式
%\CTEXsetup[number={}]{chapter}%改变目录标题样式
\renewcommand\cftchapdotsep{0.5}%虚线间隔
\renewcommand{\cftchapafterpnum}{\vspace{6pt}}%章节间隔,节前6磅
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{1.5}
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\setlength{\cftbeforesecskip}{6pt}%章节间隔,节前6磅
\setlength{\cftbeforesubsecskip}{6pt}%章节间隔,小节节前6磅
\renewcommand\cftchapfont{\heiti\zihao{4}}
\renewcommand\cftsecfont{\songti\zihao{4}}
\renewcommand\cftsubsecfont{\songti\zihao{4}}
\renewcommand\cftchappagefont{\mdseries}
\setlength\cftbeforetoctitleskip{24pt}
\setlength\cftaftertoctitleskip{18pt}
%%%%%%%%%% 章节字体、字号和间距设置 %%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{0}%目录只显示大标题
\renewcommand\appendix{\setcounter{secnumdepth}{-2}}
%\setcounter{secnumdepth}{-3}
\setlength{\parindent}{2em}
\renewcommand{\chaptername}{}
\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}.}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.}
\titleformat{\chapter}{\centering\zihao{4}\heiti}{\chaptername}{0em}{}
\titlespacing{\chapter}{0pt}{0pt}{18pt}
\titleformat{\section}{\bf\zihao{-4}\heiti}{\thesection}{0.5em}{}
\titlespacing{\section}{0pt}{12pt}{12pt}
\titleformat{\subsection}{\zihao{-4}\heiti}{\thesubsection}{0.5em}{}
\titlespacing{\subsection}{0pt}{6pt}{6pt}
\titleformat{\subsubsection}{\zihao{-4}\heiti}{\thesubsubsection}{0.5em}{}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}
%%=======标题页信息
\newtoks\codeid%单位代码
\newtoks\studentid%学生学号
\newtoks\categoryid%分类号
\newtoks\studytype%培养类型
\newtoks\major%学科专业
\newtoks\advisor%指导老师
\newtoks\titlextra%标题多余一行时添加
\newtoks\entitle%英文标题
\newtoks\entitletra%标题多余一行时添加
\newtoks\submityear%提交年份
\newtoks\submitmonth%提交月份
%%=======标题页
%需要添加循环函数，判定多于一行的情况
\def\WMU@underline[#1]#2{%
    \underline{\hbox to #1{\hfill#2\hfill}}}
\def\WMUunderline{\@ifnextchar[\WMU@underline\underline}
\renewcommand\maketitle{%封面样式
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
%    	\resizebox{\textwidth}{!}{
	    	\begin{tabular}{llll}
	    		{\bf\heiti\zihao{4}\WMU@label@categoryid \the\categoryid} & %插入分类号 
	    		{\bf\heiti\zihao{4}\WMU@label@codeid} & {\bf\heiti\zihao{4}：} & {\bf\heiti\zihao{4} \the\codeid}\\ %插入单位代码
	    		& 
	    		{\bf\heiti\zihao{4}\WMU@label@studentid} & {\bf\heiti\zihao{4}：} & {\bf\heiti\zihao{4} \the\studentid}\\ %插入学号
	    	\end{tabular}
%    	}
    	\vspace{0.75cm}%设置垂直间距
        \includegraphics[width=12.43cm]{wmu.jpg}\\%插入温医大图标
         \vspace{0.25cm}%设置垂直间距
        {\bf\heiti\WMU@label@thesis\\}%
        \vspace{1.25cm}
        \zihao{4}
        \def\tabcolsep{6pt}
        \expandarg
        \newcounter{title_str_number}
        \vspace*{50pt}
        \begin{tabular}{rl}%标题右对齐，内容左对齐
            \bf \songti \WMU@label@titleZh%中文标题折行输出
            \forloop{title_str_number}{1}{\value{title_str_number}<6}{%整个循环不会超过6
                \StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
                    & {\StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]\WMUunderline[258pt]{\bf \heiti\fontspec{Times New Roman}\zihao{3}\mygroup}}\\[0.40cm]%
                }%
            }%
        \end{tabular}
    \begin{tabular}{rl}%标题右对齐，内容左对齐
    	{\bf \WMU@label@author} &
    	{\heiti\zihao{3} \@author}\\[0.40cm]%作者信息
    	{\bf \WMU@label@major} &
    	{\heiti\zihao{3} \the\major}\\[0.40cm]%学科专业
    	{\bf \WMU@label@studytype} &
    	{\heiti\zihao{3} \the\studytype} \\[0.40cm]%培养类型
    	{\bf \WMU@label@advisor} &
    	{\heiti\zihao{3} \the\advisor} \\[0.40cm]%指导老师
    \end{tabular}
        \par
        \vspace{70pt}
        {\bf\zihao{3}二〇 \the\submityear 年 \the\submitmonth 月}
    \end{center}
    \clearpage
}
%=======中文摘要页
\newcommand{\ZhAbstract}[2]{%
    \phantomsection
    \addcontentsline{toc}{chapter}{中文摘要}
    \begin{center}%论文中文题目
        \setlength{\parskip}{24pt}
        \begin{minipage}{0.8\textwidth}
            \linespread{1.3889}
            \centering
            \zihao{3}\heiti\bf\noindent\@title\the\titlextra%
        \end{minipage}
    \end{center}
    \setlength{\parskip}{0pt}%行间距和段间距相等
    \vspace{10pt}
    \linespread{1.27}%行距20磅
    \par \heiti\zihao{-4}{目~~~~的:}\songti\zihao{-4}
    \par \heiti\zihao{-4}{方~~~~法:}\songti\zihao{-4}
    \par \heiti\zihao{-4}{结~~~~果:}\songti\zihao{-4}
    \par \heiti\zihao{-4}{结~~~~论:}\songti\zihao{-4}
    \par \heiti\zihao{-4}{关键词：}\songti\zihao{-4}
    \newpage
}
%=======英文摘要页
\newcommand{\EnAbstract}[2]{
    \phantomsection
    \addcontentsline{toc}{chapter}{英文摘要}
    %\thispagestyle{empty}
    \begin{center}%
        \setlength{\parskip}{24pt}
        \begin{minipage}{\textwidth}
            \linespread{1}
            \selectfont
            \centering
            \bf\zihao{3}\noindent{\the\entitle\ \the\entitletra}%英文标题
        \end{minipage}
    \end{center}%
    \setlength{\parskip}{0pt}
    {
    \linespread{1.27}%行距24磅
    \vspace{11pt}
    \par \fontspec{Times New Roman}\zihao{-4}\textbf{Abstract: }\fontspec{Times New Roman}\zihao{-4} #1
    \vspace{10pt}
    \par \fontspec{Times New Roman}\zihao{-4}\textbf{Key Words: } \fontspec{Times New Roman}\zihao{-4} #2}
}
%=======空格
\newcommand\WMUspace{\phantom{永}}
%=======附录页和感谢页
\newcommand{\Appendix}{%将附录添加到目录中
    \setcounter{section}{0}
    \renewcommand{\thechapter}{A}%
	\addcontentsline{toc}{chapter}{附\qquad 录}
    \chapter*{附\WMUspace\WMUspace 录}
    \zihao{5}
}
\newcommand{\Thanks}{%将致谢添加到目录中
	\addcontentsline{toc}{chapter}{致\qquad 谢}
    \chapter*{致\WMUspace\WMUspace 谢}
    \zihao{-4}\fangsong
}
%========超链接
\hypersetup{hidelinks,breaklinks=true,bookmarksopen=false}%自动写入pdf信息
\AtBeginDocument{
    \hypersetup{
        pdftitle = {\@title},
        pdfauthor = {\@author},
        pdfsubject = {湖南师范大学本科毕业论文}
    }
}
\crefformat{equation}{#2式(#1)#3}
\crefformat{figure}{#2图#1#3}
\crefformat{table}{#2表#1#3}
%\crefformat{chapter}{#2第#1章#3}
\crefformat{section}{#2#1节#3}
\crefformat{subsection}{#2#1小节#3}
\crefformat{subsubsection}{#2#1小节#3}
%=====列表样式
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
%======英文名称改为汉字
\theorembodyfont{\rmfamily\songti}
\theoremheaderfont{\rmfamily\heiti}
\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\qedsymbol{\ensuremath{\square}}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
\crefname{theorem}{定理}{定理}
\crefname{assumption}{假设}{假设}
\crefname{definition}{定义}{定义}
\crefname{proposition}{命题}{命题}
\crefname{lemma}{引理}{引理}
\crefname{theorem}{定理}{定理}
\crefname{axiom}{公理}{公理}
\crefname{corollary}{推论}{推论}
\crefname{example}{例}{例}
\crefname{remark}{注释}{注释}
\crefname{conjecture}{猜想}{猜想}
%=======程序伪代码实现
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{\textbf{输入:}}
\renewcommand{\algorithmicensure}{\textbf{输出:}}
%=======改变图表的编号格式
\captionsetup[table]{labelsep=space}%{labelsep=quad}
\captionsetup[figure]{labelsep=space}
\renewcommand{\tablename}{表} %表题头
\renewcommand{\figurename}{图} %图题头
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}} %使图编号为7.1的格式 %\protect{~}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}%使表编号为7.1的格式
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}%使公式编号为7.1的格式
\renewcommand{\thesubfigure}{(\alph{subfigure})}%使子图编号为(a)的格式
\renewcommand{\thesubtable}{(\alph{subtable})} %使子表编号为(a)的格式
%%=======参考文献
\newtoks\bibdatabase
\RequirePackage{ }
\newcommand{\printbib}{
\zihao{5}
\bibliographystyle{WMUbib}
\addcontentsline{toc}{chapter}{参考文献}
\bibliography{\the\bibdatabase}
}
\endinput
%%
%% End of file `WMUthesis.cls'.
