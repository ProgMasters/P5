% Part 1

% a.

dead(steve).
affair(steve, jane).
affair(jane, steve).
affair(mary, steve).
affair(steve, mary).
married(tom, jane).
married(jane, tom).
rich(steve).
rich(john).
greedy(john).

murder(L, M) :- married(L, X), affair(X, M), dead(M).
murder(L, M) :- greedy(L), not(rich(L)), rich(M), dead(M).

% b.
% Possible suspects are John & Tom

% c.
% If John was rich, he would not have a motive to kill Steve,
% thus Tom would be the only suspect

% Part 2

% a.

numElements(0, []).
numElements(X, [_|L]) :- numElements(X1, L), X is X1 + 1.

% b.

removeElement(X, [X|L], L).
removeElement(X, [H|L], [H|L1]) :- removeElement(X, L, L1).

% c.

insertElementAt(X, L, 1, [X|L]).
insertElementAt(X, [H|L], P, [H|L1]) :- insertElementAt(X, L, P1, L1), P is P1 + 1.

% d not accepted on mooshak yet.

segment(L1, L2) :- segmentHelper(L1, L2), !.
segment(L1, [_|L2]) :- segment(L1, L2).

segmentHelper([], _).
segmentHelper([H|L1], [H|L2]) :- segmentHelper(L1, L2).

% e.

addUpList(L1, L2) :- addUpListHelper(L1, L2, 0).

addUpListHelper([], [], _).
addUpListHelper([H1|L1], [H2|L2], A) :- H2 is A + H1, A1 is A + H1,
										addUpListHelper(L1, L2, A1).

% Part 3

% a.

mymerge([], Y, Y).
mymerge(X, [], X).
mymerge([H1|X], [H2|Y], [H3|Z]) :- H1 < H2, H3=H1, mymerge(X, [H2|Y], Z).
mymerge([H1|X], [H2|Y], [H3|Z]) :- H1 >= H2, H3=H2, mymerge([H1|X], Y, Z).

% b.

mysplit([], [], []).
mysplit([H], [H], []).
mysplit([H1,H2|L1], [H1|L2], [H2|L3]) :- mysplit(L1, L2, L3).

% c.

mysort([], []).
mysort([H], [H]).
mysort([H1,H2|L1], L2) :- mysplit([H1,H2|L1], X1, X2), mysort(X1, Z1),
 				  		  mysort(X2, Z2), mymerge(Z1, Z2, L2).

% Part 4

% a.

binaryTree(nil).
binaryTree(t(_, L, R)) :- binaryTree(L), binaryTree(R).

% b.

preorder(nil, []).
preorder(t(X, L, R), Lis) :- preorder(L, LeftLis), preorder(R, RightLis),
						   append([X|LeftLis], RightLis, Lis).

% c.

leaves(nil, []).
leaves(t(X, nil, nil), [X]).
leaves(t(_, nil, R), Lis) :- not(R=nil), leaves(R, Lis).
leaves(t(_, L, nil), Lis) :- not(L=nil), leaves(L, Lis).
leaves(t(_, L, R), Lis) :- leaves(L, LeftLis), leaves(R, RightLis),
						   not(L=nil), not(R=nil),
						   append(LeftLis, RightLis, Lis).

% Part 5

