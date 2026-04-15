conexiones_padre(padre(homero), [
                            conect(person(bart)),
            conect(person(lisa)),
                            conect(person(maggie))
                            ]).
                 
conexiones_padre(padre(abraham), [
                            conect(person(homero)),
            conect(person(herbert))
                            ]).
                 
conexiones_padre(padre(clancy), [
                            conect(person(marge)),
            conect(person(selma)),
                            conect(person(patty))
                            ]).
%---------------------------------------------------------------------------------------
conexiones_madre(madre(mona), [
                            conect(person(homero))
                            ]).
                               
conexiones_madre(madre(jaqueline), [
                            conect(person(marge)),
                            conect(person(selma)),
                            conect(person(patty))
                            ]).
                               
                                   
conexiones_madre(madre(marge), [
                            conect(person(bart)),
                            conect(person(lisa)),
                            conect(person(maggie))
                            ]).
                               
conexiones_madre(madre(selma), [
                            conect(person(ling))
                            ]).

%-----------------------------------------------------------------------------------
conexiones_abuelo(abuelo(abraham), [
                            conect(person(bart)),
                            conect(person(lisa)),
                            conect(person(maggie))
                            ]).

conexiones_abuelo(abuelo(clancy), [
                            conect(person(ling)),
                            conect(person(lisa)),
                            conect(person(maggie)),
                            conect(person(bart))
                            ]).


%---------------------------------------------------------------------------------------
conexiones_abuela(abuela(mona), [
                            conect(person(bart)),
                            conect(person(lisa)),
                            conect(person(maggie))
                            ]).
conexiones_abuela(abuelo(jaqueline), [
                            conect(person(bart)),
                            conect(person(lisa)),
                            conect(person(maggie)),
                            conect(person(bart))
                            ]).
%---------------------------------------------------------------------------------------                       
hay_conexionp(X, Y):-
    conexiones_padre(padre(X), Hijos),
    member(conect(person(Y)), Hijos).
                               
hay_conexionm(X, Y):-
    conexiones_madre(madre(X), Hijos),
    member(conect(person(Y)), Hijos).

hay_conexionabo(X, Y):-
    conexiones_abuelo(abuelo(X), Nietos),
    member(conect(person(Y)), Nietos).

hay_conexionaboa(X, Y):-
    conexiones_abuela(abuela(X), Nietos),
    member(conect(person(Y)), Nietos).