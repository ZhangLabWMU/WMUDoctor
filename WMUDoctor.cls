\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{WMUDoctor}[2020/06/11 V1.0 Thesis for WMUer]
\LoadClass[a4paper,UTF8,openany,oneside,draft]{ctexbook}
% 🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌚🌒🌓🌔🌝🌖🌗🌚
\AtEndOfPackage{\input{WMU.cfg}}%很关键配置文件
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 论文页边距一般要求：上边距2.54cm、下边距2.54cm,左右边距3.00cm,页眉1.50cm,页脚1.75cm
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\RequirePackage[top=2.54cm, bottom=2.54cm, outer=3.00cm, inner=3.00cm, headheight=1.5cm, footskip=1.75cm, heightrounded]{geometry}
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 连续参考文献连接起来
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\RequirePackage[numbers,sort&compress]{natbib}
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 参考文献上标
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\newcommand{\upcite}[1]{{\setcitestyle{square,super}\cite{#1}}}
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 尾注
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\RequirePackage[perpage, bottom]{footmisc}
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 常用宏包
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
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
\RequirePackage{fancyhdr}%需要自定义页眉/页脚
\RequirePackage{lastpage}%文件中的页数
\RequirePackage{etoolbox}
\RequirePackage[titles,subfigure]{tocloft}%控制生成的表格和图片的目录格式
\RequirePackage{titlesec}
\RequirePackage{array}
\RequirePackage{makecell}
\RequirePackage{forloop}
\RequirePackage{xstring}
\RequirePackage[unicode,psdextra]{hyperref}%超链接
\RequirePackage[nameinlink]{cleveref}
\RequirePackage{enumitem}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{caption}
\RequirePackage{ulem}
\RequirePackage{tabularx}
\pagestyle{fancy}% 启用自定义页眉/页脚
\fancypagestyle{frontmatterstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot{} % 除所有页脚字段
    \fancyfoot[C]{\thepage} %
    \renewcommand{\thepage}{\Roman{page}}
}
\appto\frontmatter{\pagestyle{frontmatterstyle}}
\ProcessOptions\relax

\fancypagestyle{mainmatterstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot{} % 除所有页脚字段
    \fancyfoot[C]{\thepage} %
}

\appto\mainmatter{\pagestyle{mainmatterstyle}}
\appto\mainmatter{\linespread{1.27}\selectfont}   %行距
\fancypagestyle{plain}{
    \thispagestyle{mainmatterstyle}
}
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{frontmatterstyle}}}
% 🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌚🌒🌓🌔🌝🌖🌗🌚
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 设置全局字体
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 设置宋体为默认CJK衬线字体，因宋体本身不包括粗体和斜体，需同时添加宋体的自动添加伪粗体及伪斜体设置
% ═══════════════════════════════════════════════════════════════
\setCJKmainfont[AutoFakeBold=2, AutoFakeSlant=0.2]{simsun.ttc}
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 设置黑体为默认CJK无衬线字体
% ═══════════════════════════════════════════════════════════════
\setCJKsansfont{SimHei}
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 设置全局非CJK字体为Time New Roman
% ═══════════════════════════════════════════════════════════════
\setmainfont[BoldFont={timesbd.ttf},ItalicFont={timesi.ttf}, BoldItalicFont={timesbi.ttf}]{times.ttf}
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 修改宋体/黑体/楷体/仿宋
% ═══════════════════════════════════════════════════════════════
\renewcommand{\songti}{\CJKfontspec[AutoFakeBold=2, AutoFakeSlant=0.2]{simsun.ttc}}
\renewcommand{\heiti}{\CJKfontspec[AutoFakeBold=2, AutoFakeSlant=0.2]{simhei.ttf}}
\renewcommand{\kaishu}{\CJKfontspec[AutoFakeBold=2, AutoFakeSlant=0.2]{simkai.ttf}}
\renewcommand{\fangsong}{\CJKfontspec[AutoFakeBold=2, AutoFakeSlant=0.2]{simfang.ttf}}

% 🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌚🌒🌓🌔🌝🌖🌗🌚
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 修改章节样式
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
%\newcommand\prechaptername{}
%\newcommand\postchaptername{}
% 🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌚🌒🌓🌔🌝🌖🌗🌚
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 标题样式
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
%\CTEXsetup[number={}]{chapter}%改变目录标题样式
\renewcommand\cftchapdotsep{0.5}%虚线间隔
\renewcommand{\cftchapafterpnum}{\vspace{0pt}}%章节间隔,节前6磅
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{1.5}
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}
% \setlength{\cftbeforesecskip}{6pt}%章节间隔,节前6磅
% \setlength{\cftbeforesubsecskip}{6pt}%章节间隔,小节节前6磅
\renewcommand\cftchapfont{\kaishu\zihao{4}}
\renewcommand\cftsecfont{\songti\zihao{4}}
\renewcommand\cftsubsecfont{\songti\zihao{4}}
\renewcommand\cftsubsubsecfont{\songti\zihao{4}}
\renewcommand\cftchappagefont{\mdseries\zihao{4}}
\setlength\cftbeforetoctitleskip{24pt}
\setlength\cftaftertoctitleskip{18pt}
% 🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌚🌒🌓🌔🌝🌖🌗🌚
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 章节字体、字号和间距设置
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\setcounter{tocdepth}{0}%目录只显示chapter
\renewcommand\appendix{\setcounter{secnumdepth}{-2}}%编号从section开始
\setlength{\parindent}{2em}%默认缩进2个字符
% 🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌚🌒🌓🌔🌝🌖🌗🌚
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 章节命名
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 chapter前不添加信息
% ═══════════════════════════════════════════════════════════════    
\renewcommand{\chaptername}{}
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 % section格式：1. 2. 3.
% ═══════════════════════════════════════════════════════════════
\renewcommand{\thesection}{\arabic{section}.}
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 subsection格式：1.1. 1.2. 1.3.
% ═══════════════════════════════════════════════════════════════    
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}.}
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 % subsubsection格式：1.1.1. 1.1.2. 1.1.3.
% ═══════════════════════════════════════════════════════════════    
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.}
% 🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌚🌒🌓🌔🌝🌖🌗🌚
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 章节段落设置
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 chapter：黑体，4号字
% ═══════════════════════════════════════════════════════════════    
\titleformat{\chapter}{\centering\zihao{4}\heiti}{\chaptername}{0em}{}%
\titlespacing{\chapter}{0pt}{5pt}{5pt}
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 section：黑体，小4号字
% ═══════════════════════════════════════════════════════════════    
\titleformat{\section}{\bf\zihao{-4}\heiti}{\thesection}{0.5em}{}
\titlespacing{\section}{0pt}{5pt}{5pt}
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 subsection：黑体，小4号字
% ═══════════════════════════════════════════════════════════════    
\titleformat{\subsection}{\bf\zihao{-4}\heiti}{\thesubsection}{0.5em}{}
\titlespacing{\subsection}{0pt}{5pt}{5pt}
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 subsubsection：黑体，小4号字
% ═══════════════════════════════════════════════════════════════    
\titleformat{\subsubsection}{\bf\zihao{-4}\heiti}{\thesubsubsection}{0.5em}{}
\titlespacing{\subsubsection}{0pt}{5pt}{5pt}
% 🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌚🌒🌓🌔🌝🌖🌗🌚
% 🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌚🌒🌓🌔🌝🌖🌗🌚
% 🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌚🌒🌓🌔🌝🌖🌗🌚
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 标题页信息
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\newtoks\codeid%单位代码
\newtoks\studentid%学生学号
\newtoks\categoryid%分类号
\newtoks\studytype%培养类型
\newtoks\major%学科专业
\newtoks\advisor%指导老师
\newtoks\titlextra%标题多余一行时添加
\newtoks\entitle%英文标题
\newtoks\entitletra%标题多余一行时添加
\newtoks\chair%评委主席
\newtoks\member%评审成员
\newtoks\submityear%提交年份
\newtoks\submitmonth%提交月份
\newtoks\submitday%提交日
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 标题页，需要添加循环函数，判定多于一行的情况
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\def\WMU@underline[#1]#2{%
    \uline{\hbox to #1{#2\hfill}}}
\def\WMUunderline{
    \@ifnextchar[
        \WMU@underline
        \underline
    }
% \def\chair#1#2#3{#1\ \ #2\ \ #3}


\renewcommand\maketitle{%封面样式
    \cleardoublepage
    \thispagestyle{empty}
    % 第1页：基本情况
    \begin{center}
        % 封面单位信息
        \begin{table}
            \setlength{\tabcolsep}{0mm}{
            \begin{tabularx}{15cm}{p{55pt}p{250pt}p{70pt}l}
                {\songti\zihao{4}\WMU@label@categoryid} & {\songti\zihao{4} \the\categoryid} & %插入分类号 
                {\songti\zihao{4}\WMU@label@codeid} & {\songti\zihao{4} \the\codeid}\\[4mm] %插入单位代码
                & & {\songti\zihao{4}\WMU@label@studentid} & {\songti\zihao{4} \the\studentid}\\[4mm] %插入学号
            \end{tabularx}}
        \end{table}
        \vspace{0.75cm}%设置垂直间距
        % 插入温医大图标
        \includegraphics[width=12.43cm]{wmu.jpg}\\
        \vspace{0.25cm}%设置垂直间距
        {\heiti\WMU@label@thesis\\}%
        \vspace{1.25cm}
        \zihao{4}
        \def\tabcolsep{6pt}
        \expandarg
        \newcounter{title_str_number}
        \vspace*{50pt}
        % 论文标题
        \begin{tabular}{rl}%标题右对齐，内容左对齐
            \bf \songti \WMU@label@titleZh%中文标题折行输出
            \forloop{title_str_number}{1}{\value{title_str_number}<6}{%整个循环不会超过6
                \StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
                    & {\StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]\WMUunderline[325pt]{\songti\fontspec{Times New Roman}\zihao{3}\bf\mygroup}}\\[0.40cm]%
                }%
            }%
        \end{tabular}
        ~\\[1cm]
        \begin{tabular}{cl}%标题居中，内容左对齐
            {\WMU@label@author} &
            {\songti\zihao{3} \@author}\\[0.40cm]%作者信息
            {\WMU@label@major} &
            {\songti\zihao{3} \the\major}\\[0.40cm]%学科专业
            {\WMU@label@studytype} &
            {\songti\zihao{3} \the\studytype}\\[0.40cm]%培养类型
            {\WMU@label@advisor} &
            {\songti\zihao{3} \the\advisor}\\[0.40cm]%指导老师
        \end{tabular}
        % \par
        ~\\[3cm]
        % 答辩日期
        {\bf\zihao{3}二〇 \the\submityear ~~年~~ \the\submitmonth ~~月}
    \end{center}
    \clearpage
    %=======评委信息页：标题
    ~\\[1cm]
    \begin{tabular}{cl}%标题居中，内容左对齐
    	\bf \songti \WMU@label@titleZh%中文标题折行输出
    	\forloop{title_str_number}{1}{\value{title_str_number}<6}{%整个循环不会超过6
    		\StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]%
    		\IfStrEq{\mygroup}{}{}{%
    			& {\StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]\WMUunderline[325pt]{\zihao{3}\bf\mygroup}}\\[0.40cm]%
    		}%
    	}%
    \end{tabular}
    ~\\[10cm]
    \begin{tabular}{ll}%标题居中，内容左对齐
        {\WMU@label@chair} & {\WMUunderline[270pt]{\zihao{3}\the\chair}}\\[0.40cm]%答辩委员会主席
        % {\WMU@label@member} & 
        \WMU@label@member%中文标题折行输出
    	\forloop{title_str_number}{1}{\value{title_str_number}<6}{%整个循环不会超过6
    		\StrFindGroup{\the\member}{\value{title_str_number}}[\mygroup]%
    		\IfStrEq{\mygroup}{}{}{%
    			& {\StrFindGroup{\the\member}{\value{title_str_number}}[\mygroup]\WMUunderline[270pt]{\zihao{3}\mygroup}}\\[0.40cm]%
    		}%
        }%答辩委员会委员
    \end{tabular}
    ~\\[2cm]
    % 答辩日期
    % \begin{table}
    %     \centering
        \begin{tabular}{lc}
           {\bfseries{\WMU@label@answerday}} & {\WMUunderline[270pt]{\zihao{3}二〇 \the\submityear ~年~ \the\submitmonth ~月~ \the\submitday ~日}}\\[0.4cm]
        \end{tabular}
        
    
    \clearpage
}






% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 中文摘要页
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\newcommand{\ZhAbstract}[5]{%
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
    \linespread{1.27}%行距20磅
    \begin{center}
        \heiti\zihao{3}\textbf{\makebox[4em][s]{摘\hspace{\fill}要}}
    \end{center}
    \vspace{10pt}
    % 目的
    \par \noindent\heiti\zihao{-4}{\makebox[4em][s]{目\hspace{\fill}的：}}
    \par \songti\zihao{-4} #1
    % 方法
    \par \noindent\heiti\zihao{-4}{\makebox[4em][s]{方\hspace{\fill}法：}}
    \par \songti\zihao{-4} #2
    % 结果
    \par \noindent\heiti\zihao{-4}{\makebox[4em][s]{结\hspace{\fill}果：}} 
    \par \songti\zihao{-4} #3
    % 结论
    \par \noindent\heiti\zihao{-4}{\makebox[4em][s]{结\hspace{\fill}论：}}
    \par \songti\zihao{-4} #4
    % 关键词
    \par \noindent\heiti\zihao{-4}{关键词：}
    \par \songti\zihao{-4} #5
    \newpage
}
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 英文摘要页
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\newcommand{\EnAbstract}[5]{
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
    \linespread{1.27}%行距20磅
    \begin{center}
        \fontspec{Times New Roman}\zihao{3}\textbf{Abstract}
    \end{center}
    \vspace{10pt}
    % Objective
    \par \noindent\fontspec{Times New Roman}\zihao{-4}\textbf{Objective: }
    \par \fontspec{Times New Roman}\zihao{-4} #1
    % Methods
    \par \noindent\fontspec{Times New Roman}\zihao{-4}\textbf{Methods: } 
    \par \fontspec{Times New Roman}\zihao{-4} #2
    % Results
    \par \noindent\fontspec{Times New Roman}\zihao{-4}\textbf{Results: } 
    \par \fontspec{Times New Roman}\zihao{-4} #3
    % Conclusions
    \par \noindent\fontspec{Times New Roman}\zihao{-4}\textbf{Conclusions: } 
    \par \fontspec{Times New Roman}\zihao{-4} #4
    % Keywords
    \par \noindent\fontspec{Times New Roman}\zihao{-4}\textbf{Key Words: } 
    \par \fontspec{Times New Roman}\zihao{-4} #5    
    }
}
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 空格
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\newcommand\WMUspace{\phantom{永}}
% 🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌘🌚🌒🌓🌔🌝🌖🌗🌚🌒🌓🌔🌝🌖🌗🌚
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 chapter定制
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
%=======前言页
% \newcommand{\Preface}{
	
% 	\setcounter{section}{0}
% 	\renewcommand{\thechapter}{A}%
	
% 	\addcontentsline{toc}{chapter}{前~~~~言}
%     \chapter*{前\WMUspace\WMUspace言}
%     \zihao{-4}\songti
% }
% %=======方法页
% \newcommand{\Method}{
% 	\addcontentsline{toc}{chapter}{材料与方法}
%     \chapter*{材料与方法}
%     \zihao{-4}\songti
% }
% %=======结果页
% \newcommand{\Result}{
% 	\addcontentsline{toc}{chapter}{结~~~~果}
%     \chapter*{结\WMUspace\WMUspace果}
%     \zihao{-4}\songti
% }

