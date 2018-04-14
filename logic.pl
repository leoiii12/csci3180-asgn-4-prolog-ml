% Assume the set of natural numbers consists of zero
%
% format_as_successor(2,X),format_as_successor(3,Y),product(X,Y,Product).
% format_as_successor(0,0).
% format_as_successor(Number,s(Result)) :- NewNumber is Number - 1, format_as_successor(NewNumber,Result).

% 1a
uint_num(0).
uint_num(s(X)) :- uint_num(X).

% 1b
gt(s(_),0).
gt(s(X),s(Y)) :- gt(X,Y).

% 1c
% uint_num(X), (X == s(s(s(0))) -> !; writeln(X)), false.

% 1d
sum(0,Result,Result).
sum(s(X),Y,s(A)) :- sum(X,Y,A).

product(0,_,0).
product(s(X),Y,Result) :- % X * Y = (X - 1) * Y + Y
    product(X,Y,A),
    sum(Y,A,Result).

% 1e
% product(s(s(0)),s(s(s(0))),Product).

% 1f
% product(X,s(s(s(s(0)))),s(s(s(s(s(s(s(s(0))))))))).

% 2a
nth(0,[MatchedElement|_],MatchedElement) :- !.

nth(Index,[_|RestElements],Element) :-
    nonvar(Index),
    NewIndex is Index - 1,
    nth(NewIndex,RestElements,Element).

% 2b
third(X,L) :- nth(2,L,X), !.