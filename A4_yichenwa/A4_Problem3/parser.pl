
parse(File) :-
	db_clear,                    % defined in database.pl
        open(File,read,Stream),
        lex(Stream,Tokens),          % defined in lexer.pl
        program(Tokens,[]),
	close(Stream),
	print_all,                   % defined in database.pl
	!.


% ___________ GRAMMAR RULES FOR TINY OOPL   __________________


program --> ['#'].
program --> class_def, program.

class_def --> class_header(C,S),['{'],fields(FL), methods(ML), ['}'],
	      {assert_class(C,S,FL,ML)}.  % defined in database.pl

class_header(C,C2) --> [class], id(C), [extends], id(C2).
class_header(C,'Object') --> [class], id(C).

fields([]) --> [].
fields(FL) --> type(T), idlist(T,L1),[';'],fields(L2),{append(L1,L2,FL)}.

idlist(T,[F:T]) --> id(F).
idlist(T,[F:T|L]) --> id(F), [','], idlist(T,L).

type(int) --> [int].
type(real) --> [real].
type(boolean) --> [boolean].
type(double) --> [double].
type(Class_name) --> id(Class_name).

methods([]) --> [].
methods([m(T,M,PL) | ML]) -->
	  result_type(T), id(M), ['('], parlist(PL),[')', ';'], methods(ML).

result_type(T) --> type(T).
result_type(void) --> [void].

parlist([T])   --> type(T), id(_).
parlist([T|L]) --> type(T), id(_), [','], parlist(L).

id(X)  --> [id(X)].

