:- include(database).
:- include(analyzer).
:- include(explain).

analyze :-
      write('Tiny OOPL Analyzer. Sample Commands:'), nl, nl,
      write('   subclasses(a, L).'), nl,
      write('   over_ridden(a, m2).'), nl,
      write('   inherits(c, L).'), nl,
      write('   recursive(a).'), nl,
      write('   cycle(a).'), nl, nl,
      write('   why(subclasses(a, L)).'), nl,
      write('   why(over_ridden(a, m2)).'), nl,
      write('   why(inherits(c, L)).'), nl,
      write('   why(recursive(a)).'), nl,
      write('   why(cycle(a)).'), nl,
      nl.