% %=======分析与讨论页
% \newcommand{\Discussion}{
% 	\addcontentsline{toc}{chapter}{分析与讨论}
%     \chapter*{分析与讨论}
%     \zihao{-4}\songti
% }
% %=======小结页
% \newcommand{\Summary}{
% 	\addcontentsline{toc}{chapter}{小~~~~结}
%     \chapter*{小\WMUspace\WMUspace结}
%     \zihao{-4}\songti
% }
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 附录页
% ═══════════════════════════════════════════════════════════════
\newcommand{\Appendix}{%将附录添加到目录中
   \setcounter{section}{0}
   \renewcommand{\thechapter}{A}%
	\addcontentsline{toc}{chapter}{附~~~~录}
    \chapter*{附\WMUspace\WMUspace 录}
    \zihao{-4}\songti
}
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 感谢页
% ═══════════════════════════════════════════════════════════════
\newcommand{\Thanks}{%将致谢添加到目录中
	\addcontentsline{toc}{chapter}{致~~~~谢}
    \chapter*{致\WMUspace\WMUspace 谢}
    \zihao{-4}\songti
}
% ═══════════════════════════════════════════════════════════════
% 🍓🍓 超链接
% ═══════════════════════════════════════════════════════════════
\hypersetup{hidelinks,breaklinks=true,bookmarksopen=false}%自动写入pdf信息
\AtBeginDocument{
    \hypersetup{
        pdftitle = {\@title},
        pdfauthor = {\@author},
        pdfsubject = {温州医科大学博士研究生毕业论文}
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
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
%=====表格样式
% toprule/bottomerule
\setlength\heavyrulewidth{1.5pt}
% midrule
\setlength\lightrulewidth{0.75pt}

% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 英文名称改为汉字
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
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
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 程序伪代码实现
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{\textbf{输入:}}
\renewcommand{\algorithmicensure}{\textbf{输出:}}
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 改变图表的编号格式
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
\captionsetup[table]{labelsep=space}%{labelsep=quad}
\captionsetup[figure]{labelsep=space}
\renewcommand{\tablename}{表} %表题头
\renewcommand{\figurename}{图} %图题头
\renewcommand{\thefigure}{\arabic{figure}：} %使图编号为1的格式 %\protect{~}
\renewcommand{\thetable}{\arabic{table}：}%使表编号为1的格式
\renewcommand{\theequation}{\arabic{equation}}%使公式编号为1的格式
\renewcommand{\thesubfigure}{(\alph{subfigure})}%使子图编号为(a)的格式
\renewcommand{\thesubtable}{(\alph{subtable})} %使子表编号为(a)的格式
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
% 🍋 参考文献
% ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
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
%% End of file `WMUDoctor.cls'.
