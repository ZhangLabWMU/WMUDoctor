\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{HUNNUthesis}[2019/12/30 V1.0 Thesis for HUNNUer]
\LoadClass[a4paper,UTF8,openany,oneside]{ctexbook}
\AtEndOfPackage{\input{HUNNU.cfg}}%很关键配置文件
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
\newcommand\prechaptername{第}
\newcommand\postchaptername{章}
%=======标题样式
\CTEXsetup[name={第,章},number={\arabic{chapter}}]{chapter}%改变目录标题样式
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
\setcounter{secnumdepth}{4}
\setlength{\parindent}{2em}
\renewcommand{\chaptername}{\prechaptername\arabic{chapter}\postchaptername}
\titleformat{\chapter}{\centering\zihao{-2}\heiti}{\chaptername}{1em}{}
\titlespacing{\chapter}{0pt}{0pt}{18pt}
\titleformat{\section}{\zihao{-3}\heiti}{\thesection}{1em}{}
\titlespacing{\section}{0pt}{12pt}{12pt}
\titleformat{\subsection}{\zihao{4}\heiti}{\thesubsection}{0.5em}{}
\titlespacing{\subsection}{0pt}{6pt}{6pt}
\titleformat{\subsubsection}{\zihao{-4}\heiti}{\thesubsubsection}{0.5em}{}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}
%%=======标题页信息
\newtoks\code%专业代码
\newtoks\college%学院
\newtoks\serialnumber%学号
\newtoks\major%专业年级
\newtoks\advisor%指导老师
\newtoks\titlextra%标题多余一行时添加
\newtoks\entitle%英文标题
\newtoks\entitletra%标题多余一行时添加
\newtoks\submityear%提交年份
\newtoks\submitmonth%提交月份
%%=======标题页
%需要添加循环函数，判定多于一行的情况
\def\HUNNU@underline[#1]#2{%
    \underline{\hbox to #1{\hfill#2\hfill}}}
\def\HUNNUunderline{\@ifnextchar[\HUNNU@underline\underline}
\renewcommand\maketitle{%封面样式
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
    	\rightline{\HUNNU@label@code\HUNNUunderline[2.5cm]{\bf\heiti\zihao{4}\the\code}}%插入专业代码
    	\vspace{0.75cm}%设置垂直间距
        \includegraphics[width=10.5cm]{hunnu.bmp}\\%插入师大图标logo
         \vspace{0.25cm}%设置垂直间距
        {\bf\heiti\zihao{-0}\HUNNU@label@thesis\\}%
        \vspace{1.25cm}
        \zihao{4}
        \def\tabcolsep{6pt}
        \expandarg
        \newcounter{title_str_number}
        \vspace*{50pt}
        \begin{tabular}{rl}%标题右对齐，内容左对齐
            \bf \heiti \HUNNU@label@titleZh%中文标题折行输出
            \forloop{title_str_number}{1}{\value{title_str_number}<6}{%整个循环不会超过6
                \StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
                    & {\StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]\HUNNUunderline[258pt]{\bf \heiti\fontspec{Times New Roman}\zihao{3}\mygroup}}\\[0.40cm]%
                }%
            }%
            \bf \heiti \HUNNU@label@titleEn%英文标题折行输出
            \forloop{title_str_number}{1}{\value{title_str_number}<6}{%
                \StrFindGroup{\the\entitle}{\value{title_str_number}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
                    & {\StrFindGroup{\the\entitle}{\value{title_str_number}}[\mygroup]\HUNNUunderline[258pt]{\fontspec{Times New Roman-Bold}\zihao{3}\mygroup}}\\[0.40cm]%
                }%
            }%
            {\bf\heiti\HUNNU@label@author} &
            {\HUNNUunderline[258pt]{\bf\heiti\zihao{3}\@author}}\\[0.40cm]%作者信息
            {\bf\heiti \HUNNU@label@serialnumber} &
            {\HUNNUunderline[258pt]{\bf\heiti\zihao{3}  \the\serialnumber}}\\[0.40cm]%学号
            {\bf\heiti \HUNNU@label@college} &
            {\HUNNUunderline[258pt]{\bf \heiti  \zihao{3} \the\college}} \\[0.40cm]%学院
            {\bf\heiti \HUNNU@label@major} &
            {\HUNNUunderline[258pt]{\bf \heiti  \zihao{3} \the\major}}\\[0.40cm]%专业年级
            {\bf\heiti \HUNNU@label@advisor} &
            {\HUNNUunderline[258pt]{\bf\heiti\zihao{3}  \the\advisor}} \\[0.40cm]%指导老师
        \end{tabular}
        \par
        \vspace{70pt}
        {\bf\heiti\zihao{3}二〇{\the\submityear}年{\the\submitmonth}月}
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
    \par \heiti\zihao{4}{摘~~~~要:}\fangsong\zihao{-4}#1
    \vspace{10pt}
    \par \heiti\zihao{4}{关键词：}\fangsong\zihao{-4}#2
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
    \par \fontspec{Times New Roman}\zihao{4}\textbf{Abstract: }\fontspec{Times New Roman}\zihao{-4} #1
    \vspace{10pt}
    \par \fontspec{Times New Roman}\zihao{4}\textbf{Key Words: } \fontspec{Times New Roman}\zihao{-4} #2}
}
%=======空格
\newcommand\HUNNUspace{\phantom{永}}
%=======附录页和感谢页
\newcommand{\Appendix}{%将附录添加到目录中
    \setcounter{section}{0}
    \renewcommand{\thechapter}{A}%
	\addcontentsline{toc}{chapter}{附\qquad 录}
    \chapter*{附\HUNNUspace\HUNNUspace 录}
    \zihao{5}
}
\newcommand{\Thanks}{%将致谢添加到目录中
	\addcontentsline{toc}{chapter}{致\qquad 谢}
    \chapter*{致\HUNNUspace\HUNNUspace 谢}
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
\crefformat{chapter}{#2第#1章#3}
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
\bibliographystyle{hunnubib}
\addcontentsline{toc}{chapter}{参考文献}
\bibliography{\the\bibdatabase}
}
\endinput
%%
%% End of file `HUNNUthesis.cls'.
