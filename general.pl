%%-------------------------------------------------------------%%
%% Team members                                                %%
%% Esraa Ashraf Ibrahim Mohammed                               %%
%% Eman Amr Ali Hamed                                          %%                                
%% Esraa Abd-El-Maksood                                        %%
%% Aya ElSayed Mohammed                                        %%
%%-------------------------------------------------------------%%

%%% --- Context Free Grammer (CFG) --- %%%

% Statements %
stmts --> stmt, stmts | [].
stmt --> if_stmt | assign_stmt |for_stmt|while_stmt|do_while_stmt| switch_stmt |func_stmt |define_stmt | io_stmt.

% If statement %
if_stmt --> ["if"], ["("], condition , [")"], stmt, else_stmt.
if_stmt --> ["if"], ["("], condition, [")"],["{"], stmts, ["}"], else_stmt.
else_stmt --> ["else"], stmt | ["else"],["{"], stmts , ["}"] | [].
% For statement %
for_stmt --> ["for"], ["("],for_st,[")"], stmt.
for_stmt --> ["for"], ["("],for_st,[")"],["{"], stmts,["}"].
% While statement %
while_stmt --> ["while"], ["("],condition,[")"], stmt.
while_stmt --> ["while"], ["("],condition,[")"],["{"], stmts,["}"].
% do_while_stmt %
do_while_stmt --> ["do"],["{"], stmts,["}"],["while"], ["("],condition,[")"],[";"].

% for_st %
for_st --> init,[";"],condition,[";"],fo.
init --> data_type, id,["="], expr|id,["="], expr|[].
fo --> id, ["+"],["+"]|id, ["-"],["-"]|[].

% switch case stmt %
cases --> case, cases|[].
case --> ["case"],factor,[":"],stmt ,opt_break, op_default.
opt_break --> ["break"],[";"]|[].
op_default --> ["default"], [":"], stmts|[].
switch_stmt --> ["switch"], ["("], id, [")"], ["{"] ,cases,["}"].

% function  stmt %
func_stmt --> data_type, id ,["("], ip_arg , [")"], ["{"], stmts ,["}"].
ip_arg --> arg , ip_arg|[].
arg --> data_type , id,[","]|data_type , id.
% Conditions %
condition --> id, cond_op , expr|[].
cond_op --> ["<"] | [">"] | ["<"],["="] | [">"],["="] | ["="],["="] | ["!"],["="].

% Assign statement (x = 5;) %
assign_stmt --> id, ["="], expr, [";"].

% Define statement (int x; or int x = 5;) %
define_stmt --> data_type, id, [";"] | data_type, assign_stmt.
data_type --> ["int"].

% C++ IO statement (cin and cout) %
io_stmt --> ["cin"], [">"], [">"], id, [";"] | ["cout"], ["<"], ["<"], id, [";"].

% Expression %
expr --> term | term, ["+"], expr | term, ["-"], expr.
term --> factor | factor, ["*"], term | factor, ["/"], term.
factor --> digit | id | ["("], expr, [")"].
digit --> "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9".
id --> [X], {atom_string(Atom, X), atom(Atom)}.

% ID Definition %
id(a).	id(b).	id(c).	id(d).	id(e).	id(f).	id(g).	id(h).
id(i).	id(j).	id(k).	id(l).	id(m).	id(a).	id(n).	id(o).
id(p).	id(q).	id(r).	id(s).	id(t).	id(u).	id(v).	id(w).
id(x).	id(y).	id(z).

%%% --- Parsing --- %%%
parser:-
	read_file_to_string("D:/Compiler project/test.txt", X, []),     % Read the file and store its content into string "X"			     
	write("\n\n--- Code ---\n\n"),                         % print source code
 	write(X),
 	tokenizer(X, Tokens),					         	   % Tokenize the code into stream of characters
	phrase(stmts, Tokens),                                 % Match the DCG grammer with tokens
	write("\nParsing Done, Syntax Free!");                 % Print that the code is syntax free
	write("\nParsing Done, Syntax Error!").                % Print that the code is syntax error

%%% --- Tokenizing --- %%%
tokenizer(Input, Output):-
	normalize_space(atom(S0), Input),
	replace_in_string("+"," + ",S0, S1),
	replace_in_string("-"," - ",S1, S2),
	replace_in_string("*"," * ",S2, S3),
	replace_in_string("/"," / ",S3, S4),
	replace_in_string("{"," { ",S4, S5),
	replace_in_string("}"," } ",S5, S6),
	replace_in_string("("," ( ",S6, S7),
	replace_in_string(")"," ) ",S7, S8),
	replace_in_string(";"," ; ",S8, S9),
	replace_in_string("|"," | ",S9, S10),
	replace_in_string("&"," & ",S10,S11),
	replace_in_string("="," = ",S11,S12),
	replace_in_string(","," , ",S12,S13),
	replace_in_string("<"," < ",S13,S14),
	replace_in_string(">"," > ",S14,S15),
	normalize_space(atom(SF), S15),
	write("\n\n--- Tokens ---\n\n"),
	write(SF),
	write("\n\n"),
	split_string(SF, " ", "",Output). 
	
replace_in_string(Old_Char, New_Char, String, New_String):-
	atomic_list_concat(Atoms, Old_Char, String),
	atomic_list_concat(Atoms, New_Char, New_String).

