subclass(C1, C2) :-
      db_class(C1,C2).

subclass(C1, C2) :-
      db_class(S,C2),
      subclass(C1,S).

over_ridden(C, M) :-
       subclass(SuperC,C),
       db_method(C,M,T),
       db_method(SuperC,M,T).

recursive(C) :-
       db_field(C,T:C).

recursive(C) :-
       subclass(SC,C),
       db_field(SC,F:C).


% needed by inherits
defines(C,M,T) :-
      db_method(C, M, T).

defines(C,M,T) :-
      subclass(C, SubC),
      db_method(SubC, M, T).

inherits(C,L) :-
      setof(M:T, defines(C,M,T), L).


% basic is true T is a built-in type; needed by cycle
basic(T) :-
      T=int;T=boolean;T=real;T=double.

cycle(C) :-
      db_method(C, M, T1->T2),
      member(C, T1).
cycle(C) :-
      db_method(C, M, T1->T2),
      member(C1, T1),
      \+basic(C1),
      cycle(C1, C, T1).

cycle(C,C0,_) :-
       db_method(C,M,T1->T2),
       member(C0,T1).
cycle(C,C0,CL) :-
       db_method(C,M,T1->T2),
       member(C1,T1),
       \+basic(C1),
       \+member(C1,CL),
       cycle(C1, C0, [C1|CL]).





