:- dynamic db_class/2, db_field/2, db_method/3.


% ___________ ASSERT DATABASE RELATIONS  ___________________

db_clear:-
	retractall(db_class(_,_)),
	retractall(db_field(_,_)),
	retractall(db_method(_,_,_)).


assert_class(C,S,FL,ML) :-
	assertz(db_class(C,S)),
	assert_fields(C,FL),
	assert_methods(C,ML).

assert_fields(_,[]).
assert_fields(C,[F|L]):-
	assertz(db_field(C,F)),
	assert_fields(C,L).

assert_methods(_,[]).
assert_methods(C,[m(T,M,PL)|L]):-
	assertz(db_method(C,M,(PL->T))),
	assert_methods(C,L).



% ____ PRINT DATABASE RELATIONS ON CONSOLE_____

print_all :-
	print_classes,
	print_methods,
	print_fields.

print_classes :-
	db_class(C,S),
	write(db_class),write('('),write(C),write(','),write(S),write(')'),
	write('.'),nl,
	fail.
print_classes :- nl.

print_fields :-
	db_field(C,F),
	write(db_field),write('('),write(C),write(','),write(F),write(')'),
	write('.'),nl,
	fail.
print_fields :- nl.

print_methods :-
	db_method(C,M,T),
	write(db_method),write('('),write(C),write(','),write(M),
	write(','),write(T),write(')'),write('.'),nl,
	fail.
print_methods :- nl.




