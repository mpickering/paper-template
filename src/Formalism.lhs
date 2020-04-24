\section{Formalism}

%include format.fmt

%if style == newcode
\begin{code}
module Formalism where

import Utils

data Judgement = Judgement

\end{code}
%endif

\begin{figure*}
\invisiblecomments
\savecolumns
\begin{code}
\end{code}
\caption{Syntax}
\label{fig:syntax}
\end{figure*}

%%\begin{code}
%%DATA IEvalEnv ::= EmptyEvalEnv  | ExtMainEvalEnv Var IValVal IEvalEnv
%%                                | ExtMetaEvalEnv MetaVar IComp IEvalEnv
%%\end{code}
%%%if style == newcode
%%\begin{code}
%%                  |    IEvalGamma
%%\end{code}
%%%endif
%%\spacecorrectnosep
%%\aligncolumn{167}{r}%
%%\restorecolumns
%%\begin{code}


\begin{figure*}
\inlinemathhs
\center\boxed{%
\begin{code}
!! 5
\end{code}}
\begin{mathpar}
\labelledinferrule{%
!! foo
}{%
\begin{code}
!! 5
\end{code}
}{%
}{\text{\VVar}}
\end{mathpar}
\caption{Value Typing}
\label{fig:value-typing}
\end{figure*}
