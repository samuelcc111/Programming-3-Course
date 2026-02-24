% Hechos (relaciones directas(padre o madre)):

% Personajes que son padres de alguien:
padre(abraham, homero).
padre(clancy, marge).
padre(homero, bart).
padre(homero, lisa).
padre(homero, maggie).
padre(abraham, herbert).
padre(clancy,selma).
padre(clancy, patty).

%Personajes que son madre de alguien:
madre(mona, homero).
madre(jaqueline, marge).
madre(marge, bart).
madre(marge, lisa).
madre(marge, maggie).
madre(selma, ling).
madre(jaqueline, selma).
madre(jaqueline, patty).



abuelo(X, Y):-
    padre(X, Z),
    padre(Z, Y).

abuelo(X, Y):-
    padre(X, Z),
    madre(Z, Y).

abuela(X, Y):-
    madre(X, Z),
    padre(Z, Y).
abuela(X, Y):-
    madre(X, Z),
    madre(Z, Y).

hermano(X,Y):-
    padre(P, X),
    padre(P, Y),
    madre(M, X),
    madre(M, Y),
    X \= Y.

tio(X,Y):-
    hermano(X, Z),
    padre(Z, Y).

tio(X,Y):-
    hermano(X, Z),
    madre(Z, Y).

primos(X, Y):-
    padre(Z, X),
    padre(Z2, Y),
    hermano(Z, Z2).
primos(X,Y):-
    madre(Z,X),
    madre(Z2,Y),
    hermano(Z,Z2).