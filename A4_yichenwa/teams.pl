% To test 'solve', type the following top-level goal, without ?-:
%
% ?- solve([Team1, Team2, Team3, Team4]).

solve(Ans):-
       Ans = [ team(_,_,pascal), team(_,_,perl),
               team(_,_,python), team(_,_,prolog) ],
       constraint1(Ans),
       constraint2(Ans),
       constraint3(Ans),
       constraint4(Ans),
       constraint5(Ans).

/*
1.  Kajol programs only in Python but Kate does not program in Python.
2.  Don programs only in Pascal and Daod does not program in Prolog.
3.  Neither Kim nor Kari nor Dip programs in Perl.
4.  Ding cannot team with Kim, Kari, or Kajol.
5.  Kari cannot team with Don, and Kate cannot team with Don or Daod.
*/

constraint1(Ans) :-
       member(team(_, kajol, python), Ans),
       member(team(_, kate, PL), Ans),
       PL \== python.


% Complete the definition of the following constraints.

constraint2(Ans) :-
       member(team(don, _, pascal), Ans),
       member(team(daod, _, RL), Ans),
       RL \== prolog.

constraint3(Ans) :-
       member(team(_, kim, EL1), Ans),
       member(team(_, kari, EL2), Ans),
       member(team(dip, _, EL3), Ans),
       EL1 \== perl,
       EL2 \==perl,
       EL3 \==perl.

constraint4(Ans) :-
       member(team(ding, KG, _), Ans),
       KG \==kim,
       KG \==kari,
       KG \==kajol.

constraint5(Ans) :-
       member(team(DB, kari, _), Ans),
       member(team(DD, kate,_), Ans),
       DB \==don,
       DD \==don,
       DD \==daod.
